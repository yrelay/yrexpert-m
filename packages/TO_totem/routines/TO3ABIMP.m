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

;TO3ABIMP^INT^1^59547,74869^0
TO3ABIMP ;
 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant svp...")
 S PAR1=FRESU(4),PAR2=FRESU(5),PAR3=FRESU(6),PAR4=FRESU(7),ART=FRESU(1),PARA=FRESU(2),NUM=FRESU(3)
 F LIG=8:5:43 D TRAIT
 K PAR1,PAR2,PAR3,PAR4,ART,NUM,PARA,EXP,VPAR,LIG,NP,VPC,REFUSE,OP D POCLEPA^%VVIDEO Q
TRAIT S EXP="^",VPAR=FRESU(LIG+4) Q:VPAR=""
 F NP=1:1:4 I @("PAR"_NP)'="" S VPC=FRESU((LIG+NP)-1) I VPC'="" D GPARA I REFUSE=0 S EXP=EXP_@("PAR"_NP)_"^"_OP_"^"_VAL_"^"_$$^%QZCHW("ET")_"^"
 S EXP=$E(EXP,1,$L(EXP)-4),$P(EXP,"^",18)=VPAR,^[QUI]FLIMPLI(ART,PARA,"G"_NUM_"."_(((LIG-8)\5)+1))=EXP
FIN Q
GPARA S REFUSE=1 F OP="<",">","'<","'>","=","'=","[]" I VPC[OP,$E(VPC,1,$L(OP))=OP S VAL=$E(VPC,$L(OP)+1,299),REFUSE=0 G FIN
 G FIN

