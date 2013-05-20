// Andor Salga
// Probably the simplest shader you can write.

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

// Ignore any colors from Processing and use pure white.
void main(){
  gl_FragColor = vec4(1, 1, 1, 1);
}
