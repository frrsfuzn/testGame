import processing.serial.*;
Serial mySerial;
char input;
Ball bola[] = new Ball[9]; //Deklarasi array
boolean rectOver = false;
boolean win = false;

String score;
void setup(){
  String myPort = mySerial.list()[0];
  mySerial = new Serial(this,myPort,9600);
  size(640,480);
  for(int i = 0; i<bola.length;i++){
    bola[i] = new Ball(int(random(55,width-55)),int(random(55,height-55)),int(random(3,10)),int(random(3,10)),int(random(40,100)),i);
    // Minimum random dari x dan y harus lebih besar dari maksimum/2 dari size
    // Untuk menghindari glitch disaat bola spawn di pinggir layar
  }
}

void draw(){
  background(155);
  stroke(2);
  
  if(Hitung.getCount()==9){
    win=true;
    for(int i = 0; i<bola.length;i++){
      bola[i].display();
      fill(255);
      rect((width/2)-100,(height/2)-30,200,60);
      fill(0);
      textAlign(CENTER,CENTER);
      text("RESET",width/2,height/2);
      if(overRect((width/2)-100, (height/2)-30,200, 60)){
        rectOver=true;
      }else{
        rectOver=false;
      }
    }
  }else{
    for(int i = 0; i<bola.length;i++){
      bola[i].display();
      bola[i].update();
    }
  }
  
  
  
  //Frame Rate
  fill(255);
  noStroke();
  rect(0,0,85,30);
  fill(0);
  textAlign(LEFT,BOTTOM);
  textSize(20);
  text(frameRate,5,25);
  //Score
  fill(255);
  noStroke();
  rect(width-110,0,width,30);
  fill(0);
  textSize(20);
  score="Score: " + Hitung.getCount();
  input=char(Hitung.getCount()+48);
  text(score,width-100,25);
  mySerial.write(input);
}

void mousePressed(){
  if(rectOver){
    rectOver=false;
    win=false;
    Hitung.clear();
    for(int i = 0; i<bola.length;i++){
      bola[i] = new Ball(int(random(55,width-55)),int(random(55,height-55)),int(random(3,10)),int(random(3,10)),int(random(40,100)),i);
      // Minimum random dari x dan y harus lebih besar dari maksimum/2 dari size
      // Untuk menghindari glitch disaat bola spawn di pinggir layar
    }
  }else{
    if(!win){
      for(int i = 0; i<bola.length;i++){
        if(bola[i].pointInEllipse(mouseX,mouseY)){
          bola[i].gantiWarna();
        }
      }
    }
  }
}

boolean overRect(int x, int y,int width, int height){
  if(mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height){
    return true;
  }else{
    return false;
  }
}
