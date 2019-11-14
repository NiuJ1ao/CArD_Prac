#include <iostream>
#include <fstream>
#include <cstdlib>
#include "pin.H"

// Simulation will be stop once this number of instructions is executed
#define STOP_INSTR_NUM 1000000000 //1b instrs
// Simulator heartbeat rate
#define SIMULATOR_HEARTBEAT_INSTR_NUM 100000000 //100m instrs

/* Base branch predictor class */
// Your are highly recommended to follow this design
// when implementing yours branch predictors
class BranchPredictorInterface {
public:
  //This function returns a prediction for a branch instruction with address branchIP
  virtual bool getPrediction(ADDRINT branchIP) = 0;
  //This function updates branch predictor's history with outcome of branch instruction with address branchIP
  virtual void train(ADDRINT branchIP, bool correctBranchDirection) = 0;
};

// This is a class which implements always taken branch predictor
class AlwaysTakenBranchPredictor : public BranchPredictorInterface {
public:
  AlwaysTakenBranchPredictor(UINT64 numberOfEntries) {}; //no entries here: always taken branch predictor is the simplest predictor
	virtual bool getPrediction(ADDRINT branchIP) {
		return true; // predict taken
	}
	virtual void train(ADDRINT branchIP, bool correctBranchDirection) {} //nothing to do here: always taken branch predictor does not have history
};

//---------------------------------------------------------------------
//##############################################
/*
 * Your changes here.
 *
 * Put your branch predictor implementation here
 *
 * For example:
 * class LocalBranchPredictor : public BranchPredictorInterface {
 *
 * ***put private members for Local branch predictor here
 *
 * public:
 *	 virtual bool getPrediction(ADDRINT branchIP) {
 *		 ***put your implementation here
 *	 }
 *	 virtual void train(ADDRINT branchIP, bool correctBranchDirection) {
 *	   ***put your implementation here
 *	 }
 * }
 *
 * You also need to create an object of branch predictor class in main().
 * See line 158 for more details
 */
//##############################################
//---------------------------------------------------------------------
#include <math.h> 
#include <bitset>
class LocalBranchPredictor : public BranchPredictorInterface {
  // put private members for Local branch predictor here
  uint16_t *localHistoryRegisters;
  uint8_t *patternHistroyTable;
  uint16_t phtIndexMask;
  bool prediction;

public:
    LocalBranchPredictor(UINT64 numberOfEntries) {
        patternHistroyTable = new uint8_t [numberOfEntries];
        localHistoryRegisters = new uint16_t [128];
        uint8_t numOfShift = 16-log2(numberOfEntries);
        phtIndexMask = 0xFFFF >> numOfShift;

        // std::cerr << "initiating" << endl;
        for (uint i=0; i<128; i++) {
            localHistoryRegisters[i] = 0;
        }

        for (uint i=0; i<numberOfEntries; i++) {
            patternHistroyTable[i] = 3;
        }
        // std::cerr << "initiate finish" << endl;
        // std::cerr << "saturatingCounter = " << bitset<3>(patternHistroyTable[0]) << endl;
    };

	virtual bool getPrediction(ADDRINT branchIP) {
		// put your implementation here
        // std::cerr << "======================================================================" << endl;
        // std::cerr << "branchIP = " << bitset<32>(branchIP) << endl;
        uint8_t indexToLHR = (uint8_t) branchIP & 0x7F;
        // std::cerr << "indexToLHR = " << bitset<8>(indexToLHR) << endl;
        uint16_t indexToPHT = localHistoryRegisters[indexToLHR];
        // std::cerr << "indexToPHT = " << bitset<8>(indexToPHT) << endl;
        // std::cerr << "saturatingCounter = " << bitset<3>(patternHistroyTable[indexToPHT]) << endl;
        prediction = patternHistroyTable[indexToPHT] >= 2;
        // std::cerr << "prediction = " << prediction << endl;
        return prediction;
	}

