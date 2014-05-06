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
final String GAME_NAME      = "kattack";
final String INCREMENT_KEYS = "zxcvbnmZXCVBNM";
final String PAUSE_KEYS     = "fghjklFGHJKLqertyuiopQWRTYUIOP";

/*
 * VARIABLES
 */
final int BLOCKS_ACROSS = 6;
final int BLOCKS_HIGH   = 11;
final int BLOCK_SIZE    = 80;
final int SIDE_BAR      = 400;
final int CANVAS_WIDTH  = (BLOCK_SIZE * BLOCKS_ACROSS) + (2 * SIDE_BAR);
final int CANVAS_HEIGHT = BLOCK_SIZE * BLOCKS_HIGH;

GameState gs;

/*
 * KEYBOARD HANDLERS
 */
void
keyPressed ()
{
    if (key == CODED)
    {
        if (keyCode == UP)
        {
            gs.deliverAction(gs.GAME_UP);
        }
        else if (keyCode == DOWN)
        {
            gs.deliverAction(gs.GAME_DOWN);
        }
        else if (keyCode == LEFT)
        {
            gs.deliverAction(gs.GAME_LEFT);
        }
        else if (keyCode == RIGHT)
        {
            gs.deliverAction(gs.GAME_RIGHT);
        }
    }

    else if (key == 'w' || key == 'W')
    {
        gs.deliverAction(gs.GAME_UP);
    }
    else if (key == 'a' || key == 'A')
    {
        gs.deliverAction(gs.GAME_LEFT);
    }
    else if (key == 's' || key == 'S')
    {
        gs.deliverAction(gs.GAME_DOWN);
    }
    else if (key == 'd' || key == 'D')
    {
        gs.deliverAction(gs.GAME_RIGHT);
    }
    
    else if (key == ' ')
    {
        gs.deliverAction(gs.GAME_SWAP);
    }
    
    else if (INCREMENT_KEYS.indexOf(key) > -1)
    { // something on the bottom row of the keyboard.
        gs.deliverAction(gs.GAME_INCREMENT);
    }
    
    else if (PAUSE_KEYS.indexOf(key) > -1)
    { // some other letter on the keyboard.
        gs.deliverAction(gs.GAME_PAUSE);
    }
}

void
keyReleased ()
{
    /* Intentionally Empty */
    /*
     * For now, OS key repeats are okay.
     */
}

/*
 * PROCESSING REQUIRED
 */
void
setup ()
{
    size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D); // P2D is required for pShapes
    
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
