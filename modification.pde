void modification(){
  int absmode= abs(mode);
  
  for (int i=0; i<point_max[absmode]; i++){
       fill(255);
       ellipse((points[absmode][modification_forme][i]).x,(points[absmode][modification_forme][i]).y,20,20);
       fill(0);
       text(i+1,(points[absmode][modification_forme][i]).x-3,(points[absmode][modification_forme][i]).y+5);
  }
  for (int i=0; i<point_max[absmode];i++){
    if (point_modification==-1 &&  boutonrond( (points[absmode][modification_forme][i]).x, (points[absmode][modification_forme][i]).y, 20) ){
      point_modification=i;
      
    }
  }
  
  if (absmode==1 || absmode==2 ||absmode==5){ //angle
    fill(255);
    rect(10+50+10+140+20+20*13+10,610,24,20);
    rect(14+50+10+140+20+20*14+10,610,20,20);
    rect(14+50+10+140+20+20*15+10,610,20,20);
    
    rect(5+14+50+10+140+20+20*16+10,610,20,20);
    rect(5+14+50+10+140+20+20*17+10,610,20,20);
    PVector pos1Topos2;
    PVector pos1Topos3;
    pos1Topos2 = new PVector(points[absmode][modification_forme][2-1].x,points[absmode][modification_forme][2-1].y);
    pos1Topos2.sub(points[absmode][modification_forme][1-1]);
    pos1Topos3 = new PVector(points[absmode][modification_forme][3-1].x,points[absmode][modification_forme][3-1].y);
    pos1Topos3.sub(points[absmode][modification_forme][1-1]);
    float a = degrees(PVector.angleBetween(pos1Topos2, pos1Topos3));
    int signe=-1;
    fill(0);
    text(a,10+50+10+140+20+20*13+10+3,610+15);
    if (bouton(14+50+10+140+20+20*14+10,610,20,20)){ //bouton -
      pos1Topos2.rotate(radians(a));
      pos1Topos3.setMag(pos1Topos2.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos1Topos3.x,pos1Topos3.y)>1){
        signe=1;        
        /*println(pos1Topos2.x);
        println(pos1Topos2.y);
        println(pos1Topos3.x);
        println(pos1Topos3.y);
        println("nope");*/
      } else {
        //println("yes");
      }
      pos1Topos3.rotate(radians(signe* (round(a)-1)) );
      fill(0);
      pos1Topos3.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][2-1]=pos1Topos3;
      
    }else if (bouton(14+50+10+140+20+20*15+10,610,20,20)){ //bouton +
      pos1Topos2.rotate(radians(a));
      pos1Topos3.setMag(pos1Topos2.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos1Topos3.x,pos1Topos3.y)>1){
        signe=1;        
      }
      pos1Topos3.rotate(radians(signe* (round(a)+1)) );
      fill(0);
      pos1Topos3.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][2-1]=pos1Topos3;
      
    }else if (bouton(5+14+50+10+140+20+20*16+10,610,20,20)){
      pos1Topos3.rotate(radians(a));
      pos1Topos2.setMag(pos1Topos3.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos1Topos3.x,pos1Topos3.y)>1){
        signe=1;        
      }
      pos1Topos2.rotate(radians(signe* (round(a)-1)) );
      fill(0);
      pos1Topos2.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][3-1]=pos1Topos2;
      
      
    }else if (bouton(5+14+50+10+140+20+20*17+10,610,20,20)){
      pos1Topos3.rotate(radians(a));
      pos1Topos2.setMag(pos1Topos3.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos1Topos3.x,pos1Topos3.y)>1){
        signe=1;        
      }
      pos1Topos2.rotate(radians(signe* (round(a)+1)) );
      fill(0);
      pos1Topos2.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][3-1]=pos1Topos2;
    }
    
  }
  if (absmode==4){ //angle 4points
    fill(255);
    rect(10+50+10+140+20+20*13+10,610,24,20);
    rect(14+50+10+140+20+20*14+10,610,20,20);
    rect(14+50+10+140+20+20*15+10,610,20,20);
    
    rect(5+14+50+10+140+20+20*16+10,610,20,20);
    rect(5+14+50+10+140+20+20*17+10,610,20,20);
    PVector pos1Topos2;
    PVector pos3Topos4;
    pos1Topos2 = new PVector(points[absmode][modification_forme][2-1].x,points[absmode][modification_forme][2-1].y);
    pos1Topos2.sub(points[absmode][modification_forme][1-1]);
    pos3Topos4 = new PVector(points[absmode][modification_forme][4-1].x,points[absmode][modification_forme][4-1].y);
    pos3Topos4.sub(points[absmode][modification_forme][3-1]);
    float a = degrees(PVector.angleBetween(pos1Topos2, pos3Topos4));
    int signe=-1;
    fill(0);
    text(a,10+50+10+140+20+20*13+10+3,610+15);
    if (bouton(14+50+10+140+20+20*14+10,610,20,20)){ //bouton -
      pos1Topos2.rotate(radians(a));
      pos3Topos4.setMag(pos1Topos2.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos3Topos4.x,pos3Topos4.y)>1){
        signe=1;        
        /*println(pos1Topos2.x);
        println(pos1Topos2.y);
        println(pos1Topos3.x);
        println(pos1Topos3.y);
        println("nope");*/
      } else {
        //println("yes");
      }
      pos3Topos4.rotate(radians(signe* (round(a)-1)) );
      fill(0);
      pos3Topos4.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][2-1]=pos3Topos4;
      
    }else if (bouton(14+50+10+140+20+20*15+10,610,20,20)){ //bouton +
      pos1Topos2.rotate(radians(a));
      pos3Topos4.setMag(pos1Topos2.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos3Topos4.x,pos3Topos4.y)>1){
        signe=1;        
      }
      pos3Topos4.rotate(radians(signe* (round(a)+1)) );
      fill(0);
      pos3Topos4.add(points[absmode][modification_forme][1-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][2-1]=pos3Topos4;
      
    }else if (bouton(5+14+50+10+140+20+20*16+10,610,20,20)){
      pos3Topos4.rotate(radians(a));
      pos1Topos2.setMag(pos3Topos4.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos3Topos4.x,pos3Topos4.y)>1){
        signe=1;        
      }
      pos1Topos2.rotate(radians(signe* (round(a)-1)) );
      fill(0);
      pos1Topos2.add(points[absmode][modification_forme][3-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][4-1]=pos1Topos2;
      
      
    }else if (bouton(5+14+50+10+140+20+20*17+10,610,20,20)){
      pos3Topos4.rotate(radians(a));
      pos1Topos2.setMag(pos3Topos4.mag());
      if (dist(pos1Topos2.x,pos1Topos2.y,pos3Topos4.x,pos3Topos4.y)>1){
        signe=1;        
      }
      pos1Topos2.rotate(radians(signe* (round(a)+1)) );
      fill(0);
      pos1Topos2.add(points[absmode][modification_forme][3-1]); //vecteur qui va de (0,0) vers le point 2 après rotation
      points[absmode][modification_forme][4-1]=pos1Topos2;
    }
    
  }

  if (absmode==4 || absmode==5){ //nombres de clous
    fill(255);
    rect(50+10+140+20+20*10+10,610,20,20);
    rect(50+10+140+20+20*11+10,610,20,20);
    rect(50+10+140+20+20*12+10,610,20,20);
    fill(0);
    text(nb_clous[absmode][modification_forme],50+10+140+20+20*11+10+3,625);
    if (bouton(50+10+140+20+20*10+10,610,20,20) && nb_clous[absmode][modification_forme]>1){
      nb_clous[absmode][modification_forme]-=1;
    } else if (bouton(50+10+140+20+20*12+10,610,20,20)){
      nb_clous[absmode][modification_forme]+=1;
    }
  }
  
  fill(255);
  rect(15+14+50+10+140+20+20*18+10*3,610,20,20);
  rect(15+14+50+10+140+20+20*19+10*3,610,20,20);
  rect(15+14+50+10+140+20+20*20+10*3,610,20,20);
  
  
   if (absmode==1 ||absmode==3 || absmode==2 ||absmode==5 ||absmode==4){
    PVector pos1Topos2;
    pos1Topos2 = new PVector(points[absmode][modification_forme][2-1].x,points[absmode][modification_forme][2-1].y);
    pos1Topos2.sub(points[absmode][modification_forme][1-1]);
    float dist= pos1Topos2.mag();
    float convertion = (echelle*dist)/longeur;
    fill(0);
    text(convertion,15+14+50+10+140+20+20*18+10*3,610);
    if (bouton(15+14+50+10+140+20+20*20+10*3,610,20,20)){ //+0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos2.setMag( (((tmp+1)/10)*longeur)/echelle );
      pos1Topos2.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][2-1]=pos1Topos2;
    } else if (bouton(15+14+50+10+140+20+20*19+10*3,610,20,20)){ //-0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos2.setMag( (((tmp-1)/10)*longeur)/echelle );
      pos1Topos2.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][2-1]=pos1Topos2;
    }
     
   } 
   if (absmode==1 || absmode==2 ||absmode==5){ //angle
     fill(255);
     rect(15+14+50+10+140+20+20*21+10*3+5,610,20,20);
     rect(15+14+50+10+140+20+20*22+10*3+5,610,20,20);
     
     PVector pos1Topos3;
     pos1Topos3 = new PVector(points[absmode][modification_forme][3-1].x,points[absmode][modification_forme][3-1].y);
     pos1Topos3.sub(points[absmode][modification_forme][1-1]);
     float dist= pos1Topos3.mag();
     float convertion = (echelle*dist)/longeur;
     fill(0);
     text(convertion,15+14+50+10+140+20+20*18+10*3+100,610);
     
     if (bouton(15+14+50+10+140+20+20*21+10*3+5,610,20,20)){ //-0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos3.setMag( (((tmp-1)/10)*longeur)/echelle );
      pos1Topos3.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][3-1]=pos1Topos3;
    } else if (bouton(15+14+50+10+140+20+20*22+10*3+5,610,20,20)){ //+0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos3.setMag( (((tmp+1)/10)*longeur)/echelle );
      pos1Topos3.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][3-1]=pos1Topos3;
    }
     
   } 
   if (absmode==4) { 
     
     fill(255);
     rect(15+14+50+10+140+20+20*21+10*3+5,610,20,20);
     rect(15+14+50+10+140+20+20*22+10*3+5,610,20,20);
     
     
     PVector pos3Topos4;
     pos3Topos4 = new PVector(points[absmode][modification_forme][4-1].x,points[absmode][modification_forme][4-1].y);
     pos3Topos4.sub(points[absmode][modification_forme][3-1]);
     float dist= pos3Topos4.mag();
     float convertion = (echelle*dist)/longeur;
     fill(0);
     text(convertion,15+14+50+10+140+20+20*18+10*3+100,610);
     
     if (bouton(15+14+50+10+140+20+20*21+10*3+5,610,20,20)){ //-0.1 cm
      float tmp = round( convertion*10 );
      pos3Topos4.setMag( (((tmp-1)/10)*longeur)/echelle );
      pos3Topos4.add(points[absmode][modification_forme][3-1]);
      points[absmode][modification_forme][4-1]=pos3Topos4;
    } else if (bouton(15+14+50+10+140+20+20*22+10*3+5,610,20,20)){ //+0.1 cm
      float tmp = round( convertion*10 );
      pos3Topos4.setMag( (((tmp+1)/10)*longeur)/echelle );
      pos3Topos4.add(points[absmode][modification_forme][3-1]);
      points[absmode][modification_forme][4-1]=pos3Topos4;
    }
    
    fill(255);
    rect(15+14+50+10+140+20+20*25+10*3+10,610,20,20);
    rect(15+14+50+10+140+20+20*26+10*3+10,610,20,20);
    
    PVector pos1Topos3;
     pos1Topos3 = new PVector(points[absmode][modification_forme][3-1].x,points[absmode][modification_forme][3-1].y);
     pos1Topos3.sub(points[absmode][modification_forme][1-1]);
     dist= pos1Topos3.mag();
     convertion = (echelle*dist)/longeur;
     fill(0);
     text(convertion,15+14+50+10+140+20+20*18+10*3+200,610);
     
     if (bouton(15+14+50+10+140+20+20*25+10*3+10,610,20,20)){ //-0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos3.setMag( (((tmp-1)/10)*longeur)/echelle );
      pos1Topos3.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][3-1]=pos1Topos3;
    } else if (bouton(15+14+50+10+140+20+20*26+10*3+10,610,20,20)){ //+0.1 cm
      float tmp = round( convertion*10 );
      pos1Topos3.setMag( (((tmp+1)/10)*longeur)/echelle );
      pos1Topos3.add(points[absmode][modification_forme][1-1]);
      points[absmode][modification_forme][3-1]=pos1Topos3;
    }
    
    fill(255);
    rect(15+14+50+10+140+20+20*28+10*3+15,610,20,20);
    rect(15+14+50+10+140+20+20*29+10*3+15,610,20,20);
    
    PVector pos3Topos1;
     pos3Topos1 = new PVector(points[absmode][modification_forme][1-1].x,points[absmode][modification_forme][1-1].y);
     pos3Topos1.sub(points[absmode][modification_forme][3-1]);
     dist= pos3Topos1.mag();
     convertion = (echelle*dist)/longeur;
     fill(0);
     
     if (bouton(15+14+50+10+140+20+20*28+10*3+15,610,20,20)){ //-0.1 cm
      float tmp = round( convertion*10 );
      pos3Topos1.setMag( (((tmp-1)/10)*longeur)/echelle );
      pos3Topos1.add(points[absmode][modification_forme][3-1]);
      points[absmode][modification_forme][1-1]=pos3Topos1;
    } else if (bouton(15+14+50+10+140+20+20*29+10*3+15,610,20,20)){ //+0.1 cm
      float tmp = round( convertion*10 );
      pos3Topos1.setMag( (((tmp+1)/10)*longeur)/echelle );
      pos3Topos1.add(points[absmode][modification_forme][3-1]);
      points[absmode][modification_forme][1-1]=pos3Topos1;
    }
    
   }
  
  
  
  //(10+140+20,10,width-10-140-20-20,height-10-140-20-10)
  if (point_modification!= -1){
    int mousex= mouseX;
    int mousey= mouseY;
    for (int j=1; j<6;j++){
      for (int i=0; i<indice_forme[j];i++){
        for (int k=0; k<point_max[j]; k++){
          
          if (dist(mousex,mousey,points[j][i][k].x,points[j][i][k].y)<=10 && !(j==absmode && i==modification_forme && k==point_modification)){ //dist avec n'importe qu'elle point && pas le point courant
            mousex=int(points[j][i][k].x);
            mousey=int(points[j][i][k].y);
          }
          
        }       
      }
    }
    
    if (mouseX<170+30){
      mousex= 170+30;
    } else if (mouseX>(width-20)){
      mousex= width-20;
    }
    if (mouseY<10){
      mousey=10;
    } else if (mouseY>(height-170)){
      mousey= height-170;
    }
    points[absmode][modification_forme][point_modification] = new PVector(mousex,mousey);
    if(mousePressed==false){
      point_modification=-1;
    }
  }
  for (int i=0; i<10; i++){
     fill(tableau_de_couleurs[i]);
     rect(50+10+140+20+20*i,610,20,20);
     if (bouton(50+10+140+20+20*i,610,20,20)){ //bouton de choix de la couleur
       mode=-mode; //mode modifaction à mode tout court
       couleur_forme[absmode][modification_forme]=tableau_de_couleurs[i];
       modification_forme=-1;
     }
  }
  
}