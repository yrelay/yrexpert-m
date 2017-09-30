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

;TOP0JELB^INT^1^59547,74873^0
TOP0JELB ;
 
 D CLEPAG^%VVIDEO,ZD^%QMDATE4 S DEV="ECR",IMPR=0,DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="JOURNAL DES ERREURS DE LECTURE" D TO4^%VZCD
JR S DX=0,DY=6 D CLEBAS^%VVIDEO W "Jour de la recuperation (? Aide) : " S DX=$X D ^%VLEC G:CTRLA=1 FIN I Y1="?" D JOUR^TOP0AID1 G JR
 I Y1="" W %DAT S Y1=%DAT
 S DAAT=Y1,DATE=$P(DAAT,"/",3)_$P(DAAT,"/",2)_$P(DAAT,"/",1)
 I '($D(^[QUI]CLICHE(DATE))) D ^%VSQUEAK G JR
HR S DX=0,DY=7 D CLEBAS^%VVIDEO W "Heure de le recuperation (? Aide) : " S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" HR I Y1="?" D HEURE^TOP0AID1 G HR
 S HEUR=Y1,HOUR=$P(HEUR,"H",1)_"."_$P(HEUR,"H",2)
 I '($D(^[QUI]CLICHE(DATE,HOUR))) D ^%VSQUEAK G HR
LECSUP S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=12 X XY W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP) G:SUP=1 FIN G:(SUP'=69)&(SUP'=73) LECSUP
 I SUP=73,$D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 D CLEPAG^%VVIDEO,AFF
FIN K DOLARI,RET,DATE,PAGE,IMPR,HOUR,%DAT,DAAT,H,HEUR,CTRLA,DEV,DXG,DXD,DYH,DYB,MSG,Y1 Q
AFF S PAGE=1,NUCLI=-1,LG=0,DOLARI=0 O IMPR U IMPR G TESTEXI
AFFI F ERR=1:1 S NUCLI=$N(^[QUI]ERLECBD(DATE,HOUR,NUCLI)) Q:((NUCLI=-1)!(NUCLI="z"))!(NUCLI="STOP")  S NULG=-1 F ER=1:1 S NULG=$N(^[QUI]ERLECBD(DATE,HOUR,NUCLI,NULG)) Q:NULG=-1  S LG=LG+1 D AFF1
 I LG=0 W !,!,"TOUS LES CLICHES ONT ETE CORRECTEMENTS LUS"
 W ! I (IMPR=0)!(IMPR=DOLARI) D POCLEPA^%VVIDEO W "[RETURN] " R *RET
FINAFF C IMPR Q
TESTEXI W #,!,?10,WHOIS,?60,"Page : ",PAGE,!,!,?15,"*** Journal des erreurs de lecture de bandes ***"
 W !,!,?21,"Cliches recuperes le ",DAAT," a ",HEUR
 I '($D(^[QUI]ERLECBD(DATE,HOUR))) W !,!,"LA BANDE A PU ETRE LUE ENTIEREMENT ET SANS AUCUN PROBLEMES" G FINAFF
 I $D(^[QUI]ERLECBD(DATE,HOUR,"STOP")) W !,!,"LA BANDE N'A PU ETRE LUE ENTIEREMENT . La lecture s'est arretee au cliche No : ",^[QUI]ERLECBD(DATE,HOUR,"STOP") G AFFI
 W !,!,"LA BANDE A PU ETRE LUE ENTIEREMENT " G AFFI
AFF1 G:(LG#50)'=0 AFF12 W #,!,?10,WHOIS,?60,"Page : ",PAGE,!,!,?15,"*** Journal des erreurs de lecture de bandes ***"
 W !,!,?21,"Cliches recuperes le ",DAAT," a ",HEUR
AFF12 I (LG#20)=0,(IMPR=0)!(IMPR=DOLARI) D POCLEPA^%VVIDEO W "[RETURN] " R *RET
 I ER=1 W !,!,"Cliche No : ",NUCLI,!,?10,"Possibilite d'informations erronees a la ligne ",NULG Q
 W !,?10,"      ""            ""           ""          ""    ",NULG
 Q

