!Takes inputs
module input
    use const
    implicit none
    integer, parameter :: minarg = 2, maxarg = 3
    
    contains

    subroutine in(data)
        implicit none
        real(rk), intent(out) :: data(maxarg)
        character(maxlen) :: arg
        integer :: i, iarg
        
        iarg = command_argument_count()

        if (iarg < minarg) then
            call get_command_argument(0, arg)
            write(0, '(a,a,a)') 'usage: ', trim(arg), 'N, step, [flag]'
            stop
        end if

        data = 0
        do i = 1, iarg
            call get_command_argument(i, arg)
            read(arg, *) data(i)
        end do

    end subroutine in

end module input