class castle{
  PImage img;
  PFont fontA = loadFont( "CourierNew36.vlw" );
  float x, y, radio;
  boolean select=false,mostrar=false,existe=false;
  war warriors;
  
  castle(float x, float y, float radio){
    this.x=x; this.y=y;
    this.radio=radio;
    select=false;mostrar=false;
    img = loadImage("grey-large-animated-castle.gif");
  }
  
  void ubicar(int n,int cnX,int cnY){
    noFill();
    stroke(0,255,0);
    
    //---Resalta select---//
    if(select==true){
      strokeWeight(3);
      ellipse(x+cnX,cnY+y+(radio/5),radio,radio/1.5);
    }
    
    //--Ubica--//
    image(img,cnX+x-(radio/2),cnY+y-(radio/2),radio,radio);
    
    //---Muestra caracteristicas si mostrar---//
    if(mostrar==true){
      textFont(fontA,16);
      fill(0,255,0);
      text("castillo "+(n+1),10,20);
    }
    
    if(existe==true){
      select=false;
      warriors.MRU();
      if((warriors.x1==warriors.x2)&&(warriors.y1==warriors.y2)){
      existe=false;
      }
    }
  }
  void enviar(float x1, float y1, float x2, float y2, int origenes){
    if (existe==false){
    warriors = new war(x1,y1,x2,y2,origenes);
    warriors.CalcularMRU();existe=true;
    }
  }
}
