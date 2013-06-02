public class FogShader extends Shader{

  public FogShader(){
    super.setup("fog/frag.glsl");
  }

  public void update(){
    
  }
  
  public void draw(){
   // translate(width/2, height/2);
   // rotate(frameCount/100.0f);
   // rotateX(frameCount/100.0f);
   // box(200);
   noStroke();
   
   rect(0,0,100, 100);
   println(frameRate);
  }
}
