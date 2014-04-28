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
    public final static byte GAME_UP        = 0;
    public final static byte GAME_DOWN      = 1;
    public final static byte GAME_LEFT      = 2;
    public final static byte GAME_RIGHT     = 3;
    public final static byte GAME_SWAP      = 4;
    public final static byte GAME_INCREMENT = 5;
    public final static byte GAME_PAUSE     = 6;

    /*
     * PRIVATE STATICS
     */

    /*
     * GAME STATES
     */
    private final static byte START_STATE = 0;
    private final static byte PLAY_STATE  = 1;
    private final static byte END_STATE   = 2;
    private final static byte PAUSE_STATE = 3;

    /*
     * STRINGS
     */
    private final static int TEXT_SIZE       = 32;
    private final static String START_STRING = "kattack - press the space key to play.";
    private final static String END_STRING   = "game over. press the space key to play again.";

    /*
     * GAME CONSTANTS
     */
    private final static float START_SPEED     = 10;    // seconds
    private final static float SPEED_INCREMENT = 0.001; // seconds
    private final static int   BLOCK_SCORE     = 10;    // points
    private final static int   LINE_SCORE      = 1;     // point
    private final static int   MATCH_BONUS     = 20;    // points
    
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
    private PGraphics none_graphic;
    private PGraphics diamond_graphic;
    private PGraphics triangle_graphic;
    private PGraphics circle_graphic;
    private PGraphics star_graphic;
    private PGraphics heart_graphic;

    private PGraphics cursor_graphic;
    private PGraphics board_graphic;
    private PGraphics pause_graphic;

    /* Images */
    private PImage start_screen;
    
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
    private final int BLOCKS_ACROSS, BLOCKS_HIGH;
    private final int BLOCK_SIZE;
    private final int SIDE_BAR;
    private int cursor_x, cursor_y;
    /* members with initial values */
    private byte  state       = START_STATE;
    private int   score       = 0;
    private float speed       = START_SPEED; // seconds.
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
        this.initPauseGraphics();
        this.initBoardGraphics();
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
        this.cursor_x = (int)(this.BLOCKS_ACROSS * 0.5) - 1;
        this.cursor_y = (int)(this.BLOCKS_HIGH - (this.BLOCKS_HIGH * 0.25));
    }

    /*
     * initTextDrawing()
     *     initializes settings for drawing text (like the score) on the screen.
     */
    private void
    initTextDrawing ()
    {
        textSize(TEXT_SIZE);
    }

    /*
     * initCursorGraphics()
     *     creates the PGraphics buffer the cursor is drawn from. Must be called
     *     before trying to draw the cursor.
     */
    private void
    initCursorGraphics ()
    {
        this.cursor_graphic = createGraphics(2 * this.BLOCK_SIZE,
                                             this.BLOCK_SIZE,
                                             P2D);
        this.cursor_graphic.beginDraw();
        this.cursor_graphic.fill(255, 0);
        this.cursor_graphic.strokeWeight(10);
        this.cursor_graphic.rect(0, 0, this.BLOCK_SIZE, this.BLOCK_SIZE, this.BLOCK_SIZE * 0.15);
        this.cursor_graphic.rect(this.BLOCK_SIZE, 0, this.BLOCK_SIZE, this.BLOCK_SIZE, this.BLOCK_SIZE * 0.15);
        this.cursor_graphic.endDraw();
    }
    
    /*
     * initPauseGraphics()
     *     creates the PGraphics buffer which stores the game paused shade. 
     */
    private void
    initPauseGraphics ()
    {
        this.pause_graphic = createGraphics(this.BLOCK_SIZE * this.BLOCKS_ACROSS,
                                            this.BLOCK_SIZE * this.BLOCKS_HIGH,
                                            P2D);
        this.pause_graphic.beginDraw();
        this.pause_graphic.noStroke();
        this.pause_graphic.fill(this.cp.addAlpha(this.cp.getTextColor(), 200));
        this.pause_graphic.rect(0, 0,
                                this.BLOCK_SIZE * this.BLOCKS_ACROSS,
                                this.BLOCK_SIZE * this.BLOCKS_HIGH);
        this.pause_graphic.fill(this.cp.getTextColor());
        this.pause_graphic.endDraw();
    }

    /*
     * initBoardGraphics()
     *     creates the PGraphics buffer that all blocks are drawn into.
     *     must be called before trying to draw any blocks.
     */
    private void
    initBoardGraphics ()
    {
        this.board_graphic = createGraphics((this.BLOCK_SIZE * this.BLOCKS_ACROSS),
                                            (this.BLOCK_SIZE * this.BLOCKS_HIGH),
                                            P2D);
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
        this.none_graphic = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE,
                                           P2D);
        this.none_graphic.beginDraw();
        this.none_graphic.fill(this.cp.getNoneColor());
        this.none_graphic.noStroke();

        this.none_graphic.rect(0, 0,
                               this.BLOCK_SIZE, this.BLOCK_SIZE);
        this.none_graphic.endDraw();
        
        /* DIAMOND BLOCK */
        this.diamond_graphic = createGraphics(this.BLOCK_SIZE,
                                              this.BLOCK_SIZE,
                                              P2D);
        PShape diamond_shape = createShape();
        diamond_shape.beginShape();
        diamond_shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        diamond_shape.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.5));
        diamond_shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.9));
        diamond_shape.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.5));
        diamond_shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        diamond_shape.endShape(CLOSE);
        diamond_shape.setFill(this.cp.getDiamondColorFill());
        diamond_shape.setStroke(this.stroke_on);
        
        this.diamond_graphic.beginDraw();
        if (this.stroke_on)
        {
            this.diamond_graphic.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.diamond_graphic.noStroke();    
        }
        this.diamond_graphic.fill(this.cp.getDiamondColorBlock());
        this.diamond_graphic.background(this.cp.getNoneColor());
        this.diamond_graphic.rect(0, 0,
                                  this.BLOCK_SIZE, this.BLOCK_SIZE,
                                  this.BLOCK_SIZE * 0.15);
        this.diamond_graphic.shape(diamond_shape, 0, 0);
        this.diamond_graphic.endDraw();
        
        /* TRIANGLE BLOCK */
        this.triangle_graphic = createGraphics(this.BLOCK_SIZE,
                                               this.BLOCK_SIZE,
                                               P2D);
        PShape triangle_shape = createShape();
        triangle_shape.beginShape();
        triangle_shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        triangle_shape.vertex((int)(this.BLOCK_SIZE * 0.1), (int)(this.BLOCK_SIZE * 0.9));
        triangle_shape.vertex((int)(this.BLOCK_SIZE * 0.9), (int)(this.BLOCK_SIZE * 0.9));
        triangle_shape.vertex((int)(this.BLOCK_SIZE * 0.5), (int)(this.BLOCK_SIZE * 0.1));
        triangle_shape.endShape(CLOSE);
        triangle_shape.setFill(this.cp.getTriangleColorFill());
        triangle_shape.setStroke(this.stroke_on);

        this.triangle_graphic.beginDraw();
        if (this.stroke_on)
        {
            this.triangle_graphic.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.triangle_graphic.noStroke();    
        }
        this.triangle_graphic.fill(this.cp.getTriangleColorBlock());
        this.triangle_graphic.background(this.cp.getNoneColor());
        this.triangle_graphic.rect(0, 0,
                                   this.BLOCK_SIZE, this.BLOCK_SIZE,
                                   this.BLOCK_SIZE * 0.15);
        this.triangle_graphic.shape(triangle_shape, 0, 0);
        this.triangle_graphic.endDraw();
        
        /* CIRCLE BLOCK */
        this.circle_graphic = createGraphics(this.BLOCK_SIZE,
                                             this.BLOCK_SIZE,
                                             P2D);
        PShape circle_shape = createShape(ELLIPSE, (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.1),
                                                   (int)(this.BLOCK_SIZE * 0.8),
                                                   (int)(this.BLOCK_SIZE * 0.8));
        circle_shape.setFill(this.cp.getCircleColorFill());
        circle_shape.setStroke(this.stroke_on);

        this.circle_graphic.beginDraw();
        if (this.stroke_on)
        {
            this.circle_graphic.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.circle_graphic.noStroke();    
        }
        this.circle_graphic.fill(this.cp.getCircleColorBlock());
        this.circle_graphic.background(this.cp.getNoneColor());
        this.circle_graphic.rect(0, 0,
                                 this.BLOCK_SIZE, this.BLOCK_SIZE,
                                 this.BLOCK_SIZE * 0.15);
        this.circle_graphic.shape(circle_shape, 0, 0);
        this.circle_graphic.endDraw();
        
        /* STAR BLOCK */
        this.star_graphic = createGraphics(this.BLOCK_SIZE,
                                           this.BLOCK_SIZE,
                                           P2D);
        PShape star_shape = createShape();
        star_shape.beginShape();
        /*       1
         *    _10'2__      
         *   9-8   4-3
         *     /.6.\
         *    7     5
         */
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05)); // 1
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.63), (int)(this.BLOCK_SIZE * 0.33)); // 2
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.95), (int)(this.BLOCK_SIZE * 0.38)); // 3
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.71), (int)(this.BLOCK_SIZE * 0.59)); // 4
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.77), (int)(this.BLOCK_SIZE * 0.90)); // 5
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.76)); // 6
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.23), (int)(this.BLOCK_SIZE * 0.90)); // 7
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.29), (int)(this.BLOCK_SIZE * 0.59)); // 8
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.05), (int)(this.BLOCK_SIZE * 0.38)); // 9
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.37), (int)(this.BLOCK_SIZE * 0.33)); // 10
        star_shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.05)); // 1
        star_shape.endShape(CLOSE);
        star_shape.setFill(this.cp.getStarColorFill());
        star_shape.setStroke(this.stroke_on);

        this.star_graphic.beginDraw();
        if (this.stroke_on)
        {
            this.star_graphic.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.star_graphic.noStroke();    
        }
        this.star_graphic.fill(this.cp.getStarColorBlock());
        this.star_graphic.background(this.cp.getNoneColor());
        this.star_graphic.rect(0, 0,
                               this.BLOCK_SIZE, this.BLOCK_SIZE,
                               this.BLOCK_SIZE * 0.15);
        this.star_graphic.shape(star_shape, 0, 0);
        this.star_graphic.endDraw();
        
        /* HEART BLOCK */
        this.heart_graphic = createGraphics(this.BLOCK_SIZE,
                                            this.BLOCK_SIZE,
                                            P2D);
        PShape heart_shape = createShape();
        heart_shape.beginShape();
        heart_shape.vertex((int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30));
        heart_shape.bezierVertex((int)(this.BLOCK_SIZE * 0.35), (int)(this.BLOCK_SIZE * -0.25),  // ctrl 1
                                 (int)(this.BLOCK_SIZE * -0.25), (int)(this.BLOCK_SIZE * 0.40),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.90));  // anchor
        heart_shape.bezierVertex((int)(this.BLOCK_SIZE * 1.25), (int)(this.BLOCK_SIZE * 0.40),   // ctrl 1
                                 (int)(this.BLOCK_SIZE * 0.65), (int)(this.BLOCK_SIZE * -0.25),  // ctrl 2
                                 (int)(this.BLOCK_SIZE * 0.50), (int)(this.BLOCK_SIZE * 0.30));  // anchor
        heart_shape.endShape(CLOSE);
        heart_shape.setFill(this.cp.getHeartColorFill());
        heart_shape.setStroke(this.stroke_on);

        this.heart_graphic.beginDraw();
        if (this.stroke_on)
        {
            this.heart_graphic.strokeWeight(this.stroke_weight);
        }
        else
        {
            this.heart_graphic.noStroke();    
        }
        this.heart_graphic.fill(this.cp.getHeartColorBlock());
        this.heart_graphic.background(this.cp.getNoneColor());
        this.heart_graphic.rect(0, 0,
                                this.BLOCK_SIZE, this.BLOCK_SIZE,
                                this.BLOCK_SIZE * 0.15);
        this.heart_graphic.shape(heart_shape, 0, 0);
        this.heart_graphic.endDraw();
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
        return this.getBlock((byte) random(1, 6)); // don't return a NONE block.
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
                                 none_graphic,
                                 BLOCK_SIZE);
            case DIAMOND_ENUM:
                return new Block(DIAMOND_ENUM,
                                 DIAMOND_STR,
                                 diamond_graphic,
                                 BLOCK_SIZE);
            case TRIANGLE_ENUM:
                return new Block(TRIANGLE_ENUM,
                                 TRIANGLE_STR,
                                 triangle_graphic,
                                 BLOCK_SIZE);
            case CIRCLE_ENUM:
                return new Block(CIRCLE_ENUM,
                                 CIRCLE_STR,
                                 circle_graphic,
                                 BLOCK_SIZE);
            case STAR_ENUM:
                return new Block(STAR_ENUM,
                                 STAR_STR,
                                 star_graphic,
                                 BLOCK_SIZE);
            case HEART_ENUM:
                return new Block(HEART_ENUM,
                                 HEART_STR,
                                 heart_graphic,
                                 BLOCK_SIZE);
            default :
                return new Block(NONE_ENUM,
                                 NONE_STR,
                                 none_graphic,
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
    
    /*
     * update()
     *     public function used to update the game state every frame.
     */
    public void
    update ()
    {
        if (this.state == PLAY_STATE)
        {
            this.cleanUp();
            this.handleGravity();
            this.handleNewBlocks();
        }
        else if (this.state == START_STATE)
        {
            /* Intentionally Empty */
        }
        else if (this.state == END_STATE)
        {
            /* Intentionally Empty */
        }
        else if (this.state == PAUSE_STATE)
        {
            /* Intentionally Empty */
        }
    }

    /*
     * findMatches()
     *     finds all blocks that are currently matched. 
     */
    private void
    findMatches ()
    {
        /*
         * Resources:
         *     https://github.com/volrath/tetris-attack/blob/master/static/js/modules/board.js
         *     http://androidgamify.blogspot.com/2013/10/match-3-game-algorithm-part-2-how-to.html
         */
        
        /* VERTICAL MATCHING */
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH - 2; j++)
            {
                byte t = this.blocks[i][j].getType();

                if (!this.blocks[i][j].isFalling()   &&
                    !this.blocks[i][j].isMarked()    &&
                    !this.blocks[i][j+1].isFalling() &&
                    !this.blocks[i][j+1].isMarked()  &&
                    !this.blocks[i][j+2].isFalling() &&
                    // !this.blocks[i][j+2].isMarked() && // third block can be marked for T combos
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
                        this.score += this.MATCH_BONUS;
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
                
                if (!this.blocks[i][j].isFalling()   &&
                    !this.blocks[i][j].isMarked()    &&
                    !this.blocks[i+1][j].isFalling() &&
                    !this.blocks[i+1][j].isMarked()  &&
                    !this.blocks[i+2][j].isFalling() &&
                    // !this.blocks[i+2][j].isMarked() && // third block can be marked for T combos
                    (t != NONE_ENUM) &&
                    (t == this.blocks[i+1][j].getType()) &&
                    (t == this.blocks[i+2][j].getType()) )
                {   // a match!
                    this.blocks[i][j].mark();
                    this.blocks[i+1][j].mark();
                    this.blocks[i+2][j].mark();
                    
                    int ii = i+3;
                    while (ii < this.BLOCKS_ACROSS             &&
                           (this.blocks[ii][j].getType() == t) &&
                           !this.blocks[ii][j].isMarked()      &&
                           !this.blocks[ii][j].isFalling())
                    {
                        this.blocks[ii][j].mark();
                        ii++;
                        this.score += this.MATCH_BONUS;
                    }
                }
            }
        }
    }
    
    /*
     * cleanUp()
     *     deletes all blocks that need deleting.
     */
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
                    this.score += BLOCK_SCORE;
                }
            }
        }
    }

    /*
     * handleGravity()
     *     make all the blocks fall.
     */
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
                else if (this.blocks[i][j].doneFalling())
                {
                    this.blocks[i][j].finishFalling();
                    /*
                     * if a block is done falling, one of two things can happen after doneFalling() it
                     *     1. if the block below it is NONE, then move it down, then:
                     *         1.a. if the block below *that* is none, fall() it again.
                     *         1.b. otherwise, it's done; find matches.
                     *     2. if the block below it is NONE, then start it falling again.
                     */
                    if (this.blocks[i][j+1].getType() == NONE_ENUM)
                    { // block below is none.
                        this.blocks[i][j+1] = this.blocks[i][j];
                        this.deleteBlock(i, j);
                        
                        if (((j + 2) < this.BLOCKS_HIGH) && this.blocks[i][j+2].getType() == NONE_ENUM)
                        {
                            this.blocks[i][j+1].fall();
                        }
                        else
                        {
                            this.findMatches(); // done falling.
                        }
                    }
                    else
                    {
                        this.findMatches();
                    }
                }
            }
        }
    }
    
    /*
     * handleNewBlocks()
     *     funtion that handles auto advancing of new lines of blocks.
     */
    private void
    handleNewBlocks ()
    {
        this.frames_past++;
        if (this.frames_past > (this.speed * frameRate)) // speed[s] * frameRate[frames/s] = # of frames to wait
        {
            this.frames_past = 0;
            this.speed -= SPEED_INCREMENT; // seconds till next line

            if (this.cursor_y > 0)
            {
                this.cursor_y--;
            }

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
        background(this.cp.getNoneColor());
        switch (this.state)
        {
            case START_STATE:
                /* DRAW START SCREEN */
                fill(this.cp.getTextColor());
                text(START_STRING, 200, 200);
                break;

            case PAUSE_STATE:
            case PLAY_STATE:
                /* DRAW SCORE */
                this.drawScore();
                /* DRAW GAME SCREEN */
                this.board_graphic.beginDraw(); // drawing blocks draws into board graphic.

                for(int j = this.BLOCKS_HIGH - 1; j >= 0; j--)
                {
                    for(int i = 0; i < this.BLOCKS_ACROSS; i++)
                    {
                        this.drawBlock(this.blocks[i][j], this.board_graphic, i, j);
                    }
                }

                this.board_graphic.endDraw();

                pushMatrix();
                translate(this.SIDE_BAR, 0);
                this.drawBoard();
                this.drawCursor();

                if (this.state == PAUSE_STATE)
                {
                    this.drawPauseScreen();
                }

                popMatrix();


                break;
            case END_STATE:
                /* DRAW END SCREEN */
                fill(this.cp.getTextColor());
                text(END_STRING, 200, 200);
                break;
        }
    }

    private void
    drawCursor ()
    {
        pushMatrix();
        translate(this.cursor_x * this.BLOCK_SIZE, this.cursor_y * this.BLOCK_SIZE);

        image(this.cursor_graphic, 0, 0);

        popMatrix();
    }

    private void
    drawScore ()
    {
        fill(this.cp.getTextColor());
        text(str(this.score), ((this.BLOCK_SIZE * this.BLOCKS_ACROSS) + this.SIDE_BAR) * 1.1, TEXT_SIZE);
    }
    
    private void
    drawBlock (Block b, PGraphics pg, int block_x, int block_y)
    {
        pg.pushMatrix();
        pg.translate(block_x * b.BLOCK_SIZE, block_y * b.BLOCK_SIZE);

        b.draw(pg);

        pg.popMatrix();
    }

    private void
    drawBoard ()
    {
        image(this.board_graphic, 0, 0);
    }

    /*
     * drawPauseScreen ()
     *     draws the screen the covers the game board when the game is paused.
     */
    private void
    drawPauseScreen ()
    {
        image(this.pause_graphic, 0, 0);
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
                        this.findMatches();
                        break;
                    case GAME_INCREMENT:
                        this.copyNewBlocks();
                        this.score += this.LINE_SCORE;
                        break;
                    case GAME_PAUSE:
                        this.state = PAUSE_STATE;
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
            case PAUSE_STATE:
                switch (action)
                {
                    case GAME_PAUSE:
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
