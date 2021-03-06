program test_string

use, intrinsic:: iso_c_binding, only: c_null_char
use string_utils

implicit none (type, external)

call test_lowercase()
print *,'PASSED: HDF5 character'
call test_strip_null()
print *,'PASSED: null strip'

contains

subroutine test_lowercase()

character(*), parameter :: hello = 'HeLl0 Th3rE !>? '
  !! Fortran 2003 allocatable string

if (.not.(toLower(hello)=='hell0 th3re !>? ')) error stop 'error: lowercase conversion'

if (.not.(trim(toLower(hello))=='hell0 th3re !>?')) error stop 'Allocatable lowercase conversion error'

end subroutine test_lowercase


subroutine test_strip_null()
character(*), parameter :: hello = 'HeLl0 Th3rE !>? '

if (.not.strip_trailing_null(hello // c_null_char) == hello) error stop 'problem stripping trailing null'

end subroutine test_strip_null

end program
