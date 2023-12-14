
set (engineName "physics")

set(libengines_base_files
	${Engine_SOURCE_DIR}/src/body.cpp
	${Engine_SOURCE_DIR}src/collide_coarse.cpp
	${Engine_SOURCE_DIR}/src/collide_fine.cpp
	${Engine_SOURCE_DIR}/src/contacts.cpp
	${Engine_SOURCE_DIR}/src/core.cpp
	${Engine_SOURCE_DIR}/src/fgen.cpp
	${Engine_SOURCE_DIR}/src/joints.cpp
	${Engine_SOURCE_DIR}/src/particle.cpp
	${Engine_SOURCE_DIR}/src/pcontacts.cpp
	${Engine_SOURCE_DIR}/src/pfgen.cpp
	${Engine_SOURCE_DIR}/src/plinks.cpp
	${Engine_SOURCE_DIR}/src/pworld.cpp
	${Engine_SOURCE_DIR}/src/random.cpp
	${Engine_SOURCE_DIR}/src/world.cpp
)

set(libengines_include
	#${Engine_SOURCE_DIR}/OpenGL/include/baseScene.h
)

 if(SHARED_LIBS)
	ADD_DEFINITIONS(-DENGINE_DLLS)
 endif()

add_library(${engineName}  
						${libengines_include}
						${libengines_base_files}
						)


source_group("Header Files\\\\include" FILES ${libengines_include})
source_group("Source Files\\\\physic" FILES ${libengines_base_files})

 
 #glm
target_include_directories(${engineName} PUBLIC ${Engine_SOURCE_DIR})

if(MSVC AND SHARED_LIBS)
  target_compile_definitions(${engineName}
    PUBLIC  ENGINE_USE_DLLS
    PRIVATE LIBENGINE_EXPORTS)
endif()


set_target_properties(${engineName} PROPERTIES
    OUTPUT_NAME ${LIB_PREFIX}${engineName})

install(TARGETS ${engineName} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
