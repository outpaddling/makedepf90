real function func1(a)
  implicit none
  real,intent(in) :: a
  write(*,*) "This is func1"
  func1 = a**2
  return
end function