	virtual void train(ADDRINT branchIP, bool correctBranchDirection) {
        // put your implementation here
        uint8_t indexToLHR = (uint8_t) branchIP & 0x7F;
        uint16_t indexToPHT = localHistoryRegisters[indexToLHR];
        // std::cerr << "======================================================================" << endl;
        // std::cerr << "correctBranchPrediction = " << (correctBranchDirection == prediction) << endl;
        // update LHR
        // std::cerr << "indexToPHT before = " << bitset<11>(localHistoryRegisters[indexToLHR]) << endl;
        localHistoryRegisters[indexToLHR] = ((localHistoryRegisters[indexToLHR] << 1) + correctBranchDirection) & phtIndexMask;
        // std::cerr << "indexToPHT after = " << bitset<11>(localHistoryRegisters[indexToLHR]) << endl;


        // update bimodal
        uint8_t saturatingCounter = patternHistroyTable[indexToPHT];

        // std::cerr << "saturatingCounter before = " << bitset<3>(patternHistroyTable[indexToPHT]) << endl;
        if (correctBranchDirection && saturatingCounter < 3) { // Actual taken;
            // std::cerr << "increment" << endl;
            patternHistroyTable[indexToPHT]++;
        } else if (!correctBranchDirection && saturatingCounter > 0) { // Actual not taken
            // std::cerr << "decrement" << endl;
            patternHistroyTable[indexToPHT]--;
        }
        // std::cerr << "saturatingCounter after = " << bitset<3>(patternHistroyTable[indexToPHT]) << endl;
    }
};

class GshareBranchPredictor : public BranchPredictorInterface {
  // put private members for Gshare Branch Predictor here
  uint16_t globalHistoryRegister;
  uint8_t *patternHistroyTable;
  uint16_t bitMask;

public:
    GshareBranchPredictor(UINT64 numberOfEntries) {
        patternHistroyTable = new uint8_t [numberOfEntries];
        uint8_t numOfShift = 16-log2(numberOfEntries);
        bitMask = 0xFFFF >> numOfShift;
        globalHistoryRegister = 0;

        for (uint i=0; i<numberOfEntries; i++) {
            patternHistroyTable[i] = 3;
        }
    };

    virtual bool getPrediction(ADDRINT branchIP) {
		// put your implementation here
        uint16_t lsbs = (uint16_t) branchIP & bitMask;
        uint16_t indexToPHT = lsbs ^ globalHistoryRegister;

        return patternHistroyTable[indexToPHT] >= 2;
	}

	virtual void train(ADDRINT branchIP, bool correctBranchDirection) {
        // put your implementation here

        // std::cerr << "======================================================================" << endl;
        uint16_t lsbs = (uint16_t) branchIP & bitMask;
        uint16_t indexToPHT = lsbs ^ globalHistoryRegister;
        // std::cerr << "branchIP = " << bitset<32>(branchIP) << endl;
        // std::cerr << "lsbs = " << bitset<8>(lsbs) << endl;
        // std::cerr << "indexToPHT = " << bitset<8>(indexToPHT) << endl;

        // std::cerr << "correctBranchPrediction = " << (correctBranchDirection) << endl;
        // std::cerr << "indexToPHT before = " << bitset<8>(globalHistoryRegister) << endl;
        // update GHR
        globalHistoryRegister = ((globalHistoryRegister << 1) + correctBranchDirection) & bitMask;
        // std::cerr << "indexToPHT after = " << bitset<8>(globalHistoryRegister) << endl;

        // update bimodal
        uint8_t saturatingCounter = patternHistroyTable[indexToPHT];
        // std::cerr << "saturatingCounter before = " << bitset<3>(patternHistroyTable[indexToPHT]) << endl;
        if (correctBranchDirection && saturatingCounter < 3) { // Actual taken;
            // std::cerr << "increment" << endl;
            patternHistroyTable[indexToPHT]++;
        } else if (!correctBranchDirection && saturatingCounter > 0) { // Actual not taken
            // std::cerr << "decrement" << endl;
            patternHistroyTable[indexToPHT]--;
        }
        // std::cerr << "saturatingCounter after = " << bitset<3>(patternHistroyTable[indexToPHT]) << endl;
    }
};

class TournamentBranchPredictor : public BranchPredictorInterface {
    // put private members for Tournament Branch Predictor here
    uint8_t *patternHistroyTableOfMetaPredictor;
    bool prediction;
    bool gShareUsed; // True if Gshare predictor is chosen, false if local predictor is chosen.
    uint16_t phtIndexMask;
    BranchPredictorInterface *gshare;
    BranchPredictorInterface *local;

public:
    TournamentBranchPredictor(UINT64 numberOfEntries) {
        patternHistroyTableOfMetaPredictor = new uint8_t [numberOfEntries];
        local = new LocalBranchPredictor(numberOfEntries);
        gshare = new GshareBranchPredictor(numberOfEntries);
        uint8_t numOfShift = 16-log2(numberOfEntries);
        phtIndexMask = 0xFFFF >> numOfShift;

        for (uint i=0; i<numberOfEntries; i++) {
            patternHistroyTableOfMetaPredictor[i] = 3;
        }
    };

