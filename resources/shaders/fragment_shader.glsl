#version 330 core
out vec4 FragColor;

in vec2 TexCoords;
in vec3 Normal;
in vec3 FragPos;

// Текстура, яку завантажить наш клас Model
uniform sampler2D texture_diffuse1;

// Параметри освітлення
uniform vec3 lightPos;
uniform vec3 viewPos;
uniform vec3 lightColor;

void main() {
    // 1. Фонове освітлення (Ambient)
    float ambientStrength = 0.2;
    vec3 ambient = ambientStrength * lightColor;

    // 2. Дифузне освітлення (Diffuse)
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;

    // 3. Дзеркальне відбиття (Specular - Blinn-Phong)
    float specularStrength = 0.3; // Не робимо хутро занадто металевим
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 halfwayDir = normalize(lightDir + viewDir);
    float spec = pow(max(dot(norm, halfwayDir), 0.0), 32.0);
    vec3 specular = specularStrength * spec * lightColor;

    // Беремо колір пікселя з текстури розмальовки
    vec3 texColor = texture(texture_diffuse1, TexCoords).rgb;

    // Комбінуємо світло з текстурою
    vec3 result = (ambient + diffuse + specular) * texColor;
    FragColor = vec4(result, 1.0);
}