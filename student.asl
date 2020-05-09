// Agent student in project prueba.mas2j
 
/* FIltros */
service(Answer, mailing):-
	checkTag("<mail>",Answer).
service(Answer, addingfile):-
	checkTag("<addtxt>", Answer).
service(Answer, creatingFile):-
	checkTag("<file>", Answer) &
	not service(Answer, addingfile).


checkTag(Service, String) :-
	.substring(Service,String).

/* Initial beliefs and rules */
tq(1, " Hablame un poco sobre la Universidad de Vigo ").
ntq(1, " Que me dices de la Universidad de Vigo ").
ntq(2, " Puedes hablarme de la Universidad de Vigo ").
ntq(3, " Que sabes sobre la Universidad de Vigo ").

tq(2, " Donde se encuentra la ESEI ").
ntq(4, " Sabes la direccion de la ESEI ").
ntq(5, " En que zona del Campus de Ourense se encuentra la ESEI ").
ntq(6, " Me indicas donde esta la ESEI ").

tq(3, " Que puedo estudiar en la ESEI ").
ntq(7, " Que titulaciones oferta la ESEI actualmente ").
ntq(8, " Cuantos titulos ofrece la ESEI ").
ntq(9, " Cuales son las carreras vinculadas a la ESEI ").

tq(4, " Por que merece la pena estudiar en la ESEI ").
ntq(10, " Que hace atractivo estudiar en la ESEI ").
ntq(11, " Es mejor estudiar en la ESEI que en otros centros ").
ntq(12, " Que ofrece la ESEI para querer estudiar en ella ").

tq(5, " Hay una cafeteria en la ESEI ").
ntq(13, " Donde puedo comer caliente en la ESEI ").
ntq(14, " Existe un local en la ESEI donde pueda tomar un refresco ").
ntq(15, " Puedo desayunar dentro de la ESEI en algun espacio ").

tq(6, " Donde se encuentra la Secretaria de la ESEI ").
ntq(16, " Como llego a la Secretaria de la ESEI ").
ntq(17, " Me indicas la localizacion de la secretaria de la ESEI ").
ntq(18, " Donde puedo realizar mis tramites administrativos en la ESEI ").

tq(7, " Que horario de atencion al publico tiene la secretaria del centro ").
ntq(19, " Puedo completar mi matricula por la tarde ").
ntq(20, " A que horas puedo ir a la secretaria a preguntar por mi matricula ").
ntq(21, " Si quiero modificar mi matricula, cuando puedo realizarlo ").

tq(8, " En que consiste el PAT ").
ntq(22, " Me dices que es el PAT ").
ntq(23, " En la web de la ESEI habla de algo llamado PAT, que es ").
ntq(24, " De que va eso del PAT ").

tq(9, " Cual es el protocolo de acogida de alumnos con necesidades educativas especiales ").
ntq(25, " Puedo matricularme en la ESEI aunque tenga necesidades educativas especiales ").
ntq(26, " Existe algun tramite que deba hacer por tener necesidades educativas especiales ").
ntq(27, " Que deben hacer los alumnos con necesidades educativas especiales ").

tq(10, " Existe una delegacion de alumnos en la ESEI ").
ntq(28, " Cuenta la ESEI con delegaciones de alumnos ").
ntq(29, " Tiene delegaciones de alumnos la ESEI ").
ntq(30, " Hay alguna delegacion de alumnos en la ESEI ").

tq(11, " Que es el suplemento europeo al titulo ").
ntq(31, " Que me dices sobre el suplemento europeo al titulo ").
ntq(32, " Puedes hablarme del suplemento europeo al titulo ").
ntq(33, " Que sabes acerca del suplemento europeo al titulo ").

tq(12, " Que tipo de practicas puedo realizar como alumno de la ESEI ").
ntq(34, " Que practicas se pueden llevar a cabo como alumno de la ESEI ").
ntq(35, " Puedo realizar practicas en empresas como alumno de la ESEI ").
ntq(36, " Indicame las practicas que puedo realizar en la ESEI ").

