//maxX = width, maxY = height

int ballX;     //Declare variable to hold X position of ball
int ballY;      //Declare variable to hold Y position of ball
int ballWidth;   //Declare variable to hold ball width
int ballHeight;  //Declare variable to hold ball height
int radius;

int circle1X;
int circle1Y;
int circle1Dia;
int circle2Dia;
int circle3Dia;
int circle4Dia;
int circle5Dia;
int circle6Dia;
int circle7Dia;


int leftPaddleX;    //Declare variable to hold X position of left paddle
int leftPaddleY;    //Declare variable to hold Y position of left paddle
int paddleWidth ;    //Declare variable to hold left and right paddle width
int paddleHeight;  //Declare variable to hold left and right paddle height
int rightPaddleX;  //Declare variable to hold X position of right paddle
int rightPaddleY;  //Declare variable to hold Y position of right paddle
int paddleLowerLimit; //Declare variable to hold the lower limit of both paddles

int textSize;          //Declare variable to hold the size of left and right player's score
int leftPlayerScore;    //Declare variable to hold left player's score  
int leftPlayerScoreX;  //Declare variable to hold X position of left player's score
int leftPlayerScoreY;  //Declare variable to hold Y position of left player's score
int rightPlayerScore;    //Declare variable to hold right player's score
int rightPlayerScoreX;  //Declare variable to hold X position of right player's score
int rightPlayerScoreY;  //Declare variable to hold Y position of right player's score
int leftPlayerNameX;
int leftPlayerNameY;
int rightPlayerNameX;
int rightPlayerNameY;

//Declare variable to hold ball speed
int ballSpeedX; //Declare variable to hold ballX speed
int ballSpeedY; //Declare variable to hold ballY speed

float screenWidth; //set to your maxX
float screenHeight; //set to your maxY
int halfWidth; // set half of width to maxx/2
int halfHeight;  // set half of height to maxY/2

boolean gameOn;

boolean checkLeftPaddle;
boolean checkRightPaddle;

int gameLevel;
int gameLevelX;
int gameLevelY;
int levelX;

//Declares variables to store scores of players at each level
int level1Score1;
int level1Score2;
int level2Score1;
int level2Score2;
int level3Score1;
int level3Score2;
int level4Score1;
int level4Score2;
int level5Score1;
int level5Score2;

int congratSize;
int congratX;
int congratY;
int newGameX;
int newGameY;
int startGameX;
int startGameY;


int time;
int goalX;
int goalTime;
int delay;
int levelUpTime;

int lineX;
int lineY;
int lineHeightX;
int lineHeightY;


//import sound library
import processing.sound.*;
SoundFile file;

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  orientation(LANDSCAPE); //Set the orientation to landscape mode
  
  // Load a soundfile and start playing it on loop
  file = new SoundFile(this, "Song.aiff");
  file.loop();
  
  
  //Initialiazing all the variables Declares above
   ballX = width/2;    
   ballY = height/2;  
   ballWidth = 30; 
   ballHeight = 30;  
   radius = 15;
   
   circle1X = (width/2);
   circle1Y = (height/2);
   circle1Dia = (height-100);
   circle2Dia = (height-200);
   circle3Dia = (height-300);
   circle4Dia = (height-400);
   circle5Dia = (height-500);
   circle6Dia = (height-600);
   circle7Dia = (height-700);

   
   leftPaddleX = width-width; 
   leftPaddleY = height-height;  
   paddleWidth = 40;  
   paddleHeight = 120;  
   rightPaddleX = width-40; 
   rightPaddleY = height-120; 
   paddleLowerLimit = 0;
   
   textSize = 20;          
   leftPlayerScore = 0;   
   leftPlayerScoreX = (width/2)-80;  
   leftPlayerScoreY = 50;  
   rightPlayerScore = 0;   
   rightPlayerScoreX = (width/2)+180;  
   rightPlayerScoreY = 50; 
   leftPlayerNameX = (width/2)-180;
   leftPlayerNameY = 50;
   rightPlayerNameX = (width/2)+80;
   rightPlayerNameY = 50;

   
   ballSpeedX = 14; 
   ballSpeedY = 14;
   
   screenWidth = width; 
   screenHeight= height; 
   halfWidth = width/2; 
   halfHeight = height/2;  
   
   gameOn = false;
   
   checkLeftPaddle = false;
   checkRightPaddle = false;
   
   gameLevel = 0;
   gameLevelX = 140;
   gameLevelY = 50;
   levelX = 50;
   
   lineX = halfWidth;
   lineY = (height - height);
   lineHeightX = halfWidth;
   lineHeightY = height;
   
   congratSize = 50;
   congratX = (halfWidth - 230);
   congratY = (halfHeight+60);
   newGameX = (halfWidth-150);
   newGameY = (halfHeight+90);
   startGameX = (halfWidth-120);
   startGameY = (halfHeight+120);
   
   time = millis();
   goalX = (halfWidth - 100);
   goalTime = 500;
   delay = second();
   levelUpTime = 1;
}



