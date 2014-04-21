/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 * 3 on page 104
 * 1 on page 116
 * 1 on page 135
 * 1 on page 143
 * 1 on page 180
 * 3 on page 289
 * 
 * page143.pde
 */

/*
Exercises
1. Use rotate() to change the orientation of a shape.
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);

    translate(200, 200);
    rotate(PI/4);

    rect(0, 0, 200, 200);
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
