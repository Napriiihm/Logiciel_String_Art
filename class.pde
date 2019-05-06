class Courbe_4_points {
  //Data
  
  //Constructor
  Courbe_4_points() {
  }
  
  //Functionality
  void tracer(PVector pos1, PVector pos2, PVector pos3, PVector pos4, color c, int nb_clous){
    PVector pos1Topos2;
    PVector pos4Topos3;

    pos1Topos2 = new PVector(pos2.x,pos2.y);
    pos1Topos2.sub(pos1);
    pos4Topos3 = new PVector(pos3.x,pos3.y);
    pos4Topos3.sub(pos4);
    
    for (float i=0; i<nb_clous+1; i++){
      stroke(c);
      line(pos1.x+(i/nb_clous)*pos1Topos2.x, pos1.y+(i/nb_clous)*pos1Topos2.y, pos4.x+(i/nb_clous)*pos4Topos3.x, pos4.y+(i/nb_clous)*pos4Topos3.y);
    }
  }
  void clous(PVector pos1, PVector pos2, PVector pos3, PVector pos4, color c, int nb_clous){
    PVector pos1Topos2;
    PVector pos4Topos3;

    pos1Topos2 = new PVector(pos2.x,pos2.y);
    pos1Topos2.sub(pos1);
    pos4Topos3 = new PVector(pos3.x,pos3.y);
    pos4Topos3.sub(pos4);
    
    for (float i=0; i<nb_clous+1; i++){
      stroke(c);
      point(pos1.x+(i/nb_clous)*pos1Topos2.x, pos1.y+(i/nb_clous)*pos1Topos2.y);
      point(pos4.x+(i/nb_clous)*pos4Topos3.x, pos4.y+(i/nb_clous)*pos4Topos3.y);
    }
  }
}

class Courbe_3_points {
  
  Courbe_3_points(){
  }
  
  void tracer(PVector pos1, PVector pos2, PVector pos3, color c, int nb_clous){
    PVector pos1Topos2;
    PVector pos3Topos1;

    pos1Topos2 = new PVector(pos2.x,pos2.y);
    pos1Topos2.sub(pos1);
    pos3Topos1 = new PVector(pos1.x,pos1.y);
    pos3Topos1.sub(pos3);
    
    for (float i=0; i<nb_clous+1; i++){
      stroke(c);
      line(pos1.x+(i/nb_clous)*pos1Topos2.x, pos1.y+(i/nb_clous)*pos1Topos2.y, pos3.x+(i/nb_clous)*pos3Topos1.x, pos3.y+(i/nb_clous)*pos3Topos1.y);
    }
  }
  
  void clous(PVector pos1, PVector pos2, PVector pos3, color c, int nb_clous){
    PVector pos1Topos2;
    PVector pos3Topos1;

    pos1Topos2 = new PVector(pos2.x,pos2.y);
    pos1Topos2.sub(pos1);
    pos3Topos1 = new PVector(pos1.x,pos1.y);
    pos3Topos1.sub(pos3);
    
    for (float i=0; i<nb_clous+1; i++){
      stroke(c);
      point(pos1.x+(i/nb_clous)*pos1Topos2.x, pos1.y+(i/nb_clous)*pos1Topos2.y);
      point(pos3.x+(i/nb_clous)*pos3Topos1.x, pos3.y+(i/nb_clous)*pos3Topos1.y);
    }
  }
}

class Trait_de_construction {
  
  Trait_de_construction(){
  }
  
  void tracer(PVector pos1, PVector pos2, PVector pos3, color c){
    stroke(c);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    line(pos1.x,pos1.y,pos3.x,pos3.y);
  }
}

class Trait {
  
  Trait(){
  }
  
  void tracer(PVector pos1, PVector pos2, color c){
    stroke(c);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
  }
  void clous(PVector pos1, PVector pos2, color c){
    stroke(c);
    point(pos1.x,pos1.y);
    point(pos2.x,pos2.y);
  }
}

class Angle {
  
  Angle(){
  }
  void tracer(PVector pos1, PVector pos2, PVector pos3, color c){
    stroke(c);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    line(pos1.x,pos1.y,pos3.x,pos3.y);
  }
  void clous(PVector pos1, PVector pos2, PVector pos3, color c){
    stroke(c);
    point(pos1.x,pos1.y);
    point(pos2.x,pos2.y);
    point(pos3.x,pos3.y);
  }
}