void draw() //runs forever
{
  background(222,184, 135); // Sets the background color to black 
  
  // Removing outline color of all the  shapes
  noStroke();
  
  
  //moves left and right paddles when screen is touched 
  movePaddles();
  
  //Check if there is an overlap between ball and left paddle
  checkLeftPaddle = doesOverlap(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius);

   //Bounce ball back if there is an overlap between ball  and left paddle
  if (checkLeftPaddle) {
    ballSpeedX = ballSpeedX * -1;
    ballSpeedY = ballSpeedY * -1;
  }

  //Check if there is an overlap between ball and right paddle
  checkRightPaddle = doesOverlap(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius); 
  
  //Bounce ball back if there is an overlap between ball and right paddle
  if (checkRightPaddle) {
    ballSpeedX = ballSpeedX * -1;
    ballSpeedY = ballSpeedY * -1;
  }
  
   //Display designed background
  displayBackground();
  
  //Disply scores on the screen
  displayScores();
  
  //Display Paddles on the screen
  displayPaddles();

  //Display Ball on the screen
  displayBall();
  
  //display designs on screen
  //display();
  
  //Move ball 
  moveBall();
  
  
  //check walls 
  checkWalls();
  
  //set game mode
  setGameMode();
  
  
  //display "GOOOAL!" on screen for half a second
  displayGoal();
  
  //start game if finger is remove from screen and screen is touched again after goal
  mouseReleased();
  
  //increase game level
  increaseLeve();
  
  
  //Check if game level is complete
  checkGameLevel(); 
  
}



      // FUNCTIONS TO BE CALL IN DRAW
      
//Function to be call in draw to move paddles
void movePaddles() {
  if(mouseX < halfWidth){
    leftPaddleY = constrain(mouseY, paddleLowerLimit, int(screenHeight-paddleHeight));
  }else{
    rightPaddleY = constrain(mouseY, paddleLowerLimit, int(screenHeight-paddleHeight));
    }
}



//Function to be call in draw to check if there is an overlap between ball and paddles
boolean doesOverlap(float xPaddle, float yPaddle, float widthPaddle, float heightPaddle, float xBall, float yBall, float radius) {

  float ballLeftEdge = xBall-radius; //left edge of ball
  float ballBottomEdge = yBall+radius; //bottom edge of ball
  float ballRightEdge = xBall+radius; //right edge of ball
  float ballTopEdge = yBall-radius; //top edge of ball

  float paddleLeftEdge = xPaddle; //left edge of paddle
  float paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
  float paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
  float paddleTopEdge = yPaddle; //top edge of paddle

  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
  {   
    return true;
  } else { 
    return false;
  }
}



