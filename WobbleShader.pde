public class WobbleShader extends Shader{

  PImage img;
  
  public WobbleShader(){
    super.setup("wobble/frag.glsl");
    img = loadImage("art.jpg");
    
    //Shader currShader = (Shader)shaders.get(currShaderIndex);
    
    PShader sh =loadShader("wobble/frag.glsl");
    
    shader.set("texture", img);
  }
  
  public void update(){
    // Processing breaks if these are not casted to floats
    shader.set("mouse", float(mouseX), float(mouseY));
    shader.set("time", millis()/1000.0);
  }
  
  public void draw(){    
    
    rect(0, 0, width, height);
  }
}
