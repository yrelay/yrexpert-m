#!/usr/bin/env python3
#!----------------------------------------------------------------------------!
#!                                                                            !
#! Yexpert : (your) Système Expert                                            !
#! Copyright (C) 2001-2020 by Hamid LOUAKED (HL).                             !
#!                                                                            !
#!----------------------------------------------------------------------------!

import urllib.request
import re

user_agent = 'Mozilla/5.0 (compatible; MSIE 5.5; Windows NT)'
headers = { 'User-Agent' : user_agent }

ext="fr"
lang="fr" # sur quelle datacenter chercher?"

nb_page=10 # Nombre de pages de résultat
keyword='yrelay' # Mot clé cherché

pagenum = 0 # on commence à la page 1
googlefrurl = "https://www.google." + ext + "/custom?hl=" + lang + "&q=" + keyword + "&start=" + str(pagenum)

f = open("liste_url_collectees.txt", "w")
while pagenum <= nb_page:
    rep = urllib.request.Request(googlefrurl,None,headers)
    response = urllib.request.urlopen(rep)
    result = str(response.read())
    # sep='<h2 class=r><a href=.*?>'
    sep='<a class="fuLhoc ZWRArf" href="/url\?q=http.*?>'
    matches=re.findall(sep,result)
    res_tab=[]
    for elt in matches:
        # sep='http.*?"'
        sep='http.*?&'
        match=re.findall(sep,elt)
        res_tab.append(match[0][:-1])

    for elt in res_tab:
        print(elt)
        f.write(elt + "\n")

    pagenum = int(pagenum) + 1 # on passe à la page suivante
    pagenum2 = str(pagenum) + '0'# on met en forme pour google qui va de 10 en 10
    googlefrurl = "https://www.google." + ext + "/custom?hl=" + lang + "&q=" + keyword + "&start=" + pagenum2 + "&safe=off&pwst=1&filter=0"




