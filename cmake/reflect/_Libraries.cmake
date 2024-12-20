# This file will be regenerated by `mulle-sourcetree-to-cmake` via
# `mulle-sde reflect` and any edits will be lost.
#
# This file will be included by cmake/share/Files.cmake
#
# Disable generation of this file with:
#
# mulle-sde environment set MULLE_SOURCETREE_TO_CMAKE_LIBRARIES_FILE DISABLE
#
if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# Generated from sourcetree: 3da2738b-6ef6-4a45-9bc6-c5168357f7e3;z;no-all-load,no-build,no-cmake-inherit,no-delete,no-dependency,no-fs,no-import,no-update,only-platform-darwin;
# Disable with : `mulle-sourcetree mark z `
# Disable for this platform: `mulle-sourcetree mark z no-cmake-platform-${MULLE_UNAME}`
# Disable for a sdk: `mulle-sourcetree mark z no-cmake-sdk-<name>`
#
if( ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
   if( COLLECT_OS_SPECIFIC_LIBRARIES_AS_NAMES)
      list( APPEND OS_SPECIFIC_LIBRARIES "z")
   else()
      if( NOT Z_LIBRARY)
         find_library( Z_LIBRARY NAMES
            z
         )
         message( STATUS "Z_LIBRARY is ${Z_LIBRARY}")
         #
         # The order looks ascending, but due to the way this file is read
         # it ends up being descending, which is what we need.
         #
         if( Z_LIBRARY)
            #
            # Add Z_LIBRARY to OS_SPECIFIC_LIBRARIES list.
            # Disable with: `mulle-sourcetree mark z no-cmake-add`
            #
            list( APPEND OS_SPECIFIC_LIBRARIES ${Z_LIBRARY})
            # intentionally left blank
         else()
            # Disable with: `mulle-sourcetree mark z no-require-link`
            message( SEND_ERROR "Z_LIBRARY was not found")
         endif()
      endif()
   endif()
endif()
