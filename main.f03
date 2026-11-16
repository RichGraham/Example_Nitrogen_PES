program PES_GP_Symm
  ! ==== Binary potential ====
  use PES_2N2_Feb23, only : PES_2N2, load_gp_2n2_data

  ! ==== Non-additive (trimer) potential====
  use class_ThreeBodyPES, only : ThreeBodyPES
  use ThreeN2_Direct_PES_Examples, only : make_3N2_PES_1, make_3N2_PES_2, make_3N2_PES_ZeroAsymptote


  implicit none(type, external)
  double precision expected_value, actual_value
  double precision :: N2_bond_length = 1.0975d0 ! in Angstrom

  ! Binary potential
  double precision rab_binary(4)

  ! Non-additive (trimer) potential
  type (ThreeBodyPES) :: my_PES_0, my_PES_1, my_PES_2
  double precision  atomic_positions(3,6)



  print *, "======== N2 Binary potential ========"
  call load_GP_2N2_Data

  print *, "Repulsive region"
  rab_binary = (/2.2458315437140284d0, 1.7890393128964790d0, 3.3391399333681528d0, 2.8310308852119626d0/)
  expected_value = 0.18134256430647674d0
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "GP region"
  rab_binary = (/4.8650859012666077d0, 4.1332293353273748d0, 5.9314248922636654d0, 5.1453440638881496d0/)
  expected_value = -2.2169238036605739d-004
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "Asymptotic region"
  rab_binary = (/10.008945272196605d0,8.9195147171591227d0, 11.083449661613455d0, 9.9914677450564575d0/)
  expected_value = 1.2322655531364154d-006
  actual_value = PES_2N2( rab_binary)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''
  print *,''
  print *,''


  print *, "======== 3N2 Trimer potential ========"
  my_PES_0 = make_3N2_PES_ZeroAsymptote()
  my_PES_1 = make_3N2_PES_1()
  my_PES_2 = make_3N2_PES_2()

  print *, "___GP region (all three PES identical)___"
  atomic_positions(:,1) = (/0.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,2) = (/0.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,3) = (/3.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,4) = (/3.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,5) = (/0.d0, 4.d0, -N2_bond_length/)
  atomic_positions(:,6) = (/0.d0, 4.d0, N2_bond_length/)

  print *,'PES_1'
  expected_value = 8.7091994795169695d-006
  actual_value = my_PES_1%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_2'
  actual_value = my_PES_2%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_ZeroAsymptote'
  actual_value = my_PES_0%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "___Repulsive region (all three PES are zero)___"
  atomic_positions(:,1) = (/0.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,2) = (/0.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,3) = (/1.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,4) = (/1.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,5) = (/0.d0, 4.d0, -N2_bond_length/)
  atomic_positions(:,6) = (/0.d0, 4.d0, N2_bond_length/)

  print *,'PES_1'
  expected_value = 0.d0
  actual_value = my_PES_1%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_2'
  actual_value = my_PES_2%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_ZeroAsymptote'
  actual_value = my_PES_0%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *, "___Asymptotic region ___"
  atomic_positions(:,1) = (/0.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,2) = (/0.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,3) = (/3.d0, 0.d0, -N2_bond_length/)
  atomic_positions(:,4) = (/3.d0, 0.d0, N2_bond_length/)
  atomic_positions(:,5) = (/0.d0, 10.d0, -N2_bond_length/)
  atomic_positions(:,6) = (/0.d0, 10.d0, N2_bond_length/)

  print *,'PES_1'
  expected_value = 1.8723345807907085d-008
  actual_value = my_PES_1%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_2'
  expected_value = 1.3349856836810425d-008
  actual_value = my_PES_2%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

  print *,'PES_ZeroAsymptote'
  expected_value = 0.d0
  actual_value = my_PES_0%evaluate( atomic_positions)
  print *,'PES value: expected = ',expected_value,', actual = ',actual_value
  print *,'difference = ', abs(expected_value - actual_value)
  print *,''

end program PES_GP_Symm

