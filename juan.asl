  
// Agent juan in project prueba.mas2j

+!eliminar <- .abolish(question(H)); !eliminar.
+!eliminar.

+question(H)[source(A)]
  <-  
  .print("He recibido la pregunta: ",H," de ", A);
  chat(H);
  !eliminar.

