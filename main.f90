program PES_GP_Symm
  use PES_2N2_Feb23, only : PES_2N2, load_gp_2n2_data
  use helpers, only: fixedAngleSlice, computeDistances
  implicit none
  double precision rab_binary(4)
  double precision expected_value, actual_value


  print *, "======== N2 Binary potential ========"
  call load_GP_2N2_Data

  print *, "Repulsive region"
  rab_binary = (/2.2458315437140284d0, 1.7890393128964790d0, 3.3391399333681528d0, 2.8310308852119626d0/)
  expected_value = 0.18134256430647674d0
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',PES_2N2( rab_binary)
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "GP region"
  rab_binary = (/4.8650859012666077d0, 4.1332293353273748d0, 5.9314248922636654d0, 5.1453440638881496d0/)
  expected_value = -2.2169238036605739d-004
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',PES_2N2( rab_binary)
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "Asymptotic region"
  rab_binary = (/10.008945272196605d0,8.9195147171591227d0, 11.083449661613455d0, 9.9914677450564575d0/)
  expected_value = 1.2322655531364154d-006
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',PES_2N2( rab_binary)
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''



end program PES_GP_Symm

