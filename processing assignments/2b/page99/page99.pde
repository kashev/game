/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 *
 * - 1 on page 41
 * - 3 on page 50
 * - 1 on page 59
 * - 1 on page 68
 * - 1 on page 77
 * - 1 on page 93
 * - 1 on page 99
 * - 1 on page 132
 *
 * page99.pde
 */

/*
Exercises
1. Draw two images in the display window.
*/

final int CANVAS_SIZE  = 500;
PImage kimg, simg;
final int imgsize = 152;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
    background(255);
    kimg = loadImage("kashev.png");
    simg = loadImage("space.jpg");
}

int x = 0;
int y = 0;
int vx = 5;
int vy = 2;
void
draw ()
{
    background(255);
    x += vx; y += vy;
    if (x + imgsize > CANVAS_SIZE || x < 0)
    {
        vx *= -1;
    }
    if (y + imgsize > CANVAS_SIZE || y < 0)
    {
        vy *= -1;
    }
    image(simg, 0, 0);
    image(kimg, x, y);
}
