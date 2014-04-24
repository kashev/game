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
 * kattack.pde
 */

/*
 * CONSTANTS
 */
final String GAME_NAME = "kattack";

/*
 * VARIABLES
 */
final int BLOCKS_ACROSS = 6;
final int BLOCKS_HIGH   = 11;
final int BLOCK_SIZE    = 80;
final int SIDE_BAR      = 200;
final int CANVAS_WIDTH  = (BLOCK_SIZE * BLOCKS_ACROSS) + SIDE_BAR;
final int CANVAS_HEIGHT = BLOCK_SIZE * BLOCKS_HIGH;

GameState gs;

/*
 * KEYBOARD HANDLERS
 */
void
keyPressed()
{
    if (key == CODED)
    {
        if (keyCode == UP)
        {
            gs.deliverKey(gs.GAME_UP);
        }
        else if (keyCode == DOWN)
        {
            gs.deliverKey(gs.GAME_DOWN);
        }
        else if (keyCode == LEFT)
        {
            gs.deliverKey(gs.GAME_LEFT);
        }
        else if (keyCode == RIGHT)
        {
            gs.deliverKey(gs.GAME_RIGHT);
        }
    }
    else if (key == ' ')
    {
        gs.deliverKey(gs.GAME_SWAP);
    }
}

void
keyReleased()
{
    println("released " + int(key) + " " + keyCode);
}

/*
 * PROCESSING REQUIRED
 */
void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D); // P2D is required for some reason
    
    gs = new GameState(BLOCKS_ACROSS, BLOCKS_HIGH, BLOCK_SIZE, SIDE_BAR);  

    /* PRINT TEXT TO CONSOLE */
    println(GAME_NAME);

    frameRate(200); // need to run faster than 60 if possible?

    gs.render(); // render for the first time.
    frame.setTitle(GAME_NAME + " : " + int(frameRate) + " fps");
}

void
draw ()
{
    gs.update();
    gs.render();
    frame.setTitle(GAME_NAME + " : " + int(frameRate) + " fps");
}
