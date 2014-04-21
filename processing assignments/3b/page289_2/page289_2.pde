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
 * page289_2.pde
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

int s = 50;
int x1 = 0, y1 = 0, x2 = 200, y2 = 200, x3 = 50, y3 = 0;
int vx1 = 6, vy1 = 2;
float i2 = 0;
float g3 = 9.8 / 10;
float v3 = 0;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

void
draw ()
{   
    background(100);
    /* 1 */
    rect(x1, y1, s, s);

    x1 += vx1; y1 +=vy1;

    if (x1 + s > CANVAS_SIZE || x1 < 0)
    {
        vx1 *= -1;
    }
    if (y1 + s > CANVAS_SIZE || y1 < 0)
    {
        vy1 *= -1;
    }

    /* 2 */
    ellipse(x2, y2, s, s);
    i2 += 0.1;
    x2 = (int)(400 + 50* sin(i2));
    y2 = (int)(400 + 50* cos(i2));

    /* 3 */
    v3 += g3;
    y3 = (int)constrain(y3 + v3, 0, CANVAS_SIZE - (2*s));

    if (y3 + (2*s) >= CANVAS_SIZE || y3 < 0)
    {
        v3 *= -0.7;
    }
    rect(x3, y3, s, 2*s);

    if ((int)random(1, 100) == 99 && y3 == CANVAS_SIZE- (2*s))
    {
        y3 = 0;
    }
}
