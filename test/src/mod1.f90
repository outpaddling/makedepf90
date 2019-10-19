module mod1
  implicit none

  contains

  subroutine sub2_in_mod1
    implicit none
    write(*,*) "This is sub2 in mod1"
  end subroutine

  function func2_in_mod1()
    implicit none
    character(len=20) :: func2_in_mod1
    func2_in_mod1 = "This is func2 in mod1"
    return
  end function

end module mod1
