import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class part19 extends PApplet {


Ball bola[] = new Ball[9]; //Deklarasi array
public void setup(){
  
  for(int i = 0; i<bola.length;i++){
    bola[i] = new Ball(PApplet.parseInt(random(55,width-55)),PApplet.parseInt(random(55,height-55)),PApplet.parseInt(random(3,10)),PApplet.parseInt(random(3,10)),PApplet.parseInt(random(40,100)));
  }

}

public void draw(){
  background(155);
  for(int i = 0; i<bola.length;i++){
    bola[i].display();
    bola[i].update();
  }
}

public void mousePressed(){
  for(int i = 0; i<bola.length;i++){
    if(bola[i].pointInEllipse(mouseX,mouseY)){
      bola[i].gantiWarna();
    }
  }
}
public class Ball {
  private int y = 100;
  private int dy = 5;
  private int x = 100;
  private int dx = 0;
  private int size = 50;
  private int warna = color(255,0,0);
 
  public Ball(int x, int y,int dx,int dy, int size){
   //ini adalah constructor
   this.x=x;
   this.y=y;
   this.dx=dx;
   this.dy=dy;
   this.size=size;
  }
  
  public void update(){
   move();
   cekNabrakTembok();
  }
  
  public void display(){
    fill(this.warna);
   ellipse(x,y,size,size); 
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
    }else{
      this.warna = color(255,0,0);
    }
  }
}
  public void settings() {  size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "part19" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
