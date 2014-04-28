/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 *
 * 2 on page 215
 * 2 on page 227
 * 2 on page 236
 * 
 * page236.pde
 */

/*
Exercises
2. Create two shapes and give each a different relation to the mouse. Design the
behaviors of each shape so that it has one behavior when the mouse is moved
and has another behavior when the mouse is dragged.
*/

final int CANVAS_SIZE  = 200;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

int r = 0, g = 0, v = 0;

void
draw ()
{   
    background(204);
    fill(color(r, g, 0));
    rect(25, 25, 50, 50);

    fill(color(0, 0, 255));
    rect(100, 100, 50, 50, v);
}


void mouseDragged() 
{
    r += 1;
    if (r > 255)
    {
        r = 0;
    }

    v -= 1;
    if (v < 0)
    {
        v = 0;
    }
}

void mouseMoved()
{
    g += 1;
    if (g > 255)
    {
        g = 0;
    }

    v += 1;
    if (v > 50)
    {
        v = 50;
    }
}
