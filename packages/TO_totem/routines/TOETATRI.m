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

;TOETATRI^INT^1^59547,74872^0
TOETATRI ;
 
 D KILL,CLEPAG^%VVIDEO S PAGE=0,DX=0,DY=10 X XY W $$^%QZCHW("Liste des triplets sur (E)cran ou (I)mprimante ? ") R *DEV S DEV=$C(DEV) G:(DEV'=$$^%QZCHW("E"))&(DEV'=$$^%QZCHW("I")) FIN S IMPR=$S(DEV=$$^%QZCHW("E"):0,1:^TABIDENT(WHOIS,"PRINTER"))
 W !,!,$$^%QZCHW("Triplets de l'article : ") S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN I '($D(^[QUI]VALITOLE(Y1))) W " ??? " H 2 G TOETATRI
 D ^%AB3STAR S ARTI=Y1,LILIM=$S(IMPR=0:20,1:47) O IMPR U IMPR
 D TETE
 S NOMTAB="^[QUI]VALITOLE(ARTI",ADR="OK^TOETATRI" D ^%VTENR
 G END
OK W !,"| ",B2,?26,"| ",B3,?55,"| ",B4,?79,"|"
 S LI=LI+1 I LI>LILIM D SUIT
 Q
END W !,LSTAR,! I IMPR=0,STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 C:IMPR'=0 IMPR D KILL Q
TETE I IMPR=0 D CLEPAG^%VVIDEO
 I IMPR'=0 W #
 W !,LSTAR,!,"|",?79,"|",!,"|" S PAGE=PAGE+1,MSG=$$^%QZCHW("Liste des triplets de ")_ARTI W $$^%QZCHW("| Page "),PAGE,?40-($L(MSG)\2),MSG,?65,$$^%QZCHW("le "),%DAT,?79,"|",!,"|",?79,"|",!,LSTAR,!,$$^%QZCHW("| Alliage "),?26,$$^%QZCHW("| Etat"),?55,$$^%QZCHW("| Norme"),?79,"|",!,LSTAR S LI=8
 G FIN
SUIT I IMPR'=0 G IMPR
 D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S STOP=1 D CLEPAG^%VVIDEO G FIN
IMPR D TETE G FIN
FIN Q
KILL I '(DTM) K (TACOMPIL,%PROGEX,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="TACOMPIL","%PROGEX","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 G FIN