tq(13, " Donde puedo consultar la oferta de practicas en empresas ").
ntq(37, " Que hago para consultar la oferta de practicas en empresas ").
ntq(38, " Existe un listado de empresas donde realizar practicas ").
ntq(39, " Como se en que empresas puedo realizar mis practicas ").

tq(14, " Con que recursos materiales y servicios cuenta la ESEI ").
ntq(40, " Que me puedes decir de las instalaciones de la ESEI ").
ntq(41, " Tiene Salon de Actos la ESEI ").
ntq(42, " Cuantos seminarios tiene la ESEI ").

tq(15, " Que son los Trabajos Fin de Grado o de Master ").
ntq(43, " Me puedes decir en que consiste un TFG ").
ntq(44, " Que diferencia hay entre un TFG y un TFM ").
ntq(45, " Existe alguna normativa especifica para los Trabajos Fin de Grado ").

tq(16, " Como hago para acceder a la Biblioteca ").
ntq(46, " Que preciso para entrar a la Biblioteca ").
ntq(47, " Necesito algun carnet para entrar a la Biblioteca ").
ntq(48, " Como entro a la Biblioteca ").

tq(17, " Como puedo justificar mi asistencia a las actividades de evaluacion y a sus revisiones ").
ntq(49, " Que hago para justificar mi asistencia a una evaluacion ").
ntq(50, " Se puede justificar la asistencia a una revision ").
ntq(51, " Trabajo, y necesito justificar mi asistencia a las evaluaciones y revisiones ").

tq(18, " Que actividades deportivas ofrece la ESEI ").
ntq(52, " Tiene algun equipo deportivo la ESEI ").
ntq(53, " Que deportes puedo hacer dentro de la ESEI ").
ntq(54, " Tiene actividades deportivas propias la ESEI ").


aq(1, " Hablame un poco de ti ").
aq(2, " Donde vives durante el curso ").
aq(3, " Por que estudias en la ESEI ").
aq(4, " Que quieres hacer cuando termines tus estudios ").
aq(5, " Tienes amigos en la ESEI ").
aq(6, " Realizas alguna actividad extraescolar ").
aq(7, " Que horario de clases tienes ").
aq(8, " Como te llamas ").
aq(9, " Tienes necesidades educativas especiales ").
aq(10, " Perteneces a la delegacion de alumnos ").
aq(11, " Eres un alumno Erasmus ").
aq(12, " Que tipo de practicas te gustaria realizar como alumno de la ESEI ").
aq(13, " En que empresa te gustaria realizar las practicas ").
aq(14, " Te han concedido alguna beca de estudios ").
aq(15, " Te gustaria obtener una retribucion por hacer tu TFG ").
aq(16, " Has ido alguna vez a la Biblioteca ").
aq(17, " Quieres revisar alguna nota de la materia de Sistemas Inteligentes ").
aq(18, " Que actividades ocio te gustan mas ").

sv(1, " Envia a anacleto con el tema puta mierda el mensaje esto es una puta mierda. ").
sv(2, " Envia el siguiente mensaje sobre el tema gatos a danielopes que diga el mensaje esesto y ya estaria. ").
sv(3, " Quiero solicitar un alta en faitic. ").
sv(4, " Quiero solicitar un cambio de grupo reducido. ").
sv(5, " Queria reservar un seminario. ").
sv(6, " Solicito la asignacion de practicas. ").
sv(7, " Quiero elegir un tfg. ").
sv(8, " Quiero proponer un tfg. ").
sv(9, " Quiero solicitar la defensa de mi tfg. ").
sv(10, " Quiero solicitar una evaluacion por compensacion. ").

cv(1, " Crea un archivo de nombre pollito lindo. ").
cv(2, " Crea un archivo de nombre pollito malo. ").
cv(3, " Añade al archivo pollito malo el texto en verdad si que eres un pollito malo. ").
cv(4, " Añade al archivo pollito lindo el texto en verdad si que eres un pollito lindo. ").

