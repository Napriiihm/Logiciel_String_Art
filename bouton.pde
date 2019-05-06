boolean bouton(int xpos, int ypos, int xlen, int ylen){
  boolean retour = false;
  
  if (mouseX>xpos && mouseX<(xpos+xlen) && mouseY>ypos && mouseY<(ypos+ylen)){
    curseur = "HAND";
    if (mousePressed){
     retour = true; 
     mousePressed=false;
    }
  }
  return retour;
}

boolean bouton_modification(int xpos, int ypos, int xlen, int ylen, int mode, int forme){
  boolean retour = false;
  
  if (mouseX>xpos && mouseX<(xpos+xlen) && mouseY>ypos && mouseY<(ypos+ylen)){
    alpha[0]=mode;
    alpha[1]=forme;
    curseur = "HAND";
    /*fill(255,0);
    rect(10+140+20,10,width-10-140-20-20,height-10-140-20-10);
    if (mode==1){
      forme1[i].tracer(points[1][i][0], points[1][i][1],couleur_forme[1][i]);
    }else if (mode==2){
      forme2[i].tracer(points[2][i][0], points[2][i][1], points[2][i][2],couleur_forme[2][i]);
    }else if (mode==3){
      forme3[i].tracer(points[3][i][0], points[3][i][1],couleur_forme[3][i]);
    }else if (mode==4){
      forme4[i].tracer(points[4][i][0], points[4][i][1], points[4][i][2], points[4][i][3],couleur_forme[4][i]);
    }else if (mode==5){
      forme5[i].tracer(points[5][i][0], points[5][i][1], points[5][i][2],couleur_forme[5][i]);
    }*/
    if (mousePressed){
     retour = true; 
     mousePressed=false;
    }
  }
  return retour;
}

boolean boutonrond(float xpos, float ypos, int rad){
  boolean retour = false;
  
  if (dist(mouseX,mouseY,xpos,ypos)<=rad/2){
    curseur = "HAND";
    if (mousePressed){
     retour = true; 
    }
  }
  return retour;
}