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

/* Shapes Drawn in Colors */
// final PShape SQUARE_SHAPE   = createShape(RECT, 15, 15, 75, 75);
// final PShape TRIANGLE_SHAPE = createShape(TRIANGLE, 50, 15, 15, 15, 15, 100 - 15); //triangle(30, 75, 58, 20, 86, 75);
// final PShape CIRCLE_SHAPE   = createShape(RECT, 0, 0, 50, 50);
// final PShape STAR_SHAPE     = createShape(RECT, 0, 0, 50, 50);
// final PShape CRESCENT_SHAPE = createShape(RECT, 0, 0, 50, 50);


/*
 * RENDERING METHODS
 */
void
drawBlock (Block b, int block_x, int block_y)
{
    pushMatrix();
    translate(block_x * BLOCK_SIZE, block_y * BLOCK_SIZE);

    fill(b.col);
    rect(0, 0, BLOCK_SIZE, BLOCK_SIZE);

    stroke(0);

    popMatrix();
}

void
render (GameState g)
{
    for (int j = g.high - 1 ; j >= 0 ; j--)
    {
        for (int i = 0; i < g.across; i++)
        {
            drawBlock(g.blocks[i][j], i, j);
        }
    }
}

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
    render(gs);
}
