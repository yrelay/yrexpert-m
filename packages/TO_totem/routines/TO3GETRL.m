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

;TO3GETRL^INT^1^59547,74870^0
TO3GETRL ;
 
 D GETCOMP S %PSUP=0,CCO=-1,NU=1 F UU=0:0 S CCO=$N(^COMPNO2($I,XART,CCO)) Q:CCO=-1  S YA=CCO D SUI
FIN K ^COMPNO2($I,XART),CCO,NU,MB,NN,NA,MM,NAMB Q
SUI S NA=-1 F NN=0:0 S NA=$N(^[QUI]REFLATER(YA,NA)) Q:NA=-1  I '($D(^PHASADM($I,NUFA,"COMP","NOK",NA))),YA'=NA S DY=22 D CLEBAS^%VVIDEO S DX=5,DY=22 X XY W $$^%QZCHW("L'analyse de "),YA,$$^%QZCHW(" depend de "),NA S MB=-1 D SUITE
 K %ETU S DY=22 D CLEBAS^%VVIDEO Q
SUITE F MM=0:0 S MB=$N(^[QUI]REFLATER(YA,NA,MB)) Q:MB=-1  I ('($D(^V($I,NA,MB))))&('($D(^AIGNOR($I,NA,MB)))) D S1
 Q
S1 G:BATCH=0 S2 Q
S2 D POCLEPA^%VVIDEO W MB,$$^%QZCHW(" de "),NA," : " R NAMB S ^V($I,NA,MB)=NAMB,%PSUP=1,%ETU=-1 F TT=0:0 S %ETU=$N(TREETUD(%ETU)) Q:%ETU=-1  S ^[QUI]PAREFLAT(%ETU,NA,MB)=^V($I,NA,MB)
 Q
GETCOMP K ^COMPNO2($I,XART) S ADR="TRAIT^TO3GETRL",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1
 Q
TRAIT S DATACOUR=@NOM,COMP=$P(DATACOUR,"^",1),^COMPNO2($I,XART,COMP)=1
 Q

