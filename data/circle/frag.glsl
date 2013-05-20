#ifdef GL_ES
precision mediump int;
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

const float radius = 30.0;

void main(){

  // If the distance from the current coord lays inside the
  // circle's radius, draw that pixel white

  // distance() will calculate the distance between two points
  // see also length()
  if( distance(vec2(250, 250), vec2(gl_FragCoord )) < radius){
    gl_FragColor = vec4(1);
  }
  else{
    gl_FragColor = vec4(0);
  }
}
