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
 * GameState.pde
 */

/*
 * GameState Class
 */
public class GameState {
    /***
     *     #     #  #######  #     #  ######   #######  ######    #####  
     *     ##   ##  #        ##   ##  #     #  #        #     #  #     # 
     *     # # # #  #        # # # #  #     #  #        #     #  #       
     *     #  #  #  #####    #  #  #  ######   #####    ######    #####  
     *     #     #  #        #     #  #     #  #        #   #          # 
     *     #     #  #        #     #  #     #  #        #    #   #     # 
     *     #     #  #######  #     #  ######   #######  #     #   #####  
     *                                                                   
     */
    
    /***
     *      #####   #######  #     #   #####   #######     #     #     #  #######   #####  
     *     #     #  #     #  ##    #  #     #     #       # #    ##    #     #     #     # 
     *     #        #     #  # #   #  #           #      #   #   # #   #     #     #       
     *     #        #     #  #  #  #   #####      #     #     #  #  #  #     #      #####  
     *     #        #     #  #   # #        #     #     #######  #   # #     #           # 
     *     #     #  #     #  #    ##  #     #     #     #     #  #    ##     #     #     # 
     *      #####   #######  #     #   #####      #     #     #  #     #     #      #####  
     *                                                                                     
     */
    /*
     * STATICS
     */
     /*
      * PUBLIC STATICS
      *     for enumerating possible game actions
      */
    public final static byte GAME_UP    = 0;
    public final static byte GAME_DOWN  = 1;
    public final static byte GAME_LEFT  = 2;
    public final static byte GAME_RIGHT = 3;
    public final static byte GAME_SWAP  = 4;
    public final static byte GAME_INC   = 5;

    /*
     * PRIVATE STATICS
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
    private final static int TEXT_SIZE       = 32;
    private final static String START_STRING = "kattack - press the space key to play.";
    private final static String END_STRING   = "game over. press the space key to play again.";

    /*
     * GAME CONSTANTS
     */
    
    private final static float SPEED_INCREMENT = 0.0001; // seconds
    
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

    /* Block Strings -  for debugging */
    private final static String NONE_STR     = "  ";
    private final static String DIAMOND_STR  = "<>";
    private final static String TRIANGLE_STR = "^ ";
    private final static String CIRCLE_STR   = "O ";
    private final static String STAR_STR     = "* ";
    private final static String HEART_STR    = "<3";


    /***
     *      #####   #######  #        #######  ######         ##         #     #  ### 
     *     #     #  #     #  #        #     #  #     #       #  #        #     #   #  
     *     #        #     #  #        #     #  #     #        ##         #     #   #  
     *     #        #     #  #        #     #  ######        ###         #     #   #  
     *     #        #     #  #        #     #  #   #        #   # #      #     #   #  
     *     #     #  #     #  #        #     #  #    #       #    #       #     #   #  
     *      #####   #######  #######  #######  #     #       ###  #       #####   ### 
     *                                                                                
     */
    /*
     * UI CONSTANTS
     *     Modifying these will change the appearance of the game.
     */
    
    private final boolean stroke_on = false;
    private final int stroke_weight = 2;

    /* ColorPalette is used to determine color scheme for game */
    private ColorPalette cp;    

    /***
     *     #     #     #     ######   ###     #     ######   #        #######   #####  
     *     #     #    # #    #     #   #     # #    #     #  #        #        #     # 
     *     #     #   #   #   #     #   #    #   #   #     #  #        #        #       
     *     #     #  #     #  ######    #   #     #  ######   #        #####     #####  
     *      #   #   #######  #   #     #   #######  #     #  #        #              # 
     *       # #    #     #  #    #    #   #     #  #     #  #        #        #     # 
     *        #     #     #  #     #  ###  #     #  ######   #######  #######   #####  
     *                                                                                 
     */

    /* Graphics */
    private PGraphics NONE_GRAPHIC;
    private PGraphics DIAMOND_GRAPHIC;
    private PGraphics TRIANGLE_GRAPHIC;
    private PGraphics CIRCLE_GRAPHIC;
    private PGraphics STAR_GRAPHIC;
    private PGraphics HEART_GRAPHIC;

