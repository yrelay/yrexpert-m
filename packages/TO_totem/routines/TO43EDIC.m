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

;TO43EDIC^INT^1^59547,74871^0
TO43EDIC ;
 
 D ^%AB3STAR S DOLARI=$I,NIV=2,$ZT="",C1=$$^%QZCHW("IMPRIMANTE"),C2=$$^%QZCHW("ECRAN"),IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
QU D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("VOULEZ VOUS LES RESULTATS SUR IMPRIMANTE OU ECRAN ? ") R *REP S REP=$C(REP) G:REP="" FIN S L=$L(REP) I (REP'=$E(C1,1,L))&(REP'=$E(C2,1,L)) G QU
 I $E(REP,1)=$$^%QZCHW("I") S DEV="IMPR",LILIM=55 O IMPR U IMPR W *-1,*23,#
 E  S IMPR=0,DEV="ECR",LILIM=16 D CLEPAG^%VVIDEO
 D ^TO43PEDC I '($D(^POSENR(DOLARI))) U 0 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("AUCUN RESULTATS ") H 2 G END
 S NBPAG=$S($D(^POSENR(DOLARI,PAGE)):PAGE,1:PAGE-1),ADREL=$E(REP,1) G @ADREL
I U 0 S DX=0,DY=10 D CLEBAS^%VVIDEO W $$^%QZCHW("IMPRESSION EN COURS") D ZD^%QMDATE4,^%QMDAK0
 F PAGE=1:1 H 5 D:PAGE'=1 FINPAG Q:'($D(^POSENR(DOLARI,PAGE)))  S MSGE=$P(^POSENR(DOLARI,PAGE,1),"^",1) D DEBPAG F LG=1:1:LILIM Q:'($D(^POSENR(DOLARI,PAGE,LG)))  S PARAM=^POSENR(DOLARI,PAGE,LG) D INTPAG
 G END
E S (OPAGE,PAGE)=1 G AFFPAG
LECSUI D POCLEPA^%VVIDEO W $$L17^%QSLIB1("") S DX=$X,DY=$Y D ^%VLEC G END:(CTRLA=1)!(CTRLF=1),61:(Y1="+")!(Y1="="),45:Y1="-" S PCH=Y1 D TO^%QZNBN1 I ISNUM=0 G LECSUI
 S OPAGE=PAGE,PAGE=PCH G AFFPAG
61 S OPAGE=PAGE,PAGE=PAGE+1 G AFFPAG
45 S OPAGE=PAGE,PAGE=PAGE-1 G AFFPAG
AFFPAG I '($D(^POSENR(DOLARI,PAGE))) D ^%VSQUEAK S PAGE=OPAGE G LECSUI
 D CLEPAG^%VVIDEO S PAG=$$^%QZCHW("Page : ")_PAGE_"/"_NBPAG W ?40-($L(PAG)\2),PAG,!
 S MSGE=$P(^POSENR(DOLARI,PAGE,1),"^",1) D DEBPA1 F LG=1:1 Q:'($D(^POSENR(DOLARI,PAGE,LG)))  S PARAM=^POSENR(DOLARI,PAGE,LG) D INTPAG
 D FINPAG G LECSUI
DEBPAG U IMPR W #,!,?2,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,?68,$$^%QZCHW("Page : "),PAGE,!
DEBPA1 I MSGE=$$^%QZCHW("PARAMETRE") U IMPR W LSTAR,!,"|",?79,"|",!,"|",?20,$$^%QZCHW("Rappel des parametres"),?79,"|",!,"|",?79,"|" Q
 I MSGE=$$^%QZCHW("LISTE") U IMPR W LSTAR,!,"|",?79,"|",!,"|",?20,$$^%QZCHW(" Rappel de la liste des parametres"),?79,"|",!,"|",?79,"|" Q
 U IMPR W LSTAR,!,"|",?79,"|",!,"|",?20,$$^%QZCHW("Solutions admissibles : "),?79,"|",!,"|",?79,"|" Q
 
INTPAG S MSGE=$P(PARAM,"^",1)
 I MSGE=$$^%QZCHW("PARAMETRE") U IMPR W !,"|",?10,$P(PARAM,"^",2),?40," = ",$P(PARAM,"^",3),?79,"|" Q
 I MSGE=$$^%QZCHW("LISTE") U IMPR W !,"|",?5,$P(PARAM,"^",2),?45,$P(PARAM,"^",3),?79,"|" Q
 I MSGE=$$^%QZCHW("DESACCORD") U IMPR W !,"|",?10,$$^%QZCHW(" sur : "),$P(PARAM,"^",2),?45,$P(PARAM,"^",3),?79,"|" Q
 I MSGE=$$^%QZCHW("SOLUTION1") U IMPR W !,"|"," * ",$P(PARAM,"^",2)," *",?10,$P(PARAM,"^",3),?79,"|" Q
 I MSGE=$$^%QZCHW("SOLUTION2") S PARAM=^POSENR(DOLARI,PAGE,LG) U IMPR W !,"|",?10,$$^%QZCHW("Etude de "),$P(PARAM,"^",2),?79,"|" Q
 S PARAM=^POSENR(DOLARI,PAGE,LG) U IMPR W !,"|",?10,$$^%QZCHW("No :"),$P(PARAM,"^",2),$$^%QZCHW(" Nbre de desaccords : "),$P(PARAM,"^",3),?79,"|"
 Q
FINPAG U IMPR W !,"|",?79,"|",!,LSTAR,!
 Q
END U IMPR W *23,*-1,# C:DEV="IMPR" IMPR
CH D CLEPAG^%VVIDEO W !,!,?20,$$^%QZCHW("1 Reediton des resultats"),!,?20,$$^%QZCHW("2 Edition de l'etude choisie"),!,?20,$$^%QZCHW("3 Fin") D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'=1)&((REP'=2)&(REP'=3)) CH G @REP
1 G TO43EDIC
2 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Numero choisi : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) 3 I '($D(^EQUIVAL(DOLARI,Y1))) W $$^%QZCHW("Inconnu ! [RETURN] ") R *RET G 2
 S NUFA=$P(^EQUIVAL(DOLARI,Y1),"^",3) D ^TO3EDIRE G CH
3 Q
FIN Q

