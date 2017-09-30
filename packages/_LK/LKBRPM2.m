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

;LKBRPM2^INT^1^59547,74867^0
LKBRPM2 ;
 
 
 
 
 
AFFMEN 
 S DX=0,DY=2 X XY W "etape : ",OPTION
 K Y
 S %R=12
 S Y="55\CLH\1\\\lecture.fichier,traitement.fichier,ecriture.dkbms,ecriture.graphique,visualisation.schema"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") Q
 I X=1 G LEC
 I X=2 G TRT
 I X=3 G DATA
 I X=4 G GRAPH
 I X=5 G VISU
 G AFFMEN
 
LEC 
 I $D(@HISTO@("ETAT",OPTION)) D ^%VZEAVT("option deja executee") G AFFMEN
 D ^LKBRP0
 S OPTION=1
 D REAF
 K @HISTO@("ETAT")
 S @HISTO@("ETAT")="1/LECTURE"
 S @HISTO@("ETAT",OPTION)=""
 G AFFMEN
TRT 
 I $D(@HISTO@("ETAT",2)) D ^%VZEAVT("option deja executee") G AFFMEN
 I '($D(@HISTO@("ETAT",1))) D ^%VZEAVT("activer l'option 1") G AFFMEN
 I '(SUPP) G TRT1
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI("suppression du repertoire "_REPP_" et de ses fils")
 I REP'=1 Q
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI("confirmation definitive"_REPP)
 I REP'=1 Q
 D CLEPAG^%VVIDEO,^%VZCDB("suppression du repertoire "_REPP,0)
 S DX=0,DY=2 X XY
 S IND="" F I=0:0 S IND=$$NXTRI^%QSTRUC8($$NOMINT^%QSF(REPP),IND) Q:IND=""  D SX^%QSGESTI($$NOMINT^%QSF(REPP),IND) W "."
TRT1 D RECUP^LKBRP
 S OPTION=2
 D REAF
 S @HISTO@("ETAT")="2/TRAITEMENT DU FICHIER"
 S @HISTO@("ETAT",OPTION)=""
 S @HISTO@("DATE")=$O(^[QUI]LK("BARPHONE","COMP",""))
 G AFFMEN
DATA 
 I $D(@HISTO@("ETAT",3)) D ^%VZEAVT("option deja executee") G AFFMEN
 I '($D(@HISTO@("ETAT",2))) D ^%VZEAVT("activer l'option 2") G AFFMEN
 D PREPRQS^LKBRP
 D ECRRQS^LKBRP
 D REAF S OPTION=3
 S @HISTO@("ETAT")="3/ECRITURE DANS DKBMS"
 S @HISTO@("ETAT",OPTION)=""
 G AFFMEN
GRAPH 
 I $D(@HISTO@("ETAT",4)) D ^%VZEAVT("option deja executee") G AFFMEN
 I '($D(@HISTO@("ETAT",2))) D ^%VZEAVT("activer l'option 2") G AFFMEN
 D ECRGEOM^LKBRP
 D ALL^%SDOPASS
 
 D CLEPAG^%VVIDEO,^%VZCDB("generation de la collection SERIGRAPHIE"_"  "_@HISTO@("ENTITE"),0)
 S LIST=$$CONCAS^%QZCHAD(TMP,"REPERE") K @(LIST)
 D LISTE^%QSCALVA("ARTICLE",@HISTO@("ENTITE"),"REPERE",LIST)
 
 S COL="SERIGRAPHIE",VER=@HISTO@("ENTITE")
 D CRECOL^%SDCOCAR(COL,VER,-90,-75,0,8475E-3)
 S R=""
 F I=1:1 S R=$O(@LIST@(R)) Q:R=""  D COL
 D REAF S OPTION=4
 S @HISTO@("ETAT")="4/ECRITURE GRAPHIQUE"
 S @HISTO@("ETAT",OPTION)=""
 G AFFMEN
 
COL 
 N X,Y,OBJ,REPERE
 S REPERE=@HISTO@("ENTITE")_","_R
 S X=$$^%QSCALVA("REPERE",REPERE,"ABSCISSE")
 S Y=$$^%QSCALVA("REPERE",REPERE,"ORDONNEE")
 S ANG=$$^%QSCALVA("REPERE",REPERE,"ORIENTATION")
 S X=$J(X*254E-2,1,1),Y=$J(Y*224E-2,1,1)
 S COMP=$$^%QSCALVA("REPERE",REPERE,"NOM.COMPOSANT")
 S OBJ=$$^%QSCALVA("ARTICLE",COMP,"GEOMETRIE")
 S DX=30,DY=10 X XY W "nombre d'objets graphiques : "_I
 D AJOBJ^%SDCCMS(COL,VER,I,OBJ,OBJ,X,Y,ANG,35E-3)
 Q
 
VISU 
 D CLEPAG^%VVIDEO,^%VZCDB("schema de donnees : "_MODEL,0)
 D CARSA^%VVIDEO(30,3,20,5)
 S DX=40-($L(REPP)\2),DY=5 X XY W REPP
 D CARSA^%VVIDEO(30,12,20,5)
 S DX=40-($L(REPF)\2),DY=14 X XY W REPF
 D G0ON^%VVIDEO
 S DY=4 X XY F DX=51:1:69 X XY W $$CARSPE^%VVIDEO("q")
 S DX=70,DY=4 X XY W $$CARSPE^%VVIDEO("k")
 S DX=70,DY=5 X XY W $$CARSPE^%VVIDEO("x")
 S DX=70,DY=6 X XY W $$CARSPE^%VVIDEO("j")
 S DY=6,DX=51 X XY W "<" F DX=52:1:69 X XY W $$CARSPE^%VVIDEO("q")
 S DY=7 F I=1:1:4 S DX=39,DY=DY+1 X XY W $$CARSPE^%VVIDEO("x")
 D G0OFF^%VVIDEO
 S DX=55,DY=3 X XY W LIENN
 S DX=42,DY=9 X XY W LIENH
 D ^%VZEAVT("")
 D REAF
 G AFFMEN
DESC 
 S DESC=$$CONCAS^%QZCHAD(TMP,"NEUTRAL") K @(DESC)
 
 S @DESC@("NATURE",1,1)=4
 S @DESC@("REPERE.CIRCUIT.IMPRIME",1,6)=10
 S @DESC@("NOM",1,12)=21
 S @DESC@("TYPE.COMPOSANT",1,23)=37
 S @DESC@("GEOMETRIE",1,39)=53
 S @DESC@("ABSCISSE",1,55)=60
 S @DESC@("ORDONNEE",1,62)=66
 S @DESC@("SURFACE.DE.LOCALISATION",1,68)=69
 S @DESC@("ORIENTATION",1,71)=75
 S @DESC@("GROUPE",1,77)=81
 S @DESC@("CARACTERISTIQUE",1,83)=92
 S @DESC@("TOLERANCE",1,94)=98
 S @DESC@("POWER.TYPE",1,100)=104
 
 Q
REAF 
 D CLEPAG^%VVIDEO
 D ^%VZCDB("passerelle  NEUTRAL_FILE",0)
 D POCLEPA^%VVIDEO,^%VZCDB("M W M informatique SA",22)
 S DX=0,DY=2 X XY W "etape : ",OPTION
 S DX=15,DY=10 X XY W "nom de l'entite : ",@HISTO@("ENTITE")
 Q

