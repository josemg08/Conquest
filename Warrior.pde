class war{
  PImage img;
  float x1,y1,x2,y2,DeltaX=0,DeltaY=0;
  boolean esq=false;
  int este,origen;
  
  war(float x1, float y1, float x2, float y2, int origen){
    this.x1=x1; this.y1=y1;
    this.x2=x2; this.y2=y2;
    this.origen=origen;
    esq=false;
    img = loadImage("24.gif");
  }

  void MRU(){
    
    //---Condiciones para esquivar---//
    //--EQ determinar inmediacion--//
    
    for(int i=0; i<castles.length; i++){
      
  if((sqrt(pow((x1-castles[i].x),2)+
  //deberia ser radio+5(radioWar) pero por alguna razon asi funk
     pow((y1-castles[i].y),2))<=(castles[i].radio-35))
     &&(i!=origen)){
        
       if(sqrt(pow((x1-castles[destino].x),2)+
     pow((y1-castles[destino].y),2))<=(castles[destino].radio+10)){
       x1=x2;y1=y2;break;
       }
    
    esq=true;este=i;
    //--Acelerador para mov H o V--//
    if((DeltaX<2)&&(DeltaX>-2)){DeltaX=DeltaX*5;} 
    //--Mov esquivar--//
    if((DeltaY<2)&&(DeltaY>-2)){y1=y1-3;}
    
    x1=x1-DeltaX;
  }
  
  //---Redirecciona desp del esq---//
  if((sqrt(pow((x1-castles[este].x),2)
      +pow((y1-castles[este].y),2))<=
      (castles[este].radio+10))&&(esq==true)){
    DeltaX=(x2-x1)/50;
    DeltaY=(y2-y1)/50;
    esq=false;
  }}
  
  //---MRU---//
    if((ceil(x1)-3>=x2)||(ceil(x1)+3<=x2)||
    (ceil(y1)-3>=y2)||(ceil(y1)+3<=y2)){
      
      x1=x1+DeltaX;
      y1=y1+DeltaY;
    }else{
     
     x1=x2;
     y1=y2;
    }
    
    
   
    noStroke();
    fill(255,0,0);
    image(img,x1+nX,y1+nY,35,35);
  }

  void CalcularMRU(){
    DeltaX=(x2-x1)/(dist(x1,y1,x2,y2))*4;
    DeltaY=(y2-y1)/(dist(x1,y1,x2,y2))*4;
  }

  void esq(){
    //--Acelerador para mov H o V--//
    if((DeltaX<2)&&(DeltaX>-2)){DeltaX=DeltaX*5;} 
    //--Mov esquivar--//
    if((DeltaY<2)&&(DeltaY>-2)){y1=y1-3;}
  
    x1=x1-DeltaX;  
  }
}
