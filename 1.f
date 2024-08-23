      PROGRAM GetNumber
      real ri,re,a,v
      print *, "Insira o raio interno do torus"
      read *, ri
      print *, "Insira o raio externo do torus"
      read *, re

      a = 4*3.14*3.14*ri*re
      v= 2*3.14*3.14*ri*ri*re
      
      print *, "Area:", a
      print *, "Volume:", v
      
      END
