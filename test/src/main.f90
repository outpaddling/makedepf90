program main
  use data_define, only: iter
  use mod1
  implicit none
  real,external :: func1

  iter = 1
  write(*,*) "Hello World!"

  write(*,*) func1(1.1e0)
  call sub1
  write(*,*) func2_in_mod1()
  call sub2_in_mod1
end
