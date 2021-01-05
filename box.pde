class Cubie{
  PVector pos;
  float len;
  Cubie(float x, float y, float z, float len_){
    pos = new PVector(x,y,z);
    len = len_;
  }
  
  void show() {
    fill(255);
    stroke(0);
    strokeWeight(8);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    beginShape(QUADS);
    float r = len / 2;
    
    // Z Fixed
    fill(colors[BCK]);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(-r, r, -r);
    
    fill(colors[FRT]);
    vertex(-r, -r, r);
    vertex(r, -r, r);
    vertex(r, r, r);
    vertex(-r, r, r);
    
    // Y Fixed
    fill(colors[DWN]);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, -r, r);
    vertex(-r, -r, r);
    
    fill(colors[UPP]);
    vertex(-r, r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(-r, r, r);
    
    // X- Fixed
    fill(colors[LFT]);
    vertex(-r, -r, -r);
    vertex(-r, r, -r);
    vertex(-r, r, r);
    vertex(-r, -r, r);
    
    fill(colors[RGT]);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(r, -r, r);
    
    endShape();
    
    //box(len);
    popMatrix();
  }
  
}
