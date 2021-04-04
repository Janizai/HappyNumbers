program main
    use const
    use test
    use file
    use input
    implicit none
    
    real(rk) :: time_start, time_stop, time_total, data(maxarg)
    integer(ik), allocatable :: result(:)
    integer(ik) :: i, n, m, num, step, flag, start
    character(maxlen) :: filename, format

    filename = 'numbers.dat'

    call in(data)
    
    n = int(data(1), ik)
    step = int(data(2), ik)
    flag = int(data(3), ik)

    allocate(result(n))
    result = 0

    call read_from_file(filename, i, m, flag)

    start = i

    num = 0

    call cpu_time(time_start)

    do while (num < n * step)
        i = i + 1
        if (O(i)) then
            num = num + 1
            if (start /= 1 .and. i /= start) then
                if (mod(num, step) == 0) then
                    result(num / step) = i
                end if
            else if (start == 1) then
                result(num / step) = i
            end if
        end if
    end do

    call cpu_time(time_stop)

    format = '(a, f7.2, a, /)'

    write(6, '()')
    write(6, format) 'CPU time spent during loop: ', time_stop - time_start, ' s'

    time_total = time_stop - time_start

    call cpu_time(time_start)
    
    call write_to_file(result, n, m, step, filename)
    
    call cpu_time(time_stop)

    write(6, format) 'CPU time spent during writing: ', time_stop - time_start, ' s'

    time_total = time_total + time_stop - time_start

    write(6, format) 'CPU time spent in total: ', time_total, ' s'
end program main