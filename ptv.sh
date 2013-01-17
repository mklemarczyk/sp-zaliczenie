#!/bin/bash

dialog --menu "Wybierz program:" 0 0 0 1 "TVP-1" 2 "TVP-2" 5 "Polsat" 17 "TVN"

wget -O "program.tmp" "http://tv.wp.pl/id,1,d,2013-01-17,all,1,mprogramy.html"


