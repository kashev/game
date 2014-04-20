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
 * page93.pde
 */

/*
Exercises
1. Explore a wide range of color combinations within one composition.
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
    noStroke();
    colorMode(HSB, CANVAS_SIZE);
    for (int i = 0; i < CANVAS_SIZE; i++)
    {
        for (int j = 0; j < CANVAS_SIZE; j++)
        {
            stroke(i, j, CANVAS_SIZE);
            point(i, j);
        }
    }
}

int i = 0;
void
draw ()
{
    stroke(0, 0, 0);
    fill(random(0, CANVAS_SIZE), random(0, CANVAS_SIZE), random(0, CANVAS_SIZE));
    ellipse(CANVAS_SIZE/2, CANVAS_SIZE/2, 200 * sin(i), 200 * sin(i));
    i++;
}
