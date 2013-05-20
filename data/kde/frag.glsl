#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

uniform int time;

void main(){

  float xOffset = sin( float(time)/100.0 ) * 15.0;
  float yOffset = cos( float(time)/100.0 ) * 15.0;

  if( distance( vec2(250.0 + xOffset, 250.0 + yOffset), vec2(gl_FragCoord)) < 40.0){
    gl_FragColor = vec4(0, 0, 1, 1);
  }else{
    gl_FragColor = vec4(1);
  }
}

