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
 * BLOCKS
 *     Enums aren't supported in Processing. BlockTypes are bytes
 */
final byte NONE_ENUM     = 0;
final byte SQUARE_ENUM   = 1;
final byte TRIANGLE_ENUM = 2;
final byte CIRCLE_ENUM   = 3;
final byte STAR_ENUM     = 4;
final byte CRESCENT_ENUM = 5;

/*
 * GameState Class
 */
public class GameState {
    /*
     * DATA
     */
    /*
     * State is stored as such:
     * [0,7] [1,7] [2,7] [3,7] [4,7] [5,7]
     * [0,6] [1,6] [2,6] [3,6] [4,6] [5,6]
     * [0,5] [1,5] [2,5] [3,5] [4,5] [5,5]
     * [0,4] [1,4] [2,4] [3,4] [4,4] [5,4]
     * [0,3] [1,3] [2,3] [3,3] [4,3] [5,3]
     * [0,2] [1,2] [2,2] [3,2] [4,2] [5,2]
     * [0,1] [1,1] [2,1] [3,1] [4,1] [5,1]
     * [0,0] [1,0] [2,0] [3,0] [4,0] [5,0]
     */
    public Block [][] blocks;
    public int across, high;
    /*
     * PUBLIC
     */
    
    /*
     * Constructor
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
    }

    /*
     * PRIVATE
     */
    private Block
    randomBlock ()
    {
        return new Block((byte) random(1, 6)); // don't return no block, 0
    }

    /*
     * DEBUGGING
     */
    public void
    printState ()
    {
        print("GAME STATE :\n\n");
        for (int j = this.high - 1 ; j >= 0 ; j--)
        {
            for (int i = 0; i < this.across; i++)
            {
                switch (this.blocks[i][j].type)
                {
                    case NONE_ENUM:
                        print(NONE_CHAR);
                        break;
                    case SQUARE_ENUM:
                        print(SQUARE_CHAR);
                        break;
                    case TRIANGLE_ENUM:
                        print(TRIANGLE_CHAR);
                        break;
                    case CIRCLE_ENUM:
                        print(CIRCLE_CHAR);
                        break;
                    case STAR_ENUM:
                        print(STAR_CHAR);
                        break;
                    case CRESCENT_ENUM:
                        print(CRESCENT_CHAR);
                        break;
                    default :
                        print("XX");
                        break;    
                }
            }
            print("\n");
        }

        print("\n\n");
    }
}
