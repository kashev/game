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
 * page289_1.pde
 */

/*
Exercises
1. Move two shapes continuously, but constrain their positions to the display window.
2. Move three shapes on different curves to create a kinetic composition.
3. Use the transformation functions to animate a shape.
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

int x1 = 0, y1 = 0, x2 = 200, y2 = 200, s = 50;
int vx1 = 2, vy1 = 4, vx2 = -4, vy2 = 2;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

void
draw ()
{   
    background(0);
    rect(x1, y1, s, s);
    ellipse(x2, y2, s, s);

    x1 += vx1; y1 +=vy1;

    if (x1 + s > CANVAS_SIZE || x1 < 0)
    {
        vx1 *= -1;
    }
    if (y1 + s > CANVAS_SIZE || y1 < 0)
    {
        vy1 *= -1;
    }

    x2 += vx2; y2 +=vy2;

    if (x2 + s/2 > CANVAS_SIZE || x2 < s/2)
    {
        vx2 *= -1;
    }
    if (y2 + s/2 > CANVAS_SIZE || y2 < s/2)
    {
        vy2 *= -1;
    }
}
