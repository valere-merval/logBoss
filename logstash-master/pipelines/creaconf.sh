#!/bin/bash

# script erzeugt aus dem entsprechenden Template File für die Port Gruppe die 7 Umgebungskonfigfiles
# 


case $1 in
	bibe)		
		port=5040
		for umg in h i j k l q m
		do
			rm -f bibe-$umg.conf
			cp bibe.templ bibe-$umg.conf
			sed -i "s/<nnnn>/$port/" bibe-$umg.conf
			echo erzeuge bibe-$umg.conf
			port=$((port+1))
		done
		;;
	tpo)
                port=5050
                for umg in h i j k l q m
                do
                        rm -f tpo-$umg.conf
                        cp tpo.templ tpo-$umg.conf
                        sed -i "s/<nnnn>/$port/" tpo-$umg.conf
                        echo erzeuge tpo-$umg.conf
			port=$((port+1))
                done
                ;;
	app)
                port=5060
                for umg in h i j k l q m
                do
                        rm -f app-$umg.conf
                        cp app.templ app-$umg.conf
                        sed -i "s/<nnnn>/$port/" app-$umg.conf
                        echo erzeuge app-$umg.conf
			port=$((port+1))
                done
                ;;

	epa3)		
                port=5070
                for umg in h i j k l q m
                do
                        rm -f epa3-$umg.conf
                        cp epa3.templ epa3-$umg.conf
                        sed -i "s/<nnnn>/$port/" epa3-$umg.conf
                        echo erzeuge epa3-$umg.conf
			port=$((port+1))
                done
                ;;

	*)
		echo "Ungültige eingabe nur Port Gruppen tpo bibe app epa3 werden aktzeptiert"

		;;
esac
