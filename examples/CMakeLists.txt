

set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} /SAFESEH:NO ")		# 程序输出文件为exe文件时起作用
set(CMAKE_SHARED_LINKR_FLAGS "${CMAKE_SHARED_LINKR_FLAGS} /SAFESEH:NO ")		# 程序输出文件为dll文件时起作用
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKR_FLAGS} /SAFESEH:NO ")	        # 程序输出文件为lib文件时起作用
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /SAFESEH:NO ")	# 程序输出文件为module文件时起作用

# ================================================= ballistic   =================================================

set(ballistic_source  ballistic/ballistic.cpp main.cpp app.h app.cpp timing.cpp timing.h)

add_executable(ballistic ${ballistic_source})
add_dependencies(ballistic ${engineName})
source_group("Source Files" FILES ${ballistic_source})

target_include_directories(ballistic PUBLIC "D:/3rdLib/")
set_target_properties(ballistic PROPERTIES PROJECT_LABEL "ballistic")						# in Visual Studio
set_target_properties(ballistic PROPERTIES OUTPUT_NAME "ballistic")
set_target_properties(ballistic PROPERTIES FOLDER "examples/")
target_link_libraries(ballistic "D:/3rdLib/GL/glut32.lib" ${engineName} "opengl32.lib" "glu32.lib" "winmm.lib")
#install
install(TARGETS ballistic RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

