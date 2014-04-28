/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 5b
 *
 * 1 on page 196
 * 1 on page 313
 * 1 on page 320
 * 2 on page 354
 * 
 * page196.pde
 */

/*
Exercises
1. Create an array to store the y-coordinates of a sequence of shapes. Draw each shape
inside draw() and use the values from the array to set the y-coordinate of each.
*/

final int CANVAS_SIZE  = 700;

/*
 * Processing Required
 */

int ys [] = {0, 100, 200, 300, 400, 500, 600};

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);

    for (int i = 0; i < ys.length; ++i)
    {
        rect(20, ys[i] + 20 , 50, 50);    
    }
}

void
draw ()
{   
    /* intentionally empty */
}
