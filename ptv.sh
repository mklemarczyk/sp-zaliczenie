#!/bin/bash

function wyborProgramu {
	data=`date +"%Y-%m-%d"`
	dialog --menu "Wybierz program:" 0 0 0 1 "TVP-1" 2 "TVP-2" 5 "Polsat" 17 "TVN" 2> "wybor.tmp";
	wybor=`cat "wybor.tmp`
	pobierzProgram $wybor $data
}

function pobierzProgram {
	wget -O "program.tmp" "http://tv.wp.pl/id,$1,d,$2,all,1,mprogramy.html";
	wyswietlenieProgramu "program.tmp";
	rm "program.tmp";
}

function wyswietlenieProgramu {
	echo "Nic";
}


dialog --msgbox "Witaj w programie TV" 0 0;




