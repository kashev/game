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
 * page59.pde
 */

/*
Exercises
1. Create a few relational expressions and print their evaluation to the console with println().
2. Create a composition with a series of lines and ellipses. Use an if structure to select which lines of code to run and which to skip.
3. Add an else to the code from exercise 2 to change which code is run.
*/

final int CANVAS_WIDTH  = 400;
final int CANVAS_HEIGHT = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT);
    
    /* 1 */
    println("3 < 5",3 < 5);
    println("3 >= 5",3 >= 5);
    println("3 == 5",3 == 5);
    println("1 == 1",1 == 1);

    /* 2  && 3 */
    final boolean apple = true;

    int s;
    if (apple)
    {
        s = 100;
    }
    else
    {
        s = 50;
    }

    ellipse(s, s, s, s);
    ellipse(2*s, 2*s, 2*s, 2*s);
    ellipse(0.5*s, 0.5*s, 0.5*s, 0.5*s);
    line(s, s, 2*s, 2*s);
    line(s * 0.5, s, 2*s, 4*s);
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
