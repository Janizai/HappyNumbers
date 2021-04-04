!Reads from and writes to files
module file
    use const
    implicit none

    contains

    subroutine write_to_file(input, n, m, step, filename)
        implicit none
        integer(ik), intent(in) :: n, m, input(n)
        character(maxlen), intent(in) :: filename
        integer(ik) :: i, ios, step

        open(unit = 1, file = filename, iostat = ios, position = 'append', status = 'old')
        
        if (ios /= 0) then
            write(6, '(a, a)') 'Error in opening file ', trim(filename)
            stop
        end if

        do i = 1, n
            write(1, '(i0, 4x, i0, 4x, f10.7)') i * step + m, input(i)
        end do

        close(unit = 1, status = 'keep')
    end subroutine write_to_file

    subroutine read_from_file(filename, i, m, flag)
        implicit none
        character(maxlen), intent(in) :: filename
        integer(ik), intent(in) :: flag
        integer(ik), intent(out) :: i, m
        character(maxlen) :: file_status
        integer(ik) :: ios
        logical :: file_exists

        inquire(file = filename, exist = file_exists)

        if (file_exists .and. flag /= 1) then
            file_status = 'old'
        else if (file_exists .and. flag == 1) then
            file_status = 'replace'
        else
            file_status = 'new'
        end if

        open(unit = 1, file = filename, iostat = ios, access = 'sequential', &
        status = file_status, position = 'append')

        if (ios /= 0) then
            write(6, '(a, a)') 'Error in opening file ', trim(filename)
            stop
        end if

        backspace(unit = 1)

        read(1, *, iostat = ios) m, i        
        
        if (ios < 0) then
            m = 0
            i = 0
        end if
        
        close(unit = 1, status = 'keep')
    end subroutine read_from_file
end module file