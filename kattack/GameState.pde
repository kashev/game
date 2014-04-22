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
     * STATICS
     */
    private final static color bg = 0xfffffff;
    /*
     * GAME STATES
     */
    private final static byte START_STATE = 0;
    private final static byte PLAY_STATE  = 1;
    private final static byte END_STATE   = 2;

    /*
     * STRINGS
     */
    private final static String START_STRING = "kattack - press any key to play.";
    private final static String END_STRING = "game over.";

    /*
     * GAME VARIABLES
     */
    
    private final static int SPEED_INCREMENT      = 1;
    private final static int FRAMES_PER_INCREMENT = 500;
    private final static int TEXT_SIZE            = 32;

    /*
     * BLOCKS CONSTANTS
     *     Enums aren't supported in Processing.
     */
    /* BlockTypes are bytes */
    private final static byte NONE_ENUM     = 0;
    private final static byte DIAMOND_ENUM  = 1;
    private final static byte TRIANGLE_ENUM = 2;
    private final static byte CIRCLE_ENUM   = 3;
    private final static byte STAR_ENUM     = 4;
    private final static byte HEART_ENUM    = 5;
    /* Colors - Courtesy of http://flatuicolors.com/ */
    private final static color NONE_COLOR     = #ffffff;
    private final static color DIAMOND_COLOR  = #8e44ad; // wisteria
    private final static color TRIANGLE_COLOR = #2980b9; // belize hole
    private final static color CIRCLE_COLOR   = #27ae60; // nephritis
    private final static color STAR_COLOR     = #f1c40f; // sunflower
    private final static color HEART_COLOR    = #c0392b; // pomegranite
    /* Graphics */
    private PGraphics NONE_GRAPHIC;
    private PGraphics DIAMOND_GRAPHIC;
    private PGraphics TRIANGLE_GRAPHIC;
    private PGraphics CIRCLE_GRAPHIC;
    private PGraphics STAR_GRAPHIC;
    private PGraphics HEART_GRAPHIC;
    /* Block Strings -  for debugging */
    private final static String NONE_STR     = "  ";
    private final static String DIAMOND_STR  = "<>";
    private final static String TRIANGLE_STR = "^ ";
    private final static String CIRCLE_STR   = "O ";
    private final static String STAR_STR     = "* ";
    private final static String HEART_STR    = "<3";
    
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
    public Block []   nblocks;
    private int BLOCKS_ACROSS, BLOCKS_HIGH;
    private int BLOCK_SIZE;
    private int SIDE_BAR;
    private byte state       = PLAY_STATE;
    private int  score       = 0;
    private int  speed       = 0;
    private int  frames_past = 0;


    /*
     * CONSTRUCTOR
     */
    public
    GameState (int across, int high, int blocksize, int sidebar)
    {
        this.BLOCKS_ACROSS = across;
        this.BLOCKS_HIGH   = high;
        this.BLOCK_SIZE    = blocksize;
        this.SIDE_BAR      = sidebar;

        initTextDrawing();

        this.blocks  = new Block[across][high];
        this.nblocks = new Block[across];

        /*
         * INITIALIZE PGRAPHICS BLOCKS
         */
        /* NONE BLOCK */
        this.NONE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE);
        /* Intentionally Empty */
        
        /* DIAMOND BLOCK */
        this.DIAMOND_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                              this.BLOCK_SIZE);
        PShape DIAMOND_SHAPE = createShape();
        DIAMOND_SHAPE.beginShape();
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.5));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.9));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.5));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        DIAMOND_SHAPE.endShape();
        DIAMOND_SHAPE.setFill(lighten(DIAMOND_COLOR, 0.4));
        this.DIAMOND_GRAPHIC.beginDraw();
        this.DIAMOND_GRAPHIC.fill(DIAMOND_COLOR);
        this.DIAMOND_GRAPHIC.rect(0, 0,
                                  this.BLOCK_SIZE, this.BLOCK_SIZE,
                                  this.BLOCK_SIZE * 0.15);
        this.DIAMOND_GRAPHIC.shape(DIAMOND_SHAPE, 0, 0);
        this.DIAMOND_GRAPHIC.endDraw();
        
        /* TRIANGLE BLOCK */
        this.TRIANGLE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                               this.BLOCK_SIZE);
        PShape TRIANGLE_SHAPE = createShape();
        TRIANGLE_SHAPE.beginShape();
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.9));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.9));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        TRIANGLE_SHAPE.endShape();
        TRIANGLE_SHAPE.setFill(lighten(TRIANGLE_COLOR, 0.4));

        this.TRIANGLE_GRAPHIC.beginDraw();
        this.TRIANGLE_GRAPHIC.fill(TRIANGLE_COLOR);
        this.TRIANGLE_GRAPHIC.rect(0, 0,
                                   this.BLOCK_SIZE, this.BLOCK_SIZE,
                                   this.BLOCK_SIZE * 0.15);
        this.TRIANGLE_GRAPHIC.shape(TRIANGLE_SHAPE, 0, 0);
        this.TRIANGLE_GRAPHIC.endDraw();
        
        /* CIRCLE BLOCK */
        this.CIRCLE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                             this.BLOCK_SIZE);
        PShape CIRCLE_SHAPE = createShape(ELLIPSE, (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.8),
                                                   (int)(this.BLOCK_SIZE * 0.8));
        CIRCLE_SHAPE.setFill(lighten(CIRCLE_COLOR, 0.4));
        this.CIRCLE_GRAPHIC.beginDraw();
        this.CIRCLE_GRAPHIC.fill(CIRCLE_COLOR);
        this.CIRCLE_GRAPHIC.rect(0, 0,
                                 this.BLOCK_SIZE, this.BLOCK_SIZE,
                                 this.BLOCK_SIZE * 0.15);
        this.CIRCLE_GRAPHIC.shape(CIRCLE_SHAPE, 0, 0);
        this.CIRCLE_GRAPHIC.endDraw();
        
        /* STAR BLOCK */
        this.STAR_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE);
        PShape STAR_SHAPE = createShape();
        STAR_SHAPE.beginShape();
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.63), (int)(this.BLOCK_SIZE * 0.33));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.95), (int)(this.BLOCK_SIZE * 0.38));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.71), (int)(this.BLOCK_SIZE * 0.59));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.77), (int)(this.BLOCK_SIZE * 0.90));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.76));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.21), (int)(this.BLOCK_SIZE * 0.90));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.27), (int)(this.BLOCK_SIZE * 0.59));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.05), (int)(this.BLOCK_SIZE * 0.38));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.36), (int)(this.BLOCK_SIZE * 0.33));
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05));
        STAR_SHAPE.endShape();
        STAR_SHAPE.setFill(lighten(STAR_COLOR, 0.4));
        this.STAR_GRAPHIC.beginDraw();
        this.STAR_GRAPHIC.fill(STAR_COLOR);
        this.STAR_GRAPHIC.rect(0, 0,
                               this.BLOCK_SIZE, this.BLOCK_SIZE,
                               this.BLOCK_SIZE * 0.15);
        this.STAR_GRAPHIC.shape(STAR_SHAPE, 0, 0);
        this.STAR_GRAPHIC.endDraw();
        
        /* HEART BLOCK */
        this.HEART_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                            this.BLOCK_SIZE);
        PShape HEART_SHAPE = createShape();
        HEART_SHAPE.beginShape();
        HEART_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30)); 
        HEART_SHAPE.bezierVertex((int)(this.BLOCK_SIZE * 0.35), (int)(this.BLOCK_SIZE * 0.00),  // ctrl 1
                                 (int)(this.BLOCK_SIZE * 0.00), (int)(this.BLOCK_SIZE * 0.40),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.9));  // anchor
        HEART_SHAPE.bezierVertex((int)(this.BLOCK_SIZE * 1.00), (int)(this.BLOCK_SIZE * 0.40),  // ctrl 1
                                 (int)(this.BLOCK_SIZE * 0.65), (int)(this.BLOCK_SIZE * 0.00),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30)); // anchor
        HEART_SHAPE.endShape();
        HEART_SHAPE.setFill(lighten(HEART_COLOR, 0.4));
        this.HEART_GRAPHIC.beginDraw();
        this.HEART_GRAPHIC.fill(HEART_COLOR);
        this.HEART_GRAPHIC.rect(0, 0,
                                this.BLOCK_SIZE, this.BLOCK_SIZE,
                                this.BLOCK_SIZE * 0.15);
        this.HEART_GRAPHIC.shape(HEART_SHAPE, 0, 0);
        this.HEART_GRAPHIC.endDraw();

        /*
         * INITIALIZE GAME BOAD
         */
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH; j++)
            {
                if (j < (int)(this.BLOCKS_HIGH * 0.5))
                {
                    this.blocks[i][j] = this.noneBlock();
                }
                else
                {
                    this.blocks[i][j] = this.randomBlock();
                }
            }

            this.nblocks[i] = this.randomBlock();
        }
    } /* END CONSTRUCTOR */

    /*
     * PRIVATE
     */
    private Block
    randomBlock ()
    {
        return this.getBlock((byte) random(1, 6)); // don't return no block, 0
    }

    private Block
    noneBlock ()
    {
        return this.getBlock(NONE_ENUM);
    }

    private Block
    getBlock (byte type)
    {
        switch (type) 
        {
            case NONE_ENUM:
                return new Block(NONE_ENUM,
                                 NONE_COLOR,
                                 NONE_STR,
                                 NONE_GRAPHIC,
                                 BLOCK_SIZE);
            case DIAMOND_ENUM:
                return new Block(DIAMOND_ENUM,
                                 DIAMOND_COLOR,
                                 DIAMOND_STR,
                                 DIAMOND_GRAPHIC,
                                 BLOCK_SIZE);
            case TRIANGLE_ENUM:
                return new Block(TRIANGLE_ENUM,
                                 TRIANGLE_COLOR,
                                 TRIANGLE_STR,
                                 TRIANGLE_GRAPHIC,
                                 BLOCK_SIZE);
            case CIRCLE_ENUM:
                return new Block(CIRCLE_ENUM,
                                 CIRCLE_COLOR,
                                 CIRCLE_STR,
                                 CIRCLE_GRAPHIC,
                                 BLOCK_SIZE);
            case STAR_ENUM:
                return new Block(STAR_ENUM,
                                 STAR_COLOR,
                                 STAR_STR,
                                 STAR_GRAPHIC,
                                 BLOCK_SIZE);
            case HEART_ENUM:
                return new Block(HEART_ENUM,
                                 HEART_COLOR,
                                 HEART_STR,
                                 HEART_GRAPHIC,
                                 BLOCK_SIZE);
            default :
                return new Block(NONE_ENUM,
                                 NONE_COLOR,
                                 NONE_STR,
                                 NONE_GRAPHIC,
                                 BLOCK_SIZE);
        }
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
    initTextDrawing ()
    {
        textSize(TEXT_SIZE);
    }

    private void
    drawScore ()
    {
        fill(0);
        text(str(this.score), this.BLOCK_SIZE * this.BLOCKS_ACROSS * 1.1, TEXT_SIZE);
    }

    private void
    findMatches ()
    {
        // https://github.com/volrath/tetris-attack/blob/master/static/js/modules/board.js
        // http://androidgamify.blogspot.com/2013/10/match-3-game-algorithm-part-2-how-to.html
        /* VERTICAL MATCHING */
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH - 2; j++)
            {
                boolean marked = this.blocks[i][j].isMarked();
                byte t0 = this.blocks[i][j].getType();
                byte t1 = this.blocks[i][j+1].getType();
                byte t2 = this.blocks[i][j+2].getType();

                if (!marked && (t0 != NONE_ENUM) && (t0 == t1) && (t0 == t2))
                {
                    // a match!
                    this.blocks[i][j].mark();
                    this.blocks[i][j+1].mark();
                    this.blocks[i][j+2].mark();

                    int jj = j+3;
                    while (jj < this.BLOCKS_HIGH && this.blocks[i][jj].getType() == t0)
                    {
                        this.blocks[i][jj].mark();
                        jj++;
                    }
                }
            }
        }
        /* HORIZONTAL MATCHING */
        for (int i = 0; i < this.BLOCKS_ACROSS - 2; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH; j++)
            {
                boolean marked = this.blocks[i][j].isMarked();
                byte t0 = this.blocks[i][j].getType();
                byte t1 = this.blocks[i+1][j].getType();
                byte t2 = this.blocks[i+2][j].getType();

                if (!marked && (t0 != NONE_ENUM) && (t0 == t1) && (t0 == t2))
                {
                    // a match!
                    this.blocks[i][j].mark();
                    this.blocks[i+1][j].mark();
                    this.blocks[i+2][j].mark();

                    int ii = i+3;
                    while (ii < this.BLOCKS_HIGH && this.blocks[ii][j].getType() == t0)
                    {
                        this.blocks[ii][j].mark();
                        ii++;
                    }
                }
            }
        }
    }

    private void
    handleGravity ()
    {
        // https://github.com/volrath/tetris-attack/blob/master/static/js/modules/board.js
    }

    private void
    copyNewBlocks ()
    {
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH; j++)
            {
                if(j == 0 && this.blocks[i][j].getType() != NONE_ENUM) // top row and block exists
                {
                    this.state = END_STATE; // Game Over!
                }
                else if (j == this.BLOCKS_HIGH - 1) // bottom row
                {
                    this.blocks[i][j] = this.nblocks[i];
                }
                else
                {
                    this.blocks[i][j] = this.blocks[i][j + 1];
                }
            }
        }
    }

    private void
    newBlocks ()
    {
        this.frames_past++;
        if (this.frames_past > FRAMES_PER_INCREMENT)
        {
            this.frames_past = 0;
            this.speed++;
            this.copyNewBlocks();

            // create new offscreen blocks
            for (int i = 0; i < this.BLOCKS_ACROSS; i++)
            {
                this.nblocks[i] = randomBlock();
            }
        }
    }

    private void
    deleteBlock (int i, int j)
    {
        this.blocks[i][j] = null;
        this.blocks[i][j] = noneBlock();
    }
    
    /*
     * PUBLIC METHODS
     */
    
    public void
    render ()
    {
        background(bg);
        switch (this.state)
        {
            case START_STATE:
                /* DRAW START SCREEN */
                fill(0);
                text(START_STRING, 200, 200);
                break;

            case PLAY_STATE:
                /* DRAW SCORE */
                this.drawScore();
                /* DRAW GAME SCREEN */
                for(int j = this.BLOCKS_HIGH - 1; j >= 0; j--)
                {
                    for(int i = 0; i < this.BLOCKS_ACROSS; i++)
                    {
                        this.drawBlock(this.blocks[i][j], i, j);
                    }
                }
                break;

            case END_STATE:
                /* DRAW END SCREEN */
                fill(0);
                text(END_STRING, 200, 200);
                break;
        }
    }

    public void
    update()
    {
        if (this.state == PLAY_STATE)
        {
            this.findMatches();
            this.handleGravity();
            this.newBlocks();
        }
    }

    /*
     * DEBUGGING
     */
    public void
    printState ()
    {
        print("GAME STATE :\n\n");
        for (int j = 0; j < this.BLOCKS_HIGH ; j++)
        {
            for (int i = 0; i < this.BLOCKS_ACROSS; i++)
            {
                print(this.blocks[i][j].getString());
            }
            print("\n");
        }

        print("\n\n");
    }

} /* END GAMESTATE */
