module ThreeN2_Direct_PES_Examples
  use molecule_factory, only : read_molecule_type
  use gp_factory, only : make_3N2_main_mq_GP_4000_test
  use GP_factory_3N2, only : make_3N2_main_mq_GP_4000_Aug26
  use class_ThreeBodyPES, only : three_body_pes_config, ThreeBodyPES
  use class_dig_asymptote, only : dig_asymptote_config, dig_asymptote
  use class_Single_Power_Law, only : Single_Power_Law
  use Functions_Of_Positions, only : zero_function
  implicit none (type, external)
  private


  !!====Public interface================================================
  public make_3N2_PES_ZeroAsymptote, make_3N2_PES_1, make_3N2_PES_2
  !!====================================================================


contains

  function make_3N2_PES_ZeroAsymptote() result(my_PES)
    type (ThreeBodyPES) :: my_PES
    type (three_body_pes_config) :: PES_config
    type(dig_asymptote_config) :: asymptote_config
    type(dig_asymptote) :: my_asymptote
    type(Single_Power_Law):: my_interpolator

    PES_config%molecule_type = [ character(len=10) ::"N2", "N2", "N2" ]
    PES_config%main_GP = make_3N2_main_mq_GP_4000_Aug26()
    PES_config%r_min = 1.5d0
    PES_config%r12_max =   5.5d0
    PES_config%r13_max =  5.51d0
    PES_config%r23_max =  5.52d0
    PES_config%short_range_function => zero_function

    asymptote_config%molecules(1) = read_molecule_type( PES_config%molecule_type(1))
    asymptote_config%molecules(2) = read_molecule_type( PES_config%molecule_type(2))
    asymptote_config%molecules(3) = read_molecule_type( PES_config%molecule_type(3))
    asymptote_config%r12_max = PES_config%r12_max
    asymptote_config%r13_max = PES_config%r13_max
    asymptote_config%r23_max = PES_config%r23_max
    asymptote_config%dig_distance = 1.d0
    asymptote_config%main_GP = PES_config%main_GP

    call my_interpolator%init(alpha_max=8.d0)
    asymptote_config%interpolator = my_interpolator

    call my_asymptote%init( asymptote_config )
    PES_config%asymptote = my_asymptote

    call my_PES%init( PES_config)
  end function make_3N2_PES_ZeroAsymptote

  function make_3N2_PES_1() result(my_PES)
    type (ThreeBodyPES) :: my_PES
    type (three_body_pes_config) :: PES_config
    type(dig_asymptote_config) :: asymptote_config
    type(dig_asymptote) :: my_asymptote
    type(Single_Power_Law):: my_interpolator

    PES_config%molecule_type = [ character(len=10) ::"N2", "N2", "N2" ]
    PES_config%main_GP = make_3N2_main_mq_GP_4000_Aug26()
    PES_config%r_min = 1.5d0
    PES_config%r12_max =   5.5d0
    PES_config%r13_max =  5.51d0
    PES_config%r23_max =  5.52d0
    PES_config%short_range_function => zero_function

    asymptote_config%molecules(1) = read_molecule_type( PES_config%molecule_type(1))
    asymptote_config%molecules(2) = read_molecule_type( PES_config%molecule_type(2))
    asymptote_config%molecules(3) = read_molecule_type( PES_config%molecule_type(3))
    asymptote_config%r12_max = PES_config%r12_max
    asymptote_config%r13_max = PES_config%r13_max
    asymptote_config%r23_max = PES_config%r23_max
    asymptote_config%dig_distance = 1.d0
    asymptote_config%main_GP = PES_config%main_GP

    call my_interpolator%init(alpha_max=8.d0)
    asymptote_config%interpolator = my_interpolator

    call my_asymptote%init( asymptote_config )
    PES_config%asymptote = my_asymptote

    call my_PES%init( PES_config)
  end function make_3N2_PES_1

    function make_3N2_PES_2() result(my_PES)
    type (ThreeBodyPES) :: my_PES
    type (three_body_pes_config) :: PES_config
    type(dig_asymptote_config) :: asymptote_config
    type(dig_asymptote) :: my_asymptote
    type(Single_Power_Law):: my_interpolator

    PES_config%molecule_type = [ character(len=10) ::"N2", "N2", "N2" ]
    PES_config%main_GP = make_3N2_main_mq_GP_4000_Aug26()
    PES_config%r_min = 1.5d0
    PES_config%r12_max =   7.5d0
    PES_config%r13_max =  7.75d0
    PES_config%r23_max =  8.0d0
    PES_config%short_range_function => zero_function

    asymptote_config%molecules(1) = read_molecule_type( PES_config%molecule_type(1))
    asymptote_config%molecules(2) = read_molecule_type( PES_config%molecule_type(2))
    asymptote_config%molecules(3) = read_molecule_type( PES_config%molecule_type(3))
    asymptote_config%r12_max = PES_config%r12_max
    asymptote_config%r13_max = PES_config%r13_max
    asymptote_config%r23_max = PES_config%r23_max
    asymptote_config%dig_distance = 1.d0
    asymptote_config%main_GP = PES_config%main_GP

    call my_interpolator%init(alpha_max=8.d0)
    asymptote_config%interpolator = my_interpolator

    call my_asymptote%init( asymptote_config )
    PES_config%asymptote = my_asymptote

    call my_PES%init( PES_config)
  end function make_3N2_PES_2

end module ThreeN2_Direct_PES_Examples
