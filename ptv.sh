#!/bin/bash

function wyborProgramu {
	data=`date +"%Y-%m-%d"`;
	dialog --menu "Wybierz program:" 0 0 0 1 "TVP-1" 2 "TVP-2" 5 "Polsat" 17 "TVN" 2> "wybor.tmp";
	wybor=`cat "wybor.tmp"`;
	rm "wybor.tmp";
	pobierzProgram $wybor $data;
}

function pobierzProgram {
	wget -O "program.tmp" "http://tv.wp.pl/id,$1,d,$2,all,1,mprogramy.html" 2> /dev/null;
	formatowanieProgramu "program.tmp";
	#rm "program.tmp";
}

function formatowanieProgramu {
	cat $1 | tr "<" "\n" > "program2.tmp";
	rm $1;	
	mv "program2.tmp" $1;
	cat $1 | grep "tvHour" > "godziny.tmp";
	cat $1 | grep "tvProg" > "tytuly.tmp";
	wyswietlenieProgramu $1 "godziny.tmp" "tytuly.tmp";
	rm "godziny.tmp";
	rm "tytuly.tmp";
}

function wyswietlenieProgramu {
	rm "$1";

	ile=`cat $2 | wc -l`;

	touch "$1";

	for (( i=0; i<$ile; i++ ));
	do
		godzina=`cat godziny.tmp | cut -d '>' -f 2 | head -n $[i+1] | tail -n 1`;
		tytul=` cat tytuly.tmp | cut -d '>' -f 2 | head -n $[i+1] | tail -n 1`;
		echo $godzina $tytul >> "$1";
	done

	dialog --textbox "$1" -1 -1;
}


dialog --msgbox "Witaj w programie TV" 0 0;
wyborProgramu;



