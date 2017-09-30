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

;TO3GRLAT^INT^1^59547,74870^0
TO3GRLAT ;
 
SUI S NA=-1,NU=1 F NN=0:0 S NA=$N(^[QUI]REFLATER(YA,NA)) Q:NA=-1  I '($D(^COMPNOM($I,XART,NA))) D IND I '(OK) S DY=22 D CLEBAS^%VVIDEO S DX=5,DY=22 X XY W $$^%QZCHW("L'analyse de "),YA," depend de ",NA S MB=-1 D SUITE
FIN S DY=22 D CLEBAS^%VVIDEO K NAMB,MB,MM,NA,NN Q
SUITE F MM=0:0 S MB=$N(^[QUI]REFLATER(YA,NA,MB)) Q:MB=-1  I ('($D(^V($I,NA,MB))))&('($D(^AIGNOR($I,NA,MB)))) D S1
 Q
S1 G:BATCH=0 S2 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Parametres indefinies"),^CSTEST($I,"UNDEF",MB_$$^%QZCHW(" de ")_NA)=1 Q
S2 D POCLEPA^%VVIDEO W MB,$$^%QZCHW(" de "),NA," : " R NAMB S ^V($I,NA,MB)=NAMB,^[QUI]PAREFLAT(NUFA,NA,MB)=^V($I,NA,MB)
 Q
IND S OK=0 G FIND:NA'["." S NBP=$L(NA,".")-1 F %UX=NBP:-1:1 S NA1=$P(NA,".",1,%UX)_"~",NA2=$N(^COMPNOM($I,XART,NA1)) I $E(NA2,1,$L(NA1))=NA1 S OK=1 G FIND
FIND Q

