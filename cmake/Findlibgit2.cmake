find_package(PkgConfig REQUIRED)
pkg_check_modules(libgit2 REQUIRED IMPORTED_TARGET libgit2)

get_filename_component(libgit2_ext ${libgit2_LINK_LIBRARIES} EXT)
string(COMPARE EQUAL "${libgit2_ext}" "${CMAKE_STATIC_LIBRARY_SUFFIX}" IS_STATIC)
set(PREFIX "")
if(IS_STATIC)
  set(PREFIX "_STATIC")
endif()

if(libgit2_FOUND AND NOT TARGET git2::git2)
  message(
    STATUS
      "libgit2 found (include: ${libgit2${PREFIX}_LIBRARY_DIRS}, lib: ${libgit2${PREFIX}_LIBRARIES})"
  )
  add_library(git2::git2 UNKNOWN IMPORTED)
  set_target_properties(
    git2::git2
    PROPERTIES IMPORTED_LOCATION "${libgit2_LINK_LIBRARIES}"
               INTERFACE_INCLUDE_DIRECTORIES "${libgit2${PREFIX}_INCLUDE_DIRS}"
               INTERFACE_LINK_LIBRARIES "${libgit2${PREFIX}_LIBRARIES}"
               INTERFACE_LINK_DIRECTORIES "${libgit2${PREFIX}_LIBRARY_DIRS}")
endif()
