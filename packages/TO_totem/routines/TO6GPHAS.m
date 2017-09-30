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

;TO6GPHAS^INT^1^59547,74871^0
TO6GPHAS ;
 
 K ^POSENR($I) S %ABAND=0,LILIM=17,TWREF=0,%FIN=0,DT=0,PT=0,INCO="       ??",P="^[QUI]PHAS(NUFA,TWREF)"
 D CLEPAG^%VVIDEO
LOOP 
 W !,LOSTAR,!,"|",?10,$$^%QZCHW("Gamme de fabrication definie pour : "),?131,"|",!,"|",?131,"|",!,"|",?10,TOID,?131,"|",!,LOSTAR
 W !,"|",?3,$$^%QZCHW("No"),?10,$$^%QZCHW("Machines"),?25,$$^%QZCHW("Operations"),?52,$$^%QZCHW("Consignes-Outillages"),?90,$$^%QZCHW("Temps"),?105,$$^%QZCHW("Couts"),?131,"|",!,LOSTAR S LI=$Y
 I '($D(@P)) S DEBP=$Y+1 G SUIT
 S N=-1,DEBP=$Y F I=1:1 S N=$N(^[QUI]PHAS(NUFA,TWREF,N)) G:N=-1 FIN D XXX
XXX W !,"|",?2,N,?10,$E(^[QUI]SECT(NUFA,TWREF,^[QUI]PHAS(NUFA,TWREF,N)),1,18),?30,$E($P(^[QUI]PHAS(NUFA,TWREF,N),"/",1),1,23) D CUTU S PY=$Y D REPER S LI=LI+1 I LI>LILIM D SUIT G:%ABAND=1 END
 Q
CUTU S CT=$S($D(^[QUI]COUT(NUFA,TWREF,@P@(N))):$J(^[QUI]COUT(NUFA,TWREF,@P@(N)),9,2),1:INCO),CT=$$GETLBLAN^%VTLBLAN(CT)
 S TE=$S($D(^[QUI]DUREE(NUFA,TWREF,@P@(N))):$J(^[QUI]DUREE(NUFA,TWREF,@P@(N)),9,2),1:INCO),TE=$$GETLBLAN^%VTLBLAN(TE)
 S CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):$E(^[QUI]CONS(NUFA,TWREF,@P@(N)),1,42),1:"------")
 S:$D(^[QUI]DUREE(NUFA,TWREF,@P@(N))) DT=DT+^[QUI]DUREE(NUFA,TWREF,@P@(N)) S:$D(^[QUI]COUT(NUFA,TWREF,@P@(N))) PT=PT+^[QUI]COUT(NUFA,TWREF,@P@(N)) W ?54,CIG,?98,TE,?110,CT,?131,"|" Q
FIN S %FIN=1 G SUIT W !,LOSTAR D 80^%VVIDEO Q
 
FIN1 G SUIT
 
FIN2 Q
SUIT D POCLEPA^%VVIDEO W $$L18^%QSLIB1("(A)cces a la modification") R *RET D TOUCHE^%INCCLAV(RET,.RET)
 I $C(RET)=$$^%QZCHW("A") D ^TO3GMODP G SUIT
 I RET=1 S %ABAND=1,STOP=1 Q
 D CLEPAG^%VVIDEO Q:%FIN=1  W !,$$^%QZCHW("Suite de la gamme de fabrication proposee pour :"),!,?5,TOID,!,! S (DEBP,LI)=$Y K ^POSENR($I) Q
REPER S ^POSENR($I,PY,2)=N,^POSENR($I,PY,10)=^[QUI]SECT(NUFA,TWREF,^[QUI]PHAS(NUFA,TWREF,N)),^POSENR($I,PY,30)=$P(^[QUI]PHAS(NUFA,TWREF,N),"/",1) S:CIG'="" ^POSENR($I,PY,54)=CIG
 S ^POSENR($I,PY,98)=TE,^POSENR($I,PY,110)=CT,^POSENR($I,PY)=N_"^"_^POSENR($I,PY,10)_"^"_^POSENR($I,PY,30)_"^"_CIG_"^"_TE_"^"_CT Q
END Q

