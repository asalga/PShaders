public class BouncingCircle extends Shader{

  public BouncingCircle(){
    super.setup("bouncing_circle/frag.glsl");
  }
  
  public void update(){
    shader.set("time", millis());
  }
}