//Function to be call in draw to display the scores on the screen
void displayScores() {
   // Writing two arbitrary numbers as the scores of the right and left players
  fill(255, 255, 255); // Sets the color of the text to white
  textSize(textSize);  // Sets the size of the text to 20pixes 
  text(leftPlayerScore, leftPlayerScoreX, leftPlayerScoreY);  // Write the first text for the left player
  text(rightPlayerScore, rightPlayerScoreX, rightPlayerScoreY); // Write the second text for the second player 
  //Write game level on screen
  text("Level", levelX, gameLevelY);
  text(gameLevel, gameLevelX, gameLevelY);
  text("Player_1:", leftPlayerNameX, leftPlayerNameY);
  text("Player_2:", rightPlayerNameX, rightPlayerNameY);
}



//Function to be call in draw to display the ball on the screen
void displayBall() {
  // Drawing of the Ball
  //fill(139, 69, 19);  // Sets the color of the shape below to white
  fill(#800000);
  ellipse(ballX, ballY, ballWidth, ballHeight);  // Draw an ellipse to represent the ball at the center with width=30pixes & height=30pixes 
}



//Function to be call in draw to display Paddles on the screen
void displayPaddles() {
  // Drawing of the two paddles 
  fill(255, 255, 0);  // Sets the color of the shapes below to yellow
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);  // Draw the first rectangle to represent the first paddle at the top left corner
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);  // Draw the second rectangle to representative the second paddle at the bottom left corner
}



//Function to be call in draw to move ball
void moveBall() {
   //move ball if gameOn is true
  if (gameOn) {
    //Move the ball down and right
    ballX = ballX + ballSpeedX; //Move the ball right
    ballY = ballY + ballSpeedY; //Move the ball down
  }else{ // return ball to center
    ballX = halfWidth;
    ballY= halfHeight;
  }
}



//Function to be call in draw to check if the ball hit the wall and increase player's score if it hit
void checkWalls() {
   // check if y position - radius of ball is less than or equal to 0 OR y position of ball + radius of ball is greater than or equal to height of screen
  // then reverse the direction of ball
  if ((ballY-radius) <= 0 || (ballY+radius) >= screenHeight) {
    ballSpeedY = ballSpeedY * -1;
  }
  
  // check if x position of ball - radius of ball is less than or equal to 0
  // if so, then increase the score of right player by 1, reverse the ball and put gameOn to false
  if (ballX-radius <= 0) {
    time = millis() + goalTime;
    fill(255, 0, 255);
    textSize(congratSize);
    text("GOOOAL!", goalX, halfHeight);
    background(255, 255, 255);
    rightPlayerScore+= 1;
    ballSpeedX = ballSpeedX * -1;
    ballSpeedY = ballSpeedY * -1;
    gameOn = false;
  }

  
  // check if x position of ball + radius of ball is greater than or equal to width of screen
  // if so, then increase the score of left player by 1, reverse the ball and put gameOn to false
  if ((ballX+radius) >= screenWidth) {
    time = millis() + goalTime;
    fill(255, 0, 255);
    textSize(congratSize);
    text("GOOOAL!", goalX, halfHeight);
    background(255, 255, 255);
    leftPlayerScore+= 1;
    ballSpeedX = ballSpeedX * -1;
    ballSpeedY = ballSpeedY * -1;
    gameOn = false;
  }
}



//Function to be call in draw to increase game leve
void increaseLeve() {
  if ((leftPlayerScore == 10) || (rightPlayerScore == 10)) {
    /*if (leftPlayerScore > rightPlayerScore){
      fill(255, 255, 255);
      textSize(textSize);
      text("Player_1 won this Level", width/2, height/2);
    }else{
      text("Player_2 won this Level", width/2, height/2);
    }*/
    gameLevel+= 1;
    leftPlayerScore = 0;
    rightPlayerScore = 0;
  }
}




