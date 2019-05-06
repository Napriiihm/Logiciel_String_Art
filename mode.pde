void choixmode(){
  fill(255);
  stroke(couleur_mode[1]);
  rect(10,10,140,140); //mode1
  stroke(couleur_mode[2]);
  rect(10,160,140,140);  //mode2
  stroke(couleur_mode[3]);
  rect(10,310,140,140);  //mode2
  stroke(couleur_mode[4]);
  rect(10,460,140,140);  //mode2
  stroke(couleur_mode[5]);
  rect(10,610,140,140);  //mode2
  if (bouton(10,10,140,140)){
    mode =1;
    indice_point =0;
    modification_forme=-1;
  } else if (bouton(10,160,140,140)){
    mode =2;
    indice_point =0;
    modification_forme=-1;
  } else if (bouton(10,310,140,140)){
    mode =3;
    indice_point =0;
    modification_forme=-1;
  } else if (bouton(10,460,140,140)){
    mode =4;
    indice_point =0;
    modification_forme=-1;
  } else if (bouton(10,610,140,140)){
    mode =5;
    indice_point =0;
    modification_forme=-1;
  }
  dessin();
  
  for (int i=1; i<=5; i++){  //contour du mode actif en 255 0 0
      if (i==mode || i==-mode){
        couleur_mode[i]=color(255,0,0);
      } else {
        couleur_mode[i]=(150);
      }
  }
  
  stroke(0);
  fill(255);
  rect(10+140+20+30,10,width-10-140-20-20-30,height-10-140-20-10); //endroit pour faire les courbes, utilisé dans placerpoint
  /*stroke(255,0,0);
  line(10+140+20+30+588,10,10+140+20+30+588,10+588);
  line(10+140+20+30,10+588/2,10+140+20+30+588,10+588/2);
  line(10+140+20+30+588/2,10,10+140+20+30+588/2,10+588);*/

  stroke(0);
    
    
    if (mode>0){ //un mode
      placerpoint();
    } else if (mode<0){ //un mode dans l'option modification d'une croube
      alpha[1]=modification_forme;
      modification();     
    }
    
    int absmode= abs(mode);
    
        
    for (int i=0; i<indice_forme[absmode]-jesaispasfrere[absmode] && i<10 ; i++){ //affiche les boutons de modification
      fill(255);
      stroke(0);
      rect(100+10+140+100*i+20,height-18-100,100,100);
      
      if (bouton_modification(100+10+140+100*i+20, height-18-100, 100,100,absmode,i+jesaispasfrere[absmode])){
        mode = -absmode;
        modification_forme = i+jesaispasfrere[absmode]; //indice de la forme à modifier
      }
    }
    
    for (int i=0; i<indice_forme[absmode]-jesaispasfrere[absmode] && i<10 ; i++){ 
      if (modification_forme==i){
        stroke(255,0,0);
        rect(100+10+140+100*i+20,height-18-100,100,100);
      }
    } 
    
    if (indice_forme[absmode]>(10+jesaispasfrere[absmode]) ){ //l'indice de forme est plus grand que les modifiction possible
      rect(width-60-10,height-18-100,40,100);  //fleche pour aller au 10 prochaines formes
      if (bouton(width-70,height-18-100,40,100)){
        jesaispasfrere[absmode]+=10;
      }
    }
    if (jesaispasfrere[absmode]>0 ){ //on c'est dépalcer au moins un fois sur la droite dans les boutons de modifications
      rect(70+10+140+20-30,height-18-100,40,100);  //fleche pour aller au 10 formes précédentes
      if (bouton(70+10+140+20-30,height-18-100,40,100)){
        jesaispasfrere[absmode]-=10;
      }
    }
    
    stroke(215);
    fill(255);
    rect(160,10,30,140);
    rect(160,160,30,590);
    if (bouton(160,10,30,140)){
      point_construction=!point_construction;
    }
    if (bouton(160,160,30,590)){
      clous=!clous;
    }
}