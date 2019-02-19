#!/bin/bash

function menu {
	if [ -f bibliotheque.txt ]
	then
		echo "Chargement..."
		sleep 0.9
	else
		sleep 0.2
		touch bibliotheque.txt
		echo "Création du fichier bibliotheque.txt"
		echo "" 
	fi

	echo ""
	echo ""
	echo "		      Bienvenue"
	echo "		    	Menu Gestionnaire d'ouvrage"
	echo ""
	read -p "	 

		1 --> Ajouter un ouvrage
		2 --> Afficher un ouvrage
		3 --> Supprimer un ouvrage 
		4 --> Rechercher un ouvrage
		0 --> Quitter le programme

		Faites votre choix : " choix
		echo ""

		if [ $choix == 1 ] 
		then
			sleep 0.2
			AjouterOuvrage
		elif [ $choix == 2 ]
		then 
			sleep 0.2
			AfficherOuvrage
		elif [ $choix == 3 ]
		then
			sleep 0.2
			echo "Chargement du module Supprimer un ouvrage"
		elif [ $choix == 4 ]
		then
			sleep 0.2
			RechercherOuvrage
			"chargement du module Rechercher un ouvrage "
		elif [ $choix == 0 ]
		then
			sleep 0.2
			echo "Vous quittez le programme ..."
			exit
		fi
		

}
function AjouterOuvrage {
	echo ""
	echo ""
	echo "		Ajouter un Ouvrage"
	echo ""

	echo 'Pour ajouter un ouvrage, renseignez les champs demandés.'

	read -p "Titre: " titre
 
	read -p "Auteur: " auteur

	read -p "Editeur: " editeur

	read -p "ISBN: " isbn
	echo ""
	read -p "Confirmez vous votre saisie ? oui/non: " saisie
	echo ""

	if [ $saisie == oui ]
	then 
		echo "Vous venez d'ajouter un ouvrage avec succès !"
		echo ""
		tableau=([0]=$titre [1]=$auteur [2]=$editeur [3]=$isbn)

		echo "" >> bibliotheque.txt
		echo "${tableau[0]}" >> bibliotheque.txt
		echo "${tableau[1]}" >> bibliotheque.txt
		echo "${tableau[2]}" >> bibliotheque.txt
		echo "${tableau[3]}" >> bibliotheque.txt
		echo "" >> bibliotheque.txt

		echo "Titre ajouter: ${tableau[0]}"
		sleep 0.2
		echo "Auteur ajouter: ${tableau[1]}"
		sleep 0.2
		echo "Editeur ajouter: ${tableau[2]}"
		sleep 0.2
		echo "Isbn ajouter: ${tableau[3]}"
			
	
	elif  [ $saisie == non ]
	then
		read -p "Vous devez valider votre saisie pour ajouter un ouvrage, recommencez ? oui/non: " Nsaisie
		if [ $Nsaisie == oui ]
		then
			AjouterOuvrage
		elif [ $Nsaisie == non ]
		then
			echo "Que voulez vous faire ?"
			echo ""
			read -p "Recommencez / Quittez ? " Dchoix
			if [ $Dchoix == quittez ]
			then
				exit
			elif [ $Dchoix == recommencez ]
			then
				AjouterOuvrage
			fi
		fi
	fi


}

function AfficherOuvrage {

	echo ""
	echo ""
	echo "		Afficher un Ouvrage"
	echo ""
	echo "Pour afficher un ouvrage, renseignez les champs demandés"
	echo ""
	read -p "Titre de l'ouvrage à afficher: " ATitre
	sleep 0.2

	echo ""

	for Ligne in $(cat bibliotheque.txt)  
	do  
		if [ $Ligne == $ATitre ] 
		then
			echo ""
			echo "Ouvrage a afficher"
			sleep 0.6
			echo""
			grep -wi -A 3 "$ATitre" bibliotheque.txt
			echo ""
		fi
	done 
	echo "Que voulez vous faire ?"
	echo""
	sleep 0.1
	read -p "Recommencez / Quittez ? " Achoix
	if [ $Achoix == quittez ]
			then
				exit
			elif [ $Achoix == recommencez ]
			then
				AfficherOuvrage
			fi
	
	
	
}

function RechercherOuvrage {
	echo ""
	echo ""
	echo "		Rechercher un Ouvrage"
	echo ""
	sleep 0.5
	echo "	1 --> Rechercher par Titre"
	echo "	2 --> Rechercher par Auteur"
	echo "	3 --> Rechercher par Editeur"
	echo "	4 --> Rechercher par Isbn"
	read -p "	Faites votre choix : Rchoix"


	if [ $Rchoix == 1 ] 
	then
			sleep 0.2
			read -p "Titre de l'ouvrage à afficher: " RTitre
			sleep 0.2
			for Ligne in $(cat bibliotheque.txt)  
			do  
				if [ $Ligne == $RTitre ] 
				then
					echo ""
					echo "Ouvrage rechercher"
					sleep 0.6
					echo""
					grep -wi -A 3 "$RTitre" bibliotheque.txt
					echo ""
				fi
			done
			
	elif [ $Rchoix == 2 ]
	then 
			sleep 0.2
			read -p "Auteur de l'ouvrage à afficher: " RAuteur
			sleep 0.2
	for Ligne in $(cat bibliotheque.txt)  
	do  
		if [ $Ligne == $RAuteur ] 
		then
					echo ""
					echo "Ouvrage rechercher"
					sleep 0.6
					echo""
					grep -wi -A 3 "$RAuteur" bibliotheque.txt
					echo ""
		fi
	done
			
		elif [ $Rchoix == 3 ]
		then
			sleep 0.2
			read -p "Editeur de l'ouvrage à afficher: " REditeur
			sleep 0.2
			for Ligne in $(cat bibliotheque.txt)  
			do  
				if [ $Ligne == $REditeur ] 
				then
					echo ""
					echo "Ouvrage rechercher"
					sleep 0.6
					echo""
					grep -wi -A 3 "$REditeur" bibliotheque.txt
					echo ""
				fi
			done

		elif [ $Rchoix == 4 ]
		then
			sleep 0.2
			read -p "Titre de l'ouvrage à afficher: " RIsbn
			sleep 0.2
			for Ligne in $(cat bibliotheque.txt)  
			do  
				if [ $Ligne == $RIsbn ] 
				then
					echo ""
					echo "Ouvrage rechercher"
					sleep 0.6
					echo""
					grep -wi -A 3 "$RIsbn" bibliotheque.txt
					echo ""
				fi
			done
		fi
			




}
menu