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
    private final static byte NONE_ENUM = 0;
    
    /*
     * MEMBER VARIABLES
     */
    /* PUBLIC */
    /* PRIVATE */
    /* FINAL */
    private final byte   type;
    private final color  col;
    private final String str;
    private final PGraphics pg;
    /* NOT FINAL */
    private boolean marked = false;

    /*
     * PRIVATE METHODS
     */

    /*
     * CONSTRUCTORS
     */
    public
    Block (byte type,
           color col,
           String str,
           PGraphics pg,
           int blocksize)
    {
        this.type = type;
        this.col = col;
        this.str = str;
        this.pg  = pg;
        this.BLOCK_SIZE = blocksize;
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

    public boolean
    isMarked ()
    {
        return this.marked;
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
        if (this.isMarked())
        {
            tint(255, 0, 0, 50);
        }
        else
        {
            noTint();
        }
        image(this.pg, 0, 0);
    }

    /* UPDATING */
    public void
    mark ()
    {
        this.marked = true;
    }

}
