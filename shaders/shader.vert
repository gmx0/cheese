#version 450

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 uv;

layout(location = 3) in float uv_x_offset;
layout(location = 4) in mat4 transform;

layout(location = 0) out vec2 out_uv;

layout(set = 0, binding = 0) uniform Perspective {
    mat4 perspective;
};

layout(set = 0, binding = 1) uniform View {
    mat4 view;
};

void main() {
    out_uv = vec2(uv.x + uv_x_offset, uv.y);

    mat4 modelview = view * transform;
    gl_Position = perspective * modelview * vec4(position, 1.0);
}
