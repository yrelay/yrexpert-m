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

;%SGPXIN1^INT^1^59547,73891^0
%SGPXIN1 ;;11:33 AM  16 Jul 1992; ; 16 Jul 92  2:03 PM
 
 
INSCHEM S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("SCHEMAS DE DONNEES",OBJ)="",WRITE=0 G INSCHEM2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E("schema "_OBJ_" ",1,50)
 I NOTALL,'($D(@ESCHEM@(OBJ))) S WRITE=0 D IC("non selectionne") G INSCHEM2
 S WRITE=1
 U 0 I $D(^RQSMOD(OBJ)) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),SUPSCHEM(OBJ)
INSCHEM2 
 I WRITE D IC("chargement") S @ENSLOAD@("SCHEMA",OBJ)=""
 S ^RQSMOD(OBJ)=""
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMDL1(OBJ,X)=Y
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC),Z=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMDL2(OBJ,X,Y)=Z
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC),Z=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMDL3(OBJ,X,Y)=Z
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC),Z=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMDL4(OBJ,X,Y)=Z
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMDL5(OBJ,X)=Y
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I X'="",WRITE S ^RQSMOD2(OBJ)=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^RQSMOD3(OBJ,X)=""
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMOD5(OBJ,X)=Y
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC),Z=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^RQSMOD8(OBJ,X,Y)=Z
 G @RET
 
SUPSCHEM(SHEM) 
 K ^RQSMOD(SHEM),^RQSMOD3(SHEM),^RQSMOD5(SHEM),^RQSMOD8(SHEM),^RQSMDL1(SHEM),^RQSMDL2(SHEM),^RQSMDL3(SHEM),^RQSMDL4(SHEM),^RQSMDL5(SHEM)
 Q
 
IC(TXT) S DX=59,DY=14 X XY W $J("",18) X XY W $E($$^%QZCHW(TXT),1,18) Q
 ;
 ;