    private PGraphics CURSOR_GRAPHIC;
    private PGraphics BOARD_GRAPHIC;
    
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
    private int cursor_x, cursor_y;
    /* members with initial values */
    private byte  state       = START_STATE;
    private int   score       = 0;
    private float speed       = 15.0; // seconds.
    private int   frames_past = 0;


    /***
     *      #####   #######  #     #   #####   #######  ######   #     #   #####   #######  #######  ######  
     *     #     #  #     #  ##    #  #     #     #     #     #  #     #  #     #     #     #     #  #     # 
     *     #        #     #  # #   #  #           #     #     #  #     #  #           #     #     #  #     # 
     *     #        #     #  #  #  #   #####      #     ######   #     #  #           #     #     #  ######  
     *     #        #     #  #   # #        #     #     #   #    #     #  #           #     #     #  #   #   
     *     #     #  #     #  #    ##  #     #     #     #    #   #     #  #     #     #     #     #  #    #  
     *      #####   #######  #     #   #####      #     #     #   #####    #####      #     #######  #     # 
     *                                                                                                       
     */
    public
    GameState (int across, int high, int blocksize, int sidebar)
    {
        this.BLOCKS_ACROSS = across;
        this.BLOCKS_HIGH   = high;
        this.BLOCK_SIZE    = blocksize;
        this.SIDE_BAR      = sidebar;

        this.cp = new ColorPalette(ColorPalette.LIGHT_THEME); // must be called before initBlockGraphics.
                                                              // change the argument to change the color scheme.

        this.initDefaultValues();
        this.initTextDrawing();
        this.initCursorGraphics();
        this.initBlockGraphics(); // must be called before initGameBoard.

        this.blocks  = new Block[across][high];
        this.nblocks = new Block[across];

        this.initGameBoard();

    } /* END CONSTRUCTOR */

    /***
     *     ###  #     #  ###  #######  ###     #     #        ###  #######  #######  ######    #####  
     *      #   ##    #   #      #      #     # #    #         #        #   #        #     #  #     # 
     *      #   # #   #   #      #      #    #   #   #         #       #    #        #     #  #       
     *      #   #  #  #   #      #      #   #     #  #         #      #     #####    ######    #####  
     *      #   #   # #   #      #      #   #######  #         #     #      #        #   #          # 
     *      #   #    ##   #      #      #   #     #  #         #    #       #        #    #   #     # 
     *     ###  #     #  ###     #     ###  #     #  #######  ###  #######  #######  #     #   #####  
     *                                                                                                
     */

    /*
     * initDefaultValues()
     *     resets the game for another play.
     */
    private void
    initDefaultValues ()
    {
        this.score = 0;
        this.speed = 15.0;
        this.cursor_x      = (int)(this.BLOCKS_ACROSS * 0.5) - 1;
        this.cursor_y      = (int)(this.BLOCKS_HIGH - (this.BLOCKS_HIGH * 0.25));
    }

    private void
    initTextDrawing ()
    {
        textSize(TEXT_SIZE);
    }

    /*
     * initCursorGraphics()
     *     creates the graphics buffer the cursor is drawn from. Must be called
     *     before trying to draw the cursor.
     */
    private void
    initCursorGraphics ()
    {
        this.CURSOR_GRAPHIC = createGraphics(2 * this.BLOCK_SIZE,
                                             this.BLOCK_SIZE,
                                             P2D);
        this.CURSOR_GRAPHIC.beginDraw();
        this.CURSOR_GRAPHIC.fill(255, 0);
        this.CURSOR_GRAPHIC.strokeWeight(5);
        this.CURSOR_GRAPHIC.rect(0, 0, this.BLOCK_SIZE, this.BLOCK_SIZE);
        this.CURSOR_GRAPHIC.rect(this.BLOCK_SIZE, 0, this.BLOCK_SIZE, this.BLOCK_SIZE);
        this.CURSOR_GRAPHIC.endDraw();
    }

