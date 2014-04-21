/*
 * Kashev Dalmia    - dalmia3
 * ARTD 313 sp 2014 - Ex 2b
 * 3 on page 104
 * 1 on page 116
 * 1 on page 135
 * 1 on page 143
 * 1 on page 180
 * 3 on page 289
 * 
 * page104.pde
 */

/*
Exercises
1. Create five char variables and assign a character to each. Write each to the console.
2. Create two String variables and assign a word to each. Write each to the console.
3. Store a sentence in a String and write it to the console
*/

final int CANVAS_SIZE  = 500;

/*
 * Processing Required
 */

void
setup ()
{
    size(CANVAS_SIZE, CANVAS_SIZE);

    char a = 'a';
    char b = 'b';
    char c = 'c';
    char d = 'd';
    char e = 'e';

    println("a: "+a);
    println("b: "+b);
    println("c: "+c);
    println("d: "+d);
    println("e: "+e);

    String k = "Kashev";
    String l = "ARTD313";

    println("k: "+k);
    println("l: "+l);

    String s = "This is so fun.";

    println("s: "+s);
}

void
draw ()
{
    /* INTENTIONALLY EMPTY */
}
