# This file is part of mctc-lib.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if(NOT TARGET "jsonfortran::jsonfortran")
  # json-fortran tries to make it hard to get found
  string(TOLOWER "jsonfortran-${CMAKE_Fortran_COMPILER_ID}" jsonfortran)
  find_package("${jsonfortran}" CONFIG)
  add_library("jsonfortran::jsonfortran" IMPORTED INTERFACE)
  target_link_libraries(
    "jsonfortran::jsonfortran"
    INTERFACE
    "jsonfortran$<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:-static>"
  )
  target_include_directories(
    "jsonfortran::jsonfortran"
    INTERFACE
    "${jsonfortran_INCLUDE_DIRS}"
  )
endif()
