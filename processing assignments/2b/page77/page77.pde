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
 * page77.pde
 */

/*
Exercises
1. Use beginShape() to draw a shape of your own design.
*/

final int CANVAS_WIDTH  = 600;
final int CANVAS_HEIGHT = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT);
    
    /* 1 */
    beginShape();
    vertex(100, 200);
    vertex(150, 300);
    vertex(200, 50);
    vertex(400, 450);
    vertex(100, 200);
    endShape();
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
