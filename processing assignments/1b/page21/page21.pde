/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 1b
 *
 * 1, 2, and 3 on page 21
 * 1 and 2 on page 35
 *
 * pg 21 exs 1, 2, & 3
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

/*
 * Processing Required
 */

void
setup ()
{
    size(canvas_width, canvas_height);
    stroke(255);
    background(0);
    /* PRINT TEXT TO CONSOLE */
    print("Kashev Dalmia");
    println(" - dalmia3");
    print("Processing is fun");
    println(" & easy!");
}

void
draw ()
{
    line(0, 0, mouseX, mouseY);
}
