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
    private final static int    TEXT_SIZE_LG   = 48;
    private final static int    TEXT_SIZE_SM   = 36;
    private final static String FONT_NAME      = "Roboto-Thin.ttf";
    private final static String START_STRING   = "Attack on Tetris\npress the space key to play";
    private final static String END_STRING     = "game over.\npress the space key to play again.";
    private final static String SWAP_STRING    = "swap";
    private final static String MOVE_STRING    = "move";
    private final static String PAUSE_STRING   = "pause";
    private final static String ADVANCE_STRING = "advance";

    /*
     * GAME CONSTANTS
     */
    private final static float START_SPEED     = 10;    // seconds
    private final static float SPEED_INCREMENT = 0.001; // seconds
    private final static int   BLOCK_SCORE     = 10;    // points
    private final static int   LINE_SCORE      = 1;     // point
    private final static int   MATCH_BONUS     = 20;    // points

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
    
    private final boolean STROKE_ON = false;
    private final int STROKE_WEIGHT = 2;
    private final int CURSOR_WEIGHT = 3;

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

    /* Font */
    private PFont game_font;
    
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
    private final int CANVAS_WIDTH, CANVAS_HEIGHT;
    private final int CURSOR_WIDTH, CURSOR_LENGTH;
    
    private int cursor_x, cursor_y;
    /* members with initial values */
    private int   frames_past  = 0;
    private byte  state        = START_STATE;
    private int   score        = 0;
    private float speed        = START_SPEED; // seconds
    private int diamond_count  = 0,
                triangle_count = 0,
                circle_count   = 0,
                star_count     = 0,
                heart_count    = 0;



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
        this.CANVAS_WIDTH  = (this.BLOCK_SIZE * this.BLOCKS_ACROSS) + (2 * this.SIDE_BAR);
        this.CANVAS_HEIGHT = (this.BLOCK_SIZE * this.BLOCKS_HIGH);
        this.CURSOR_WIDTH  = (int)(this.BLOCK_SIZE * 0.2) + (int)(this.CURSOR_WEIGHT / 2);
        this.CURSOR_LENGTH = (int)(this.BLOCK_SIZE * 0.4) + (int)(this.CURSOR_WEIGHT / 2);

        this.cp = new ColorPalette(ColorPalette.LIGHT_THEME); // must be called before initBlockGraphics.
                                                              // change the argument to change the color scheme.

        this.initDefaultValues();  // sets game defaults
        this.initStartGraphics();  // initializes start screen graphics.
        this.initTextDrawing();    // sets text size, etc.
        this.initCursorGraphics(); // initializes cursor graphics buffer
        this.initPauseGraphics();  // initializes pause screen graphics buffer
        this.initBoardGraphics();  // initializes game board graphics buffer
        this.initBlockGraphics();  // initializes block graphics buffers. must be called before initGameBoard.

        this.blocks  = new Block[across][high];
        this.nblocks = new Block[across];

        this.initGameBoard(); // puts blocks in game board - game defaults.

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
        this.diamond_count  = 0;
        this.triangle_count = 0;
        this.circle_count   = 0;
        this.star_count     = 0;
        this.heart_count    = 0;
    }

    /*
     * initStartGraphics()
     *     loads images displayed on the start screen.
     */
    private void
    initStartGraphics ()
    {
        this.start_screen = loadImage("keyboard.png");
    }

    /*
     * initTextDrawing()
     *     initializes settings for drawing text (like the score) on the screen.
     */
    private void
    initTextDrawing ()
    {
        this.game_font = createFont(FONT_NAME, TEXT_SIZE_LG);
        textAlign(CENTER, CENTER);
        textFont(this.game_font);
        textSize(TEXT_SIZE_LG);
    }

    /*
     * initCursorGraphics()
     *     creates the PGraphics buffer the cursor is drawn from. Must be called
     *     before trying to draw the cursor.
     */
    private void
    initCursorGraphics ()
    {
        this.cursor_graphic = createGraphics((2 * this.BLOCK_SIZE) + (2 * CURSOR_WIDTH),
                                             this.BLOCK_SIZE + (2 * CURSOR_WIDTH),
                                             P2D);
        PShape c_tl = createShape();
        c_tl.beginShape();
        c_tl.strokeWeight(this.CURSOR_WEIGHT);
        c_tl.stroke(0);
        c_tl.fill(255);
        c_tl.vertex(0, 0);
        c_tl.vertex(this.CURSOR_LENGTH, 0);
        c_tl.vertex(this.CURSOR_LENGTH, this.CURSOR_WIDTH);
        c_tl.vertex(this.CURSOR_WIDTH, this.CURSOR_WIDTH);
        c_tl.vertex(this.CURSOR_WIDTH, this.CURSOR_LENGTH);
        c_tl.vertex(0, this.CURSOR_LENGTH);
        c_tl.vertex(0, 0);
        c_tl.endShape();

        PShape c_tr = createShape();
        c_tr.beginShape();
        c_tr.strokeWeight(this.CURSOR_WEIGHT);
        c_tr.stroke(0);
        c_tr.fill(255);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), 0);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH, 0);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH, this.CURSOR_WIDTH);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH, this.CURSOR_WIDTH);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH, this.CURSOR_LENGTH);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), this.CURSOR_LENGTH);
        c_tr.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), 0);
        c_tr.endShape();

        PShape c_bl = createShape();
        c_bl.beginShape();
        c_bl.strokeWeight(this.CURSOR_WEIGHT);
        c_bl.stroke(0);
        c_bl.fill(255);
        c_bl.vertex(0, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_bl.vertex(this.CURSOR_LENGTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_bl.vertex(this.CURSOR_LENGTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bl.vertex(this.CURSOR_WIDTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bl.vertex(this.CURSOR_WIDTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_bl.vertex(0, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_bl.vertex(0, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_bl.endShape();

        PShape c_br = createShape();
        c_br.beginShape();
        c_br.strokeWeight(this.CURSOR_WEIGHT);
        c_br.stroke(0);
        c_br.fill(255);
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH, (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_br.vertex((2 * this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH), (this.BLOCK_SIZE) + (2 * this.CURSOR_WIDTH));
        c_br.endShape();

        PShape c_tm = createShape();
        c_tm.beginShape();
        c_tm.strokeWeight(this.CURSOR_WEIGHT);
        c_tm.stroke(0);
        c_tm.fill(255);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, 0);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + (2 * this.CURSOR_LENGTH), 0);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + (2 * this.CURSOR_LENGTH), this.CURSOR_WIDTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH + (int)(0.5 * this.CURSOR_WIDTH), this.CURSOR_WIDTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH + (int)(0.5 * this.CURSOR_WIDTH), this.CURSOR_LENGTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH - (int)(0.5 * this.CURSOR_WIDTH), this.CURSOR_LENGTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH - (int)(0.5 * this.CURSOR_WIDTH), this.CURSOR_WIDTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, this.CURSOR_WIDTH);
        c_tm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, 0);
        c_tm.endShape();

        PShape c_bm = createShape();
        c_bm.beginShape();
        c_bm.strokeWeight(this.CURSOR_WEIGHT);
        c_bm.stroke(0);
        c_bm.fill(255);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH));
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + (2 * this.CURSOR_LENGTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH));
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + (2 * this.CURSOR_LENGTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH + (int)(0.5 * this.CURSOR_WIDTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH + (int)(0.5 * this.CURSOR_WIDTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH - (int)(0.5 * this.CURSOR_WIDTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_LENGTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH + this.CURSOR_LENGTH - (int)(0.5 * this.CURSOR_WIDTH), this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH) - this.CURSOR_WIDTH);
        c_bm.vertex(this.BLOCK_SIZE + this.CURSOR_WIDTH - this.CURSOR_LENGTH, this.BLOCK_SIZE + (2 * this.CURSOR_WIDTH));
        c_bm.endShape();

        this.cursor_graphic.beginDraw();

        /* DRAW TOP LEFT */
        this.cursor_graphic.shape(c_tl, 0, 0);
        /* DRAW TOP RIGHT */
        this.cursor_graphic.shape(c_tr, 0, 0);
        /* DRAW BOTTOM LEFT */
        this.cursor_graphic.shape(c_bl, 0, 0);
        /* DRAW BOTTOM RIGHT */
        this.cursor_graphic.shape(c_br, 0, 0);
        /* DRAW TOP MIDDLE */
        this.cursor_graphic.shape(c_tm, 0, 0);
        /* DRAW BOTTOM MIDDLE */
        this.cursor_graphic.shape(c_bm, 0, 0);

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
        this.none_graphic.background(0, 0);
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
        diamond_shape.setStroke(this.STROKE_ON);
        
        this.diamond_graphic.beginDraw();
        this.diamond_graphic.background(0, 0);
        if (this.STROKE_ON)
        {
            this.diamond_graphic.strokeWeight(this.STROKE_WEIGHT);
        }
        else
        {
            this.diamond_graphic.noStroke();    
        }
        this.diamond_graphic.fill(this.cp.getDiamondColorBlock());
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
        triangle_shape.setStroke(this.STROKE_ON);

        this.triangle_graphic.beginDraw();
        this.triangle_graphic.background(0, 0);
        if (this.STROKE_ON)
        {
            this.triangle_graphic.strokeWeight(this.STROKE_WEIGHT);
        }
        else
        {
            this.triangle_graphic.noStroke();    
        }
        this.triangle_graphic.fill(this.cp.getTriangleColorBlock());
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
        circle_shape.setStroke(this.STROKE_ON);

        this.circle_graphic.beginDraw();
        this.circle_graphic.background(0, 0);
        if (this.STROKE_ON)
        {
            this.circle_graphic.strokeWeight(this.STROKE_WEIGHT);
        }
        else
        {
            this.circle_graphic.noStroke();    
        }
        this.circle_graphic.fill(this.cp.getCircleColorBlock());
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
        star_shape.setStroke(this.STROKE_ON);

        this.star_graphic.beginDraw();
        this.star_graphic.background(0, 0);
        if (this.STROKE_ON)
        {
            this.star_graphic.strokeWeight(this.STROKE_WEIGHT);
        }
        else
        {
            this.star_graphic.noStroke();    
        }
        this.star_graphic.fill(this.cp.getStarColorBlock());
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
        heart_shape.setStroke(this.STROKE_ON);

        this.heart_graphic.beginDraw();
        this.heart_graphic.background(0, 0);
        if (this.STROKE_ON)
        {
            this.heart_graphic.strokeWeight(this.STROKE_WEIGHT);
        }
        else
        {
            this.heart_graphic.noStroke();    
        }
        this.heart_graphic.fill(this.cp.getHeartColorBlock());
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
    
     /*
      * randomBlock()
      *     returns a random block that is not none.
      */
    private Block
    randomBlock ()
    {
        return this.getBlock((byte) random(1, 6)); // don't return a NONE block.
    }

    /*
     * noneBlock()
     *     returns a none block.
     */
    private Block
    noneBlock ()
    {
        return this.getBlock(Block.NONE_ENUM);
    }

    /*
     * deleteBlock()
     *     deletes the block at the given x and y in this.blocks, and replaces it
     *     with a new none block.
     */
    private void
    deleteBlock (int i, int j)
    {
        this.blocks[i][j] = null;
        this.blocks[i][j] = noneBlock();
    }

    /*
     * getBlock()
     *     instantiates a new block.
     */
    private Block
    getBlock (byte type)
    {
        switch (type) 
        {
            case Block.NONE_ENUM:
                return new Block(Block.NONE_ENUM,
                                 Block.NONE_STR,
                                 none_graphic,
                                 BLOCK_SIZE);
            case Block.DIAMOND_ENUM:
                return new Block(Block.DIAMOND_ENUM,
                                 Block.DIAMOND_STR,
                                 diamond_graphic,
                                 BLOCK_SIZE);
            case Block.TRIANGLE_ENUM:
                return new Block(Block.TRIANGLE_ENUM,
                                 Block.TRIANGLE_STR,
                                 triangle_graphic,
                                 BLOCK_SIZE);
            case Block.CIRCLE_ENUM:
                return new Block(Block.CIRCLE_ENUM,
                                 Block.CIRCLE_STR,
                                 circle_graphic,
                                 BLOCK_SIZE);
            case Block.STAR_ENUM:
                return new Block(Block.STAR_ENUM,
                                 Block.STAR_STR,
                                 star_graphic,
                                 BLOCK_SIZE);
            case Block.HEART_ENUM:
                return new Block(Block.HEART_ENUM,
                                 Block.HEART_STR,
                                 heart_graphic,
                                 BLOCK_SIZE);
            default :
                return new Block(Block.NONE_ENUM,
                                 Block.NONE_STR,
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
                    (t != Block.NONE_ENUM) &&
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
                    (t != Block.NONE_ENUM) &&
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
                    switch(this.blocks[i][j].getType())
                    {
                        case Block.DIAMOND_ENUM:
                            this.diamond_count++;
                            break;
                        case Block.TRIANGLE_ENUM:
                            this.triangle_count++;
                            break;
                        case Block.CIRCLE_ENUM:
                            this.circle_count++;
                            break;
                        case Block.STAR_ENUM:
                            this.star_count++;
                            break;
                        case Block.HEART_ENUM:
                            this.heart_count++;
                            break;
                    }

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
                if (!this.blocks[i][j].isFalling() && ((this.blocks[i][j+1].getType() == Block.NONE_ENUM) || this.blocks[i][j+1].isFalling()))
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
                    if (this.blocks[i][j+1].getType() == Block.NONE_ENUM)
                    { // block below is none.
                        this.blocks[i][j+1] = this.blocks[i][j];
                        this.deleteBlock(i, j);
                        
                        if (((j + 2) < this.BLOCKS_HIGH) && this.blocks[i][j+2].getType() == Block.NONE_ENUM)
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

    /*
     * copyNewBlocks()
     *     copies the new blocks from the offscreen buffer to the screen. Also handles
     *     game over condition.
     */
    private void
    copyNewBlocks ()
    {
        for (int i = 0; i < this.BLOCKS_ACROSS; i++)
        {
            for (int j = 0; j < this.BLOCKS_HIGH; j++)
            {
                if(j == 0 && this.blocks[i][j].getType() != Block.NONE_ENUM) // top row and block exists
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

    /*
     * render()
     *     called repeatedly by the top level sketch to draw the game to the Processing screen.
     */
    public void
    render ()
    {
        background(this.cp.getBackgroundColor());
        switch (this.state)
        {
            case START_STATE:
                /* DRAW START SCREEN */
                image(this.start_screen, (this.CANVAS_WIDTH - this.start_screen.width) / 2 , (this.CANVAS_HEIGHT - this.start_screen.height) / 2);
                fill(this.cp.getTextColor());
                textSize(TEXT_SIZE_LG);
                text(START_STRING, 0, 0, this.CANVAS_WIDTH, 200);
                textSize(TEXT_SIZE_SM);
                text(SWAP_STRING, 600, 610);
                text(MOVE_STRING, 325, 450);
                text(MOVE_STRING, 1100, 615);
                text(PAUSE_STRING, 650, 450);
                text(ADVANCE_STRING, 500, 535);

                break;

            case PAUSE_STATE:
            case PLAY_STATE:
                /* DRAW SCORE */
                this.drawScore();
                /* DRAW SIDEBAR */
                this.drawSideBar();
                /* DRAW GAME SCREEN */
                this.board_graphic.beginDraw(); // drawing blocks draws into board graphic.
                this.board_graphic.background(this.cp.getNoneColor());
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

                /* Keeping it DRY */
                if (this.state == PAUSE_STATE)
                {
                    this.drawPauseScreen();
                }

                popMatrix();


                break;
            case END_STATE:
                /* DRAW END SCREEN */
                fill(this.cp.getTextColor());
                text(END_STRING, 0, this.CANVAS_HEIGHT / 2 - 200, this.CANVAS_WIDTH, 200);
                break;
        }
    }

    /*
     * drawCursor()
     *     draws the cursor onto the game screen. Does not draw into the game board,
     *     is drawn over the game board.
     */
    private void
    drawCursor ()
    {
        pushMatrix();
        translate(this.cursor_x * this.BLOCK_SIZE, this.cursor_y * this.BLOCK_SIZE);

        image(this.cursor_graphic, -1 * CURSOR_WIDTH, -1 * CURSOR_WIDTH);

        popMatrix();
    }

    /*
     * drawScore()
     *     draws the score onto the screen.
     */
    private void
    drawScore ()
    {
        fill(this.cp.getTextColor());
        textSize(TEXT_SIZE_LG);
        text("Score : " + str(this.score), ((this.BLOCK_SIZE * this.BLOCKS_ACROSS) + this.SIDE_BAR) * 1.2, TEXT_SIZE_LG);
    }
    
    /*
     * drawBlock()
     *     draws a given block into the game board. Does translation within board based
     *     on block_x, block_y.
     */
    private void
    drawBlock (Block b, PGraphics pg, int block_x, int block_y)
    {
        pg.pushMatrix();
        pg.translate(block_x * b.BLOCK_SIZE, block_y * b.BLOCK_SIZE);

        b.draw(pg);

        pg.popMatrix();
    }

    /*
     * drawBoard()
     *     draws the board to the screen. Assumes translation has already taken place.
     */
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

    /*
     * drawSideBar ()
     *     draws the sidebar : number of block of each type destroyed.
     */
    private void
    drawSideBar ()
    {
        final int offset    = (int) (this.CANVAS_HEIGHT * 0.05);
        final int place     = (int) ((this.CANVAS_HEIGHT - (2 * offset) + this.BLOCK_SIZE) / 5);
        final int pos_x_img = (int) (SIDE_BAR * 0.2);
        final int pos_x_txt = (int) ((SIDE_BAR * 0.2) + (this.BLOCK_SIZE * 1.1));
        final int pos_0_y   = (int) (offset + (place * 0));
        final int pos_1_y   = (int) (offset + (place * 1));
        final int pos_2_y   = (int) (offset + (place * 2));
        final int pos_3_y   = (int) (offset + (place * 3));
        final int pos_4_y   = (int) (offset + (place * 4));
        
        textAlign(CENTER, CENTER);

        image(this.diamond_graphic,    pos_x_img, pos_0_y);
        text(str(this.diamond_count),  pos_x_txt, pos_0_y, this.BLOCK_SIZE, this.BLOCK_SIZE);

        image(this.triangle_graphic,   pos_x_img, pos_1_y);
        text(str(this.triangle_count), pos_x_txt, pos_1_y, this.BLOCK_SIZE, this.BLOCK_SIZE);

        image(this.circle_graphic,     pos_x_img, pos_2_y);
        text(str(this.circle_count),   pos_x_txt, pos_2_y, this.BLOCK_SIZE, this.BLOCK_SIZE);

        image(this.star_graphic,       pos_x_img, pos_3_y);
        text(str(this.star_count),     pos_x_txt, pos_3_y, this.BLOCK_SIZE, this.BLOCK_SIZE);

        image(this.heart_graphic,      pos_x_img, pos_4_y);
        text(str(this.heart_count),    pos_x_txt, pos_4_y, this.BLOCK_SIZE, this.BLOCK_SIZE);


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
    
    /*
     * deliverAction()
     *     sends an action to the game to modify the state.
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
    
    /*
     * printState()
     *     prints the state of the game to the Processing Terminal.
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
