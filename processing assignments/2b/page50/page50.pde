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
 * page50.pde
 */

/*
Exercises
1. Use one variable to set the position and size for three ellipses.
2. Use multiplication to create a series of lines with increasing space between each.
3. Explore the functions for constraining numbers. Use min() and max() to draw a regular pattern of lines from a sequence of irregular numbers.
 */

final int CANVAS_WIDTH  = 700;
final int CANVAS_HEIGHT = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT);
    
    /* 1 */
    final int s = 100;
    ellipse(s, s, s, s);
    ellipse(s, 2.5*s, s, s);
    ellipse(s, 4*s, s, s);

    /* 2 */
    final int t = 200; final int b = 400;
    line(t, s, t, b);
    line(1.1*t, s, 1.1*t, b);
    line(1.7*t, s, 1.7*t, b);
    line(3*t, s, 3*t, b);

    /* 3 */
    final int [] values = { 129, 124, 42, 21, 100, 255, 124, 12, 141, 1600};

    line(min(values), min(values), 0.2 * max(values), 0.2 * max(values));
    line(0.2 * min(values), 2.0 * min(values), 0.2 * max(values), 0.2 * max(values));
    line(2.0 * min(values), 0.2 * min(values), 0.2 * max(values), 0.2 * max(values));

}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
