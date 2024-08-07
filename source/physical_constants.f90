!> author: Sam Hatfield, Fred Kucharski, Franco Molteni
!  date: 04/07/2019
!  For storing and initializing physical constants.
module physical_constants
    
    use params

    implicit none

    private
    public rearth, omega, grav
    public p0, cp, akap, rgas, alhc, alhs, sbc
    public sigl, sigh, grdsig, grdscp, wvi

    ! Physical constants for dynamics
    real(kind=8), parameter :: rearth = 6.371e+6    !! Radius of Earth (m)
    real(kind=8), parameter :: omega  = 7.292e-05   !! Rotation rate of Earth (rad/s)
    real(kind=8), parameter :: grav   = 9.81        !! Gravitational acceleration (m/s/s)

    ! Physical constants for thermodynamics
    real(kind=8), parameter :: p0   = 1.e+5   !! Reference pressure (Pa)
    real(kind=8), parameter :: cp   = 1004.0  !! Specific heat at constant pressure (J/K/kg)
    real(kind=8), parameter :: akap = 2.0/7.0 !! 1 - 1/gamma where gamma is the heat capacity ratio of a
                                         !! perfect diatomic gas (7/5)
    real(kind=8), parameter :: rgas = akap*cp !! Gas constant per unit mass for dry air (J/K/kg)
    real(kind=8), parameter :: alhc = 2501.0  !! Latent heat of condensation, in J/g for consistency with
                                         !! specific humidity in g/Kg
    real(kind=8), parameter :: alhs = 2801.0  !! Latent heat of sublimation
    real(kind=8), parameter :: sbc  = 5.67e-8 !! Stefan-Boltzmann constant

    !   Functions of sigma and latitude (initial. in INPHYS)
    real(kind=8), dimension(kx)   :: sigl   !! Logarithm of full-level sigma
    real(kind=8), dimension(0:kx) :: sigh   !! Half-level sigma
    real(kind=8), dimension(kx)   :: grdsig !! g/(d_sigma p0) : to convert fluxes of u,v,q into
                                       !! d(u,v,q)/dt
    real(kind=8), dimension(kx)   :: grdscp !! g/(d_sigma p0 c_p): to convert energy fluxes into dT/dt
    real(kind=8), dimension(kx,2) :: wvi    !! Weights for vertical interpolation
end module
