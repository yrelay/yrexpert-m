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

;%SGPKIN3^INT^1^59547,73891^0
%SGPKIN3 ;;09:57 AM  22 Dec 1992; ; 15 Apr 93 10:03 AM
 
 
 
 
 
 
INMSQ S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("MASQUES DE SAISIE",OBJ)="",WRITE=0 G INMSQ2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E($$^%QZCHW("masque de saisie")_" "_OBJ_" ",1,50)
 I NOTALL,'($D(@EMSQ@(OBJ))) U 0 S WRITE=0 D IC("non selectionne") G INMSQ2
 S WRITE=1
 U 0 I $D(^[QUI]RQSGLO("SR","DEF",OBJ)) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression") K ^[QUI]RQSGLO("SR","DEF",OBJ)
 
INMSQ2 I WRITE D IC("chargement") S @ENSLOAD@("MSQ",OBJ)=""
 I WRITE S ^[QUI]RQSGLO("SR","DEF",OBJ)=""
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE D INMSQ3
 G @RET
INMSQ3 
 S CA=$P(X," ",1)
 S LC=$P(X," ",2)
 I CA="DEFINITION" S GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ)"
 I CA="CHAMP" S VG=0,GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ,""CHAMPS"",LC)"
 I CA="CONTROLES" S GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ,""CHAMPS"",LC,""CONTROLES"")"
 I CA="VALEURS.LEGALES" S VG=VG+1,GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ,""CHAMPS"",LC,""VALEG"",VG)"
 I CA="AIDE" S GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ,""CHAMPS"",LC,""AIDE"")"
 I CA="EXECUTION" S GLO="^[QUI]RQSGLO(""SR"",""DEF"",OBJ,""UCONTS"")"
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I WRITE S @GLO=X
 Q
 
 
 
INPRD S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("PREDICATS",OBJ)="",WRITE=0 G INPRD2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E("predicat "_OBJ_" ",1,50)
 I NOTALL,'($D(@EPRD@(OBJ))) S WRITE=0 D IC("non selectionne") G INPRD2
 S WRITE=1
 U 0 I $$EXIPRED^%PSPRGES(OBJ) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),SUPP^%PSPRGES(OBJ)
 
INPRD2 I WRITE D IC("chargement"),CREER^%PSPRGES(OBJ) S @ENSLOAD@("PRD",OBJ)=""
 S J=0
INPRD3 S J=J+1
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) G:X="" @RET
 I WRITE S ^[QUI]RQSGLO("PRED",OBJ,J)=X
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I (X'="")&WRITE S ^[QUI]RQSGLO("PRED",OBJ,J,"COEF")=X
 G INPRD3
 
 
 
IC(TXT) S DX=59,DY=14 X XY W $J("",18) X XY W $E($$^%QZCHW(TXT),1,18) Q

