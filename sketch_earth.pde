import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage img;
float X,Y,Z;
PShape earth;
Minim minim;
AudioPlayer star_wars;
int angle;    //角度を設定するための変数
boolean r;
 
void setup() {
  size(1000, 700, P3D);
  angle = 0;    //60度を設定
  r = false;
  background(0);
  noStroke();
  //img = loadImage("800px-MODIS_Map.jpg");
  //img = loadImage("earth.png");
  //img = loadImage("earth_specular_2048.jpg");
  img = loadImage("WorldMap_ja.png");
  earth = createShape(SPHERE, 300);
  earth.setTexture(img);
  minim = new Minim(this);
  star_wars = minim.loadFile("John Williams - Star Wars Main Theme (Full).mp3");
}
 
 
void draw() {
  background(0);
  
  translate(width/2, height/2);    //立体の中心を画面中央に移動 
  rotateX(X);
  rotateY(Y);
  rotateZ(Z);
 if(r==true)
 {
  angle += 1;    //角度を1ずつ足していく
  if(angle > 360) angle = 0;    //360度を超えたら0に戻す
  rotateY(radians(angle));    //Y軸に対してangleの数値分だけ回転
 }
  //球
  pushMatrix();
  shape(earth);
  popMatrix(); 
  
}

void stop(){
 star_wars.close();
 minim.stop();
 super.stop();
}

void keyPressed(){
 if(keyCode == UP) X += 0.5; 
 if(keyCode == DOWN) X -= 0.5; 
 if(keyCode == RIGHT) Y += 0.5; 
 if(keyCode == LEFT) Y -= 0.5;
 if(keyCode == ENTER){
   r = true;
   star_wars.loop();
 }
 if(keyCode == SHIFT){
   r = false;
   star_wars.pause();
 }
}