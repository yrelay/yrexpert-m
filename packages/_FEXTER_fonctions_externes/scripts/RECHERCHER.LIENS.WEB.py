#!/usr/bin/env python3
#!----------------------------------------------------------------------------!
#!                                                                            !
#! Yexpert : (your) Système Expert                                            !
#! Copyright (C) 2001-2020 by Hamid LOUAKED (HL).                             !
#!                                                                            !
#!----------------------------------------------------------------------------!

import sys
import datetime
import time
import getopt
import urllib.request
import urllib.parse
import re
import unicodedata
import html

if (sys.stdout.encoding is None):            
    print >> sys.stderr, "veuillez définir python env PYTHONIOENCODING=UTF-8, exemple: export PYTHONIOENCODING=UTF-8, lors de l'écriture sur stdout." 
    exit(1)

# Options
# instance = nom de l'instance
# utilisation https://python.developpez.com/cours/DiveIntoPython/php/frdiveintopython/scripts_and_streams/command_ligne_arguments.php
# documentation à titre indicatif

def usage() :
    help = """
usage: RECHERCHER.LIEN.WEB options

Ce script permet de rechercher les liens web depuis un moteur de recherche

DEFAULTS:
	INSTANCE    yrelay
	AUTEUR      DMO
	AUTRE       RECHERCHER.LIEN.WEB
	DATE.CREATION   JJ/MM/AA
	HEURE.CREATION  HH:MM
	REPERTOIRE  INSTANCE
	NOM         AA-MM-JJ-HH-MM-SS-99
	FICHIER     AA-MM-JJ-HH-MM-SS-99.IND
	USER.AGENT  Mozilla/5.0 (compatible; MSIE 5.5; Windows NT)
	EXT         fr		# Langue
	LANG        fr		# Sur quelle datacenter chercher ? C'est le .dot !
	NB.PAGE     10 		# Nombre de pages de résultat
	RECHERCHE   mots clés	# Utiliser les opérateurs pour affiner ses recherches
	MOTEUR      STARTPAGE   # STARTPAGE ou GOOGLE
    CARD        999		# Nombre de liens trouvés
    DUREE       999		# En secondes

OPTIONS:
	-h    (h)elp, affiche ce message
	-i    (i)nstance de YRexpert
	-a    (a)uteur, est la partition de l'instance
	-r    (r)echeche un mot clé
	-m    (m)oteur de rechercher sélectionné
	-p    nombre de (p)age de recherche (par paquet de 10)
	-e    r(e)pertoire de destination
	-n    (n)nom de l'individu contenant les données
	-f    (f)ichier d'échange avec DKBMS
	-d    (d)ebug active le débogage
"""

