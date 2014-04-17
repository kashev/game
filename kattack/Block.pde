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
    public final static int BLOCK_SIZE = 75;
    /*
     * BLOCKS
     *     Enums aren't supported in Processing. BlockTypes are bytes
     */
    private final static byte NONE_ENUM     = 0;
    private final static byte SQUARE_ENUM   = 1;
    private final static byte TRIANGLE_ENUM = 2;
    private final static byte CIRCLE_ENUM   = 3;
    private final static byte STAR_ENUM     = 4;
    private final static byte CRESCENT_ENUM = 5;
    /*
     * DEFINITIONS
     */
    /* Colors Courtesy of http://flatuicolors.com/ */
    private final static color NONE_COLOR     = #ffffff;
    private final static color SQUARE_COLOR   = #3498db;
    private final static color TRIANGLE_COLOR = #2ecc71;
    private final static color CIRCLE_COLOR   = #9b59b6;
    private final static color STAR_COLOR     = #f1c40f;
    private final static color CRESCENT_COLOR = #e74c3c;
    /*
     * 
     */
    /* Block Char Strings is for debugging */
    private final static String NONE_CHAR     = "  ";
    private final static String SQUARE_CHAR   = "[]";
    private final static String TRIANGLE_CHAR = "^ ";
    private final static String CIRCLE_CHAR   = "O ";
    private final static String STAR_CHAR     = "* ";
    private final static String CRESCENT_CHAR = "C ";


    /*
     * MEMBER VARIABLES
     */
    public byte   type;
    public color  col;
    public String str;
    public PShape shape;

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

    private void
    getShape ()
    {
        switch (this.type)
        {
            case NONE_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            case SQUARE_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            case TRIANGLE_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            case CIRCLE_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            case STAR_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            case CRESCENT_ENUM:
                this.shape = createShape(RECT, 0, 0, 20, 20);
                break;
            default :
                this.shape = createShape(RECT, 0, 0, 20, 20);;
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
        this.getShape();
    }

    public
    Block ()
    {
        this.type = (byte) random(1, 6);
        this.getColor();
        this.getString();
        this.getShape();
    }

    /*
     * PUBLIC METHODS
     */
    public void
    draw ()
    {
        fill(this.col);
        rect(0, 0, BLOCK_SIZE, BLOCK_SIZE);
        shape(this.shape, 10, 10);
    }

}