respuesta(1).

/* Initial goals */

!start.

/* Plans */

+!start : bot(created) <- 
    /* TODO: Que cojones? */
	!tqreset;
	!aqreset;
	!svreset;
	!cvreset;
   .println("Preguntas obligatorias tq y las ntq");
	!level0;
	.wait(12000);
    .println("Preguntas obligatorias aq");
	!level1;
	.wait(2000);
	.println("solicitudes anexo 2 wowUWU");
	!level2;
	.wait(2000);
	.println("Archivos y demas cosas");
	!level3;
	.wait(4000).

+!tqreset : dotq(N,Str) <- -dotq(N,Str); +tq(N,Str); !tqreset.
+!tqreset.

+!aqreset : doaq(N,Str) <- -doaq(N,Str); +aq(N,Str); !aqreset.
+!aqreset.

+!svreset : dosv(N,Str) <- -dosv(N,Str); +sv(N,Str); !svreset.
+!svreset.

+!cvreset : docv(N,Str) <- -docv(N,Str); +cv(N,Str); !cvreset.
+!cvreset.

+!select(N,Answer) : dotq(N,_) <- ?tq(New,Answer); -tq(New,Answer); +dotq(New,Answer).
+!select(N,Answer) : not dotq(N,_) & tq(N,Answer) <- -tq(N,Answer); +dotq(N,Answer).
+!select(0,Answer) : tq(N,Answer) <- -tq(N,Answer); +dotq(N,Answer).

+!selectb(N,Answer) : dontq(N,_) <- ?ntq(New,Answer); -ntq(New,Answer); +dontq(New,Answer).
+!selectb(N,Answer) : not dontq(N,_) & ntq(N,Answer) <- -ntq(N,Answer); +dontq(N,Answer).
+!selectb(0,Answer) : ntq(N,Answer) <- -ntq(N,Answer); +dontq(N,Answer).

+!choose(N,Answer) : doaq(N,_) <- ?aq(New,Answer); -aq(New,Answer); +doaq(New,Answer).
+!choose(N,Answer) : not doaq(N,_) & aq(N,Answer) <- -aq(N,Answer); +doaq(N,Answer).
+!choose(0,Answer) : aq(N,Answer) <- -aq(N,Answer); +doaq(N,Answer).

+!chooseb(N,Answer) : dosv(N,_) <- ?sv(New,Answer); -sv(New,Answer); +dosv(New,Answer).
+!chooseb(N,Answer) : not dosv(N,_) & sv(N,Answer) <- -sv(N,Answer); +dosv(N,Answer).
+!chooseb(0,Answer) : sv(N,Answer) <- -sv(N,Answer); +dosv(N,Answer).

+!choosec(N,Answer) : docv(N,_) <- ?cv(New,Answer); -cv(New,Answer); +docv(New,Answer).
+!choosec(N,Answer) : not docv(N,_) & cv(N,Answer) <- -cv(N,Answer); +docv(N,Answer).
+!choosec(0,Answer) : cv(N,Answer) <- -cv(N,Answer); +docv(N,Answer).

+!responder(N,Answer) : .substring( "No entendí bien tu pregunta" , Answer )  <- .send(juan,tell,question(" si ")); !responder.
+!responder.

+!level0 <-

	for (.range(I,1,5)) {
		Sel = math.round(math.random(17))+1;
		.println;
		.println("Pregunta seleccionada: ", Sel," <===============================");
		.println;
		!select(Sel,Ans);
		.println;
		.println("%%%%%%%%%%%%%%%%%%%%%% TRAZA DEL BOT %%%%%%%%%%%%%%%%%%%%%%%%");
		.println;
        /* TODO: Utilizar send(->juan.asl)*/
		//chat(Ans);
		.send(juan,tell,question(Ans));
		.wait(4000);
		
		.println;
		.println("%%%%%%%%%%%%%%%%%% REFORMULO LA PREGUNTA %%%%%%%%%%%%%%%%%%%%");
		.println;
		New = (Sel * 3) - math.round(math.random(2));
		.println("Nueva pregunta ===========================> ", New);
		!selectb(New,NewAns);
		//chat(NewAns);
		.send(juan,tell,question(NewAns));
        /* TODO: Manejar confirmación en preguntas no almacenadas */
		.wait(4000);
	
}.