/*void display() {
  //delay = second() * levelUpTime;
  if (gameLevel == 1) {
    delay = (second() * levelUpTime);
    fill(255, 200, 0);
    text("Level up ✌", halfWidth/2, halfHeight/2);
    text("Level 1", halfWidth/2, (halfHeight/2)+30);
    
  }else if (gameLevel == 2) {
    delay = (second() * levelUpTime);
    fill(255, 200, 0);
    text("Level up ✌", halfWidth/2, halfHeight/2);
    text("Level 2", halfWidth/2, (halfHeight/2)+30);
    
  }else if (gameLevel ==3) {
    delay = (second() * levelUpTime);
    fill(255, 200, 0);
    text("Level up ✌", halfWidth/2, halfHeight/2);
    text("Level 3", halfWidth/2, (halfHeight/2)+30);
    
  }else if (gameLevel == 4) {
    delay = (second() * levelUpTime);
    fill(255, 200, 0);
    text("Level up ✌", halfWidth/2, halfHeight/2);
    text("Level 4", halfWidth/2, (halfHeight/2)+30);
    
  }else if (gameLevel ==5) {
    delay = (second() * levelUpTime);
    fill(255, 200, 0);
    text("Level up ✌", halfWidth/2, halfHeight/2);
    text("Final Level", halfWidth/2, (halfHeight/2)+30);
  }
}*/



//Function to be call in draw to check if Game level is completed
void checkGameLevel() {
  if(gameLevel == 5) {
    background(150);  /*
    fill(0, 0, 200);
    textSize(40);
    text("RESULT OF ALL LEVELS", halfWidth-230, 50);
    textSize(textSize);
    fill(0, 255, 255);
    text("No.", halfWidth-200, 80);
    text("Player_1", halfWidth-100, 80);
    text("Player_2", halfWidth+50, 80);
    
    text("1.", halfWidth-200, 120);
    text(level1Score1, halfWidth-70, 120);
    text(level1Score2, halfWidth+80, 120);
    
    text("2.", halfWidth-200, 140);
    text(level2Score1, halfWidth-70, 140);
    text(level2Score2, halfWidth+80, 140);
    
    text("3.", halfWidth-200, 160);
    text(level3Score1, halfWidth-70, 160);
    text(level3Score2, halfWidth+80, 160);
    
    text("4.", halfWidth-200, 180);
    text(level4Score1, halfWidth-70, 180);
    text(level4Score2, halfWidth+80, 180);
    
    text("5.", halfWidth-200, 200);
    text(level5Score1, halfWidth-70, 200);
    text(level5Score2, halfWidth+80, 200);*/
    
    textSize(congratSize);
    fill(255, 0, 0);
    text("CONGRATULATION!", congratX, congratY);
    fill(255, 255, 255);
    textSize(textSize);
    text("You have completed all the Levels", newGameX, newGameY);
    fill(0, 255, 255);
    text("QUIT AND START AGAIN", startGameX, startGameY);
    gameOn = false;
    file.stop(); // stop playing sound
  }
}

//Function to be called in draw to set game mode
void setGameMode() {
  // condition to check if screen is touched.
  // if so, then put gameOn to true 
  if (mousePressed) {
    gameOn = true;
  }
}



//Function to be call in draw to display "GOOOAL!"
void displayGoal() {
  if (millis() < time) {
    fill(255, 0, 255);
    textSize(congratSize);
    text("GOOOAL!", goalX, halfHeight);
  }
}


//Function to be call in draw to restart game only if finger is remove from screen
//after scoring goal and touching it again
void mouseReleased() {
 if ((ballX-radius <= 0) || ((ballX+radius) >= screenWidth) ) {
   mousePressed = false;
   gameOn = false;
 }
}


void displayBackground() {
  fill(#F6B165);
  ellipse(circle1X, circle1Y, circle1Dia, circle1Dia);
  
  fill(#D58D57);
  ellipse(circle1X, circle1Y, circle2Dia, circle2Dia);
  
  fill(#B36C49);
  ellipse(circle1X, circle1Y, circle3Dia, circle3Dia);
  
  fill(#914F3B);
  ellipse(circle1X, circle1Y, circle4Dia, circle4Dia);
  
  fill(#6F362D);
  ellipse(circle1X, circle1Y, circle5Dia, circle5Dia);
  
  fill(#4E211F);
  ellipse(circle1X, circle1Y, circle6Dia, circle6Dia);
  
  fill(#2C1112);
  ellipse(circle1X, circle1Y, circle7Dia, circle7Dia);
  
}
