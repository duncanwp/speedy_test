program test_humidity
    use humidity  ! Import the module containing the subroutines

    implicit none

    ! Parameters
    integer, parameter :: ix = 96, il = 48  ! Example dimensions

    ! Declare variables
    real(kind=8) :: ta(ix, il)     ! Absolute temperature
    real(kind=8) :: ps(ix, il)     !! Normalized pressure
    real(kind=8) :: sig            ! Sigma level
    real(kind=8) :: qa(ix, il)     ! Specific humidity (input/output)
    real(kind=8) :: rh(ix, il)     ! Relative humidity (input/output)
    real(kind=8) :: qsat(ix, il)   ! Saturation specific humidity (output)
    integer :: choice              ! User's choice

    ! Initialize input variables with example values
    ta = 300.0   ! Example temperature in Kelvin
    ps = 1.0     ! Example normalized pressure
    sig = 0.5    ! Example sigma level
    qa = 0.007   ! Example specific humidity
    rh = 0.6     ! Example relative humidity
    choice = 2

    if (choice == 1) then
        ! Call the subroutine to convert specific humidity to relative humidity
        call spec_hum_to_rel_hum(ta, ps, sig, qa, rh, qsat)
        print *, "Relative Humidity:", rh(1, 1)
        print *, "Specific Humidity:", qa(1, 1)
        print *, "Saturation Specific Humidity:", qsat(1, 1)
    else if (choice == 2) then
        ! Call the subroutine to convert relative humidity to specific humidity
        call rel_hum_to_spec_hum(ta, ps, sig, rh, qa, qsat)
        print *, "Relative Humidity:", rh(1,1)
        print *, "Specific Humidity:", qa(1, 1)
        print *, "Saturation Specific Humidity:", qsat(1, 1)
    else
        print *, "Invalid choice! Please select 1 or 2."
    end if

end program test_humidity