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

;%LXUC3^INT^1^59547,73871^0
LEXUC3 ;
 
 G:CONCUR'=1 ALORS
 S PRECO=^[QUI]PLEX("TOLEX",POSII)
 I $D(^[QUI]TOLEX(PRECO)) D POCLEPA^%VVIDEO W PCH,"=",PRECO H 1 G FIN
 I '($D(^[QUI]TOSYNONY(PRECO))) G REFUS
 S PRECOS=$N(^[QUI]TOSYNONY(PRECO,-1)) G:PRECOS=-1 REFUS D ^%VZEAVT(PCH_"="_PRECO_$$^%QZCHW(" est synonyme de ")_PRECOS_$$^%QZCHW(" ==> Substitution ")),^%VZEATT S CHN="",LPCH=$L(PCH) F UU=1:1:LPCH S CHN=CHN_" "
 S OPCH=PCH,LIBCPT=PRECOS D ^%LXBESTA S PRECOS=PCH,PCH=OPCH
 S ICC=IC,ORES=RESUL(IC),TAB(ICC)=CHN D ^%VAFFICH S TAB(ICC)=$S(CHP="P":PRECOS,1:$S(PCH=BRAQG:PRECOS_","_BRAQD,1:$P(ORES,",",1)_","_PRECOS)) D ^%VAFFICH G FIN
REFUS S REFUSE=1 G FIN
ALORS G:CONCUR=2 AMBI
UNKN G:CHP'="B" PARA
P1 D ^%VSQUEAK,POCLEPA^%VVIDEO W PCH,$$^%QZCHW("est inconnu ! Est-ce une valeur literale ? [O/N/(L)exique,(B)Cons.breve] ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&((REP'=$$^%QZCHW("N"))&((REP'=$$^%QZCHW("L"))&(REP'=$$^%QZCHW("B")))) P1
 G:REP=$$^%QZCHW("O") FIN
 S REFUSE=1 G:REP=$$^%QZCHW("L") LEX G:REP=$$^%QZCHW("B") BREV G FIN
PARA D ^%VSQUEAK,POCLEPA^%VVIDEO W PCH,$$^%QZCHW(" est inconnu ! Abreviation refusee (L)exique/(B)Cons.breve/[RETURN] ") R *RET S REFUSE=1,RET=$C(RET) G:RET=$$^%QZCHW("B") BREV G:RET=$$^%QZCHW("L") LEX G FIN
AMBI D ^%VZEAVT($$^%QZCHW("Veuillez etre plus precis ! ")_PCH_$$^%QZCHW(" est ambigu ")) S REFUSE=1 G FIN
FIN D POCLEPA^%VVIDEO Q
LEX D ^%LXUC7 G FIN
BREV S OICC=IC D ^%LXCONS,^%VAFIGRI,^%VAFISCR S ICC=OICC,CTRLF=0 G FIN

