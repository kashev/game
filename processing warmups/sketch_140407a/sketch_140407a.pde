/*
 * Lecture Sketch
 */

/*
 * CONSTANTS
 */

final int canvas_width  = 400;
final int canvas_height = 700;

/*
 * PROCESSING REQUIRED
 */
void
setup ()
{
    size(canvas_width, canvas_height);
    stroke(255);
    background(192, 64, 0);
}

void
draw ()
{
    background(192, 64, 0);
    line(0, 0, mouseX, mouseY);
    noFill();
    rect(100, 100, 100, 100);
    triangle(0, 0, 200, 100, 100, 200);
}
