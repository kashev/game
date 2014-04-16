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
/* Colors Courtesy of http://flatuicolors.com/ */
final color SQUARE_COLOR   = #3498db;
final color TRIANGLE_COLOR = #2ecc71;
final color CIRCLE_COLOR   = #9b59b6;
final color STAR_COLOR     = #f1c40f;
final color CRESCENT_COLOR = #e74c3c;
/* Shapes Drawn in Colors */
// final PShape SQUARE_SHAPE   = createShape(RECT, 15, 15, 75, 75);
// final PShape TRIANGLE_SHAPE = createShape(TRIANGLE, 50, 15, 15, 15, 15, 100 - 15); //triangle(30, 75, 58, 20, 86, 75);
// final PShape CIRCLE_SHAPE   = createShape(RECT, 0, 0, 50, 50);
// final PShape STAR_SHAPE     = createShape(RECT, 0, 0, 50, 50);
// final PShape CRESCENT_SHAPE = createShape(RECT, 0, 0, 50, 50);
/* Block Char Strings is for debugging */
final String NONE_CHAR     = "  ";
final String SQUARE_CHAR   = "[]";
final String TRIANGLE_CHAR = "^ ";
final String CIRCLE_CHAR   = "O ";
final String STAR_CHAR     = "* ";
final String CRESCENT_CHAR = "C ";

/*
 * RENDERING METHODS
 */
void
drawBlock (Block b, int block_x, int block_y)
{
    color d;

    switch (b.type)
    {
        case NONE_ENUM:
            d = bg;
            break;
        case SQUARE_ENUM:
            d = SQUARE_COLOR;
            break;
        case TRIANGLE_ENUM:
            d = TRIANGLE_COLOR;
            break;
        case CIRCLE_ENUM:
            d = CIRCLE_COLOR;
            break;
        case STAR_ENUM:
            d = STAR_COLOR;
            break;
        case CRESCENT_ENUM:
            d = CRESCENT_COLOR;
            break;
        default :
            d = #000000;
            break;    
    }

    pushMatrix();
    translate(block_x * BLOCK_SIZE, block_y * BLOCK_SIZE);

    fill(d);
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
GameState gs = new GameState(6, 8);

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
