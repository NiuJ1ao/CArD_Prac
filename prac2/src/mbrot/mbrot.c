#include "../lib/csr.h"

extern void putpix(unsigned long px_addr, unsigned long px_value);
extern void put_leds(unsigned long leds);
extern void put_ssd(unsigned long ssd);
extern unsigned long get_btns();
extern unsigned long get_switches();

unsigned char px, py;

#define ImageHeight 256
#define ImageWidth  256
#define PIXELS_24BIT

#ifdef PIXELS_24BIT
  #define RGB_PACK(_r_,_g_,_b_) (((_r_)<<16)+((_b_)<<8)+(_g_))
#else
  #define RGB_PACK(_r_,_g_,_b_) (((_r_*31/255)<<11)+((_b_*31/255)<<6)+(_g_*63/255))
#endif

const unsigned int cmap[32] = {
 RGB_PACK( 66,  30,  15), /* brown 3 */
 RGB_PACK( 40,  14,  20), /* brown 3 */
 RGB_PACK( 25,   7,  26), /* dark violett */
 RGB_PACK( 17,   3,  35), /* dark violett */
 RGB_PACK(  9,   1,  47), /* darkest blue */
 RGB_PACK(  6,   3,  56), /* darkest blue */
 RGB_PACK(  4,   4,  73), /* blue 5 */
 RGB_PACK(  2,   5,  88), /* blue 5 */
 RGB_PACK(  0,   7, 100), /* blue 4 */
 RGB_PACK(  6,  20, 119), /* blue 4 */
 RGB_PACK( 12 , 44, 138), /* blue 3 */
 RGB_PACK( 18 , 60, 155), /* blue 3 */
 RGB_PACK( 24,  82, 177), /* blue 2 */
 RGB_PACK( 40, 100, 192), /* blue 2 */
 RGB_PACK( 57, 125, 209), /* blue 1 */
 RGB_PACK( 57, 152, 219), /* blue 1 */
 RGB_PACK( 95, 181, 229), /* blue 0 */
 RGB_PACK(134, 181, 239), /* blue 0 */
 RGB_PACK(172, 208, 248), /* lightest blue */
 RGB_PACK(211, 236, 248), /* lightest blue */
 RGB_PACK(226, 234, 219), /* lightest yellow */
 RGB_PACK(241, 233, 191), /* lightest yellow */
 RGB_PACK(244, 216, 143), /* light yellow */
 RGB_PACK(248, 201,  95), /* light yellow */
 RGB_PACK(251, 185,  47), /* dirty yellow */
 RGB_PACK(255, 170,   0), /* dirty yellow */
 RGB_PACK(229, 149,   0), /* brown 0 */
 RGB_PACK(204, 128,   0), /* brown 0 */
 RGB_PACK(178, 107,   0), /* brown 1 */
 RGB_PACK(153,  87,   1), /* brown 1 */
 RGB_PACK(129,  70,   3), /* brown 2 */
 RGB_PACK(106,  52,   3)  /* brown 2 */
};

void fill(unsigned long val){
  unsigned long addr;
  for (addr = 0; addr < 65536; addr++)
    putpix(addr, val);
}

const float MinRe_tab[2] = {-2.0, -0.796407186};
const float MaxRe_tab[2] = { 1.0, -0.760479042};
const float MinIm_tab[2] = {-1.2,  0.117343173};

int mbrot(int zoom)
{
  float         MinRe = MinRe_tab[zoom];
  float         MaxRe = MaxRe_tab[zoom];
  float         MinIm = MinIm_tab[zoom];
  float         MaxIm = MinIm+(MaxRe-MinRe)*ImageHeight/ImageWidth;
  float         Re_factor = (MaxRe-MinRe)/(ImageWidth-1);
  float         Im_factor = (MaxIm-MinIm)/(ImageHeight-1);
  unsigned      MaxIterations = 30;
  unsigned      y;
  unsigned long px_addr = 0;

  unsigned long msec_start, msec_end, msec_elapsed;
  msec_start = csr_read(0x0C01);
  unsigned long scale = 100*(((get_switches() >> 1) & 1)+1);

  for (y=0; y<ImageHeight; ++y)
  {
    float    c_im = MaxIm - y*Im_factor;
    unsigned x;
    
    for (x=0; x<ImageWidth; ++x)
    {
      float    c_re     = MinRe + x*Re_factor;
      float    Z_re     = c_re;
      float    Z_im     = c_im;
      int      isInside = 1;
      unsigned n;
         
      for (n=0; n<MaxIterations; ++n)
      {
        float Z_re2 = Z_re*Z_re, Z_im2 = Z_im*Z_im;
        
        if (Z_re2 + Z_im2 > 4.0) {
          isInside = 0;
          break;
        }
        Z_im = 2*Z_re*Z_im + c_im;
        Z_re = Z_re2 - Z_im2 + c_re;
      }
      if (!isInside) {
        int ix = n%32;
        putpix(px_addr++, cmap[ix]);
      }
      else
        putpix(px_addr++, 0);
    }

    msec_end = csr_read(0x0C01);
    msec_elapsed = msec_end - msec_start;
    put_ssd((msec_elapsed+50)/scale);

  }
}

int main(){
  unsigned long iter  = 0;
  unsigned long leds  = 0;
  unsigned long bgval = 0;
  unsigned long zoom  = 0;
  unsigned long msec_start, msec_end, msec_elapsed;
  unsigned long scale = 100*(((get_switches() >> 1) & 1)+1);

  put_ssd(0);

  while (1) {
    fill(bgval);
    put_leds(zoom);
    msec_start = csr_read(0x0C01);
    mbrot(zoom);
    msec_end = csr_read(0x0C01);
    msec_elapsed = msec_end - msec_start;
    put_ssd((msec_elapsed+50)/scale);
	  while (!(get_btns() & 0x8));
	  zoom  = get_switches() & 1;
    scale = 100*(((get_switches() >> 1) & 1)+1);
  }
}
