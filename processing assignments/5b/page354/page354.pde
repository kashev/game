/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 5b
 *
 * 1 on page 196
 * 1 on page 313
 * 1 on page 320
 * 2 on page 354
 * 
 * page354.pde
 */

/*
Exercises
2. Load three images and recombine them with blend().
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

PImage i1, i2, i3;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
    i1 = loadImage("1.jpg");
    i2 = loadImage("2.jpg");
    i3 = loadImage("3.jpg");

    i1.blend(i2, 0, 0, CANVAS_SIZE, CANVAS_SIZE, 0, 0, CANVAS_SIZE, CANVAS_SIZE, ADD);
    i1.blend(i3, 0, 0, CANVAS_SIZE, CANVAS_SIZE, 0, 0, CANVAS_SIZE, CANVAS_SIZE, ADD);
    image(i1, 0, 0);
}

void
draw ()
{
    /* intentionally empty */
}
