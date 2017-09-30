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

;LKBRPMN^INT^1^59547,74867^0
LKBRPMN ;
 
 
 
 
 
 N WHOIS,QUI,Y1,CTRLA,CTRLF,CTRLI,CTRLP,CTRLD,CTRLH,Y,X,%R,CTR,TMP,DESC
 N OPTION,REPP,REPF,PERE,LIEN,HISTO,LIENN,LIENH,ETAT,DATE,LIST,SUPP
 N ENTITE
 S OPTION=0
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMP)
 S HISTO="^[QUI]RQSDON(""LKBRP"")"
DEB D CURRENT^%IS,VARSYS^%QCSAP,CLEPAG^%VVIDEO
 D POCLEPA^%VVIDEO,^%VZCDB("M W M informatique SA",22)
 K Y1 S DX=0,DY=0 X XY W "nom du service : " S DX=$X D ^%VLEC
 I ((Y1="")!CTRLA)!CTRLF D CLEPAG^%VVIDEO,^%VCLEVAR Q
 I '($D(^TABIDENT(Y1))) D ^%VZEAVT("service inconnu") G DEB
 S WHOIS=Y1,QUI=^TABIDENT(WHOIS,"MACHINE")
 D DESC
AFFPAS 
 D CLEPAG^%VVIDEO
 D ^%VZCDB("service ----> "_WHOIS,0)
 D POCLEPA^%VVIDEO,^%VZCDB("M W M informatique SA",22)
 D CARSA^%VVIDEO(26,8,28,3) S DX=28,DY=9 X XY W "PASSERELLE  NEUTRAL_FILE"
 S DX=0,DY=0 X XY R *R
 
 
 
 I '($D(@HISTO)) G CONFIG
 D CLEPAG^%VVIDEO
 D ^%VZEAVT("la derniere passerelle activee n'a pas ete achevee")
 D ^%VZCDB("passerelle  NEUTRAL_FILE",0)
 D ^%VZCDB("etat de la derniere passerelle",2)
 S ENTITE=@HISTO@("ENTITE")
 S DATE=@HISTO@("DATE")
 S ETAT=@HISTO@("ETAT")
 S REPP=@HISTO@("REPERTOIRE.NOMENCLATURE")
 S REPF=@HISTO@("REPERTOIRE.REPERE")
 S SUPP=@HISTO@("SUPPRESSION")
 S LIENN=@HISTO@("LIEN.NOMENCLATURE")
 S LIENH=@HISTO@("LIEN.HIERARCHIQUE")
 S MODEL=@HISTO@("SCHEMA.DONNEES")
 S DX=10,DY=3 X XY W "entite : ",ENTITE
 S DX=10,DY=DY+2 X XY W "date de la passerelle : ",$$TEMPSNO^%QMDATE(DATE)
 S DX=10,DY=DY+2 X XY W "etat de la passerelle : ",$P(ETAT,"/",2)
 D ^%VZCDB("parametres de la passerelle",9) S DY=DY+2
 S DX=10,DY=DY+2 X XY W "repertoire de nomenclature : ",REPP
 S DX=10,DY=DY+2 X XY W "repertoire des reperes : ",REPF
 S DX=10,DY=DY+2 X XY W "suppression du repertoire de nomenclature : ",$S(SUPP:"OUI",1:"NON")
CHOIX K Y
 S %R=22,Y="10\CBLDH\2\\\reprise historique,suppression historique"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G DEB
 G:CTR'="" CHOIX
 I X=2 K @(HISTO),ENTITE,DATE,ETAT G CONFIG
 I X'=1 G CHOIX
 S OPTION=$P(ETAT,"/")
 G FDEB
 
CONFIG 
 K REPP,REPF,SUPP,MODEL
 D CLEPAG^%VVIDEO
 D ^%VZCDB("service ----> "_WHOIS,0)
 D POCLEPA^%VVIDEO,^%VZCDB("M W M informatique SA",22)
 S DX=10,DY=3 X XY W "nom du schema de donnees : " S DX=$X D ^%VLEC
 I ((Y1="")!CTRLA)!CTRLF D CLEPAG^%VVIDEO G DEB
 S MODEL=Y1
 I $$MODEL^%QSMODEL'=MODEL D ^%VZEAVT("schema de donnees non installe") G CONFIG
