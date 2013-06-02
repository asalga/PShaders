public class Shader{
  protected PShader shader;
  
  public void setup(String shaderPath){
    shader = loadShader(shaderPath);
  }
  
  public void update(){
  }
  
  public void load(){
    shader(shader);
  }

  public void draw(){
    rect(0, 0, width, height);
  }
}
