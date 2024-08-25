C ======================================================================
C Matéria: Introduction to Computational Physics
C Criador: João Calisto
C Curso: Computational Physics
C Data: [25/08/2024]
C Descrição: Este programa lê do terminal três vetores v1, v2 e v3, onde cada vetor
C é representado por suas coordenadas (xi, yi, zi). O programa calcula
C a área lateral e o volume de um paralelepípedo que tem uma base triangular
C formada pelos vetores v1, v2 e v1 − v2, e arestas laterais dadas pelo vetor v3.
C O programa também verifica se o vetor ~v3 está no mesmo plano formado pelos
C vetores v1 e v2 e se v1 não é paralelo a v2, exibindo uma mensagem de erro
C caso qualquer uma dessas condições seja violada. Os resultados são mostrados
C na tela do terminal.
C ======================================================================

        PROGRAM CalculateParaDim
        real v(3,3)
        real v21(3)
        character(10) nstr
        integer n
        real vpv(3)
        real base_area, side1_area, side2_area, side3_area
        real total_volume, total_area
        real v3m
        integer is_parallel, is_on_plane
        

        do n = 1, 3
            write(nstr, '(i1)') n
            print *, "v", TRIM(nstr), " -> vx vy vz:"
            read *, v(n, 1), v(n, 2), v(n, 3)
        end do
        
        do n = 1, 3
            write(nstr, '(i1)') n
            print *, "v", TRIM(nstr) , ":"

            print *, "(", v(n, 1), ",", v(n, 2), ",", v(n, 3), ")"
        end do

        v21(1) = v(2,1) - v(1,1)
        v21(2) = v(2,2) - v(1,2)
        v21(3) = v(2,3) - v(1,3)

        v3m = SQRT(v(3,1)**2+v(3,2)**2+v(3,3)**2)

C       Verificando se v1 é paralelo com v2
        is_parallel = v(1,1)*v(2, 1) + v(1,2)*v(2,2) + v(1,3)*v(2, 3)
        if ( is_parallel .NE. 0 ) THEN 
            print *, "Vetor v2 é paralelo com v1"
            STOP
        END IF


C       Calculando a área da superfície da base (PRODUTO VETORIAL V1 X V2)
        vpv(1) = v(1,2)*v(2,3) - v(1,3)*v(2,2)
        vpv(2) = v(1,3)*v(2,1) - v(1,1)*v(2,3)
        vpv(3) = v(1,1)*v(2,2) - v(1,2)*v(2,1)
        base_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)/2

C       Verificando se v3 está no plano v1 X v2
        is_on_plane = vpv(1) * v(3, 1) + vpv(2)*v(3, 2) + vpv(3)*v(3, 3)
        if ( is_on_plane .EQ. 0 ) THEN 
            print *, "Vetor v3 está no plano v1 x v2"
            STOP
        END IF

C       As superfícies laterais: 

C       Calculando a área da superfície do primeiro lado (PRODUTO VETORIAL V1 X V3)
        vpv(1) = v(1,2)*v(3,3) - v(1,3)*v(3,2)
        vpv(2) = v(1,3)*v(3,1) - v(1,1)*v(3,3)
        vpv(3) = v(1,1)*v(3,2) - v(1,2)*v(3,1)
        side1_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)

C       Calculando a área da superfície do segundo lado (PRODUTO VETORIAL V2 X V3)
        vpv(1) = v(2,2)*v(3,3) - v(2,3)*v(3,2)
        vpv(2) = v(2,3)*v(3,1) - v(2,1)*v(3,3)
        vpv(3) = v(2,1)*v(3,2) - v(2,2)*v(3,1)
        side2_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)

C       Calculando a área da superfície do terceiro lado (PRODUTO VETORIAL (V2-V1) X V3)
        vpv(1) = v21(2)*v(3,3) - v21(3)*v(3,2)
        vpv(2) = v21(3)*v(3,1) - v21(1)*v(3,3)
        vpv(3) = v21(1)*v(3,2) - v21(2)*v(3,1)
        side3_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)


C       Como temos a área da base e do topo iguais, podemos usar 2*base_area para calcular a base e o topo
        total_area = 2*base_area + side1_area + side2_area + side3_area


C       Calculando o volume do paralelepípedo (PRODUTO TRIPLO ESCALAR V3 * V1 X V2)
        vpv(1) = v(1,2)*v(2,3) - v(1,3)*v(2,2)
        vpv(2) = v(1,3)*v(2,1) - v(1,1)*v(2,3)
        vpv(3) = v(1,1)*v(2,2) - v(1,2)*v(2,1)
        total_volume = v(3,1)*vpv(1) + v(3,2)*vpv(2) + v(3,3)*vpv(3)

        print *, "Area Total: ", total_area
        print *, "Volume Total: ", total_volume

        END