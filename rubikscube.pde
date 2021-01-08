import peasy.*;
PeasyCam cam;

int dim = 3;
Cubie[] cube = new Cubie[dim * dim * dim];

String[] allMoves = {"f", "b", "u", "d", "l","r"};
String sequence = "";
int counter = 0;

boolean started = false;

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
  for (int i = 0; i < 200; i++){
    int r = int(random(allMoves.length));
    sequence += allMoves[r];
    if(random(1) < 0.5) {
      sequence += allMoves[r];
    } else {
      sequence += allMoves[r].toUpperCase();
    }
  }
  println(sequence);
  for (int i = sequence.length()-1; i >= 0; i--){
    String nextMove = flipCase(sequence.charAt(i));
    sequence += nextMove;
  }
}

String flipCase(char c) {
  String s = ""+c;
  if(s.equals(s.toLowerCase())){
    return s.toUpperCase();
  } else {
    return s.toLowerCase();
  }
}

void turnX(int index, int dir){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.x == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.y, qb.z); 
      qb.turnFacesX(dir);
      qb.update(round(qb.x), round(matrix.m02), round(matrix.m12));
    }
  }
}

void turnY(int index, int dir){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.y == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.turnFacesY(dir);
      qb.update(round(matrix.m02), round(qb.y), round(matrix.m12));
    }
  }
}

void turnZ(int index, int dir){
  for (int i = 0; i < cube.length; i++){
    Cubie qb = cube[i];
    if(qb.z == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.turnFacesZ(dir);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
    }
  }
}


void applyMove(char move){
  switch (move) {
    case 'f': 
    turnZ(1, 1);
    break;
  case 'F': 
    turnZ(1, -1);
    break;  
  case 'b': 
    turnZ(-1, 1);
    break;
  case 'B': 
    turnZ(-1, -1);
    break;
  case 'u': 
    turnY(1, 1);
    break;
  case 'U': 
    turnY(1, -1);
    break;
  case 'd': 
    turnY(-1, 1);
    break;
  case 'D': 
    turnY(-1, -1);
    break;
  case 'l': 
    turnX(-1, 1);
    break;
  case 'L': 
    turnX(-1, -1);
    break;
  case 'r': 
    turnX(1, 1);
    break;
  case 'R': 
    turnX(1, -1);
    break;
  }
  
  //if (key == '1') {
  //  turnZ(-1);
  //} else if (key == '2'){
  //  turnZ(1);
  //}
}

void keyPressed(){
  if(key == ' '){
    started = true;
  } else {
      switch (key) {
      case 'f': 
      turnZ(1, 1);
      break;
    case 'F': 
      turnZ(1, -1);
      break;  
    case 'b': 
      turnZ(-1, 1);
      break;
    case 'B': 
      turnZ(-1, -1);
      break;
    case 'u': 
      turnY(1, 1);
      break;
    case 'U': 
      turnY(1, -1);
      break;
    case 'd': 
      turnY(-1, 1);
      break;
    case 'D': 
      turnY(-1, -1);
      break;
    case 'l': 
      turnX(-1, 1);
      break;
    case 'L': 
      turnX(-1, -1);
      break;
    case 'r': 
      turnX(1, 1);
      break;
    case 'R': 
      turnX(1, -1);
      break;
    }
  }
}


void draw(){
  background(55);
  if(started){
    if (frameCount % 1 == 0){
      if(counter < sequence.length()) {
        char move = sequence.charAt(counter);
        applyMove(move);
        counter++;
      }
    }
  }
  scale(50);
  for (int i = 0; i < cube.length; i++){
    cube[i].show();
  }
}
