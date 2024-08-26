C ======================================================================
C Matéria: Introduction to Computational Physics
C Criador: João Calisto
C Curso: Computational Physics
C Data: [25/08/2024]
C Descrição: Este programa lê os N números reais (do tipo REAL*8) do arquivo
C "tarefa-3-entrada-1.in". O programa descobre e imprime o valor de N
C na tela do terminal. Em seguida, o programa solicita ao usuário o valor de
C M (onde M ≤ N) e ordena apenas os M menores números lidos do arquivo.
C O resultado da ordenação, juntamente com o número M, é salvo em um arquivo
C de saída.
C ======================================================================
        program OrderedFile
        integer i, i2, n,m, ios, swapped
        real line
        REAL*8, ALLOCATABLE :: numeros(:), menores(:), sorted_array(:)
        REAL*8 tmp
        
        open(unit=1, file='tarefa-3-entrada-1.in')

        i = 1
        do
            read (1, *, iostat=ios) line 
            if (ios /= 0) exit
            i = i + 1
        end do

        ALLOCATE(numeros(i))
        ALLOCATE(sorted_array(i))
        REWIND(1)

        n = i        
        do i2 = 1, i-1
            read (1, *) numeros(i2)
            ! print *, numeros(i2)
        end do

        close (1)
        print *, "N é ", n
        
        print *, "Insira M (N>=M):"
        read *, m
        if (m > n) then
            print *, "M deve ser menor ou igual a N"
            stop
        end if

        ALLOCATE(menores(m))

        swapped = 1;
        do while (swapped >= 1)
            swapped = 0;
            do i = 1, n - 1

                if (numeros(i) > numeros(i+1)) then
                    tmp = numeros(i)
                    numeros(i) = numeros(i+1)
                    numeros(i+1) = tmp
                    swapped = swapped + 1
                    ! print *, "changening", numeros(i), numeros(i+1)
                end if
            end do
        end do

        open(unit=2, file='tarefa-3-entrada-1.out', action='write')

        do i = 1, m
            write (2, *) numeros(i)
        end do
        close(2)
        
        end 
    

