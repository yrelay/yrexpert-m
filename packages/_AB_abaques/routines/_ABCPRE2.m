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

;%ABCPRE2^INT^1^59547,73864^0
%ABCPRE2 ;
 
 D KILL,CLEPAG^%VVIDEO S DOLARI=$I
 S PAGE=0,DX=0,DY=10 X XY W $$^%QZCHW("Resultats de la comprehension sur (E)cran ou (I)mprimante ? ") R *DEV:^TOZE($I,"ATTENTE")
 D TOUCHE^%INCCLAV(DEV,.DEV) G:DEV=-1 FIN
 S DEV=$C(DEV) G:(DEV'=$E($$^%QZCHW("Ecran")))&(DEV'=$E($$^%QZCHW("Imprimante"))) FIN S DEV=$S(DEV=$E($$^%QZCHW("Ecran")):"E",1:"I")
 S IMPR=$S(DEV="E":0,1:^TABIDENT(WHOIS,"PRINTER")),LILIM=$S(IMPR=0:20,1:47) O IMPR U IMPR
 D TETE
 S %STOP=0,PGEC=-1 F UU=0:0 Q:%STOP=1  S PGEC=$N(^TACOMPIL(DOLARI,PGEC)) Q:PGEC=-1  S LIG=-1 F VV=0:0 S LIG=$N(^TACOMPIL(DOLARI,PGEC,LIG)) Q:LIG=-1  D COMPR Q:%STOP=1
END I IMPR=0,%STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET:^TOZE($I,"ATTENTE")
 C:IMPR'=0 IMPR D KILL Q
COMPR S RGR=^TACOMPIL(DOLARI,PGEC,LIG),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR,! S LI=LI+2 I LI>LILIM D SUIT G:%STOP=1 FIN
 S QUW=$S(TYPGR="(P)":QUI,1:%UCI) I $D(^[QUW]TIMCPGR(NOMG,NORM,IDENT)) S RDCP=^[QUW]TIMCPGR(NOMG,NORM,IDENT),DAT=$P(RDCP,"^",1),HD=$P(RDCP,"^",2),HF=$P(RDCP,"^",3),RH=$$^%QZCHW("Derniere comprehension le ")_DAT_$$^%QZCHW(" de ")_HD_$$^%QZCHW(" a ")_HF G WR
 S RH=$$^%QZCHW("Derniere comprehension le ????")
WR W !,?10,RH S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 W ! S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 S %TAB="^[QUW]GRILEROR("""_NOMG_""","""_NORM_""","""_IDENT_""")" I $D(@%TAB) G DETAIL
 W !,?10,$$^%QZCHW("Pas d'anomalie detectee a ce jour"),! S LI=LI+2 I LI>LILIM D SUIT G:%STOP=1 FIN
 G FIN
DETAIL S %ERROR=-1 W !,?15,$$^%QZCHW("* Erreurs *"),?40,$$^%QZCHW("* Pages *"),?65,$$^%QZCHW("* Colonnes *") S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 W ! S LI=LI+1 I LI>LILIM D SUIT G:%STOP=1 FIN
 F %UU=0:0 S %ERROR=$N(@%TAB@(%ERROR)) Q:%ERROR=-1  D LIST G:%STOP=1 FIN
 W ! S LI=LI+1 I LI>LILIM D SUIT
 G FIN
LIST S PCH=%ERROR D TO^%QZNBN1 I ISNUM G LISTS
 W !,?10,%ERROR,$$^%QZCHW(" est "),@%TAB@(%ERROR) S LI=LI+1 I LI>LILIM D SUIT
 G FIN
LISTS S PGE=$P(@%TAB@(%ERROR),"^",1),COL=$P(@%TAB@(%ERROR),"^",2),ERREUR=$P(@%TAB@(%ERROR),"^",3) W !,?10,ERREUR,?42,PGE,?69,COL S LI=LI+1 I LI>LILIM D SUIT
 G FIN
TETE I IMPR=0 D CLEPAG^%VVIDEO
 I IMPR'=0 W #
 S PAGE=PAGE+1,MSG=$$^%QZCHW("- Resultats de la comprehension d'abaques -") W $$^%QZCHW("Page "),PAGE,?40-($L(MSG)\2),MSG,?68,%DAT,!,!,! S LI=5
 G FIN
SUIT I IMPR'=0 G IMPR
 D POCLEPA^%VVIDEO W $$L2^%QSLIB
 R *REP:^TOZE($I,"ATTENTE") D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S %STOP=1 D CLEPAG^%VVIDEO G FIN
IMPR D TETE G FIN
FIN Q
KILL I '(DTM) K (TACOMPIL,%PROGEX,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="TACOMPIL","%PROGEX","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 G FIN

