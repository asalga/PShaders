#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

const float BOX_SIZE = 50.0;

void main(){
  
  // This alternates every row between zero and one.
  int evenRow = int(mod(gl_FragCoord.y / BOX_SIZE, 2.0));

  if( int(mod(gl_FragCoord.x / BOX_SIZE, 2.0)) == evenRow ){
    gl_FragColor = vec4(1);
  }
  else{
    gl_FragColor = vec4(0);
  }

}