	virtual bool getPrediction(ADDRINT branchIP) {
		// put your implementation here
        uint16_t indexToPHT = (uint16_t) branchIP & phtIndexMask;
        gShareUsed = patternHistroyTableOfMetaPredictor[indexToPHT] >= 2;
        if (gShareUsed) {
            prediction = gshare->getPrediction(branchIP);
        } else {
            prediction = local->getPrediction(branchIP);
        }

        return prediction;
	}

	virtual void train(ADDRINT branchIP, bool correctBranchDirection) {
        // put your implementation here
        // train both local and gshare
        // std::cerr << "======================================================================" << endl;
        local->train(branchIP, correctBranchDirection);
        gshare->train(branchIP, correctBranchDirection);

        uint16_t indexToPHT = (uint16_t) branchIP & phtIndexMask;
        
        // std::cerr << "correctBranchPrediction = " << (correctBranchDirection == prediction) << endl;
        // std::cerr << "saturatingCounter before = " << bitset<8>(patternHistroyTableOfMetaPredictor[indexToPHT]) << endl;
        uint8_t saturatingCounter = patternHistroyTableOfMetaPredictor[indexToPHT];
        if (correctBranchDirection == prediction) {
            // Strengthen saturating counter
            // std::cerr << "strengthen" << endl;
            if (saturatingCounter == 2) {
                patternHistroyTableOfMetaPredictor[indexToPHT]++;
            } else if (saturatingCounter == 1) {
                patternHistroyTableOfMetaPredictor[indexToPHT]--;
            }
        } else {
            if (gShareUsed) {
                if (correctBranchDirection == local->getPrediction(branchIP)) {
                    // Weaken saturating counter
                    // std::cerr << "local is correct" << endl;
                    if (saturatingCounter < 2) {
                        // std::cerr << "weaken" << endl;
                        patternHistroyTableOfMetaPredictor[indexToPHT]++;
                    } else {
                        // std::cerr << "weaken" << endl;
                        patternHistroyTableOfMetaPredictor[indexToPHT]--;
                    }
                } else if (correctBranchDirection == gshare->getPrediction(branchIP)) {
                    // Weaken saturating counter
                    // std::cerr << "gshare is correct" << endl;
                    if (saturatingCounter < 2) {
                        // std::cerr << "weaken" << endl;
                        patternHistroyTableOfMetaPredictor[indexToPHT]++;
                    } else {
                        // std::cerr << "weaken" << endl;
                        patternHistroyTableOfMetaPredictor[indexToPHT]--;
                    }
                }
            }
        }
        // std::cerr << "saturatingCounter after = " << bitset<8>(patternHistroyTableOfMetaPredictor[indexToPHT]) << endl;
    }
};

ofstream OutFile;
BranchPredictorInterface *branchPredictor;

KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE, "pintool",
    "o", "BP_stats.out", "specify output file name");
KNOB<UINT64> KnobNumberOfEntriesInBranchPredictor(KNOB_MODE_WRITEONCE, "pintool",
    "num_BP_entries", "1024", "specify number of entries in a branch predictor");
KNOB<string> KnobBranchPredictorType(KNOB_MODE_WRITEONCE, "pintool",
    "BP_type", "always_taken", "specify type of branch predictor to be used");

// The running counts of branches, predictions and instructions are kept here
static UINT64 iCount                          = 0;
static UINT64 correctPredictionCount          = 0;
static UINT64 conditionalBranchesCount        = 0;
static UINT64 takenBranchesCount              = 0;
static UINT64 notTakenBranchesCount           = 0;
static UINT64 predictedTakenBranchesCount     = 0;
static UINT64 predictedNotTakenBranchesCount  = 0;

VOID docount() {
  // Update instruction counter
  iCount++;
  // Print this message every SIMULATOR_HEARTBEAT_INSTR_NUM executed
  if (iCount % SIMULATOR_HEARTBEAT_INSTR_NUM == 0) {
    std::cerr << "Executed " << iCount << " instructions." << endl;
  }
  // Release control of application if STOP_INSTR_NUM instructions have been executed
  if (iCount == STOP_INSTR_NUM) {
    PIN_Detach();
  }
}



VOID TerminateSimulationHandler(VOID *v) {
  OutFile.setf(ios::showbase);
  // At the end of a simulation, print counters to a file
  OutFile << "Prediction accuracy:\t"            << (double)correctPredictionCount / (double)conditionalBranchesCount << endl
          << "Number of conditional branches:\t" << conditionalBranchesCount                                      << endl
          << "Number of correct predictions:\t"  << correctPredictionCount                                        << endl
          << "Number of taken branches:\t"       << takenBranchesCount                                            << endl
          << "Number of non-taken branches:\t"   << notTakenBranchesCount                                         << endl
          ;
  OutFile.close();

  std::cerr << endl << "PIN has been detachbranchPredictored at iCount = " << STOP_INSTR_NUM << endl;
  std::cerr << endl << "Simulation has reached its target point. Terminate simulation." << endl;
  std::cerr << "Prediction accuracy:\t" << (double)correctPredictionCount / (double)conditionalBranchesCount << endl;
  std::exit(EXIT_SUCCESS);
}

