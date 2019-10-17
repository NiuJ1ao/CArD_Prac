/* Library of I/O functions to write pixels to the VGA frame buffer
 *
 */

/* Define the CSR addresses for the VGA pixel buffer registers */

#define CSR_PX_ADDR  0x07C4
#define CSR_PX_DIN   0x07C5
#define CSR_PX_DOUT  0x07C6
#define CSR_PX_CMD   0x07C7
#define PX_CMD_WRITE 1
#define PX_CMD_READ  2

#define csr_write(csr, val)					          \
({								                            \
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrw " #csr ", %0"		\
			      : : "rK" (__v));			            \
})

#define csr_read(csr)						\
({								\
	register unsigned long __v;				\
	__asm__ __volatile__ ("csrr %0, " #csr			\
			      : "=r" (__v));			\
	__v;							\
})

void putpix (unsigned long px_addr, unsigned long px_value)
{
  const unsigned long cmd_write = 1;
  csr_write(0x07C4, px_addr);
  csr_write(0x07C5, px_value);
  csr_write(0x07C7, cmd_write);
  return;
}

void put_leds(unsigned long leds)
{
	csr_write(0x07C1, leds);
}

void put_ssd(unsigned long ssd)
{
	csr_write(0x07C2, ssd);
}

unsigned long get_btns()
{
	return csr_read(0xFC3);
}

unsigned long get_switches()
{
	return csr_read(0xFC2);
}
