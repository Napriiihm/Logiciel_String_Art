int entier(float flottant){
  int result = int(flottant);
  if (((result+1)-flottant)<=0.5){
    result+=1;
  }
  return result;
}

float angle(PVector vect1, PVector vect2){
  vect1.setMag(5000);
  vect2.setMag(5000);
  return PVector.angleBetween(vect1,vect2);
  
}