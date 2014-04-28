/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 *
 * 2 on page 215
 * 2 on page 227
 * 2 on page 236
 * 
 * page215.pde
 */

/*
Exercises
2. Create a typing program to display a different image for each letter on the keyboard.
*/


/* 
 * Images From : http://www.publicdomainpictures.net/view-image.php?image=35513
 */
final int CANVAS_SIZE  = 200;

/*
 * Processing Required
 */

PImage[] letters = new PImage[26];

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);

    for (char i = 'a'; i <= 'z'; i++)
    {
        letters[int(i - 'a')] = loadImage(i+".jpg");
    }
}

void
draw ()
{   
    background(204);
    if ((key >= 'a') && (key <= 'z'))
    {
        image(letters[int(key - 'a')], 5, 5);
    }
}
