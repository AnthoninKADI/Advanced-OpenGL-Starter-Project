#version 330 core
in vec3 FragPos;            
in float DistanceCenter;  

uniform vec3 SphereCenter;  

out vec4 FragColor;

void main()
{
    float distanceMax = length(vec3(1.0, 1.0, 1.0));  
    float power = 5;
    float normalizedDistance = DistanceCenter / distanceMax; 
    normalizedDistance = pow(normalizedDistance, power);
    vec3 color = mix(vec3(0.0,0.0,1.0), vec3(1.0,1.0,1.0),normalizedDistance);
    FragColor = vec4(color, 1.0);
}