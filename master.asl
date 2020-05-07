// Agent master :)

// To take the account of bot answers
numAnswer(1).

// Check if bot answer requires a service
service(Answer, translating):-
	checkTag("<translate>",Answer).
service(Answer, mailing):-
	checkTag("<mail>",Answer).
service(Answer, addingBot):-
	checkTag("<botprop>",Answer).
service(Answer, creatingSet):-
	checkTag("<addset>",Answer) &
	not checkTag("<new>",Answer).
service(Answer, addingSet):-
	checkTag("<mail>",Answer) &
	checkTag("<new>",Answer).
service(Answer, creatingMap):-
	checkTag("<addmap>",Answer) &
	not checkTag("<new>",Answer).
service(Answer, addingMap):-
	checkTag("<addmap>",Answer) &
	checkTag("<new>",Answer).
service(Answer, addingfile):-
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
	.substring(EndTag,String,End) &  // Four: find the Fst position of the terminal tag string
	.substring(String,Val,Fst+N,End).    // Five: get the Val tagged

/* Another way to get the value will consist to delete from String the prefix, sufix and tags in orrder to let only the required Val */

// Run service

doService(translating, String, Translation) :-
	getValTag("<to>", String, To) &
	getValTag("<msg>", String, Msg) &
	gui.translating("es",To,Msg,Translation).

doService(mailing, String, "done") :-
	getValTag("<to>", String, To) &
	getValTag("<subject>", String, Subject) &
	getValTag("<msg>", String, Msg) &
	gui.translating(To,Subject,Msg).

doService(addingBot, String, Done) :-
	getValTag("<name>",String,Prop) &
	getValTag("<val>",String,Value) &
	bot(Name) &
	.term2string(Name,NameStr) &
	.concat(NameStr,"/config/properties.txt",PropertiesFile) &
	.concat(Prop,":",First) &
	.concat(First,Value,ToWrite) &
	gui.writingOn(ToWrite,PropertiesFile) &
	.concat("Acabo de añadirme la propiedad: ", ToWrite, Done).

// Filter the answer to be showed when the service indicated as second arg is done
filter(Answer, translating, Answered):-
	doService(translating,Answer,Translation) &
	.concat("La traducción que me pediste es: ", Translation, Answered).

filter(Answer, mailing, "Ya he enviado el mensaje como me pediste."):-
	doService(mailing, Answer, Done) &
	Done = "done".

filter(Answer, addingBot, Answered):- //true
	doService(addingBot,Answer,Answered).

/* Initial goals */



+answer(Answer) : service(Answer,Service) & filter(Answer,Service,Answered) & numAnswer(N) <-
	-+numAnswer(N+1);
	+respuesta(N,Answered);
	.println("======================");
	.println;
	.println("Acabo de recibir del bot la contestacion ", Answered);
	.println;
	.println("======================");
	.wait(1000).



+answer(Answer) : service(Answer,Service) & not filter(Answer,Service,Answered) & numAnswer(N) <-
	-+numAnswer(N+1);
	+respuesta(N,"No se como filtrar y enmascarar este servicio.");
	.println("======================");
	.println;
	.println("Acabo de recibir del bot la contestacion ", Service);
	.wait(1000);
	.println;
	.println("======================").