def main(argv):
    # Initialiser les variables
    instance = "anna"
    auteur = "DMO"
    recherche = ""
    moteur = "STARTPAGE"
    nb_page = 1
    repertoire = "INTERFACE"
    nom = ""
    fichier = ""
    muet = 1
    
    # Récupérer les options   
    try:
        opts, args = getopt.getopt(argv,"hi:a:r:m:p:e:n:f:d",["help", "instance=", "auteur=", "recherche=", "moteur=", "nb_page=", "repertoire=", "nom=", "fichier="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-i", "--instance"):
            instance = arg
        elif opt in ("-a", "--auteur"):
            auteur = arg
        elif opt in ("-r", "--recherche"):
            recherche = arg.replace('+',' ')
            recherche = recherche.replace(':',"'")
            recherche = recherche.replace('#','"')
        elif opt in ("-m", "--moteur"):
            moteur = arg
        elif opt in ("-p", "--nb_page"):
            nb_page = int(arg)
        elif opt in ("-e", "--repertoire"):
            repertoire = arg
        elif opt in ("-n", "--nom"):
            nom = arg
        elif opt in ("-f", "--fichier"):
            fichier = arg
        elif opt == '-d':
            muet = 0

    # afficher la version
    if muet == 0 : print(sys.stdout.write("Bonjour de Python %s\n" % (sys.version,)))

    # rechercher ne peut être null
    if recherche == "" :
        message = "La recherche ne peut pas être null, utiliser l'option -r 'mot clé recherché'" 
        print(message + "\n")
        exit(0)

    # nom ne peut être null
    if nom == "" :
        message = "Le nom ne peut pas être null, utiliser l'option -n 'nom'" 
        print(message + "\n")
        exit(0)

    # fichier ne peut être null
    if fichier == "" :
        message = "Le fichier ne peut pas être null, utiliser l'option -f 'fichier de sortie'" 
        print(message + "\n")
        exit(0)

    # Rechercher liens sur le web
    if moteur == "GOOGLE" :
        google(instance,auteur,recherche,moteur,nb_page,repertoire,nom,fichier,muet)
    else :
        startpage(instance,auteur,recherche,moteur,nb_page,repertoire,nom,fichier,muet)

def google(instance,auteur,recherche, moteur,nb_page,repertoire,nom,fichier,muet):
    autre = "RECHERCHER.LIENS.WEB"
    debut_chrono = time.perf_counter()
    date_creation = datetime.datetime.now().strftime('%d/%m/%y')
    heure_creation = datetime.datetime.now().strftime('%H:%M')
    #nom = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S-%f')
    #fichier = nom_interface + ".IND" 
    moteur = "GOOGLE"
    user_agent = 'Mozilla/5.0 (compatible; MSIE 5.5; Windows NT)'
    headers = { 'User-Agent' : user_agent }
    ext="fr"
    lang="fr" # sur quelle datacenter chercher?"
    #nb_page=1 # Nombre de pages de résultat
    #recherche='yrelay' # Mot clé cherché
    keyword = urllib.parse.quote(recherche)

    f = open(fichier, "w")
    f.write("archivage de " + auteur + " le " + date_creation + " a " + heure_creation + "(version 1.0)" + "\n")
    f.write(autre + "\n")
    f.write("\n")
    f.write(repertoire + "^" + nom + "^" + "\n")
    f.write("AUTEUR^1" + "^" + auteur + "\n")
    f.write("DATE.CREATION^1" + "^" + date_creation + "\n")
    f.write("HEURE.CREATION^1" + "^" + heure_creation + "\n")
    f.write("FONCTION^1^" + autre + "\n")
    f.write("MOTEUR^1^" + moteur + "\n")
    f.write("RECHERCHE^1^" + recherche + "\n")

    f2 = open('2.txt', "w")
    pagenum = 0 # on commence à la page 0 puis de 10 en 10
    card = 0
    while (pagenum/10) < nb_page:
        if pagenum == 0 :
            moteururl = "https://www.google." + ext + "/custom?hl=" + lang + "&q=" + keyword + "&start=0"
        else :
            moteururl = "https://www.google." + ext + "/custom?hl=" + lang + "&q=" + keyword + "&start=" + str(pagenum) + "&safe=off&pwst=1&filter=0"
        pagenum = pagenum + 10          # on met en forme pour google qui va de 10 en 10
        if muet == 0 : print("\n" + "--- " + moteururl)
        f.write("URL^" + str(pagenum) + "^" + moteururl + "\n")

        rep = urllib.request.Request(moteururl,None,headers)
        response = urllib.request.urlopen(rep)
        result = urllib.parse.unquote(response.read().decode('utf8'))
        f2.write(str(result))

        # Parser les URLs
        indice_url = 0
        sep='<a class="fuLhoc ZWRArf" href="/url\?q=http.*?>'
        matches=re.findall(sep,result)
        res_tab=[]
        for elt in matches:
            sep='http.*?&'
            match=re.findall(sep,elt)
            res_tab.append(match[0][:-1])
        for elt in res_tab:
            if muet == 0 : print(elt)
            card = card + 1
            indice_url = indice_url + 1
            if len(elt) > 200 : elt = "Valeur supérieure à 200 : " + str(len(elt))
            f.write("HREF^" + str(pagenum) + "," + str(indice_url) + "^" + elt + "\n")

        # Parser les descriptions
        indice_url = 0
        sep='<tr><td class="f3hb4"><div>   <div>       <span class="qXLe6d FrIlee">.*?</div>'
        matches=re.findall(sep,result)
        res_tab=[]
        for elt in matches:
            sep='.*'	# TODO : à simplifier
            match=re.findall(sep,elt)
            res_tab.append(match[0][:-1])
        for elt in res_tab:
            elt = elt.strip('<tr><td class="f3hb4"><div>   <div>       <span class="qXLe6d FrIlee">')
            elt = elt.strip('YyStc YVIcad">') # TODO : à simplifier
            elt = elt.replace('</span> ','')
            elt = elt.replace(' <span class="fYyStc YVIcad">','')
            elt = elt.replace(' <span class="fYyStc">','')
            elt = elt.replace('       </','')
            if muet == 0 : print(elt)
            if len(elt) > 200 : elt = "Valeur supérieure à 200 : " + str(len(elt))
            indice_url = indice_url + 1
            f.write("DESCRIPTION^" + str(pagenum) + "," + str(indice_url) + "^" + elt + "\n")

    f.write("DUREE^1^" + str(time.perf_counter() - debut_chrono) + "\n")
    f.write("CARD^1^" + str(card) + "\n")
    f.write("\n")
    return [1,"Terminé."]

def startpage(instance,auteur,recherche,moteur,nb_page,repertoire,nom,fichier,muet):
    autre = "RECHERCHER.LIENS.WEB"
    debut_chrono = time.perf_counter()
    date_creation = datetime.datetime.now().strftime('%d/%m/%y')
    heure_creation = datetime.datetime.now().strftime('%H:%M')
    #nom = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S-%f')
    #fichier = nom_interface + ".IND" 
    moteur = "STARTPAGE"
    user_agent = 'Mozilla/5.0 (compatible; MSIE 5.5; Windows NT)'
    headers = { 'User-Agent' : user_agent }
    ext="fr"
    lang="fr" # sur quelle datacenter chercher?"
    language="francais"
    #nb_page=1 # Nombre de pages de résultat
    #recherche='yrelay' # Mot clé cherché
    keyword = urllib.parse.quote(recherche)
    f = open(fichier, "w")
    f.write("archivage de " + auteur + " le " + date_creation + " a " + heure_creation + "(version 1.0)" + "\n")
    f.write(autre + "\n")
    f.write("\n")
    f.write(repertoire + "^" + nom + "^" + "\n")
    f.write("AUTEUR^1" + "^" + auteur + "\n")
    f.write("DATE.CREATION^1" + "^" + date_creation + "\n")
    f.write("HEURE.CREATION^1" + "^" + heure_creation + "\n")
    f.write("FONCTION^1^" + autre + "\n")
    f.write("MOTEUR^1^" + moteur + "\n")
    f.write("RECHERCHE^1^" + recherche + "\n")

    pagenum = 0 # on commence à la page 1
    card = 0
    while pagenum < nb_page:
        pagenum = int(pagenum) + 1  # on passe à la page suivante
        pagenum2 = str(pagenum)     # on met en forme pour startpage qui commence à 1
        if pagenum == 1 :
            moteururl = "https://www.startpage." + ext + "/do/search?cat=web&query=" + keyword + "&language=" + language + "&lang=" + lang
        else :
            moteururl = "https://www.startpage." + ext + "/do/search?cat=web&query=" + keyword + "&language=" + language + "&lang=" + lang + "&page=" + pagenum2
        if muet == 0 : print("\n" + "--- " + moteururl)
        f.write("URL^" + str(pagenum) + "^" + moteururl + "\n")

        rep = urllib.request.Request(moteururl,None,headers)
        response = urllib.request.urlopen(rep)
        result = urllib.parse.unquote(response.read().decode('utf8'))

        # Parser les URLs
        indice_url = 0
        sep='class="w-gl__result-url"\\n                            href="http.*?"'
        matches=re.findall(sep,result)
        res_tab=[]
        for elt in matches:
            sep='http.*?"'
            match=re.findall(sep,elt)
            res_tab.append(match[0][:-1])
        for elt in res_tab:
            if muet == 0 : print(elt)
            indice_url = indice_url + 1
            if len(elt) > 200 : elt = "Valeur supérieure à 200 : " + str(len(elt))
            f.write("HREF^" + str(pagenum) + "," + str(indice_url) + "^" + elt + "\n")

        # Parser les descriptions
        indice_url = 0
        sep='<p class="w-gl__description">.*?<'
        matches=re.findall(sep,result)
        for elt in matches:
            elt = elt.strip('<p class="w-gl__description">')
            elt = html.unescape(elt)
            if muet == 0 : print(elt)
            card = card + 1
            indice_url = indice_url + 1
            if len(elt) > 200 : elt = "Valeur supérieure à 200 : " + str(len(elt))
            f.write("DESCRIPTION^" + str(pagenum) + "," + str(indice_url) + "^" + elt + "\n")

    f.write("DUREE^1^" + str(time.perf_counter() - debut_chrono) + "\n")
    f.write("CARD^1^" + str(card) + "\n")
    return [1,"Terminé."]

if __name__ == "__main__":
    main(sys.argv[1:])

