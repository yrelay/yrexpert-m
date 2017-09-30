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

;TORESTYL^INT^1^59547,74875^0
TORESTYL ;
 
 S TIT=$$^%QZCHW("Interpretation fiche par fiche du SF") D ^TOGETART
 G:'($D(^TACOMPIL($I))) FIN S DOLARI=$I
 D CLEPAG^%VVIDEO S PAGE=0,DX=10,DY=10 X XY
 
 W $$^%QZCHW("Resultats sur ") S DEV=$$^%VZESOR("E") G:(DEV'=0)&(DEV'=1) FIN
 S DEV=$S(DEV=0:"E",1:"I")
 S IMPR=$S(DEV="E":0,1:^TABIDENT(WHOIS,"PRINTER")),LILIM=$S(IMPR=0:21,1:47) O IMPR U IMPR
 D ^%AB3STAR S %STOP=0,NARTI=-1
 F UU=0:0 Q:%STOP=1  S NARTI=$N(^TACOMPIL(DOLARI,NARTI)) Q:NARTI=-1  S ARTI=^TACOMPIL(DOLARI,NARTI) D COMPR Q:%STOP=1
END I IMPR=0,%STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 C:IMPR'=0 IMPR Q
COMPR S BEG=1 D TETE S GRIL=-1
 F UU=0:0 Q:%STOP=1  S GRIL=$N(^[QUI]REPFICH(ARTI,GRIL)) G:GRIL=-1 END D TYPFIC G:%STOP=1 END S FIC=-1 F UU=0:0 S FIC=$N(^[QUI]REPFICH(ARTI,GRIL,FIC)) Q:FIC=-1  S NUFICH=^[QUI]REPFICH(ARTI,GRIL,FIC) D TLIB G:%STOP=1 END
TLIB I (FIC["$ARG")!((FIC["%VALA")!(FIC["%ARGI")) G FIN
 I '($D(^[QUI]TYPLIB(ARTI,NUFICH))) G FIN
 D CADRE G:%STOP=1 FIN
 S LIB=-1 F VV=1:1 S LIB=$N(^[QUI]TYPLIB(ARTI,NUFICH,LIB)) Q:LIB=-1  S TYP=^[QUI]TYPLIB(ARTI,NUFICH,LIB) D TYPLIB Q:%STOP=1
 I %STOP'=1 W !,LSTAR S LI=LI+1 I LI>LILIM D SUIT
 G FIN
TYPFIC W ! S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 S MSG="*** "_GRIL_" ***" W !,?40-($L(MSG)\2),MSG I LI>LILIM D SUIT G:%STOP=1 FIN
 W ! S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 G FIN
 
TETE I IMPR=0 D CLEPAG^%VVIDEO
 I IMPR'=0 W #
 S PAGE=PAGE+1,MSG=$$^%QZCHW("- Comprehension de ")_ARTI_$S(BEG=1:"",1:$$^%QZCHW(" (suite)"))_" _" W $$^%QZCHW("Page "),PAGE,?40-($L(MSG)\2),MSG,?65,$$^%QZCHW("le ") D ZD^%QMDATE4 W %DAT,!,! S LI=3
 I $D(^[QUI]TIMCOMP(ARTI)) S DAT=$N(^[QUI]TIMCOMP(ARTI,-1)),RDCP=^[QUI]TIMCOMP(ARTI,DAT),HD=$P(RDCP,"^",1),HF=$P(RDCP,"^",2),RH=$$^%QZCHW("Derniere comprehension le ")_DAT_$$^%QZCHW(" de ")_HD_$$^%QZCHW(" a ")_HF G WR
 S RH=$$^%QZCHW("Derniere comprehension le ????")
WR I BEG=0 G FIN
 W !,?10,RH,!,! S LI=6,BEG=0 Q
 
SUIT I IMPR'=0 H 5 G IMPR
 D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S %STOP=1 D CLEPAG^%VVIDEO G FIN
IMPR D TETE G FIN
FIN Q
KILL I '(DTM) K (TACOMPIL,%PROGEX,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="TACOMPIL","%PROGEX","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
 
CADRE S LIM=LI+5 I LIM>LILIM K LIM D SUIT G:%STOP=1 FIN
 K LIM W !,!,LSTAR,!,"| ",$E(FIC,1,45),?48,$$^%QZCHW("| Obj."),?55,$$^%QZCHW("| Para."),?63,$$^%QZCHW("| Cte"),?69,$$^%QZCHW("| Inconnu"),?79,"|",!,"| ",$E(FIC,46,599)," (",NUFICH,")",?48,"|",?55,"|",?63,"|",?69,"|",?79,"|",!,LSTAR
 S LI=LI+5 I LI>LILIM D SUIT
 G FIN
TYPLIB I (LIB["%VALAB")!(LIB["%ARGIN") G FIN
 I LIB'["$ARG" D AFFTYP G FIN
 D ^TOFICARG
 Q
AFFTYP W !,"| ",LIB S M=$S(TYP="UP":"param",1:"+"),T=$E(TYP,1) W ?48,"|",?51,$S(T="O":M,1:""),?55,"|",?59,$S(T="P":M,1:""),?63,"|",?66,$S(T="C":M,1:""),?69,"|",?73,$S(T="U":M,1:""),?79,"|"
 S LI=LI+1 I LI>LILIM D SUIT
 G FIN

