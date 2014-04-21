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

public class Block {
    /*
     * BLOCK SIZE - should be the same for all blocks
     */
    private int BLOCK_SIZE;
    
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

    /* Colors - Courtesy of http://flatuicolors.com/ */
    private final static color NONE_COLOR     = #ffffff;
    private final static color SQUARE_COLOR   = #3498db;
    private final static color TRIANGLE_COLOR = #2ecc71;
    private final static color CIRCLE_COLOR   = #9b59b6;
    private final static color STAR_COLOR     = #f1c40f;
    private final static color CRESCENT_COLOR = #e74c3c;

    /* Block Strings -  for debugging */
    private final static String NONE_CHAR     = "  ";
    private final static String SQUARE_CHAR   = "[]";
    private final static String TRIANGLE_CHAR = "^ ";
    private final static String CIRCLE_CHAR   = "O ";
    private final static String STAR_CHAR     = "* ";
    private final static String CRESCENT_CHAR = "C ";

    /*
     * MEMBER VARIABLES
     */
    /* PUBLIC */
    /* PRIVATE */
    private byte   type;
    private color  col;
    private String str;
    private PShape shape;

    /*
     * PRIVATE METHODS
     */
    private void
    setColor ()
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
    setString ()
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
    setShape ()
    {
        switch (this.type)
        {
            case NONE_ENUM:
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
            case SQUARE_ENUM:
                this.shape = createShape(RECT, (int)(this.BLOCK_SIZE * 0.2),
                                               (int)(this.BLOCK_SIZE * 0.2),
                                               (int)(this.BLOCK_SIZE * 0.6),
                                               (int)(this.BLOCK_SIZE * 0.6) );
                // this.shape.fill(lighten(this.col, 0.2));
                break;
            case TRIANGLE_ENUM:
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
            case CIRCLE_ENUM:
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
            case STAR_ENUM:
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
            case CRESCENT_ENUM:
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
            default :
                this.shape = createShape(RECT, 0, 0, 1, 1);
                break;
        }
    }

    /*
     * CONSTRUCTORS
     */
    public
    Block (byte type, int blocksize)
    {
        this.type = type;
        this.BLOCK_SIZE = blocksize;
        this.setColor();
        this.setString();
        this.setShape();
    }

    public
    Block (int blocksize)
    {
        this.type = (byte) random(1, 6);
        this.BLOCK_SIZE = blocksize;
        this.setColor();
        this.setString();
        this.setShape();
    }

    /*
     * PUBLIC METHODS
     */
    /* GETTERS */
    public byte
    getType ()
    {
        return this.type;
    }

    public String
    getString ()
    {
        return this.str;
    }

    /* RENDERING */
    public void
    draw ()
    {
        fill(this.col);
        rect(0, 0, this.BLOCK_SIZE, this.BLOCK_SIZE);
        shape(this.shape, 0, 0);
    }

    /* UPDATING */
    public void
    markForDeletion ()
    {
        //stub
    }

}
