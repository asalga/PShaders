#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

const float radius = 40.0;

// We can make prototypes if our funcitons are defined
// below where they are used.
vec3 lerp(in vec3, in vec3, in float);

/*
 */
vec3 getNormal(in vec2 sphereCenter, in float sphereRadius, vec2 point ){

  // Need to figure out how far the current point is from the center
  // to lerp it
  float distFromCenter = distance(point, sphereCenter);
  float weight = distFromCenter/sphereRadius;
  
  // Z component is zero since at the edge the normal will be on the XY plane
  vec3 edgeNormal = vec3(point - sphereCenter, 0);
  edgeNormal = normalize(edgeNormal);


  // We know the normal at the center of the sphere points directly at the viewer,
  // so we can use that in our mix/lerp.
  return mix(vec3(0,0,1), edgeNormal, weight); 
}

/*
 * Using the built-in mix() method does something similar, this is here
 * just for demonstrations purposes.
 */
vec3 lerp(in vec3 v1, in vec3 v2, in float weight ){
  return v1 + ((v2 - v1) * weight);
}


void main(){

  if( distance( vec2(250, 250), vec2(gl_FragCoord)) < 100.0){
    vec3 sphereNormal =  vec3(getNormal( vec2(250, 250), 100.0, vec2(gl_FragCoord)));
    vec3 dirLight = vec3(0,0,1);
    vec3 col =  normalize((vec3(1,1,1))) * dot(sphereNormal, dirLight);
    gl_FragColor = vec4(0.1) + vec4(col, 1);
  }
  else{
    gl_FragColor = vec4(0);
  }
}

