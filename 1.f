C ======================================================================
C Program: Introduction to Computational Physics
C Author: João Calisto
C Course: Computational Physics
C Description: This program demonstrates the basic concepts of
C              Computational Physics using Fortran 77.
C Date: [25/08/2024]
C ======================================================================

      PROGRAM CalculateTorusDim
      real ri,re,a,v
      print *, "Insira o raio interno do torus"
      read *, ri
      print *, "Insira o raio externo do torus"
      read *, re

      a = 4*3.14**2*ri*re
      v= 2*3.14**2*ri**2*re
      
      print *, "Area:", a
      print *, "Volume:", v
      
      END
