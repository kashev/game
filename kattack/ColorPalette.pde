/*
 * game
 * 'A Game made with Processing'
 * 
 * Kashev Dalmia
 * kashev.dalmia@gmail.com
 * 
 * The Last Project for ARTD 313 @ UIUC, Sp 2014
 * proj2a4b - dalmia3
 *
 * ColorPalette.pde
 */

public class ColorPalette {

    /*
     * COLOR PALETTE KEYWORDS
     *     used to switch the color scheme upon construction of the color palette object.
     */
    public final static byte LIGHT = 0;
    public final static byte SOS   = 1;

    /*
     * Colors - Courtesy of http://flatuicolors.com/
     *     Colors don't need to be static, this allows us to use lighten();
     */
    private final color NONE_COLOR = #ffffff;
    private final color BLOCK_GREY = #a0a0a0;
    
    private final color DIAMOND_COLOR_DARK  = #8e44ad; // wisteria
    private final color TRIANGLE_COLOR_DARK = #2980b9; // belize hole
    private final color CIRCLE_COLOR_DARK   = #27ae60; // nephritis
    private final color STAR_COLOR_DARK     = #f1c40f; // sunflower
    private final color HEART_COLOR_DARK    = #c0392b; // pomegranite

    private final color DIAMOND_COLOR_LIGHT  = this.lighten(#8e44ad, 0.4); // wisteria
    private final color TRIANGLE_COLOR_LIGHT = this.lighten(#2980b9, 0.4); // belize hole
    private final color CIRCLE_COLOR_LIGHT   = this.lighten(#27ae60, 0.4); // nephritis
    private final color STAR_COLOR_LIGHT     = this.lighten(#f1c40f, 0.4); // sunflower
    private final color HEART_COLOR_LIGHT    = this.lighten(#c0392b, 0.4); // pomegranite
    
    /* Inspired by https://cottonbureau.com/products/sos, http://bitelabs.org, https://cottonbureau.com/products/macaw/*/
    private final color DIAMOND_COLOR_SOS  = #5edaf6;
    private final color TRIANGLE_COLOR_SOS = this.lighten(#30A848, 0.2); // lighter bitelabs
    private final color CIRCLE_COLOR_SOS   = #e066ff;
    private final color STAR_COLOR_SOS     = #ffff6D;
    private final color HEART_COLOR_SOS    = #f45f72;


    /*
     * EXPORTED COLORS
     *     these are used to color the game.
     */
    private color DIAMOND_COLOR_BLOCK;
    private color TRIANGLE_COLOR_BLOCK;
    private color CIRCLE_COLOR_BLOCK;
    private color STAR_COLOR_BLOCK;
    private color HEART_COLOR_BLOCK;
    
    private color DIAMOND_COLOR_FILL;
    private color TRIANGLE_COLOR_FILL;
    private color CIRCLE_COLOR_FILL;
    private color STAR_COLOR_FILL;
    private color HEART_COLOR_FILL;

    /*
     * CONSTRUCTORS
     */
    public
    ColorPalette (byte p)
    {
        changePalette(p);
    }
    public
    ColorPalette ()
    {
        changePalette(this.LIGHT);
    }

    /*
     * changePalette() - changes the current color palette.
     *     note: must redraw block graphics to see changes.
     */
    public void
    changePalette (byte p)
    {
        switch (p)
        {
            case LIGHT:
                /*
                 * LIGHT THEME
                 */
                this.DIAMOND_COLOR_BLOCK  = DIAMOND_COLOR_DARK;
                this.TRIANGLE_COLOR_BLOCK = TRIANGLE_COLOR_DARK;
                this.CIRCLE_COLOR_BLOCK   = CIRCLE_COLOR_DARK;
                this.STAR_COLOR_BLOCK     = STAR_COLOR_DARK;
                this.HEART_COLOR_BLOCK    = HEART_COLOR_DARK;
                
                this.DIAMOND_COLOR_FILL  = DIAMOND_COLOR_LIGHT;
                this.TRIANGLE_COLOR_FILL = TRIANGLE_COLOR_LIGHT;
                this.CIRCLE_COLOR_FILL   = CIRCLE_COLOR_LIGHT;
                this.STAR_COLOR_FILL     = STAR_COLOR_LIGHT;
                this.HEART_COLOR_FILL    = HEART_COLOR_LIGHT;
                break;
            case SOS:
            default:
                /*
                 * SOS inspired.
                 */
                this.DIAMOND_COLOR_BLOCK  = BLOCK_GREY;
                this.TRIANGLE_COLOR_BLOCK = BLOCK_GREY;
                this.CIRCLE_COLOR_BLOCK   = BLOCK_GREY;
                this.STAR_COLOR_BLOCK     = BLOCK_GREY;
                this.HEART_COLOR_BLOCK    = BLOCK_GREY;
            
                this.DIAMOND_COLOR_FILL  = DIAMOND_COLOR_SOS;
                this.TRIANGLE_COLOR_FILL = TRIANGLE_COLOR_SOS;
                this.CIRCLE_COLOR_FILL   = CIRCLE_COLOR_SOS;
                this.STAR_COLOR_FILL     = STAR_COLOR_SOS;
                this.HEART_COLOR_FILL    = HEART_COLOR_SOS;
                break;
        }
    }

    /*
     * GETTERS
     */
    
    public color getDiamondColorBlock  () { return this.DIAMOND_COLOR_BLOCK;  }
    public color getTriangleColorBlock () { return this.TRIANGLE_COLOR_BLOCK; }
    public color getCircleColorBlock   () { return this.CIRCLE_COLOR_BLOCK;   }
    public color getStarColorBlock     () { return this.STAR_COLOR_BLOCK;     }
    public color getHeartColorBlock    () { return this.HEART_COLOR_BLOCK;    }

    public color getDiamondColorFill  () { return this.DIAMOND_COLOR_FILL;  }
    public color getTriangleColorFill () { return this.TRIANGLE_COLOR_FILL; }
    public color getCircleColorFill   () { return this.CIRCLE_COLOR_FILL;   }
    public color getStarColorFill     () { return this.STAR_COLOR_FILL;     }
    public color getHeartColorFill    () { return this.HEART_COLOR_FILL;    }


    /*
     * PRIVATE METHODS
     */
    private color
    addAlpha (color c, int a)
    {
        return (c & 0xffffff) | (a << 24);
    }
    
    private color
    darken (color c, float p)
    {
        int change = (int)(constrain(p, 0.0, 1.0) * (float)0xFF);
        int r = (int)constrain(red(c)   - change, 0, 255);
        int g = (int)constrain(green(c) - change, 0, 255);
        int b = (int)constrain(blue(c)  - change, 0, 255);
        return color(r, g, b);
    }
    
    public color
    lighten (color c, float p)
    {
        int change = (int)(constrain(p, 0.0, 1.0) * (float)0xFF);
        int r = (int)constrain(red(c)   + change, 0, 255);
        int g = (int)constrain(green(c) + change, 0, 255);
        int b = (int)constrain(blue(c)  + change, 0, 255);
        return color(r, g, b);
    }
}
