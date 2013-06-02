#ifdef GL_ES
precision mediump float;
precisiom mediump int;
#endif

#define PROCESSING_COLOR_SHADER

uniform sampler2D texture;
uniform int frameCount;

varying vec4 vertColor;

vec4 sample[9];

vec2 tc_offset2[9];

void main(){
tc_offset2[0] = vec2(-1, 1);
tc_offset2[1] = vec2( 0, 1);
tc_offset2[2] = vec2( 1, 1);
tc_offset2[3] = vec2(-1, 0);
tc_offset2[4] = vec2( 0, 0);
tc_offset2[5] = vec2( 1, 0);
tc_offset2[6] = vec2(-1,-1);
tc_offset2[7] = vec2( 0,-1);
tc_offset2[8] = vec2( 1,-1);

  for(int i = 0; i < 9; i++){
    sample[i] = vec4(texture2D(texture, vec2(gl_FragCoord)/500.0 + vec2(tc_offset2[i])/500.0 ));
  }

  gl_FragColor = (sample[0] + sample[1] * 2.0 + sample[2] + 
		 sample[3] * 2.0 + sample[4] + sample[5] * 2.0 + 
		 sample[6] + sample[7] * 2.0 + sample[8]) / 13.0;

    //vec4 texCol = texture2D(texture, vec2(gl_FragCoord)/500.0);
    //gl_FragColor = texCol;

}

  //vec4 texCol = texture2D(texture, vec2(gl_FragCoord));
  //gl_FragColor = texCol;
  //vec4(1.0, 0.0, 0.0, 1.0);// mix(fogColor, gl_Color, fogFactor);

