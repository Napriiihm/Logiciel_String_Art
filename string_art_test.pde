String curseur = "HAND";
int mode=0;  // 0 signifie aucune mode
float b=0;
   
int formes_max = 10000;
Trait_de_construction[] forme1 = new Trait_de_construction[formes_max]; //mode1
Angle[] forme2 = new Angle[formes_max]; //mode2
Trait[] forme3 = new Trait[formes_max]; //mode3
Courbe_4_points[] forme4 = new Courbe_4_points[formes_max];  //mode4
Courbe_3_points[] forme5 = new Courbe_3_points[formes_max]; //mode5
PVector[][][] points = new PVector[6][formes_max][4]; //[mode 1, 2, 3, 4, ou 5][formes_max][est le nombre de points par formes]
int indice_point =0; //indice du point à placer
int point_modification = -1; //indice du point à modifié

int[] indice_forme = new int[6]; //[mode 1, 2, 3, 4, ou 5] [0] ne sera pas utilisé
int[] jesaispasfrere = new int[6]; //[mode 1, 2, 3, 4, ou 5] [0] ne sera pas utilisé
int modification_forme = -1; //indice de la forme à modifié peut importe le mode

int[] alpha = {0,0}; //mode et indice forme 
color[] tableau_de_couleurs = {color(192, 57, 43),color(231, 76, 60),color(142, 68, 173),color(41, 128, 185),color(52, 152, 219),color(26, 188, 156),color(51, 255, 0),color(139, 195, 74),color(255, 193, 7),color(255, 87, 34)};
color[][] couleur_forme = new color[6][formes_max]; //[choix du mode][indice de la forme dans le mode]
int[][] nb_clous = new int[6][formes_max]; //[choix du mode][indice de la forme dans le mode]
int[][][] taille = new int[6][formes_max][2]; //[choix du mode][indice de la forme dans le mode][choix du trai]//biberon led, biberon pour chef cuisinier, biberon sans tétine, biberon double tétine
int[] couleur_mode = new int [6]; //nombre de mode +1 (case 0 non utilisé)
int[] point_max = {0,3,3,2,4,3}; //points par courbe en fonction du mode utilisé dans placer point
boolean point_construction=false;
boolean clous=false;

float longeur = 588; //588pixel (hauteur de la case pour dessiner)
float echelle = 100; //100cm

void setup(){
  fullScreen();
    for (int i=0; i < formes_max; i++) {  
      forme1[i] = new Trait_de_construction();
    }
    for (int i=0; i < formes_max; i++) {  
      forme2[i] = new Angle();
    }
    for (int i=0; i < formes_max; i++) {  
      forme3[i] = new Trait();
    }
    for (int i=0; i < formes_max; i++) {  
      forme4[i] = new Courbe_4_points();
    }
    for (int i=0; i < formes_max; i++) {  
      forme5[i] = new Courbe_3_points();
    }

    
    
  for (int i=0; i<6; i++){
       couleur_mode[i]=(150);
       indice_forme[i]=0; 
       jesaispasfrere[i]=0;
  }
  for (int i=1; i<=5; i++){
        couleur_forme[i][0]=(0);
        nb_clous[i][0]=10;
  }
}

void draw(){
  background(125);   
  curseur="ARROW";
  alpha[0]=0;
  
  
  choixmode();
  
  if (curseur=="HAND"){
    cursor(HAND);
  }else if (curseur=="ARROW"){
    cursor(ARROW);
  } else if (curseur=="NOPE"){
    noCursor();
  }
  
  if (!point_construction){
    for (int i=0; i<indice_forme[1];i++){
        forme1[i].tracer(points[1][i][0], points[1][i][1], points[1][i][2],couleur_forme[1][i]);
    }
  }
  if (!clous){
    for (int i=0; i<indice_forme[2];i++){
           forme2[i].tracer(points[2][i][0], points[2][i][1], points[2][i][2],couleur_forme[2][i]);
    }
    for (int i=0; i<indice_forme[3];i++){
           forme3[i].tracer(points[3][i][0], points[3][i][1],couleur_forme[3][i]);
    }
    for (int i=0; i<indice_forme[4];i++){
           forme4[i].tracer(points[4][i][0], points[4][i][1], points[4][i][2], points[4][i][3],couleur_forme[4][i],nb_clous[4][i]);
    }
    for (int i=0; i<indice_forme[5];i++){
           forme5[i].tracer(points[5][i][0], points[5][i][1], points[5][i][2],couleur_forme[5][i],nb_clous[5][i]);
    }
  } else {
    strokeWeight(2);
    for (int i=0; i<indice_forme[2];i++){
           forme2[i].clous(points[2][i][0], points[2][i][1], points[2][i][2],couleur_forme[2][i]);
    }
    for (int i=0; i<indice_forme[3];i++){
           forme3[i].clous(points[3][i][0], points[3][i][1],couleur_forme[3][i]);
    }
    for (int i=0; i<indice_forme[4];i++){
           forme4[i].clous(points[4][i][0], points[4][i][1], points[4][i][2], points[4][i][3],couleur_forme[4][i],nb_clous[4][i]);
    }
    for (int i=0; i<indice_forme[5];i++){
           forme5[i].clous(points[5][i][0], points[5][i][1], points[5][i][2],couleur_forme[5][i],nb_clous[5][i]);
    }
    strokeWeight(1);
  }
  
  if (alpha[0]!=0){ //quand on a la souris sur une bouton de modification on voit la forme en question qui est mise en avant
    fill(255,200);
    stroke(0);
    rect(10+140+20+30,10,width-10-140-20-20-30,height-10-140-20-10);
    if (alpha[0]==1 || mode==-1){
      forme1[alpha[1]].tracer(points[1][alpha[1]][0], points[1][alpha[1]][1], points[1][alpha[1]][2],couleur_forme[1][alpha[1]]);
    }else if (alpha[0]==2 || mode==-2){
      forme2[alpha[1]].tracer(points[2][alpha[1]][0], points[2][alpha[1]][1], points[2][alpha[1]][2],couleur_forme[2][alpha[1]]);
    }else if (alpha[0]==3 || mode==-3){
      forme3[alpha[1]].tracer(points[3][alpha[1]][0], points[3][alpha[1]][1],couleur_forme[3][alpha[1]]);
    }else if (alpha[0]==4 || mode==-4){
      forme4[alpha[1]].tracer(points[4][alpha[1]][0], points[4][alpha[1]][1], points[4][alpha[1]][2], points[4][alpha[1]][3],couleur_forme[4][alpha[1]],nb_clous[4][alpha[1]]);
    }else if (alpha[0]==5 || mode==-5){
      forme5[alpha[1]].tracer(points[5][alpha[1]][0], points[5][alpha[1]][1], points[5][alpha[1]][2],couleur_forme[5][alpha[1]],nb_clous[5][alpha[1]]);
    }
    for (int i=0; i<point_max[alpha[0]]; i++){
       fill(255);
       ellipse((points[alpha[0]][alpha[1]][i]).x,(points[alpha[0]][alpha[1]][i]).y,20,20);
       fill(0);
       text(i+1,(points[alpha[0]][alpha[1]][i]).x-3,(points[alpha[0]][alpha[1]][i]).y+5);
    }
  }
  
  fill(0);
  /*text(mode,800,600);
  text(indice_point,800,650);
  text(jesaispasfrere[2],800,700);
  text(modification_forme,800,750);
  text(point_modification,850,750);*/
}