//
VOID Fini(int code, VOID * v)
{
  TerminateSimulationHandler(v);
}

// This function is called before every conditional branch is executed
static VOID AtConditionalBranch(ADDRINT branchIP, BOOL correctBranchDirection) {
  /*
	 * This is the place where predictor is queried for a prediction and trained
	 */

	bool prediction = branchPredictor->getPrediction(branchIP);
	branchPredictor->train(branchIP, correctBranchDirection);

  // Update stat counters
  if (prediction) {
    predictedTakenBranchesCount++;
  } else {
    predictedNotTakenBranchesCount++;
  }
  if (correctBranchDirection) {
    takenBranchesCount++;
  } else {
    notTakenBranchesCount++;
  }
	if (prediction == correctBranchDirection) correctPredictionCount++;
  conditionalBranchesCount++;
}

// Pin calls this function every time a new instruction is encountered
VOID Instruction(INS ins, VOID *v) {
  //Inser a call before every instruction to count them
  INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)docount, IARG_END);

  // Insert a call before every conditional branch
  if ( INS_IsBranch(ins) && INS_HasFallThrough(ins) ) {
    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)AtConditionalBranch, IARG_INST_PTR, IARG_BRANCH_TAKEN, IARG_END);
  }
}

// Print Help Message
INT32 Usage() {
  cerr << "This tool simulates different types of branch predictors" << endl;
  cerr << endl << KNOB_BASE::StringKnobSummary() << endl;
  return -1;
}

int main(int argc, char * argv[]) {
  // Initialize pin
  if (PIN_Init(argc, argv)) return Usage();

  // Create a branch predictor object of requested type
  if (KnobBranchPredictorType.Value() == "always_taken") {
    std::cerr << "Using always taken BP" << std::endl;
    branchPredictor = new AlwaysTakenBranchPredictor(KnobNumberOfEntriesInBranchPredictor.Value());
  }
//---------------------------------------------------------------------
//##############################################
/*
 * Your changes here.
 *
 * Create an object of branch predictor class you implemented in the following sections.
 *
 * NOTE:
 *  KnobNumberOfEntriesInBranchPredictor.Value() returns the value specified after tool option "-num_BP_entries"
 *    Argument of tool option "-num_BP_entries" is an integer
 *  KnobBranchPredictorType.Value() returns the value specified after tool option "-BP_type"
 *    Argument of tool option "-BP_type" can be one of the followong strings: "always_taken", "local", "gshare", "tournament"
 *    Please DO NOT CHANGE these strings as they will be used for testing your code
 */
//---------------------------------------------------------------------
//##############################################
  else if (KnobBranchPredictorType.Value() == "local") {
  	 std::cerr << "Using Local BP." << std::endl;
/* Uncomment when you implemented Local branch predictor */
  branchPredictor = new LocalBranchPredictor(KnobNumberOfEntriesInBranchPredictor.Value());
  }
  else if (KnobBranchPredictorType.Value() == "gshare") {
  	 std::cerr << "Using Gshare BP."<< std::endl;
/* Uncomment when you implemented Gshare branch predictor */
   branchPredictor = new GshareBranchPredictor(KnobNumberOfEntriesInBranchPredictor.Value());
  }
  else if (KnobBranchPredictorType.Value() == "tournament") {
  	 std::cerr << "Using Tournament BP." << std::endl;
/* Uncomment when you implemented tournament branch predictor */
   branchPredictor = new TournamentBranchPredictor(KnobNumberOfEntriesInBranchPredictor.Value());
  }
  else {
    std::cerr << "Error: No such type of branch predictor. Simulation will be terminated." << std::endl;
    std::exit(EXIT_FAILURE);
  }

  std::cerr << "The simulation will run " << STOP_INSTR_NUM << " instructions." << std::endl;

  OutFile.open(KnobOutputFile.Value().c_str());

  // Register Instruction to be called to instrument instructions
  INS_AddInstrumentFunction(Instruction, 0);

  // Function to be called if the porgram finishes before it completes 10b instructions
  PIN_AddFiniFunction(Fini, 0);

  // Callback functions to invoke before Pin releases control of the application
  PIN_AddDetachFunction(TerminateSimulationHandler, 0);

  // Start the program, never returns
  PIN_StartProgram();

  return 0;
}
