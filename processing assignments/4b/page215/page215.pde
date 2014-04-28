/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 4b
 *
 * 2 on page 215
 * 2 on page 227
 * 2 on page 236
 * 
 * page215.pde
 */

/*
Exercises
2. Invent three unique shapes that behave differently in relation to the mouse. Each
shape’s behavior should change when the mouse is pressed. Relate the form of
each shape to its behavior.
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);
}

void
draw ()
{   
    background(204);
    if (mousePressed == true)
    {
        /* SHAPE 1 */
        fill(color(0, 0, 150));
        triangle(0, 0, CANVAS_SIZE, mouseY, mouseX, CANVAS_SIZE);
        /* SHAPE 2 */
        fill(color(40, 50, 60));
        ellipse(CANVAS_SIZE * 0.5, CANVAS_SIZE * 0.5, mouseY, mouseX);
        /* SHAPE 3 */
        fill (color(0, 255, 0));
        rect(mouseX - (CANVAS_SIZE * 0.05), mouseY- (CANVAS_SIZE * 0.05), CANVAS_SIZE * 0.1, CANVAS_SIZE * 0.1, CANVAS_SIZE* 0.03);
    }
    else
    {
        /* SHAPE 1 */
        fill(color(0, 0, 150));
        triangle(0, 0, CANVAS_SIZE, mouseX, mouseY, CANVAS_SIZE);
        /* SHAPE 2 */
        fill(color(40, 50, 60));
        ellipse(CANVAS_SIZE * 0.5, CANVAS_SIZE * 0.5, mouseX, mouseY);
        /* SHAPE 3 */
        fill (color(255, 0, 0));
        rect(mouseX- (CANVAS_SIZE * 0.05), mouseY- (CANVAS_SIZE * 0.05), CANVAS_SIZE * 0.1, CANVAS_SIZE * 0.1);
    }
}
