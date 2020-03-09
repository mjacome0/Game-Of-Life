class Cell{
  float x;
  float y;
  boolean alive;
  boolean willLive;
  
  Cell(float x, float y){
    this.x = x;
    this.y = y;
    alive = false;
    willLive = false;
  }
  
  void display(){
    if(alive) fill(255);
    else fill(0);
    rect(x, y, 10, 10);
  }
}
