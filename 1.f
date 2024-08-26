C ======================================================================
C Matéria: Introduction to Computational Physics
C Criador: João Calisto
C Curso: Computational Physics
C Data: [25/08/2024]
C Descrição: Este programa lê do terminal os raios interno (r1) e externo (r2)
C              de um toro e calcula a área total e o volume do toro. 
C              Os resultados são exibidos na tela do terminal.
C ======================================================================

      PROGRAM CalculateTorusDim
      real ri,re,a,v
      print *, "Insira o raio interno do torus"
      read *, ri
      print *, "Insira o raio externo do torus"
      read *, re
      real pi 3.141592653589793

      a = 4*pi**2*ri*re
      v= 2*pi**2*ri**2*re
      
      print *, "Area:", a
      print *, "Volume:", v
      
      END
