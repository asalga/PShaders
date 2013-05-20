int currShaderIndex = -1;
ArrayList shaders;

void keyPressed(){
  loadNextShader();
}

void loadNextShader(){
  currShaderIndex++;
  if(currShaderIndex >= shaders.size()){
    currShaderIndex = 0;
  }
  
  Shader shader = (Shader)shaders.get(currShaderIndex);
}

void setup(){
  size(500, 500, P3D);
  
  shaders = new ArrayList<Shader>();
  setupShaders();
  
  loadNextShader();
}

void setupShaders(){
  shaders.add(new SimpleShader());
  shaders.add(new ScanlineShader());
  shaders.add(new Checkerboard());
  shaders.add(new CircleShader());
  shaders.add(new BouncingCircle());
  shaders.add(new SphereShader());
}

void draw(){
  ((Shader)shaders.get(currShaderIndex)).load();
  ((Shader)shaders.get(currShaderIndex)).update();
  background(0);
  rect(0, 0, width, height);
}
