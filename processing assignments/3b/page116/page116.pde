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
 * page116.pde
 */

/*
Exercises
1. Explore different typefaces in Processing. Draw your favorite word to the display window in your favorite typeface.
*/

final int CANVAS_SIZE  = 200;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);

    PFont font = loadFont("UniversCom-45Light-24.vlw");
    String myfavoriteword = "charlatan";

    textFont(font);
    fill(0);
    background(255);
    text(myfavoriteword, 50, 50);
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
