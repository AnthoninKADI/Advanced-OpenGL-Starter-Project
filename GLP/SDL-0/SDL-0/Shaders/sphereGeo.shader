#version 450 core

layout (triangles) in;
layout (triangle_strip, max_vertices = 3) out;

uniform mat4 mv_matrix; 
uniform mat4 projection; 

void main(void)
{
    for (int i = 0; i < 3; i++) {
        gl_Position = projection * mv_matrix * gl_in[i].gl_Position;
        EmitVertex();
    }
    EndPrimitive();
}
