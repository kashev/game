/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 *
 * - 1 on page 41
 * - 3 on page 50
 * - 1 on page 59
 * - 1 on page 68
 * - 1 on page 77
 * - 1 on page 93
 * - 1 on page 99
 * - 1 on page 132
 *
 * page41.pde
 */

/*
1. Think about different types of numbers you use daily. Are they integer or
floating-point numbers?
2. Make a few int and float variables. Try assigning them in different ways. Write the
values to the console with println().
3. Create a composition that scales proportionally with different window sizes.
Put different values into size() to test.
 */

final float ratio = 0.05;

/*
 * Processing Required
 */

void
setup ()
{
    size((int)(100*random(1, 10)), (int)(100*random(1, 10)));
    /* PRINT TEXT TO CONSOLE */
    print("Kashev Dalmia");
    println(" - dalmia3");
    print("Processing is fun");
    println(" & easy!");

    println("CANVAS_WIDTH: "+ width);
    println("CANVAS_HEIGHT: "+ height);
    println("ratio: "+ratio);

    if (frame != null)
    {
        frame.setResizable(true);
    }

}

void
draw ()
{
    rect((int)(ratio*width), (int)(ratio * height), (int)((1-(2*ratio)) * width), (int)((1-(2*ratio)) * height));
}
