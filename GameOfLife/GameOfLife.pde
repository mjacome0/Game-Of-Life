Cell [][] board;

void setup(){
  size(600, 600);
  //noLoop();
  frameRate(10);
  board = new Cell[60][60];
  for(int i = 0; i < 60; i++){
    for(int j = 0; j < 60; j++){
      board[i][j] = new Cell(i * 10, j * 10);
    }
  }
  // Line oscillator
  board[10][10].alive = true;
  board[10][11].alive = true;
  board[10][12].alive = true;
  
  // Glider
  board[20+30][20].alive = true;
  board[21+30][21].alive = true;
  board[21+30][22].alive = true;
  board[20+30][22].alive = true;
  board[19+30][22].alive = true;
  
  //
  board[10][30].alive = true;
  board[11][30].alive = true;
  board[12][30].alive = true;
  
  board[16][30].alive = true;
  board[17][30].alive = true;
  board[18][30].alive = true;
  
  board[8][32].alive = true;
  board[8][33].alive = true;
  board[8][34].alive = true;
  
  board[13][32].alive = true;
  board[13][33].alive = true;
  board[13][34].alive = true;
  
  board[15][32].alive = true;
  board[15][33].alive = true;
  board[15][34].alive = true;
  
  board[20][32].alive = true;
  board[20][33].alive = true;
  board[20][34].alive = true;
  
  board[10][35].alive = true;
  board[11][35].alive = true;
  board[12][35].alive = true;
  
  board[16][35].alive = true;
  board[17][35].alive = true;
  board[18][35].alive = true;
  
  board[10][37].alive = true;
  board[11][37].alive = true;
  board[12][37].alive = true;
  
  board[16][37].alive = true;
  board[17][37].alive = true;
  board[18][37].alive = true;
  
  board[8][39].alive = true;
  board[8][40].alive = true;
  board[8][41].alive = true;
  
  board[13][39].alive = true;
  board[13][40].alive = true;
  board[13][41].alive = true;
  
  board[15][39].alive = true;
  board[15][40].alive = true;
  board[15][41].alive = true;
  
  board[20][39].alive = true;
  board[20][40].alive = true;
  board[20][41].alive = true;
  
  board[10][42].alive = true;
  board[11][42].alive = true;
  board[12][42].alive = true;
  
  board[16][42].alive = true;
  board[17][42].alive = true;
  board[18][42].alive = true;
  
  //
  board[10+30][30].alive = true;
  board[11+30][30].alive = true;
  board[12+30][30].alive = true;
  
  board[16+30][30].alive = true;
  board[17+30][30].alive = true;
  board[18+30][30].alive = true;
  
  board[8+30][32].alive = true;
  board[8+30][33].alive = true;
  board[8+30][34].alive = true;
  
  board[13+30][32].alive = true;
  board[13+30][33].alive = true;
  board[13+30][34].alive = true;
  
  board[15+30][32].alive = true;
  board[15+30][33].alive = true;
  board[15+30][34].alive = true;
  
  board[20+30][32].alive = true;
  board[20+30][33].alive = true;
  board[20+30][34].alive = true;
  
  board[10+30][35].alive = true;
  board[11+30][35].alive = true;
  board[12+30][35].alive = true;
  
  board[16+30][35].alive = true;
  board[17+30][35].alive = true;
  board[18+30][35].alive = true;
  
  board[10+30][37].alive = true;
  board[11+30][37].alive = true;
  board[12+30][37].alive = true;
  
  board[16+30][37].alive = true;
  board[17+30][37].alive = true;
  board[18+30][37].alive = true;
  
  board[8+30][39].alive = true;
  board[8+30][40].alive = true;
  board[8+30][38].alive = true;
  
  board[13+30][39].alive = true;
  board[13+30][40].alive = true;
  board[13+30][38].alive = true;
  
  board[15+30][39].alive = true;
  board[15+30][40].alive = true;
  board[15+30][38].alive = true;
  
  board[20+30][39].alive = true;
  board[20+30][40].alive = true;
  board[20+30][38].alive = true;
  
  board[10+30][42].alive = true;
  board[11+30][42].alive = true;
  board[12+30][42].alive = true;
  
  board[16+30][42].alive = true;
  board[17+30][42].alive = true;
  board[18+30][42].alive = true;
}

void draw(){
  background(0);
  for(int i = 0; i < 60; i++){
    for(int j = 0; j < 60; j++){
      
      int neighborAlive = countNeighbors(i, j);
      if(board[i][j].alive && (neighborAlive == 2 || neighborAlive == 3)) board[i][j].willLive = true;
      else if(!board[i][j].alive && neighborAlive == 3) board[i][j].willLive = true;
      else board[i][j].willLive = false;
      
      board[i][j].display();
    }
  }    
  for(int i = 0; i < 60; i++){
    for(int j = 0; j < 60; j++){
      board[i][j].alive = board[i][j].willLive;
      board[i][j].willLive = false;
    }
  }
}

int countNeighbors(int i, int j){
  int count = 0;
  int x;
  int y;
  for(int a = -1; a <= 1; a++){
    for(int b = -1; b <= 1; b++){
      if(a != 0 || b != 0){
        x = i + a;
        y = j + b;
        if(x >= 0 && x < 60 && y >= 0 && y < 60)
          if(board[x][y].alive) count++;
      }
    }
  }
  return count;
}
