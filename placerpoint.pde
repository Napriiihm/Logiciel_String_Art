void placerpoint(){
  for (int i=0; i<indice_point; i++){  //affiche les points quand on les places
      fill(255);
      ellipse((points[mode][indice_forme[mode]][i]).x,(points[mode][indice_forme[mode]][i]).y,20,20);
      fill(0);
      text(i+1,(points[mode][indice_forme[mode]][i]).x-3,(points[mode][indice_forme[mode]][i]).y+5);
   }
   /*if (indice_point==0 && indice_forme[mode]>0){   //affiche les 4 points de la forme d'avant avant 
     for (int i=0; i<point_max[mode]; i++){
       fill(255);
       ellipse((points[mode][indice_forme[mode]-1][i]).x,(points[mode][indice_forme[mode]-1][i]).y,20,20);
       fill(0);
       text(i+1,(points[mode][indice_forme[mode]-1][i]).x-3,(points[mode][indice_forme[mode]-1][i]).y+5);
     }
   }*/
   
  if (mouseX>170+30 && mouseY>10 && mouseX<(width-20) && mouseY<(height-170)){ //endroit pour faire les courbes
   fill(255);
   ellipse(mouseX,mouseY,20,20);
   fill(0);
   text(indice_point+1,mouseX-3,mouseY+5);
   curseur= "NOPE";
   
   if (mousePressed){
      int mousex= mouseX;
      int mousey= mouseY;
      for (int j=1; j<6;j++){
        for (int i=0; i<indice_forme[j];i++){
          for (int k=0; k<point_max[j]; k++){
            
            if (dist(mousex,mousey,points[j][i][k].x,points[j][i][k].y)<=10 && !(j==mode && i==modification_forme && k==point_modification)){ //dist avec n'importe qu'elle point && pas le point courant
              mousex=int(points[j][i][k].x);
              mousey=int(points[j][i][k].y);
            }
            
            
          }       
        }
      }
      points[mode][indice_forme[mode]][indice_point] = new PVector(mousex, mousey);
  
      indice_point++;
      if (indice_point >=point_max[mode]){ //à changer en fonction de mode trait ou courbe 3 ou 4
        if (indice_forme[mode]>0){
          couleur_forme[mode][indice_forme[mode]]=couleur_forme[mode][indice_forme[mode]-1]; //à partir de la 2eme forme initialise là couleur de la forme à la couleur de la forme d'avant
          nb_clous[mode][indice_forme[mode]]=nb_clous[mode][indice_forme[mode]-1];
      }
        indice_forme[mode]++;
        if ((indice_forme[mode]-1)%10==0 && indice_forme[mode]!=1){
          jesaispasfrere[mode]+=10;
        }
        indice_point = 0;
      }
    mousePressed=false;
   }
  }
}