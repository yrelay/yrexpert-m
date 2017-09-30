;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%EDCHR^INT^1^59547,73869^0
EDCHR(TYPE) 
 
 
 
 
 
 
 
 N MODIF,CHANGER,MENU1,TROUVER,PROBLEME,CHOIX,CPT,TEMP,CTR,I,AD,%PROVEN
 S CPT=0,MODIF=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PROBLEME=$$CONCAS^%QZCHAD(TEMP,"PROBLEME")
 I ((TYPE'="MODELE")&(TYPE'="FORMAT"))&(TYPE'="TRT") D ^%VZEAVT("Vous devez travailler imperativement avec les TRAITEMENTS, les MODELES ou les FORMATS ...") Q
 S:TYPE="MODELE" %PROVEN="EDMOD"
 S:TYPE="FORMAT" %PROVEN="EDFORMAT"
 S:TYPE="TRT" %PROVEN="TRT"
AFF D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RECHERCHE / SUBSTITUTION"))
 S MENU1(1)=$$^%QZCHW("RECHERCHE")_"^RECH"
 S MENU1(2)=$$^%QZCHW("SUBSTITUTION")_"^REMPL"
DIAL2 D ^%VQUIKMN(23,78,22,"MENU1",.AD,.CTR)
 I (CTR="A")!(CTR="F") K @(TEMP) Q
 I AD'="" G @AD
 G DIAL2
RECH 
 D CLEPAG^%VVIDEO,^%VZCDB("RECHERCHE DANS LES "_$$LIB(TYPE)_"S",0)
 S DX=10,DY=3 X XY D LIRE2^%VREAD($$^%QZCHW("Donnez la chaine de caracteres a rechercher")_" : ","",9,RM-4,DY+1,DY-1,"","",.CTR,.FONCT)
 G:CTR'="" AFF
 S FONCT2=FONCT
 D CHANGE(TYPE,FONCT,FONCT2,0,0)
 G:CHOIX=-1 AFF
 I @TROUVER=0 D ^%VZEAVT("Cette chaine de caractere n'est contenue dans aucun "_$$MIN^%VMINUSC($$LIB(TYPE))_" ...") G AFF
 D CLEPAG^%VVIDEO,^%VZCDB("RESULTATS DE LA RECHERCHE DANS LES "_$$LIB(TYPE)_"S ( "_@TROUVER_" cas )",0)
 S DX=0,DY=2 X XY D BLD^%VVIDEO
 W "Nom du "_$$MIN^%VMINUSC($$LIB(TYPE))_" : Ligne  xxx -->       contenu de la ligne" D NORM^%VVIDEO
 D INIT^%QUCHOIP(TROUVER,1,"",0,4,80,18),AFF^%QUCHOIP
RECH2 S I=$$UN^%QUCHOIP
 D END^%QUCHOIP
 G AFF
REMPL 
 D CLEPAG^%VVIDEO,^%VZCDB("SUBSTITUTION DANS LES "_$$LIB(TYPE)_"S",0)
 S DX=10,DY=2 X XY D ^%VZCDB($$^%QZCHW("Remplacer la chaine de caracteres")_" : ",DY)
 S DX=10,DY=3 X XY D LIRE2^%VREAD("","",9,RM-4,DY+1,DY-1,"","",.CTR,.FONCT)
 G:(CTR'="")!(FONCT="") AFF
 S DX=10,DY=7 X XY D ^%VZCDB($J($$^%QZCHW("par"),10)_" : ",DY)
 S DX=10,DY=8 X XY D LIRE2^%VREAD("","",9,RM-4,DY+1,DY-1,"","",.CTR,.FONCT2)
 G:CTR'="" AFF
 S MENU2(1)=$$^%QZCHW("ASSISTE")_"^0"
 S MENU2(2)=$$^%QZCHW("AUTOMATIQUE")_"^1"
 D POCLEPA^%VVIDEO S DY=22 X XY W "Mode :" D ^%VQUIKMN(20,78,22,"MENU2",.AUTO,.CTR)
 I (CTR="A")!(CTR="F") G AFF
 D CHANGE(TYPE,FONCT,FONCT2,1,AUTO)
 I @PROBLEME=0 G AFF
 D CLEPAG^%VVIDEO,^%VZCDB("RESULTATS DE LA REANALYSE",0),INIT^%QUCHOIP(PROBLEME,1,"",0,1,80,20),AFF^%QUCHOIP
REMPL2 S I=$$UN^%QUCHOIP
 D END^%QUCHOIP
 G AFF
 
CHANGE(TYPE,FONCT,FONCT2,CHANGER,AUTO) 
 
 N SOURCE,Y1,OK,PHRASE,NPHRASE
DEB 
 S @PROBLEME=0
 S TROUVER=$$CONCAS^%QZCHAD(TEMP,"TROUVER") K @(TROUVER) S @TROUVER=0
 S:TYPE="FORMAT" (SOURCE,GLO)="^[QUI]EDFORMAT"
 S:TYPE="MODELE" (SOURCE,GLO)="^[QUI]EDMOD"
 S:TYPE="TRT" (SOURCE,GLO)="^[QUI]TTL"
 S MOD=""
 
 S DX=10,DY=7 X XY S CHOIX=$$MES^%VZEOUI("Recherche dans tous les "_$$LIB(TYPE)_"S","N")
 I CHOIX=-1 G FIN
 I CHOIX=1 D INIT G FIN
LEC 
 S GLO=$$CONCAS^%QZCHAD(TEMP,"ELEMENT") K @(GLO)
 S DX=10,DY=10 X XY W $$^%QZCHW($$LIB(TYPE)_" : ") S DX=$X D ^%VLEC
 I (Y1="")!CTRLA S CHOIX=-1 G FIN
 I "*?"'[$E(Y1,$L(Y1)) S @GLO@(Y1)="" G:'($D(@SOURCE@(Y1))) LEC D INIT G FIN
 
SELEC 
 D INIT^%QUCHOIP(SOURCE,1,"",0,6,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(GLO) I '($D(@GLO)) S CHOIX=-1 G FIN
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI("Confirmation ?","O")'=1 G FIN
 D ^%VZEATT,INIT
 D END^%QUCHOIP K @(GLO)
 G FIN
 
INIT I CHANGER D CLEPAG^%VVIDEO
LOOP I (CHANGER&(MOD'=""))&MODIF D VARCOMP
 R *STOP:0 D TOUCHE^%INCCLAV(STOP,.STOP)
 I STOP=1 D POCLEPA^%VVIDEO S STOP=$$MES^%VZEOUI("Abandon immediat ? ","N") D POCLEPA^%VVIDEO I STOP'=0 S CHOIX=-1 G FIN
 S MOD=$O(@GLO@(MOD)) Q:MOD=""
 S LIG="",MODIF=0
 G LOOP3:TYPE="FORMAT"
 G LOOP4:TYPE="TRT"
LOOP2 S LIG=$O(@SOURCE@(MOD,"LIGNE",LIG)) G:LIG="" LOOP
 S PHRASE=@SOURCE@(MOD,"LIGNE",LIG)
 I ('(CHANGER))&(PHRASE[FONCT) D TROUVER G LOOP2
 I CHANGER D SUBST(SOURCE,PHRASE,FONCT,FONCT2)
 G LOOP2
LOOP3 S LIG=$O(@SOURCE@(MOD,"LIGNES",LIG)) G:LIG="" LOOP
 S PHRASE=@SOURCE@(MOD,"LIGNES",LIG)
 I ('(CHANGER))&(PHRASE[FONCT) D TROUVER G LOOP3
 I CHANGER D SUBST(SOURCE,PHRASE,FONCT,FONCT2)
 G LOOP3
LOOP4 S LIG=$O(@SOURCE@(MOD,2,LIG)) G:LIG="" LOOP
 S PHRASE=@SOURCE@(MOD,2,LIG)
 I ('(CHANGER))&(PHRASE[FONCT) D TROUVER G LOOP4
 I CHANGER D SUBST(SOURCE,PHRASE,FONCT,FONCT2)
 G LOOP4
LOOP5 S LIG=$O(@SOURCE@(MOD,"CONTRAINTES",LIG)) G:LIG="" LOOP
 S PHRASE=@SOURCE@(MOD,"CONTRAINTES",LIG)
 I ('(CHANGER))&(PHRASE[FONCT) D TROUVER G LOOP5
 I CHANGER D SUBST(SOURCE,PHRASE,FONCT,FONCT2)
 G LOOP5
 
SUBST(SOURCE,PHRASE,FONCT,FONCT2) 
 N NPHRASE
 I PHRASE'[FONCT Q
 S CPT=CPT+1 I (CPT#6)=0 D CLEPAG^%VVIDEO
 W ?1,MOD,?20,LIG,?25,$E(PHRASE,1,50),!
 S NPHRASE=$$ZSUBST^%QZCHSUB(PHRASE,FONCT,FONCT2) W ?25,$E(NPHRASE,1,50),!
 I '(AUTO) S DY=$Y#25 X XY S I=$$MES^%VZEOUI("Substitution ?","N") W !,! Q:I=0  G:I=-1 STOP
 I TYPE="FORMAT" S @SOURCE@(MOD,"LIGNES",LIG)=NPHRASE D REANA^%EDFANAL(MOD,LIG) D:'(OK) PB S MODIF=1 Q
 I TYPE="MODELE" S @SOURCE@(MOD,"LIGNE",LIG)=NPHRASE D REANA^%EDMANAL(MOD,LIG) D:'(OK) PB S MODIF=1 Q
 
 Q
LIB(TYPE) 
 I TYPE="FORMAT" Q TYPE
 I TYPE="MODELE" Q TYPE
 I TYPE="TRT" Q "TRAITEMENT"
 Q ""
PB 
 N LL
 S @PROBLEME=@PROBLEME+1,LL=$E($$MIN^%VMINUSC($$LIB(TYPE))_" "_MOD_"---> Probleme de reanalyse : ligne "_LIG,1,77)
 S @PROBLEME@(LL)=""
 Q
TROUVER 
 N LIG2,LL S LIG2=$J(LIG,3),LIG2=$TR(LIG2," ",0)
 S @TROUVER=@TROUVER+1,LL=$E(MOD_" : "_LIG2_" -> "_PHRASE,1,75)
 S @TROUVER@(LL)=""
 Q
FIN Q
STOP S MOD="z" Q
VARCOMP 
 N FORMAT
 I TYPE="MODELE" D VARCOMP^%EDGETMD
 I TYPE="FORMAT" S FORMAT=MOD D VARCOMP^%EDFDIAL
 Q