CONFIG1 
 S DY=6 D CLEBAS^%VVIDEO
 S DX=10,DY=6 X XY W "nom du repertoire de la nomenclature  : " S DX=$X D ^%VLEC
 I ((Y1="")!CTRLA)!CTRLF D CLEPAG^%VVIDEO G CONFIG
 S REPP=Y1
 I $$REPM^%QSGEST9(REPP)=0 D ^%VZEAVT("repertoire inconnu") G CONFIG1
 D LIEN^%QSGEST9($$NOMINT^%QSF(REPP),"LIEN")
 S LIENN=""
 F I=0:0 S LIENN=$O(LIEN(LIENN)) Q:LIENN=""  Q:LIEN(LIENN)=4
 I LIENN="" D ^%VZEAVT("lien involutif indefini") G CONFIG
CONFIG2 
 S DY=9 D CLEBAS^%VVIDEO
 S DX=10,DY=9 X XY W "nom du repertoire des reperes : " S DX=$X D ^%VLEC
 I ((Y1="")!CTRLA)!CTRLF D CLEPAG^%VVIDEO G CONFIG
 S REPF=Y1
 I $$REPM^%QSGEST9(REPF)=0 D ^%VZEAVT("repertoire inconnu") G CONFIG2
 D PEREFILS^%QSGEL2($$NOMINT^%QSF(REPF),.PERE,.LIENH)
 I $$NOMLOG^%QSF(PERE)'=REPP D ^%VZEAVT(REPP_" n'est pas un repertoire pere de "_REPF) G CONFIG2
CONFIG3 K Y
 S DX=0,DY=22 X XY W "supression du repertoire "_REPP_" avant execution"
 S %R=22,Y="60\CBLDH\2\\\non,oui"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") CONFIG3
 G:CTR'="" CONFIG
 I X=1 S SUPP=0 G CONFIG4
 I X=2 S SUPP=1 G CONFIG4
 G CONFIG3
 
CONFIG4 
 S @HISTO@("REPERTOIRE.NOMENCLATURE")=REPP
 S @HISTO@("REPERTOIRE.REPERE")=REPF
 S @HISTO@("LIEN.NOMENCLATURE")=LIENN
 S @HISTO@("LIEN.HIERARCHIQUE")=LIENH
 S @HISTO@("SCHEMA.DONNEES")=MODEL
 S @HISTO@("DATE")=""
 S @HISTO@("ETAT")=0
 S @HISTO@("SUPPRESSION")=SUPP
FDEB 
 D CLEPAG^%VVIDEO
 D ^%VZCDB("passerelle  NEUTRAL_FILE",0)
 D POCLEPA^%VVIDEO,^%VZCDB("M W M informatique SA",22)
 S DX=15,DY=10 X XY W "nom de l'entite : "
 S DX=$X I $D(ENTITE) X XY W ENTITE D ^%VZEAVT("") G FDEB1
 D ^%VLEC
 I ((Y1="")!CTRLA)!CTRLF D CLEPAG^%VVIDEO G DEB
FDEB1 S @HISTO@("ENTITE")=Y1
 D AFFMEN^LKBRPM2
 I OPTION'>1 K @(HISTO)
 S OK=1 F I=1:1:4 I '($D(@HISTO@("ETAT",I))) S OK=0
 I OK K @(HISTO)
 G DEB
 
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
 Q
TEST 
 S ^[QUI]RQSDON("LKBRP","ENTITE")="ESSAI"
 S ^[QUI]RQSDON("LKBRP","DATE")=$H
 S ^[QUI]RQSDON("LKBRP","ETAT")="1/LECTURE"
 Q
KILL K ^[QUI]RQSDON("LKBRP") Q

