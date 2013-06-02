int currShaderIndex = 0;
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
  ((Shader)shaders.get(currShaderIndex)).load();
}

void setup(){
  size(500, 500, P3D);
  
  shaders = new ArrayList<Shader>();
  setupShaders();
  
  Shader shader = (Shader)shaders.get(currShaderIndex);
  ((Shader)shaders.get(currShaderIndex)).load();
}

void setupShaders(){

  shaders.add(new WobbleShader());
  shaders.add(new SphereShader());
  shaders.add(new SimpleShader());
  shaders.add(new Checkerboard());
  shaders.add(new CircleShader());
  shaders.add(new BouncingCircle());
  shaders.add(new BlurShader());
  
  //shaders.add(new SimpleImgBlurShader());
  //shaders.add(new FogShader());
  //shaders.add(new ScanlineShader());
}

void draw(){
  Shader currShader = (Shader)shaders.get(currShaderIndex);
  currShader.update();
  
  background(0);
  currShader.draw();
}
