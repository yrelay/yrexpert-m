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

;%MZHLPC^INT^1^59547,73872^0
MOZHLPD ;
 
 D CLEPAG^%VVIDEO S T="Explications detaillees",DX=40-($L(T)\2),DY=0 X XY D REV^%VVIDEO W T D NORM^%VVIDEO
 
 S %STOP=0,DX=15,DY=3,%FIN=0,DX=$X-1 X XY W " ",! F I=1:1 S AA=$T(FUN+I) Q:AA=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6),CHOI=$P(AA,";",2) F TP=1:1:3 D:TP=2 ECR2 D:TP=3 ECR3 D:TP=1 ECR1
 I %STOP'=1 S %FIN=1 D ALORS
 G FIN
ALORS D POCLEPA^%VVIDEO I %FIN=0 W $$L2^%QSLIB R *REP S:REP=1 %STOP=1 S DX=0,DY=3 D CLEBAS^%VVIDEO G FIN
 W "Fin de liste. [RETURN] pour retour a la gamme" R *RET
FIN Q
ECR1 S DX=0 X XY W $P(CHOI,"#",TP) Q
ECR2 S DX=$X X XY
 D:$$TABID^%INCOIN("TYPECR")'="EGA" REV^%VVIDEO
 D:$$TABID^%INCOIN("TYPECR")="EGA" BLD+1^%VVIDEO
 W $P(CHOI,"#",TP) D NORM^%VVIDEO Q
ECR3 S DX=$X W $P(CHOI,"#",TP) S DY=DY+1 Q
FUN 
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;

