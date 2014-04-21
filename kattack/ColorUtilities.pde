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
 * ColorUtilities.pde
 */

color
addAlpha (color c, int a)
{
    return (c & 0xffffff) | (a << 24);
}

color
darken (color c, float p)
{
    int change = (int)(constrain(p, 0.0, 1.0) * (float)0xFF);
    int r = (int)constrain(red(c)   - change, 0, 255);
    int g = (int)constrain(green(c) - change, 0, 255);
    int b = (int)constrain(blue(c)  - change, 0, 255);
    return color(r, g, b);
}

color
lighten (color c, float p)
{
    int change = (int)(constrain(p, 0.0, 1.0) * (float)0xFF);
    int r = (int)constrain(red(c)   + change, 0, 255);
    int g = (int)constrain(green(c) + change, 0, 255);
    int b = (int)constrain(blue(c)  + change, 0, 255);
    return color(r, g, b);
}
