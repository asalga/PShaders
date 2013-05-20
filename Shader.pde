public class Shader{
  protected PShader shader;
  
  public void setup(String shaderPath){
    shader = loadShader(shaderPath);
    println(shader);
  }
  
  public void update(){
  }
  
  public void load(){
    shader(shader);
  }
}
