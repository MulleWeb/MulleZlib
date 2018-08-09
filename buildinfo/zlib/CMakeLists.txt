cmake_minimum_required( VERSION 3.0)

project( zlib NONE)

file( GLOB BUILDINFO_DIRS
   zlib*
)

foreach( DIR ${BUILDINFO_DIRS} )
   install( DIRECTORY "${DIR}" DESTINATION "share/mulle-craft")
endforeach()
