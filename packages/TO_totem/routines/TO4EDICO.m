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

;TO4EDICO^INT^1^59547,74871^0
TO4EDICO ;
 
 D ^%AB3STAR S DOLARI=$I,NIV=2,$ZT="",C1=$$^%QZCHW("IMPRIMANTE"),C2=$$^%QZCHW("ECRAN"),IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:3)
QU D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("VOULEZ VOUS LES RESULTATS SUR IMPRIMANTE OU ECRAN ? ") R *REP S REP=$C(REP) G:REP="" FIN S L=$L(REP) I (REP'=$E(C1,1,L))&(REP'=$E(C2,1,L)) G QU
 I $E(REP,1)=$$^%QZCHW("I") S DEV="IMPR",LILIM=55 O IMPR U IMPR W *-1,*23,#
 E  S DEV="ECR",LILIM=17 D CLEPAG^%VVIDEO
 W !,LSTAR,!,"|",?79,"|",!,"|",?20,$$^%QZCHW("Rappel des parametres"),!,"|",?79,"|"
 S NU=-1 F UU=0:0 S NU=$N(^V(DOLARI,YA,NU)) Q:NU=-1  I ^V(DOLARI,YA,NU)'="" W !,"|",?10,NU,?40," = ",^V(DOLARI,YA,NU)
 W !,"|",?79,"|",!,LSTAR,!,"|",?79,"|",!,"|",?20,$$^%QZCHW(" Rappel de la liste des parametres"),!,"|",?79,"|",!,"|"
 S NU=-1 F UU=1:1 S NU=$N(^TO4GEXPL(DOLARI,NU)) Q:NU=-1  W ?(((UU-1)#2)*40)+5,NU,$S(NU>9:"",1:" ")," : ",^TO4GEXPL(DOLARI,NU) I (UU#2)=0 W ?79,"|",!,"|"
 W ?79,"|",!,"|",?79,"|",!,LSTAR
ECR W !,"|",?79,"|",!,"|",?20,$$^%QZCHW("Solutions admissibles : "),?79,"|",!,"|",?79,"|" S NU=-1
 F UU=0:0 S NU=$N(^EQUIVAL(DOLARI,NU)) G:NU=-1 SUIT D ALORS
ALORS W !,"|"," *",NU," *",?10,$P($P(^EQUIVAL(DOLARI,NU),"^",1),"/",1),?79,"|",!,"|",?10,$$^%QZCHW("Etude de "),$P(^EQUIVAL(DOLARI,NU),"^",1),?79,"|",!,"|",?10,$$^%QZCHW("No :"),$P(^EQUIVAL(DOLARI,NU),"^",3),$$^%QZCHW(" Nbre de desaccords : "),$P(^EQUIVAL(DOLARI,NU),"^",2),?79,"|"
 D:$D(^DESACOR(DOLARI,NU)) EXP W !,"|",?79,"|" Q
SUIT W !,"|",?79,"|",!,LSTAR G END
EXP W !,"|",?10,$$^%QZCHW(" sur : "),?79,"|",! F VV=1:1 S VD=$P(^DESACOR(DOLARI,NU),"^",VV) Q:VD=""  W ?(((VV-1)#2)*40)+5,VD I (VV#2)=0 W ?79,"|",!,"|"
 W ?79,"|",!,"|",?79,"|" G FIN
END W *23,*-1,# C:DEV="IMPR" IMPR
 D POCLEPA^%VVIDEO W "RETURN" R *RET
CH D CLEPAG^%VVIDEO W !,!,?20,$$^%QZCHW("1 Reediton des resultats"),!,?20,$$^%QZCHW("2 Edition de l'etude choisie"),!,?20,$$^%QZCHW("3 Fin") D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'=1)&((REP'=2)&(REP'=3)) CH G @REP
1 G TO4EDICO
2 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Numero choisi : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) 3 I '($D(^EQUIVAL(DOLARI,Y1))) W $$^%QZCHW("Inconnu ! [RETURN] ") R *RET G 2
 S NUFA=$P(^EQUIVAL(DOLARI,Y1),"^",3) D ^TO3EDIRE G CH
3 Q
FIN Q

