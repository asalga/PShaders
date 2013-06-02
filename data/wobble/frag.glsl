#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

#define TAU 3.141592658 * 2.0

uniform sampler2D texture;

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main(){

  //float freqScale = 20.0   * float(float(mouse.x)/500.0);//(float(cursor.x))/500.0 * 20.0; 
  //float freq = float(frameCount)/80.0 * freqScale;

  vec2 texCoords = vec2(gl_FragCoord)/499.0;
 
  float amp = float(mouse.x)/500.0;
 
  float t = time;
  t = mod(time, TAU); 

  // sin returns a value from -1 to 1 which will be too large of an offset,
  // so we scale it down.
  texCoords.xy += vec2(0, (sin( t + (gl_FragCoord.x/50.0))/20.0) * amp) ;

  // Flip texture coordinates
  texCoords.y = 1.0 - texCoords.y;
  
  // Expand texture so even after wobble, the valleys from sin are off screen
  texCoords.xy *= 0.7;
  
  // Center the image
  texCoords.xy += (1.0 - 0.7)/2.0;

  vec4 texel = texture2D(texture, texCoords);

  gl_FragColor = texel;
}

