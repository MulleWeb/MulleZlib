cmake_minimum_required( VERSION 3.15)

project( expat NONE)

file( GLOB DEFINITION_DIRS
   definition*
)

foreach( DIR ${DEFINITION_DIRS} )
   install( DIRECTORY "${DIR}" DESTINATION "share/mulle-craft/zlib")
endforeach()
