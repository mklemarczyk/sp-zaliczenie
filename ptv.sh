#!/bin/bash

function wyborProgramu {
	echo "Nic";
}

function pobierzProgram {
	wget -O "program.tmp" "http://tv.wp.pl/id,$1,d,$2,all,1,mprogramy.html";
	rm "program.tmp";
}

function wyswietlenieProgramu {
	echo "Nic";
}


dialog --msgbox "Witaj w programie TV" 0 0;

dialog --menu "Wybierz program:" 0 0 0 1 "TVP-1" 2 "TVP-2" 5 "Polsat" 17 "TVN" 2> wybor.tmp;



