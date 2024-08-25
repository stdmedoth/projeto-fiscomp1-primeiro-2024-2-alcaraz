C ======================================================================
C Program: Introduction to Computational Physics
C Author: João Calisto
C Course: Computational Physics
C Description: This program demonstrates the basic concepts of
C              Computational Physics using Fortran 77.
C Date: [25/08/2024]
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

C       Checking if v1 is parallel to v2
        is_parallel = v(1,1)*v(2, 1) + v(1,2)*v(2,2) + v(1,3)*v(2, 3)
        if ( is_parallel .NE. 0 ) THEN 
            print *, "Vector v2 is parallel to v1"
            STOP
        END IF


C       Calculating the area of base surface (CROSS PRODUCT V1 X V2)
        vpv(1) = v(1,2)*v(2,3) - v(1,3)*v(2,2)
        vpv(2) = v(1,3)*v(2,1) - v(1,1)*v(2,3)
        vpv(3) = v(1,1)*v(2,2) - v(1,2)*v(2,1)
        base_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)/2

C       Checking if v3 is on plane v1 X v2
        is_on_plane = vpv(1) * v(3, 1) + vpv(2)*v(3, 2) + vpv(3)*v(3, 3)
        if ( is_on_plane .EQ. 0 ) THEN 
            print *, "Vector v3 is on plane v1 x v2"
            STOP
        END IF

C       The sides surface: 

C       Calculating the area of first side surface (CROSS PRODUCT V1 X V3)
        vpv(1) = v(1,2)*v(3,3) - v(1,3)*v(3,2)
        vpv(2) = v(1,3)*v(3,1) - v(1,1)*v(3,3)
        vpv(3) = v(1,1)*v(3,2) - v(1,2)*v(3,1)
        side1_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)

C       Calculating the area of second side surface (CROSS PRODUCT V2 X V3)
        vpv(1) = v(2,2)*v(3,3) - v(2,3)*v(3,2)
        vpv(2) = v(2,3)*v(3,1) - v(2,1)*v(3,3)
        vpv(3) = v(2,1)*v(3,2) - v(2,2)*v(3,1)
        side2_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)

C       Calculating the area of third side surface (CROSS PRODUCT (V2-V1) X V3)
        vpv(1) = v21(2)*v(3,3) - v21(3)*v(3,2)
        vpv(2) = v21(3)*v(3,1) - v21(1)*v(3,3)
        vpv(3) = v21(1)*v(3,2) - v21(2)*v(3,1)
        side3_area = SQRT(vpv(1)**2+vpv(2)**2+vpv(3)**2)


C       As we have the area of base and top as the same, so we can use 2*base_area to calculate base and top  
        total_area = 2*base_area + side1_area + side2_area + side3_area


C       Calculating the volume of the paralelepiped (SCALAR TRIPLE PRODUCT V3 * V1 X V2)
        vpv(1) = v(1,2)*v(2,3) - v(1,3)*v(2,2)
        vpv(2) = v(1,3)*v(2,1) - v(1,1)*v(2,3)
        vpv(3) = v(1,1)*v(2,2) - v(1,2)*v(2,1)
        total_volume = v(3,1)*vpv(1) + v(3,2)*vpv(2) + v(3,3)*vpv(3)

        print *, "Total area: ", total_area
        print *, "Total volume: ", total_volume

        END