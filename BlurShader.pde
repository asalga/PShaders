public class BlurShader extends Shader{

  PImage img;
  PGraphics pg, pg2;
  PShape plane;
  int iterations = 1;
 
  public BlurShader(){
    img = createImage(width, height, RGB);
    pg = createGraphics(width, height, P3D);
    pg2 = createGraphics(width, height, P3D);

    super.setup("blur/frag.glsl");
  }

  public void update(){
  }
  
  public void draw(){   
    pg.beginDraw();
    pg.loadPixels();
    pg.background(0);
    pg.fill(255, 128, 0);
    pg.translate(width/2, height/2);
    pg.rotate(frameCount/100.0f);
    pg.rotateX(frameCount/100.0f);
    pg.box(200);
    pg.endDraw();
    
    for(int i = 0; i < iterations; i++){
      pg2.beginDraw();
      PShader test = pg2.loadShader("blur/frag.glsl");
      pg2.shader(test);
      if(i == 0){
        test.set("texture", pg);
      }
      else{
        test.set("texture", pg2);
      }
      pg2.rect(0, 0, width, height);
      pg2.endDraw();
    }
    
    resetShader();
    
    if(iterations == 0){
      image(pg, 0, 0);
    }
    else{
      image(pg2, 0, 0);
    }
  }
}

