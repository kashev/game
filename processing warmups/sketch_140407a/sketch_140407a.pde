/*
 * game
 * 'A Simple Game made with ProcessingJS'
 *
 * Kashev Dalmia
 * kashev.dalmia@gmail.com
 *
 * The Last Project for ARTD 313 @ UIUC, Sp 2014
 * proj2a4b - dalmia3
 *
 * sketch_140407a.pde
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
    line(150, 25, mouseX, mouseY);
}
