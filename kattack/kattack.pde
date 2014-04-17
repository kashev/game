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
GameState gs;

final color bg = #FFFFFF;

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
    gs = new GameState(BLOCKS_ACROSS, BLOCKS_HIGH);
    
    final int BLOCK_SIZE    = gs.blocks[0][0].BLOCK_SIZE;
    final int CANVAS_WIDTH  = BLOCK_SIZE * BLOCKS_ACROSS;
    final int CANVAS_HEIGHT = BLOCK_SIZE * BLOCKS_HIGH;
    
    size(CANVAS_WIDTH, CANVAS_HEIGHT, P2D);
    background(bg);
    /* PRINT TEXT TO CONSOLE */
    println(GAME_NAME);

    gs.printState();
}

void
draw ()
{
    gs.update();
    gs.render();
}
