/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 5b
 *
 * 1 on page 196
 * 1 on page 313
 * 1 on page 320
 * 2 on page 354
 * 
 * page196.pde
 */

/*
Exercises
1. Write a function to draw a shape to the screen multiple times, each at a
different position.
*/

final int CANVAS_SIZE  = 700;


void
drawShapes (int num, PShape s)
{
    for (int i = 0; i < num; i++)
    {
        shape(s, random(0, CANVAS_SIZE), random(0, CANVAS_SIZE), 20, 20);
    }
}

/*
 * Processing Required
 */

PShape theshape;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE, P2D);
    frameRate(10);
    theshape = createShape(ELLIPSE, 0, 0, 50, 50);
}

void
draw ()
{   
    drawShapes(5, theshape);
}
