/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 3b
 * 3 on page 104
 * 1 on page 116
 * 1 on page 135
 * 1 on page 143
 * 1 on page 180
 * 3 on page 289
 * 
 * page180.pde
 */

/*
Exercises
1. Make a program run at four frames per second and display the current frame count to the console with println().
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

int x = 0, y = 0, s = 50;
int vx = 2, vy = 4;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
    frameRate(4);
}

void
draw ()
{   
    background(0);
    rect(x, y, s, s);
    x += vx; y +=vy;

    if (x + s > CANVAS_SIZE || x < 0)
    {
        vx *= -1;
    }
    if (y + s > CANVAS_SIZE || y < 0)
    {
        vy *= -1;
    }
    println("frameRate: "+frameRate);
    frame.setTitle(frameRate + " fps");
}
