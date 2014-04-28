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
 * page289_3.pde
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
int x = 0, y = 0;
int vx = 2, vy = 4;

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

void
draw ()
{   
    background(100);

    pushMatrix();
    translate(x, y);
    rect(0, 0, s, s);
    popMatrix();

    x += vx; y +=vy;

    if (x + s > CANVAS_SIZE || x < 0)
    {
        vx *= -1;
    }
    if (y + s > CANVAS_SIZE || y < 0)
    {
        vy *= -1;
    }
}
