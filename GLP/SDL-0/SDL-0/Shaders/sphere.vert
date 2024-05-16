#version 330 core
in vec3 pos;

uniform mat4 mv_matrix;
uniform mat4 projection;

out vec3 FragPos;  
out float DistanceCenter;  

float doNoise(vec3 p) {
    return fract(sin(dot(p, vec3(0.0, 3.0, 0.0))) * 43000.0);
}

void main()
{
    vec3 noiseOffset = vec3(1.0, 1.0, 1.0);  
    float value = doNoise(pos + noiseOffset);
    vec3 displacedPos = pos + value * normalize(pos);  

    gl_Position = projection * mv_matrix * vec4(displacedPos, 1.0);
    FragPos = displacedPos;  
    DistanceCenter = length(displacedPos);  
}