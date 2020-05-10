// Agente Master

// Contador respuestas
numAnswer(1).

// Comprobar si es un servicio

service(Answer, mailing):-
	checkTag("<mail>",Answer).
service(Answer, addingFile):-
	checkTag("<addtxt>", Answer).
service(Answer, creatingFile):-
	checkTag("<file>", Answer) &
	not service(Answer, addingfile).

checkTag(Service, String) :-
	.substring(Service,String).

// Clase teórica de Handouts

getValTag(Tag, String,Val):-
	.substring(Tag,String,Fst) &
	.length(Tag,N) &
	.delete(0,Tag,RestTag) &
	.concat("</",RestTag,EndTag) &
	.substring(EndTag,String,End) & 
	.substring(String,Val,Fst+N,End).

// Realización de el servicio

doService(mailing, String, "done") :-
	getValTag("<to>", String, To) &
	getValTag("<subject>", String, Subject) &
	getValTag("<msg>", String, Msg).
	//gui.mailing(To,Subject,Msg).
	
doService(creatingFile, String, "done") :-
	getValTag("<file>", String, Name) &
	gui.creatingFile(Name).

doService(addingFile, String, "done") :-
	getValTag("<txt>", String, Txt) &
	getValTag("<file>", String, File) &
	gui.writingOn(Txt,File).
	
// Filtrado de respuesta

filter(Answer, mailing, "Ya he enviado el mensaje como me pediste."):-
	doService(mailing, Answer, Done) &
	Done = "done".
	
filter(Answer, creatingFile, "Ya esta creado el archivo como pediste.") :-
	doService(creatingFile, Answer, Done) &
	Done = "done".
	
filter(Answer, addingFile, "Ya se ha a�adido el texto al archivo como pediste.") :-
	doService(addingFile, Answer, Done) &
	Done = "done".

// Manejo de respuestas

+answer(Answer) : service(Answer,Service) & filter(Answer,Service,Answered) & numAnswer(N) <-
	-+numAnswer(N+1);
	+respuesta(N,Answered);
	.concat("Se ha realizado de forma correcta el servicio solicitado ",Service,Result);
	.send(student,tell,answer(Result));
	.wait(1000).


+answer(Answer) : service(Answer,Service) & not filter(Answer,Service,Answered) & numAnswer(N) <-
	-+numAnswer(N+1);
	+respuesta(N,"No se como filtrar y enmascarar este servicio.");
	.concat("No se como filtrar y enmascarar este servicio.",Service,Result);
	.send(student,tell,answer(Result));
	.wait(1000).

