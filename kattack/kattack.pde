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

/*
 * VARIABLES
 */
final int BLOCKS_ACROSS = 6;
final int BLOCKS_HIGH   = 11;
final int BLOCK_SIZE    = 80;
final int CANVAS_WIDTH  = BLOCK_SIZE * BLOCKS_ACROSS;
final int CANVAS_HEIGHT = BLOCK_SIZE * BLOCKS_HIGH;

GameState gs;

/*
 * KEYBOARD HANDLERS
 */
void
keyTyped()
{
  println("typed " + int(key) + " " + keyCode);
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
    size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D); // P2D is required for some PShapes
    
    gs = new GameState(BLOCKS_ACROSS, BLOCKS_HIGH, BLOCK_SIZE);  

    /* PRINT TEXT TO CONSOLE */
    println(GAME_NAME);

    /*
     * DEFAULT DRAWING SETTINGS
     */
    strokeWeight(2);
    frameRate(200); // need to run faster than 60 if possible?

    gs.printState();
    gs.render();

}

void
draw ()
{
    gs.update();
    gs.render();
    frame.setTitle(GAME_NAME + " : " + int(frameRate) + " fps");
}
