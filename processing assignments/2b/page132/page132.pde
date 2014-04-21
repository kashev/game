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
 * page132.pde
 */

/*
Exercises
1. Use three variables assigned to random values to create a composition that is different every time the program is run.
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */
int s, x, y;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

void
draw ()
{
    s = (int) random(100, 400);
    x = (int) random(0, CANVAS_SIZE);
    y = (int) random(0, CANVAS_SIZE);
    ellipse(x, y, s, s);
}
