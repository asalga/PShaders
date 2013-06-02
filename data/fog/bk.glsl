#ifdef GL_ES
precision mediump float;
precisiom mediump int;
#endif

#define PROCESSING_COLOR_SHADER

void main(){

  const vec4 fogColor = vec4(0.5, 0.8, 0.5, 1.0);

  const float e = 2.71;

  float fogFactor = 0.3 * gl_FragCoord.z;
  fogFactor *= fogFactor;
  fogFactor = clamp(pow(e, -fogFactor), 0.0, 1.0);

  gl_FragColor = mix(fogColor, gl_Color, fogFactor);
}

