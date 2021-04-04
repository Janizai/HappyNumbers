# HappyNumbers
A Fortran program that calculates [happy numbers](https://en.wikipedia.org/wiki/Happy_number). 

## Compilation instructions
### Windows (src)
`gfortran .\const.f90 .\test.f90 .\file.f90 .\input.f90 .\main.f90 -o ..\run\happy`

### Windows (run)
`gfortran ..\src\const.f90 ..\src\test.f90 ..\src\file.f90 ..\src\input.f90 ..\src\main.f90 -o .\happy`

### Linux (src)
`gfortran {const,test,file,input,main}.f90 -o ../run/happy`

### Linux (run)
`gfortran ../src/{const,test,file,input,main}.f90 -o happy`

## Usage instructions

Run command: `happy N, step, flag`

`N` is the amount of numbers to be generated and written to the output file, for example `100` or `1e6`.

`step` is the step between successive writes to file.

`flag` is an optional parameter, if `flag == 1` the current output file will be replaced. By default the program continues from the last number written to file.

The output file is formatted such that the the first column is ordinal numbers, and the second is happy numbers.
