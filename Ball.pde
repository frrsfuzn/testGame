public class Ball {
  private int y = 100;
  private int dy = 5;
  private int x = 100;
  private int dx = 0;
  private int size = 50;
  private color warna = color(255,0,0);
  private int nomor;
  
  public Ball(int x, int y,int dx,int dy, int size,int n){
   //ini adalah constructor
   this.x=x;
   this.y=y;
   this.dx=dx;
   this.dy=dy;
   this.size=size;
   this.nomor=n;
   
  }
  
  public void update(){
   move();
   cekNabrakTembok();
  }
  
  public void display(){
    fill(this.warna);
    ellipse(x,y,size,size); 
    textAlign(CENTER,CENTER);
    textSize(size/2);
    fill(0);
    text(nomor,x,y);
  }
  
  public void cekNabrakTembok(){
    if(nabrakTembokVertikalGa()){
      setdx(getdx()*-1);
    }
    
    if(nabrakTembokHorizontalGa()){
      setdy(getdy()*-1);
    }
  }
  
  public boolean nabrakTembokVertikalGa(){
    if(getX()+getSize()/2 > width || getX()-getSize()/2 < 0){
      return true;
    }else{
      return false;
    }
  }
  
  public boolean nabrakTembokHorizontalGa(){
    if(getY()+getSize()/2 > height || getY()-getSize()/2 < 0){
      return true;
    }else{
      return false;
    }
  }
  
  public void move(){
    y+=dy;
    x+=dx;
  }
  
  public void setdy(int dy){
    this.dy = dy;
  }
  
  public void setdx(int dx){
    this.dx = dx;
  }
  
  
  
  public int getdy(){
    return dy;
  }
  
  public int getdx(){
    return dx;
  }
  
  public int getY(){
    return y;
  }
  
  public int getX(){
    return x;
  }
  
  public int getSize(){
    return size;
  }
  
  public boolean pointInEllipse(int x, int y){
    double jarak = Math.sqrt(Math.pow((x - getX()),2)+Math.pow((y-getY()),2));
    if(jarak<getSize()/2){
      return true;
    }else{
      return false; 
    }
  }
  
  public void gantiWarna(){
    if(red(this.warna)==255){ //kalau merah
      this.warna = color(0,255,0); //ganti ke hijau
      Hitung.add();
    }else{
      this.warna = color(255,0,0);
      Hitung.subtract();
    }
  }
}

static class Hitung{
 static int count=0;
 static void add(){
   count++;
 }
 static void subtract(){
   count--;
 }
 static int getCount(){
  return count; 
 }
 static void clear(){
   count=0;
 }
}
