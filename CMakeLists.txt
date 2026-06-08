cmake_minimum_required(VERSION 3.20)
project(EeveeProject)

set(CMAKE_CXX_STANDARD 17)


find_package(glfw3 CONFIG REQUIRED)
find_package(glad CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

add_executable(EeveeProject
        src/main.cpp
        src/stb_image.cpp
        src/Shader.h
        src/stb_image.h
        src/Mesh.h
        src/Model.h
)

target_link_libraries(EeveeProject PRIVATE
        glfw
        glad::glad
        assimp::assimp
        glm::glm
)