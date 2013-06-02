public class SimpleImageBlurShader extends Shader{

  PImage img;
  PGraphics pg, pg2;
  PShape plane;
  int iterations = 0;
 
  public SimpleImageBlurShader(){
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
      PShader test = pg2.loadShader("simple_image_blur_shader/frag.glsl");
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
    
    if(iterations == 0
    ){
      image(pg, 0, 0);
    }
    else{
      image(pg2, 0, 0);
    }
    
    

    //img.loadPixels();
    //for (int i = 0; i < img.pixels.length; i++) {
      //img.pixels[i] = pg.pixels[i];
    //}
    //img.updatePixels();
    
    //image(pg, 0,0);
    
    //Shader currShader = (Shader)shaders.get(currShaderIndex);
    //currShader.load();
    
    //background(0);
    //translate(width/2, height/2, 0);
    //scale(256);
    //shape(plane);
    //resetShader();
    //image(pg, 0,0); 
   
    
   // Shader currShader = (Shader)shaders.get(currShaderIndex);
   // currShader.load();

   /* PImage img = createImage(width, height, RGB);
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] = color(0, 90, 102); 
    }
    img.updatePixels();
*/
    //shader.set("texture", pg);
    
    //rect(0, 0, width, height);
    
    //shader.set("frameCount", frameCount);
    
    /*

     if(frameCount > 1){
      // Copy what we drew to the framebuffer to a texture
      loadPixels();
      
      img.loadPixels();
      for (int i = 0; i < img.pixels.length; i++) {
        img.pixels[i] = pixels[i];
      }
      //print(color(img.pixels[width*2 + height*2]));
      
      img.updatePixels();
      
      float[] f = {1,1,10, 1,10,1, 1,1,10};
      
      shader.set("texture", img);
      shader.set("tc_offset", f);
    }*/
  }
}

