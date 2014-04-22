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
    private final static byte DIAMOND_ENUM  = 1;
    private final static byte TRIANGLE_ENUM = 2;
    private final static byte CIRCLE_ENUM   = 3;
    private final static byte STAR_ENUM     = 4;
    private final static byte HEART_ENUM    = 5;

    /* Colors - Courtesy of http://flatuicolors.com/ */
    private final static color NONE_COLOR     = #ffffff;
    private final static color DIAMOND_COLOR  = #8e44ad; // wisteria
    private final static color TRIANGLE_COLOR = #2980b9; // belize hole
    private final static color CIRCLE_COLOR   = #27ae60; // nephritis
    private final static color STAR_COLOR     = #f1c40f; // sunflower
    private final static color HEART_COLOR    = #c0392b; // pomegranite

    /* Block Strings -  for debugging */
    private final static String NONE_CHAR     = "  ";
    private final static String DIAMOND_CHAR  = "<>";
    private final static String TRIANGLE_CHAR = "^ ";
    private final static String CIRCLE_CHAR   = "O ";
    private final static String STAR_CHAR     = "* ";
    private final static String HEART_CHAR    = "<3";

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
            case DIAMOND_ENUM:
                this.col = DIAMOND_COLOR;
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
            case HEART_ENUM:
                this.col = HEART_COLOR;
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
            case DIAMOND_ENUM:
                this.str = DIAMOND_CHAR;
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
            case HEART_ENUM:
                this.str = HEART_CHAR;
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
                this.shape = createShape();
                break;
            case DIAMOND_ENUM:
                this.shape = createShape();
                this.shape.beginShape();
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.5));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.9));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.5));

                this.shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));

                this.shape.endShape();
                this.shape.setFill(lighten(this.col, 0.4));
                break;
            case TRIANGLE_ENUM:
                this.shape = createShape();
                this.shape.beginShape();
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.9));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.9));

                this.shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));

                this.shape.endShape();
                this.shape.setFill(lighten(this.col, 0.4));
                break;
            case CIRCLE_ENUM:
                this.shape = createShape(ELLIPSE, (int)(this.BLOCK_SIZE * 0.1),
                                                  (int)(this.BLOCK_SIZE * 0.1),
                                                  (int)(this.BLOCK_SIZE * 0.8),
                                                  (int)(this.BLOCK_SIZE * 0.8));
                this.shape.setFill(lighten(this.col, 0.4));
                break;
            case STAR_ENUM:
                this.shape = createShape();
                this.shape.beginShape();
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.63), (int)(this.BLOCK_SIZE * 0.33));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.95), (int)(this.BLOCK_SIZE * 0.38));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.71), (int)(this.BLOCK_SIZE * 0.59));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.77), (int)(this.BLOCK_SIZE * 0.90));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.76));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.21), (int)(this.BLOCK_SIZE * 0.90));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.27), (int)(this.BLOCK_SIZE * 0.59));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.05), (int)(this.BLOCK_SIZE * 0.38));
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.36), (int)(this.BLOCK_SIZE * 0.33));

                this.shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05));

                this.shape.endShape();
                this.shape.setFill(lighten(this.col, 0.4));
                break;
            case HEART_ENUM:
                this.shape = createShape();
                this.shape.beginShape();
                this.shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30)); 
                this.shape.bezierVertex((int)(this.BLOCK_SIZE * 0.35), (int)(this.BLOCK_SIZE * -0.25), // ctrl 1
                                        (int)(this.BLOCK_SIZE * -0.25), (int)(this.BLOCK_SIZE * 0.40), // ctrl 2
                                        (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.9));  // anchor
                this.shape.bezierVertex((int)(this.BLOCK_SIZE * 1.25), (int)(this.BLOCK_SIZE * 0.40),  // ctrl 1
                                        (int)(this.BLOCK_SIZE * 0.65), (int)(this.BLOCK_SIZE * -0.25), // ctrl 2
                                        (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30)); // anchor

                this.shape.endShape();
                this.shape.setFill(lighten(this.col, 0.4));
                break;
            default :
                this.shape = createShape();
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
        if (this.type == NONE_ENUM)
        {
            noStroke();
        }
        else
        {
            stroke(0);
        }
        rect(0, 0, this.BLOCK_SIZE, this.BLOCK_SIZE
            ,this.BLOCK_SIZE * 0.15); // curved edges
            // );
        shape(this.shape, 0, 0);
    }

    /* UPDATING */
    public void
    markForDeletion ()
    {
        //stub
    }

}
