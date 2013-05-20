#ifdef GL_ES
precision mediump int;
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

const float radius = 30.0;

// Uniforms are used to communicate from our application
// to the shader.
uniform int time;

void main(){

  float circleYPos = sin( float(time)/100.0 ) * 25.0;

  // We can only add two floats, and not int and float
  if( distance( vec2(250, 250.0 + circleYPos), vec2(gl_FragCoord)) < radius){
    gl_FragColor = vec4(1);
  }
  else{
    gl_FragColor = vec4(0);
  }
}