    /*
     * initBlockGraphics()
     *     initializes internal PGraphics buffers to draw blocks from. Must be called
     *     before instantiating any blocks.
     */
    private void
    initBlockGraphics ()
    {
        /* NONE BLOCK */
        this.NONE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE,
                                           P2D);
        /* Intentionally Empty */
        
        /* DIAMOND BLOCK */
        this.DIAMOND_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                              this.BLOCK_SIZE,
                                              P2D);
        PShape DIAMOND_SHAPE = createShape();
        DIAMOND_SHAPE.beginShape();
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.5));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.9));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.5));
        DIAMOND_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        DIAMOND_SHAPE.endShape(CLOSE);
        DIAMOND_SHAPE.setFill(this.cp.getDiamondColorFill());
        DIAMOND_SHAPE.setStroke(this.stroke_on);
        
        this.DIAMOND_GRAPHIC.beginDraw();
        if (this.stroke_on)
        {
            this.DIAMOND_GRAPHIC.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.DIAMOND_GRAPHIC.noStroke();    
        }
        this.DIAMOND_GRAPHIC.fill(this.cp.getDiamondColorBlock());
        this.DIAMOND_GRAPHIC.rect(0, 0,
                                  this.BLOCK_SIZE, this.BLOCK_SIZE,
                                  this.BLOCK_SIZE * 0.15);
        this.DIAMOND_GRAPHIC.shape(DIAMOND_SHAPE, 0, 0);
        this.DIAMOND_GRAPHIC.endDraw();
        
        /* TRIANGLE BLOCK */
        this.TRIANGLE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                               this.BLOCK_SIZE,
                                               P2D);
        PShape TRIANGLE_SHAPE = createShape();
        TRIANGLE_SHAPE.beginShape();
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.9));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.9));
        TRIANGLE_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        TRIANGLE_SHAPE.endShape(CLOSE);
        TRIANGLE_SHAPE.setFill(this.cp.getTriangleColorFill());
        TRIANGLE_SHAPE.setStroke(this.stroke_on);

        this.TRIANGLE_GRAPHIC.beginDraw();
        if (this.stroke_on)
        {
            this.TRIANGLE_GRAPHIC.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.TRIANGLE_GRAPHIC.noStroke();    
        }
        this.TRIANGLE_GRAPHIC.fill(this.cp.getTriangleColorBlock());
        this.TRIANGLE_GRAPHIC.rect(0, 0,
                                   this.BLOCK_SIZE, this.BLOCK_SIZE,
                                   this.BLOCK_SIZE * 0.15);
        this.TRIANGLE_GRAPHIC.shape(TRIANGLE_SHAPE, 0, 0);
        this.TRIANGLE_GRAPHIC.endDraw();
        
        /* CIRCLE BLOCK */
        this.CIRCLE_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                             this.BLOCK_SIZE,
                                             P2D);
        PShape CIRCLE_SHAPE = createShape(ELLIPSE, (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.8),
                                                   (int)(this.BLOCK_SIZE * 0.8));
        CIRCLE_SHAPE.setFill(this.cp.getCircleColorFill());
        CIRCLE_SHAPE.setStroke(this.stroke_on);

        this.CIRCLE_GRAPHIC.beginDraw();
        if (this.stroke_on)
        {
            this.CIRCLE_GRAPHIC.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.CIRCLE_GRAPHIC.noStroke();    
        }
        this.CIRCLE_GRAPHIC.fill(this.cp.getCircleColorBlock());
        this.CIRCLE_GRAPHIC.rect(0, 0,
                                 this.BLOCK_SIZE, this.BLOCK_SIZE,
                                 this.BLOCK_SIZE * 0.15);
        this.CIRCLE_GRAPHIC.shape(CIRCLE_SHAPE, 0, 0);
        this.CIRCLE_GRAPHIC.endDraw();
        
        /* STAR BLOCK */
        this.STAR_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE,
                                           P2D);
        PShape STAR_SHAPE = createShape();
        STAR_SHAPE.beginShape();
        /*       1
         *    _10'2__      
         *   9-8   4-3
         *     /.6.\
         *    7     5
         */
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05)); // 1
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.63), (int)(this.BLOCK_SIZE * 0.33)); // 2
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.95), (int)(this.BLOCK_SIZE * 0.38)); // 3
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.71), (int)(this.BLOCK_SIZE * 0.59)); // 4
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.77), (int)(this.BLOCK_SIZE * 0.90)); // 5
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.76)); // 6
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.23), (int)(this.BLOCK_SIZE * 0.90)); // 7
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.29), (int)(this.BLOCK_SIZE * 0.59)); // 8
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.05), (int)(this.BLOCK_SIZE * 0.38)); // 9
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.37), (int)(this.BLOCK_SIZE * 0.33)); // 10
        STAR_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05)); // 1
        STAR_SHAPE.endShape(CLOSE);
        STAR_SHAPE.setFill(this.cp.getStarColorFill());
        STAR_SHAPE.setStroke(this.stroke_on);

        this.STAR_GRAPHIC.beginDraw();
        if (this.stroke_on)
        {
            this.STAR_GRAPHIC.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.STAR_GRAPHIC.noStroke();    
        }
        this.STAR_GRAPHIC.fill(this.cp.getStarColorBlock());
        this.STAR_GRAPHIC.rect(0, 0,
                               this.BLOCK_SIZE, this.BLOCK_SIZE,
                               this.BLOCK_SIZE * 0.15);
        this.STAR_GRAPHIC.shape(STAR_SHAPE, 0, 0);
        this.STAR_GRAPHIC.endDraw();
        
        /* HEART BLOCK */
        this.HEART_GRAPHIC = createGraphics(this.BLOCK_SIZE,
                                            this.BLOCK_SIZE,
                                            P2D);
        PShape HEART_SHAPE = createShape();
        HEART_SHAPE.beginShape();
        HEART_SHAPE.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30));
        HEART_SHAPE.bezierVertex((int)(this.BLOCK_SIZE * 0.35), (int)(this.BLOCK_SIZE * -0.25),  // ctrl 1
                                 (int)(this.BLOCK_SIZE * -0.25), (int)(this.BLOCK_SIZE * 0.40),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.90));  // anchor
        HEART_SHAPE.bezierVertex((int)(this.BLOCK_SIZE * 1.25), (int)(this.BLOCK_SIZE * 0.40),   // ctrl 1
                                 (int)(this.BLOCK_SIZE * 0.65), (int)(this.BLOCK_SIZE * -0.25),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30));  // anchor
        HEART_SHAPE.endShape(CLOSE);
        HEART_SHAPE.setFill(this.cp.getHeartColorFill());
        HEART_SHAPE.setStroke(this.stroke_on);

        this.HEART_GRAPHIC.beginDraw();
        this.HEART_GRAPHIC.fill(this.cp.getHeartColorBlock());
        if (this.stroke_on)
        {
            this.HEART_GRAPHIC.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.HEART_GRAPHIC.noStroke();    
        }
        this.HEART_GRAPHIC.rect(0, 0,
                                this.BLOCK_SIZE, this.BLOCK_SIZE,
                                this.BLOCK_SIZE * 0.15);
        this.HEART_GRAPHIC.shape(HEART_SHAPE, 0, 0);
        this.HEART_GRAPHIC.endDraw();
    }

    /*
     * initGameBoard()
     *     initializes blocks on the board to the state they
     *     should be in for the beginning of a new game.
     */
    private void
    initGameBoard ()
    {
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
    }


    /***
     *     #     #  #######  #######  #     #  #######  ######    #####  
     *     ##   ##  #           #     #     #  #     #  #     #  #     # 
     *     # # # #  #           #     #     #  #     #  #     #  #       
     *     #  #  #  #####       #     #######  #     #  #     #   #####  
     *     #     #  #           #     #     #  #     #  #     #        # 
     *     #     #  #           #     #     #  #     #  #     #  #     # 
     *     #     #  #######     #     #     #  #######  ######    #####  
     *                                                                   
     */
    
    /***
     *     ######   #        #######   #####   #    #      #     #  #######  #######  #     #  #######  ######    #####  
     *     #     #  #        #     #  #     #  #   #       ##   ##  #           #     #     #  #     #  #     #  #     # 
     *     #     #  #        #     #  #        #  #        # # # #  #           #     #     #  #     #  #     #  #       
     *     ######   #        #     #  #        ###         #  #  #  #####       #     #######  #     #  #     #   #####  
     *     #     #  #        #     #  #        #  #        #     #  #           #     #     #  #     #  #     #        # 
     *     #     #  #        #     #  #     #  #   #       #     #  #           #     #     #  #     #  #     #  #     # 
     *     ######   #######  #######   #####   #    #      #     #  #######     #     #     #  #######  ######    #####  
     *                                                                                                                   
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

    private void
    deleteBlock (int i, int j)
    {
        this.blocks[i][j] = null;
        this.blocks[i][j] = noneBlock();
    }

    private Block
    getBlock (byte type)
    {
        switch (type) 
        {
            case NONE_ENUM:
                return new Block(NONE_ENUM,
                                 NONE_STR,
                                 NONE_GRAPHIC,
                                 BLOCK_SIZE);
            case DIAMOND_ENUM:
                return new Block(DIAMOND_ENUM,
                                 DIAMOND_STR,
                                 DIAMOND_GRAPHIC,
                                 BLOCK_SIZE);
            case TRIANGLE_ENUM:
                return new Block(TRIANGLE_ENUM,
                                 TRIANGLE_STR,
                                 TRIANGLE_GRAPHIC,
                                 BLOCK_SIZE);
            case CIRCLE_ENUM:
                return new Block(CIRCLE_ENUM,
                                 CIRCLE_STR,
                                 CIRCLE_GRAPHIC,
                                 BLOCK_SIZE);
            case STAR_ENUM:
                return new Block(STAR_ENUM,
                                 STAR_STR,
                                 STAR_GRAPHIC,
                                 BLOCK_SIZE);
            case HEART_ENUM:
                return new Block(HEART_ENUM,
                                 HEART_STR,
                                 HEART_GRAPHIC,
                                 BLOCK_SIZE);
            default :
                return new Block(NONE_ENUM,
                                 NONE_STR,
                                 NONE_GRAPHIC,
                                 BLOCK_SIZE);
        }
    }



    /***
     *      #####      #     #     #  #######      #        #######   #####   ###   #####  
     *     #     #    # #    ##   ##  #            #        #     #  #     #   #   #     # 
     *     #         #   #   # # # #  #            #        #     #  #         #   #       
     *     #  ####  #     #  #  #  #  #####        #        #     #  #  ####   #   #       
     *     #     #  #######  #     #  #            #        #     #  #     #   #   #       
     *     #     #  #     #  #     #  #            #        #     #  #     #   #   #     # 
     *      #####   #     #  #     #  #######      #######  #######   #####   ###   #####  
     *                                                                                     
     */
    
    public void
    update()
    {
        if (this.state == PLAY_STATE)
        {
            this.findMatches();
            this.cleanUp();
            this.handleGravity();
            this.handleNewBlocks();
        }
        else if (this.state == START_STATE)
        {
            // TODO
        }
        else if (this.state == END_STATE)
        {
            // TODO
        }
    }

    private void
    findMatches ()
    {
        // Resources
        // https://github.com/volrath/tetris-attack/blob/master/static/js/modules/board.js
        // http://androidgamify.blogspot.com/2013/10/match-3-game-algorithm-part-2-how-to.html
        /* VERTICAL MATCHING */
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH - 2; j++)
            {
                byte t = this.blocks[i][j].getType();

                if (!this.blocks[i][j].isMarked()    &&
                    !this.blocks[i][j+1].isMarked()  &&
                    !this.blocks[i][j+2].isMarked()  && 
                    !this.blocks[i][j].isFalling()   &&
                    !this.blocks[i][j+1].isFalling() &&
                    !this.blocks[i][j+2].isFalling() &&
                    (t != NONE_ENUM) &&
                    (t == this.blocks[i][j+1].getType()) &&
                    (t == this.blocks[i][j+2].getType()) )
                {   // a match!
                    this.blocks[i][j].mark();
                    this.blocks[i][j+1].mark();
                    this.blocks[i][j+2].mark();

                    int jj = j+3;
                    while (jj < this.BLOCKS_HIGH               &&
                           (this.blocks[i][jj].getType() == t) &&
                           !this.blocks[i][jj].isMarked()      &&
                           !this.blocks[i][jj].isFalling())
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
                byte t = this.blocks[i][j].getType();
                
                if (!this.blocks[i][j].isMarked()    &&
                    !this.blocks[i+1][j].isMarked()  &&
                    !this.blocks[i+2][j].isMarked()  && 
                    !this.blocks[i][j].isFalling()   &&
                    !this.blocks[i+1][j].isFalling() &&
                    !this.blocks[i+2][j].isFalling() &&
                    (t != NONE_ENUM) &&
                    (t == this.blocks[i+1][j].getType()) &&
                    (t == this.blocks[i+2][j].getType()) )
                {   // a match!
                    this.blocks[i][j].mark();
                    this.blocks[i+1][j].mark();
                    this.blocks[i+2][j].mark();
                    
                    int ii = j+3;
                    while (ii < this.BLOCKS_ACROSS             &&
                           (this.blocks[ii][j].getType() == t) &&
                           !this.blocks[ii][j].isMarked()      &&
                           !this.blocks[ii][j].isFalling())
                    {
                        this.blocks[ii][j].mark();
                        ii++;
                    }
                }
            }
        }
    }

    private void
    cleanUp ()
    {
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH; j++)
            {
                if (this.blocks[i][j].shouldDelete())
                {
                    this.deleteBlock(i, j);
                }
            }
        }
    }

    private void
    handleGravity ()
    {
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH - 1; j++)
            {
                if (!this.blocks[i][j].isFalling() && ((this.blocks[i][j+1].getType() == NONE_ENUM) || this.blocks[i][j+1].isFalling()))
                {
                    this.blocks[i][j].fall();
                }
                else if (this.blocks[i][j].doneFalling() && this.blocks[i][j+1].getType() == NONE_ENUM)
                {
                    this.blocks[i][j].finishFalling();
                    this.blocks[i][j + 1 ] = this.blocks[i][j];
                    this.deleteBlock(i, j);
                }
            }
        }
    }

    private void
    handleNewBlocks ()
    {
        this.frames_past++;
        if (this.frames_past > (this.speed * frameRate)) // speed[s] * frameRate[frames/s] = # of frames to wait
        {
            this.frames_past = 0;
            this.speed -= SPEED_INCREMENT;

            this.copyNewBlocks();
        }
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

        // create new offscreen blocks
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            this.nblocks[i] = randomBlock();
        }
    }



    /***
     *     ######   #######  #     #  ######   #######  ######   ###  #     #   #####  
     *     #     #  #        ##    #  #     #  #        #     #   #   ##    #  #     # 
     *     #     #  #        # #   #  #     #  #        #     #   #   # #   #  #       
     *     ######   #####    #  #  #  #     #  #####    ######    #   #  #  #  #  #### 
     *     #   #    #        #   # #  #     #  #        #   #     #   #   # #  #     # 
     *     #    #   #        #    ##  #     #  #        #    #    #   #    ##  #     # 
     *     #     #  #######  #     #  ######   #######  #     #  ###  #     #   #####  
     *                                                                                 
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
                this.drawCursor();
                break;

            case END_STATE:
                /* DRAW END SCREEN */
                fill(0);
                text(END_STRING, 200, 200);
                break;
        }
    }

    private void
    drawCursor ()
    {
        pushMatrix();
        translate(this.cursor_x * this.BLOCK_SIZE, this.cursor_y * this.BLOCK_SIZE);

        image(this.CURSOR_GRAPHIC, 0, 0);

        popMatrix();
    }

    private void
    drawScore ()
    {
        fill(0);
        text(str(this.score), this.BLOCK_SIZE * this.BLOCKS_ACROSS * 1.1, TEXT_SIZE);
    }
    
    private void
    drawBlock (Block b, int block_x, int block_y)
    {
        pushMatrix();
        translate(block_x * b.BLOCK_SIZE, block_y * b.BLOCK_SIZE);

        b.draw();

        popMatrix();
    }



    /***
     *      #####      #     #     #  #######         #      #####   #######  ###  #######  #     #   #####  
     *     #     #    # #    ##   ##  #              # #    #     #     #      #   #     #  ##    #  #     # 
     *     #         #   #   # # # #  #             #   #   #           #      #   #     #  # #   #  #       
     *     #  ####  #     #  #  #  #  #####        #     #  #           #      #   #     #  #  #  #   #####  
     *     #     #  #######  #     #  #            #######  #           #      #   #     #  #   # #        # 
     *     #     #  #     #  #     #  #            #     #  #     #     #      #   #     #  #    ##  #     # 
     *      #####   #     #  #     #  #######      #     #   #####      #     ###  #######  #     #   #####  
     *                                                                                                       
     */
    public void
    deliverAction (byte action)
    {
        switch (this.state)
        {
            case PLAY_STATE:
                switch (action)
                {
                    case GAME_UP: // up is down in blockspace.
                        if (this.cursor_y > 0)
                        {
                            this.cursor_y--;
                        }
                        break;
                    case GAME_DOWN: // down is up in blockspace.
                        if (this.cursor_y < this.BLOCKS_HIGH - 1)
                        {
                            this.cursor_y++;
                        }
                        break;
                    case GAME_LEFT:
                        if (this.cursor_x > 0)
                        {
                            this.cursor_x--;
                        }
                        break;
                    case GAME_RIGHT:
                        if (this.cursor_x < this.BLOCKS_ACROSS - 2)
                        {
                            this.cursor_x++;
                        }
                        break;
                    case GAME_SWAP:
                        // swap blocks under cursor.
                        this.swapBlocks(this.cursor_x, this.cursor_y, this.cursor_x + 1, this.cursor_y);
                        break;
                    case GAME_INC:
                        this.copyNewBlocks();
                    default:
                        break;    
                }
                break;
            case START_STATE:
                switch (action)
                {
                    case GAME_SWAP:
                        this.state = PLAY_STATE;
                        break;
                    default:
                        break;
                }
            case END_STATE:
                switch (action)
                {
                    case GAME_SWAP:
                        // start a new game. reinit the board, speed, score.
                        this.initGameBoard();
                        this.initDefaultValues();
                        this.state = PLAY_STATE;
                        break;
                    default:
                        break;    
                }
            default:   
                break;
        }
    }

    /*
     * swapBlocks()
     *     given two indexes, swaps the blocks.
     *     note that no bounds checking is performed; if a swap is attempted
     *     on blocks that don't exist, something else is wrong. However, checking
     *     that the blocks are not matched is checked.
     */
    private void
    swapBlocks (int x1, int y1, int x2, int y2)
    {
        if(!this.blocks[x1][y1].isMarked() &&
           !this.blocks[x2][y2].isMarked())
        {
            Block temp = this.blocks[x1][y1];
            this.blocks[x1][y1] = this.blocks[x2][y2];
            this.blocks[x2][y2] = temp;
            temp = null;
        }
    }

    /***
     *     ######   #######  ######   #     #   #####  
     *     #     #  #        #     #  #     #  #     # 
     *     #     #  #        #     #  #     #  #       
     *     #     #  #####    ######   #     #  #  #### 
     *     #     #  #        #     #  #     #  #     # 
     *     #     #  #        #     #  #     #  #     # 
     *     ######   #######  ######    #####    #####  
     *                                                 
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
