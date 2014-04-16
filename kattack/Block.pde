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
 * Block.pde
 */

/*
 * Block Class
 */

/* Shapes Drawn in Colors */
// final PShape SQUARE_SHAPE   = createShape(RECT, 15, 15, 75, 75);
// final PShape TRIANGLE_SHAPE = createShape(TRIANGLE, 50, 15, 15, 15, 15, 100 - 15); //triangle(30, 75, 58, 20, 86, 75);
// final PShape CIRCLE_SHAPE   = createShape(RECT, 0, 0, 50, 50);
// final PShape STAR_SHAPE     = createShape(RECT, 0, 0, 50, 50);
// final PShape CRESCENT_SHAPE = createShape(RECT, 0, 0, 50, 50);

public class Block {
    /*
     * STATICS
     */
    final static int BLOCK_SIZE = 100;
    /*
     * BLOCKS
     *     Enums aren't supported in Processing. BlockTypes are bytes
     */
    final static byte NONE_ENUM     = 0;
    final static byte SQUARE_ENUM   = 1;
    final static byte TRIANGLE_ENUM = 2;
    final static byte CIRCLE_ENUM   = 3;
    final static byte STAR_ENUM     = 4;
    final static byte CRESCENT_ENUM = 5;
    /*
     * DEFINITIONS
     */
    /* Colors Courtesy of http://flatuicolors.com/ */
    final static color NONE_COLOR     = #ffffff;
    final static color SQUARE_COLOR   = #3498db;
    final static color TRIANGLE_COLOR = #2ecc71;
    final static color CIRCLE_COLOR   = #9b59b6;
    final static color STAR_COLOR     = #f1c40f;
    final static color CRESCENT_COLOR = #e74c3c;
    /*
     * 
     */
    /* Block Char Strings is for debugging */
    final String NONE_CHAR     = "  ";
    final String SQUARE_CHAR   = "[]";
    final String TRIANGLE_CHAR = "^ ";
    final String CIRCLE_CHAR   = "O ";
    final String STAR_CHAR     = "* ";
    final String CRESCENT_CHAR = "C ";


    /*
     * MEMBER VARIABLES
     */
    public byte   type;
    public color  col;
    public String str;

    /*
     * PRIVATE METHODS
     */
    private void
    getColor ()
    {
        switch (this.type)
        {
            case NONE_ENUM:
                this.col = NONE_COLOR;
                break;
            case SQUARE_ENUM:
                this.col = SQUARE_COLOR;
                break;
            case TRIANGLE_ENUM:
                this.col = TRIANGLE_COLOR;
                break;
            case CIRCLE_ENUM:
                this.col = CIRCLE_COLOR;
                break;
            case STAR_ENUM:
                this.col = STAR_COLOR;
                break;
            case CRESCENT_ENUM:
                this.col = CRESCENT_COLOR;
                break;
            default :
                this.col = #000000;
                break;
        }
    }

    private void
    getString ()
    {
        switch (this.type)
        {
            case NONE_ENUM:
                this.str = NONE_CHAR;
                break;
            case SQUARE_ENUM:
                this.str = SQUARE_CHAR;
                break;
            case TRIANGLE_ENUM:
                this.str = TRIANGLE_CHAR;
                break;
            case CIRCLE_ENUM:
                this.str = CIRCLE_CHAR;
                break;
            case STAR_ENUM:
                this.str = STAR_CHAR;
                break;
            case CRESCENT_ENUM:
                this.str = CRESCENT_CHAR;
                break;
            default :
                this.str = "XX";
                break;
        }
    }

    /*
     * CONSTRUCTORS
     */
    public
    Block (byte type)
    {
        this.type = type;
        this.getColor();
        this.getString();
    }

    public
    Block ()
    {
        this.type = (byte) random(1, 6);
        this.getColor();
        this.getString();
    }

    /*
     * PUBLIC METHODS
     */
    public void
    draw ()
    {
        fill(this.col);
        rect(0, 0, BLOCK_SIZE, BLOCK_SIZE);
    }

}