+!level1 <-
	for (.range(I,1,5)) {
		Sel = math.round(math.random(17))+1;
		.println("Pregunta seleccionada: ", Sel," <===============================");
		.println;
		!choose(Sel,Ans);
		//chat(Ans);
		.send(juan,tell,question(Ans));
		.wait(2100);
		.println;
		.println("===============================================");
	}.
	
	
+!level2 <-
	for (.range(I,1,5)) {
		Sel = math.round(math.random(9))+1;
		.println("servicio seleccionado: ", Sel," <===============================");
		.println;
		!chooseb(Sel,Ans);
		//chat(Ans);
		.send(juan,tell,question(Ans));
		.wait(2100);
		.println;
		.abolish(answer("Se ha realizado de forma correcta el servicio solicitado mailing"));
		.println("===========================================");
	}.

+!level3 <-
	for (.range(I,1,2)) {
		Sel = math.round(math.random(3))+1;
		.println("servicios de archivo seleccionado: ", Sel," <===============================");
		.println;
		!choosec(Sel,Ans);
		//chat(Ans);
		.send(juan,tell,question(Ans));
		.wait(2100);
		.println;
		.abolish(answer("Se ha realizado de forma correcta el servicio solicitado creatingFile"));
		.println("===========================================");
	}.	
	
/* Manejo de respuestas */
+answer(Answer) : .substring( "No entendí bien tu pregunta" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.println("=============================================");
	!responder(N,Answer);
	.println;
	.wait(400).

// 1
	
+answer(Answer) : .substring( "Recibido dime tu nombre y materia" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel y materia SI "));
	.println("=============================================");
	.println;
	.wait(400).		

// 2 
	
+answer(Answer) : .substring( "Recibido dime tu nombre grupo y materia" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel al grupo 4 de SI "));
	.println("=============================================");
	.println;
	.wait(400).		

// 3
	
+answer(Answer) : .substring( "Recibido dime tu nombre el seminario y el dia" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel y el seminario 30b a las 3 del lunes "));
	.println("=============================================");
	.println;
	.wait(400).		

// 4
	
+answer(Answer) : .substring( "Recibido dime tu nombre y la empresa elegida" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel con la empresa Imatia "));
	.println("=============================================");
	.println;
	.wait(400).		

// 5
	
+answer(Answer) : .substring( "Recibido dime tu nombre y el tfg elegido" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel con tfg pollito"));
	.println("=============================================");
	.println;
	.wait(400).	

// 6
	
+answer(Answer) : .substring( "Recibido dime tu nombre y la tematica" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel con tematica pollito lindo"));
	.println("=============================================");
	.println;
	.wait(400).		

// 7	
	
+answer(Answer) : .substring( "Recibido dime tu nombre dni y la tematica del tfg" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel con dni 17374938V y tematica pollito lindo"));
	.println("=============================================");
	.println;
	.wait(400).

// 8	
	
+answer(Answer) : .substring( "Recibido dime tu nombre y la materia" , Answer ) & not service(Answer,service) <- 
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", Answer);
	.println;
	.send(juan,tell,question(" Angel y materia SI"));
	.println("=============================================");
	.println;
	.wait(400).
	
+answer(Answer) : not .substring( "No entendí bien tu pregunta" , Answer ) & not service(Answer,Service) <- 
	?respuesta(N);
	-+respuesta(N+1);
	+respuesta(N,Answer);
	.println("=============================================");
	.println;
	.println("Acabo de recibir de Juanito la contestación ", N, " : ", Answer);
	.wait(300);
	.println;
	.println("=============================================").	
	
	

