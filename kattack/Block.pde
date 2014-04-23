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

public class Block {
    /*
     * BLOCK SIZE - should be the same for all blocks
     */
    private int BLOCK_SIZE;
    private final static byte NONE_ENUM    = 0;
    private final static int TIMER_COUNT   = 200;
    private final static int FALLING_COUNT = 200;
    
    /*
     * MEMBER VARIABLES
     */
    /* PUBLIC */
    /* PRIVATE */
    /* FINAL */
    private final byte   type;
    private final String str;
    private final PGraphics pg;
    /* NOT FINAL */
    private boolean marked  = false;
    private boolean falling = false;
    private int timer = 0;

    /*
     * PRIVATE METHODS
     */

    /*
     * CONSTRUCTORS
     */
    public
    Block (byte type,
           String str,
           PGraphics pg,
           int blocksize)
    {
        this.type = type;
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

    public boolean
    shouldDelete ()
    {
        return this.isMarked() && (this.timer > TIMER_COUNT);
    }

    public boolean
    isFalling ()
    {
        return this.falling;
    }

    public boolean
    doneFalling ()
    {
        return (this.timer > FALLING_COUNT);
    }


    /* RENDERING */
    public void
    draw ()
    {
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
            this.timer++;
        }
        else
        {
            noTint();
        }

        if (this.isFalling())
        {
            // animate falling
            this.timer++;
        }
        else
        {
            // don't animate falling
        }

        image(this.pg, 0, 0);
    }

    /* UPDATING */
    public void
    mark ()
    {
        this.marked = true;
    }

    public void
    fall ()
    {
        this.falling = true;
    }

    public void
    finishFalling ()
    {
        this.falling = false;
        this.timer = 0;
    }

}
