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

;TOPHASUD^INT^1^59547,74874^0
TOPHASUD ;
 
 Q:'($D(^[QUI]USINART(YA)))  D SAVE,^TOSEEUAR,^TOREAUS5
COMPR D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^TOPHASUP
 
FIN D RES,CLEPAG^%VVIDEO,^TOTCADRE,^TO3WNUFA K REF1,^AFFPAG($I),^DEJAVU($I),ARAP,MUN,%PP,%NN,LG,PAGE Q
AFFERR S EXI="^DEJAVU($I)",LG=50,PAGE=0 K ^AFFPAG($I),^DEJAVU($I)
 S ARAP=-1 F %PP=1:1 S ARAP=$N(^UNKN($I,YA,ARAP)) Q:ARAP=-1  S MUN=-1 F %NN=1:1 S MUN=$N(^UNKN($I,YA,ARAP,MUN)) Q:MUN=-1  D STO
 D ^TOEDUNKN
 G COMPR
STO S REF=^UNKN($I,YA,ARAP,MUN),REF1=$TR(REF," ",",") Q:$D(@EXI@(REF1))
 S @EXI@(REF1)=1,LG=LG+1 I LG>21 S LG=8,PAGE=PAGE+1
 S ^AFFPAG($I,PAGE,LG)=$TR(REF," ","^") Q
SAVE D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") K ^BLSAV($J) F IT=$$^%QZCHW("YA"),"NUFA","TWREF","QUI","WHOIS","YB","BATCH" S ^BLSAV($J,IT)=@IT
 D ^%QCAMEMS K  D CURRENT^%IS S IT=-1 F %U=1:1 S IT=$N(^BLSAV($J,IT)) Q:IT=-1  S @IT=^BLSAV($J,IT)
 D POCLEPA^%VVIDEO Q
RES K  D ^%QCAMEMR Q
TEST S BATCH=0,NUFA="X",TWREF=0 W !,$$^%QZCHW("A tester : ") R YA Q:$A(YA)<32  D ^TOPHASUD G TEST

