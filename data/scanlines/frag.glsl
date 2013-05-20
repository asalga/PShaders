#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

void main(){

  // We can't use the % symbol for modulus.
  // In addition, we need to use floats for mod
  int color = int(mod(gl_FragCoord.y, 2.0));
  gl_FragColor = vec4(color);

  // Branchy version:
  //if( int(mod(gl_FragCoord.y, 2.0)) == 0){
  //  gl_FragColor = vec4(0, 0, 0, 1); 
  //}
  //else{
  //  gl_FragColor = vec4(1, 1, 1, 1);
  //}
}
