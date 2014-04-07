/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 1b
 *
 * 1, 2, and 3 on page 21
 * 1 and 2 on page 35
 *
 * pg 35 exs 1 & 2
 */

/*
 * This code will create a black 640 * 480 pixel display window with a black background,
 * then display some text to the console.
 */

/*
 * CONSTANTS
 */
final int canvas_width  = 640;
final int canvas_height = 480;

final color bg  = #404040;
final color nep = #27ae60;
final color asb = #7f8c8d;
final color bel = #2980b9;

final int wait = 1000;
/*
 * VARIABLES
 */
int t;
boolean which = true;

void
composition (color ell_fill, color ell_line, color l_col)
{
    /*
     * Background
     */
    background(bg);

    /*
     * Ellipse
     */
    strokeWeight(3);
    stroke(ell_line);
    fill(ell_fill);
    ellipse((millis() % canvas_width), (millis() % canvas_height) , canvas_width / 4, canvas_height* 0.4);

    /*
     * Line
     */
    stroke(l_col);
    smooth();
    strokeWeight(10);
    line(0, canvas_height, canvas_width, 0);
}

/*
 * Processing Required
 */
void
setup ()
{
    size(canvas_width, canvas_height);
    /* PRINT TEXT TO CONSOLE */
    println("Kashev Dalmia - Page 35 Ex. 1 & 2");

    t = millis();
    composition(nep, asb, bel);
}

void
draw ()
{
    if (millis() - t  >= wait)
    {    
        t = millis();
        which = !which;
        if (which)
        {
            composition(nep, asb, bel);
        }
        else
        {
            composition(bel, asb, nep);
        }
    }
}
