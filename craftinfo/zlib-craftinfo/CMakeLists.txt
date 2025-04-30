cmake_minimum_required( VERSION 3.13...99.99)

project( expat NONE)

file( GLOB DEFINITION_DIRS
   definition*
)

foreach( DIR ${DEFINITION_DIRS} )
   install( DIRECTORY "${DIR}" DESTINATION "share/mulle-craft/zlib")
endforeach()
