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
final int BLOCKS_HIGH   = 11;

final color bg = #FFFFFF;

/*
 * VARIABLES
 */
GameState gs = new GameState(BLOCKS_ACROSS, BLOCKS_HIGH);

/*
 * KEYBOARD HANDLER
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
    size(CANVAS_WIDTH, CANVAS_HEIGHT);
    background(bg);
    /* PRINT TEXT TO CONSOLE */
    println(GAME_NAME);

    gs.printState();
}

void
draw ()
{
    gs.render();
}
