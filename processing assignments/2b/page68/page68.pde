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
 * page68.pde
 */

/*
Exercises
1. Draw a regular pattern with five lines. Rewrite the code using a for structure.
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
    int y1 = 100;
    int y2 = 400;
    int s  = 100;
    for (int i = 1; i <= 5; ++i)
    {
        line(s*i, y1, s*i, y2);
    }
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
