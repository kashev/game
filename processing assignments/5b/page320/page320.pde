/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 5b
 *
 * 1 on page 196
 * 1 on page 313
 * 1 on page 320
 * 2 on page 354
 * 
 * page320.pde
 */

/*
Exercises
1. Load a sequence of related images into an array and use them to create a
linear animation.
*/

final int NUM_FRAMES   = 73;

/*
 * Processing Required
 */

PImage imgs [] = new PImage[NUM_FRAMES];
int f = 0;

void
setup ()
{
    for (int i = 0; i < NUM_FRAMES; i++)
    {
        imgs[i] = loadImage("wow-gif/frame_" + nf(i, 3) + ".gif"); 
    }

    size(imgs[0].width, imgs[0].height);
    frameRate(20);
}

void
draw ()
{
    image(imgs[f], 0, 0);
    f = (f + 1) % NUM_FRAMES;
}
