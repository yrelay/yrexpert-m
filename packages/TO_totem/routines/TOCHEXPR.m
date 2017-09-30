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

;TOCHEXPR^INT^1^59547,74871^0
TOCHEXPR ;
 
 S %TBL="^[QUI]EXPRLONG",%R=""""_ARTI_"""" F %U=2:1:NCLE S %R=%R_","""_@("WB"_%U)_""""
 S %TBL=%TBL_"("_%R_","_%NU_")",NPAR=0,ADRF="TRAIT1^TOCHEXPR",XDP="("_XDP_")" D ^TOGSQUEL,RECONS^TOGSQUEL S @%TBL@(0)=EX
FIN K ADRF,EX,VPOL,T,LOCA,NPAR,%U,%R,%II,BL,PCH Q
TRAIT1 S PCH=VPOL(VI) D TO^%QZNBN1 Q:ISNUM  S NPAR=NPAR+1,@%TBL@(NPAR)=VPOL(VI),VPOL(VI)="T("_NPAR_")" Q
GET S %ERR=0,$ZT="ERR" K T S NPAR=0 F %II=1:1 S NPAR=$N(@%TBL@(NPAR)) Q:NPAR=-1  S @("BL="_@%TBL@(NPAR)),@("T("_NPAR_")")=BL
 S EX=@%TBL@(0),@("RES1="_EX) G FIN
 
TEST S NCLE=0,ARTI="TEST.ESSAI",%NU=1
 W !,$$^%QZCHW("Expression a traiter : ") R XDP Q:$A(XDP)<32
 D TOCHEXPR,GET W !,"    ===> ",RES1 K ^[QUI]EXPRLONG(ARTI),ARTI,%TBL,RES1,BL G TEST
 
ERR S %ERR=1 G FIN

