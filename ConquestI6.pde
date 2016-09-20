castle[] castles;
float[] data;
int destino; 
boolean envia, noEnvio; 
int nX,nY;
PImage imag;

void setup(){
  size(700,500);
  smooth();
  nX=0;nY=0;
  //---Load txt info of centers and sizes---//
  String[] Info = loadStrings("Info.txt");
  castles = new castle[Info.length];
  
  for(int i=0; i<castles.length; i++){
    float[] data = float(split(Info[i], "," )); 
    this.data=data;

    castles[i] = new castle(data[0],data[1],data[2]);
  }
  imag = loadImage("Nueva imagen (2).png");
}

void draw(){

  //--Background--//
  for(int i=-500; i<1000; i=i+70){
    for(int j=-350; j<800; j=j+50){
      image(imag,i+nX,j+nY);
    }
   }
  
  //---Navegadores---//
  if((mouseX>5)&&(nX>-200)){nX=nX-3;}
  if((mouseX<width-5)&&(nX<500)){nX=nX+3;}
  if((mouseY>5)&&(nY>-200)){nY=nY-3;}
  if((mouseY<height-5)&&(nY<300)){nY=nY+3;}
  
  //--Derecha superior cuadro--//
  fill(255,255,255,50);
  noStroke();
  rect(0,0,width/1.5,30);
  rect(0,0,width/1.5,30);
    
  //---Pocisiona castles---//
  for(int i=0; i<castles.length; i++){
    castles[i].ubicar(i,nX,nY);
  }
  
  //---Envia war---//
  if(envia==true){
    for(int i=0; i<castles.length; i++){
      if(castles[i].select==true){
        castles[i].enviar(castles[i].x,castles[i].y,
                          castles[destino].x,castles[destino].y,i);
      }
    }
    envia=false;
  }
}

void mousePressed(){
  //---En castles---//
  for(int i=0; i<castles.length; i++){
    
    //---Mouse dentro de un castle---//
    if(sqrt(pow((mouseX-(castles[i].x+nX)),2)+
    pow((mouseY-(castles[i].y+nY)),2))<=castles[i].radio/2){
      
      //--Si ya esta select--//
      if(castles[i].select==true){
        castles[i].mostrar=true;
        destino=i; envia=true;
        break;
      }

      //--Si no lo esta--//
      if(castles[i].select==false){
        castles[i].select=true;
        for(int j=0; j<castles.length; j++){
          castles[j].mostrar=false;
        }
      }
    }
  }
}

