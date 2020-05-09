// Agent master :)

// To take the account of bot answers
numAnswer(1).

// Check if bot answer requires a service

service(Answer, mailing):-
	checkTag("<mail>",Answer).
service(Answer, addingFile):-
	checkTag("<addtxt>", Answer).
service(Answer, creatingFile):-
	checkTag("<file>", Answer) &
	not service(Answer, addingfile).


// Checking a concrete service required by the bot is as simple as find the required tag as a substring on the string
// given by the second parameter

checkTag(Service, String) :-
	.substring(Service,String).

// Gest into Val the first substring contained by a tag into string

getValTag(Tag, String,Val):-
	.substring(Tag,String,Fst) &   // First: find the Fst Position on the tag string
	.length(Tag,N) &			   // Second: calculate the lenght of the tag string
	.delete(0,Tag,RestTag) &       // Third: build the terminal of the tag string
	.concat("</",RestTag,EndTag) &  // Four: find the Fst position of the terminal tag string
	.substring(EndTag,String,End) &  // Four: find the Fst position of the terminal tag string
	.substring(String,Val,Fst+N,End).    // Five: get the Val tagged

/* Another way to get the value will consist to delete from String the prefix, sufix and tags in orrder to let only the required Val */

// Run service


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
	
// Filter the answer to be showed when the service indicated as second arg is done

filter(Answer, mailing, "Ya he enviado el mensaje como me pediste."):-
	doService(mailing, Answer, Done) &
	Done = "done".
	
filter(Answer, creatingFile, "Ya esta creado el archivo como pediste.") :-
	doService(creatingFile, Answer, Done) &
	Done = "done".
	
filter(Answer, addingFile, "Ya se ha a�adido el texto al archivo como pediste.") :-
	doService(addingFile, Answer, Done) &
	Done = "done".


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

