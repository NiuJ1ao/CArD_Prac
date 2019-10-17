#include <stdio.h>

const unsigned ImageHeight = 256;
const unsigned ImageWidth  = 256;

typedef struct RGB {
  unsigned char r, g, b;
} RGB_t;

const RGB_t cmap[32] = {
 { 66,  30,  15}, /* brown 3 */
 { 40,  14,  20}, /* brown 3 */
 { 25,   7,  26}, /* dark violett */
 { 17,   3,  35}, /* dark violett */
 {  9,   1,  47}, /* darkest blue */
 {  6,   3,  56}, /* darkest blue */
 {  4,   4,  73}, /* blue 5 */
 {  2,   5,  88}, /* blue 5 */
 {  0,   7, 100}, /* blue 4 */
 {  6,  20, 119}, /* blue 4 */
 { 12 , 44, 138}, /* blue 3 */
 { 18 , 60, 155}, /* blue 3 */
 { 24,  82, 177}, /* blue 2 */
 { 40, 100, 192}, /* blue 2 */
 { 57, 125, 209}, /* blue 1 */
 { 57, 152, 219}, /* blue 1 */
 { 95, 181, 229}, /* blue 0 */
 {134, 181, 239}, /* blue 0 */
 {172, 208, 248}, /* lightest blue */
 {211, 236, 248}, /* lightest blue */
 {226, 234, 219}, /* lightest yellow */
 {241, 233, 191}, /* lightest yellow */
 {244, 216, 143}, /* light yellow */
 {248, 201,  95}, /* light yellow */
 {251, 185,  47}, /* dirty yellow */
 {255, 170,   0}, /* dirty yellow */
 {229, 149,   0}, /* brown 0 */
 {204, 128,   0}, /* brown 0 */
 {178, 107,   0}, /* brown 1 */
 {153,  87,   1}, /* brown 1 */
 {129,  70,   3}, /* brown 2 */
 {106,  52,   3}  /* brown 2 */
};

int main(int argc, char * argv[])
{
  float MinRe = -2.0;
  float MaxRe = 1.0;
  float MinIm = -1.2;
  float MaxIm = MinIm+(MaxRe-MinRe)*ImageHeight/ImageWidth;
  float Re_factor = (MaxRe-MinRe)/(ImageWidth-1);
  float Im_factor = (MaxIm-MinIm)/(ImageHeight-1);
  unsigned MaxIterations = 30;
  unsigned y;
  
  printf ("P3\n");
  printf ("%3d %3d\n", ImageHeight, ImageWidth);
  printf ("255\n");
  
  for (y=0; y<ImageHeight; ++y)
  {
    float   c_im = MaxIm - y*Im_factor;
    unsigned x;
     
    for (x=0; x<ImageWidth; ++x)
    {
      float   c_re     = MinRe + x*Re_factor;
      float   Z_re     = c_re, Z_im = c_im;
      int      isInside = 1;
      unsigned n;
         
      for (n=0; n<MaxIterations; ++n)
      {
        float Z_re2 = Z_re*Z_re, Z_im2 = Z_im*Z_im;
        
        if(Z_re2 + Z_im2 > 4) {
          isInside = 0;
          break;
        }
        Z_im = 2*Z_re*Z_im + c_im;
        Z_re = Z_re2 - Z_im2 + c_re;
      }
      if (!isInside) {
        // printf ("%3d %3d %3d ", n*255/33, Z_re*33, (MaxIterations-n)*4);
        int ix = n%32;
        printf ("%3d %3d %3d ", cmap[ix].r, cmap[ix].g, cmap[ix].b);
      }
      else
        printf ("  0 0 0 ");
    }
    printf ("\n");
  }
}
