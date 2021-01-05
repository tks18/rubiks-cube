import peasy.*;
PeasyCam cam;

final int UPP = 0;
final int DWN = 1;
final int RGT = 2;
final int LFT = 3;
final int FRT = 4;
final int BCK = 5;

// UP, DOWN, RIGHT, LEFT, FRONT, BACK
color[] colors = {
  #FFFFFF, #FFFF00,
  #FFA500, #FF0000,
  #00FF00, #0000FF
};

int dim = 3;
Cubie[] cube = new Cubie[dim * dim * dim];
void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++){
    for (int y = -1; y <= 1; y++){
      for (int z = -1; z <= 1; z++){
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x,y,z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
}

void turnX(int index){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.x == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(qb.y, qb.z);
      
      qb.update(round(qb.x), round(matrix.m02), round(matrix.m12));
    }
  }
}

void turnY(int index){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.y == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(qb.x, qb.z);
      
      qb.update(round(matrix.m02), round(qb.y), round(matrix.m12));
    }
  }
}

void turnZ(int index){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.z == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(qb.x, qb.y);
      
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
    }
  }
}

void keyPressed(){
  switch (key) {
    case '1':
      turnZ(-1);
      break;
    case '2':
      turnZ(1);
      break;
    case '3':
      turnY(-1);
      break;
    case '4':
      turnY(1);
      break;
    case '5':
      turnX(-1);
      break;
    case '6':
      turnX(1);
      break;
  }
  
  //if (key == '1') {
  //  turnZ(-1);
  //} else if (key == '2'){
  //  turnZ(1);
  //}
}

void draw(){
  background(55);
  scale(50);
  for (int i = 0; i < cube.length; i++){
    cube[i].show();
  }
}
