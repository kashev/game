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
 * kattack.pde
 */

/*
 * CONSTANTS
 */
final String GAME_NAME = "kattack";

final int CANVAS_WIDTH  = 600;
final int CANVAS_HEIGHT = 800;

final int BLOCK_SIZE    = 100;
final int BLOCKS_ACROSS = 6;
final int BLOCKS_HIGH   = 8;

final color bg = #FFFFFF;

/*
 * DEFINITIONS
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
/* Colors Courtesy of http://flatuicolors.com/ */
final color SQUARE_COLOR   = #3498db;
final color TRIANGLE_COLOR = #2ecc71;
final color CIRCLE_COLOR   = #9b59b6;
final color STAR_COLOR     = #f1c40f;
final color CRESCENT_COLOR = #e74c3c;
/* Block Unicode is for debugging */
final String NONE_CHAR     = "  ";
final String SQUARE_CHAR   = "[]";
final String TRIANGLE_CHAR = "^ ";
final String CIRCLE_CHAR   = "O ";
final String STAR_CHAR     = "* ";
final String CRESCENT_CHAR = "C ";


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
    public byte [][] blocks;
    public int across, high;
    
    /*
     * Constructor
     */
    public
    GameState (int across, int high)
    {
        this.across = across;
        this.high   = high; 
        this.blocks = new byte[across][high];

        /* initially, no blocks */
        for (int i = 0; i < this.across; i++)
        {
            for (int j = 0; j < this.high; j++)
            {
                this.blocks[i][j] = this.randomBlock();
            }
        }
    }

    /*
     * PUBLIC
     */

    /*
     * PRIVATE
     */
    private byte
    randomBlock ()
    {
        return (byte) random(1, 6); // don't return no block, 0
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
                switch (this.blocks[i][j])
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

/*
 * VARIABLES
 */

GameState gs = new GameState(6, 8);

/*
 * Processing Required
 */
void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT);
    background(bg);
    /* PRINT TEXT TO CONSOLE */
    println(GAME_NAME);
    gs.printState();
}

void
draw ()
{
    // todo
}
