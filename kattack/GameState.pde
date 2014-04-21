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
 * GameState.pde
 */

/*
 * GameState Class
 */
public class GameState {
    /*
     * DATA
     */
    /*
     * State is stored as such:
     * [0,0] [1,0] [2,0] [3,0] [4,0] [5,0]
     * [0,1] [1,1] [2,1] [3,1] [4,1] [5,1]
     * [0,2] [1,2] [2,2] [3,2] [4,2] [5,2]
     * [0,3] [1,3] [2,3] [3,3] [4,3] [5,3]
     * [0,4] [1,4] [2,4] [3,4] [4,4] [5,4]
     * [0,5] [1,5] [2,5] [3,5] [4,5] [5,5]
     * [0,6] [1,6] [2,6] [3,6] [4,6] [5,6]
     * [0,7] [1,7] [2,7] [3,7] [4,7] [5,7]
     */
    public Block [][] blocks;
    public int across, high;
    public int BLOCK_SIZE;

    private final static color bg = 0xfffffff;

    /*
     * CONSTRUCTOR
     */
    public
    GameState (int across, int high)
    {
        this.across = across;
        this.high   = high;
        this.blocks = new Block[across][high];

        /* initially, random blocks */
        for (int i = 0; i < this.across; i++)
        {
            for (int j = 0; j < this.high; j++)
            {
                this.blocks[i][j] = this.randomBlock();
            }
        }

        this.BLOCK_SIZE = this.blocks[0][0].BLOCK_SIZE;
    }

    /*
     * PRIVATE
     */
    private Block
    randomBlock ()
    {
        return new Block(); // don't return no block, 0
    }

    private void
    drawBlock (Block b, int block_x, int block_y)
    {
        pushMatrix();
        translate(block_x * b.BLOCK_SIZE, block_y * b.BLOCK_SIZE);

        b.draw();

        popMatrix();
    }

    private void
    findMatches ()
    {

    }

    private void
    handleGravity ()
    {
        // https://github.com/volrath/tetris-attack/blob/master/static/js/modules/board.js
    }
    
    /*
     * PUBLIC METHODS
     */
    
    public void
    render()
    {
        background(bg);

        for(int j = this.high - 1; j >= 0; j--)
        {
            for(int i = 0; i < this.across; i++)
            {
                this.drawBlock(this.blocks[i][j], i, j);
            }
        }
    }

    public void
    update()
    {
        findMatches();
        handleGravity();
    }

    /*
     * DEBUGGING
     */
    public void
    printState ()
    {
        print("GAME STATE :\n\n");
        for (int j = 0; j < this.high ; j++)
        {
            for (int i = 0; i < this.across; i++)
            {
                print(this.blocks[i][j].getString());
            }
            print("\n");
        }

        print("\n\n");
    }

} /* END GAMESTATE */
