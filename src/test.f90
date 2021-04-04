!Tests whether an integer is happy or sad
module test
    use const, only : rk, ik
    implicit none
    integer, parameter, private :: unhappy(8) = [4, 16, 37, 58, 89, 145, 42, 20]

    contains

    pure logical function O(x_in)
        implicit none
        integer(ik), intent(in) :: x_in
        integer(ik) :: x, i, sum

        x = x_in
        do    
            sum = 0
            do i = 1, floor(log10(real(x, rk)) + 1)
                sum = sum + (x - (x / 10) * 10) ** 2
                x = x / 10
            end do
            x = sum

            if (x == 1) then
                O = .true.
                return
            else if (any(x == unhappy)) then
                O = .false.
                return
            end if
        end do
    end function O
end module test