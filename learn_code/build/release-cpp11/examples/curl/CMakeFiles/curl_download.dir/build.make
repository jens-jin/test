# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/user/code/git/learn_code/muduo-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user/code/git/learn_code/build/release-cpp11

# Include any dependencies generated for this target.
include examples/curl/CMakeFiles/curl_download.dir/depend.make

# Include the progress variables for this target.
include examples/curl/CMakeFiles/curl_download.dir/progress.make

# Include the compile flags for this target's objects.
include examples/curl/CMakeFiles/curl_download.dir/flags.make

examples/curl/CMakeFiles/curl_download.dir/download.cc.o: examples/curl/CMakeFiles/curl_download.dir/flags.make
examples/curl/CMakeFiles/curl_download.dir/download.cc.o: /home/user/code/git/learn_code/muduo-master/examples/curl/download.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/code/git/learn_code/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/curl/CMakeFiles/curl_download.dir/download.cc.o"
	cd /home/user/code/git/learn_code/build/release-cpp11/examples/curl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/curl_download.dir/download.cc.o -c /home/user/code/git/learn_code/muduo-master/examples/curl/download.cc

examples/curl/CMakeFiles/curl_download.dir/download.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/curl_download.dir/download.cc.i"
	cd /home/user/code/git/learn_code/build/release-cpp11/examples/curl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/code/git/learn_code/muduo-master/examples/curl/download.cc > CMakeFiles/curl_download.dir/download.cc.i

examples/curl/CMakeFiles/curl_download.dir/download.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/curl_download.dir/download.cc.s"
	cd /home/user/code/git/learn_code/build/release-cpp11/examples/curl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/code/git/learn_code/muduo-master/examples/curl/download.cc -o CMakeFiles/curl_download.dir/download.cc.s

# Object files for target curl_download
curl_download_OBJECTS = \
"CMakeFiles/curl_download.dir/download.cc.o"

# External object files for target curl_download
curl_download_EXTERNAL_OBJECTS =

bin/curl_download: examples/curl/CMakeFiles/curl_download.dir/download.cc.o
bin/curl_download: examples/curl/CMakeFiles/curl_download.dir/build.make
bin/curl_download: lib/libmuduo_curl.a
bin/curl_download: lib/libmuduo_net.a
bin/curl_download: lib/libmuduo_base.a
bin/curl_download: examples/curl/CMakeFiles/curl_download.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/code/git/learn_code/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/curl_download"
	cd /home/user/code/git/learn_code/build/release-cpp11/examples/curl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/curl_download.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/curl/CMakeFiles/curl_download.dir/build: bin/curl_download

.PHONY : examples/curl/CMakeFiles/curl_download.dir/build

examples/curl/CMakeFiles/curl_download.dir/clean:
	cd /home/user/code/git/learn_code/build/release-cpp11/examples/curl && $(CMAKE_COMMAND) -P CMakeFiles/curl_download.dir/cmake_clean.cmake
.PHONY : examples/curl/CMakeFiles/curl_download.dir/clean

examples/curl/CMakeFiles/curl_download.dir/depend:
	cd /home/user/code/git/learn_code/build/release-cpp11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/code/git/learn_code/muduo-master /home/user/code/git/learn_code/muduo-master/examples/curl /home/user/code/git/learn_code/build/release-cpp11 /home/user/code/git/learn_code/build/release-cpp11/examples/curl /home/user/code/git/learn_code/build/release-cpp11/examples/curl/CMakeFiles/curl_download.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/curl/CMakeFiles/curl_download.dir/depend

