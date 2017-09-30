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
;! Nomprog     : %SGPXIN2                                                     !
;! Module      : Sauvegarde et restauration.                                  !
;! But         : Restauration du schéma de données.                           !
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

%SGPXIN2 ;
 
 
 
LISCHEM(NFIC,ENSOBJ) 
 N IOFI,OKRET,WRITE,ECRAS,EXAM
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 Q:'(OKRET)
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S NOTALL=1,ECRAS=1
 S RET="LEC^%SGPXIN2",EXAM=1
LEC S TYPE=$$READ^%SYSUTI1(IOFI,.OKLEC)
 G:TYPE="SCHEMA DE DONNEES" INSCHEM
 D CLOSE^%SYSUTI1(IOFI,"R")
 Q
 
 
 
 
 
CHARGER(NFIC,ALL,ESEL,ECRAS,ECHO,ENSLOAD)
 N NOTALL,WRITE
 S ESCHEM=$$CONCAS^%QZCHAD(ESEL,"SCHEMAS DE DONNEES")
 S NOTALL=$S(ALL:0,1:1)
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
TRAIT S RET="SUITE^%SGPXIN2",EXAM=0
SUITE S TYPE=$$READ^%SYSUTI1(IOFI,.OKLEC)
 G:TYPE="SCHEMA DE DONNEES" INSCHEM
 D CLOSE^%SYSUTI1(IOFI,"R")
 Q
 
 
 S ICOUR=0
 
 
 Q
 
PROLA G:ICOUR>3 PROLAC
 S ICOUR=ICOUR+1
 S XX(ICOUR)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:ICOUR D LIGA(%II)
 Q
PROLAC F %II=1:1:3 S XX(%II)=XX(%II+1)
 S XX(4)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:4 D LIGA(%II)
 Q
EPILA S XX(ICOUR)=XX(ICOUR)_" ("_$S(RES:"OK",1:$$^%QZCHW("Probleme"))_")" D LIGA(ICOUR) Q
 
LIGA(I) U 0 S DX=4,DY=15+I X XY W $J(" ",74) X XY W XX(I) Q
 
 
 
 
 
 
INSCHEM S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 
 I EXAM S @ENSOBJ@("SCHEMAS DE DONNEES",OBJ)="",WRITE=0 G INSCHEM2
 I ECHO U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E("schema "_OBJ_" ",1,50)
 I NOTALL,'($D(@ESCHEM@(OBJ))) S WRITE=0 D:ECHO IC("non selectionne") G INSCHEM2
 S WRITE=1
 G:'($D(^RQSMOD(OBJ))) INSCHEM2
 I ECRAS=0 S WRITE=0 G INSCHEM2
 I ECRAS=1 S WRITE=1 D:ECHO IC("suppression") D SUPSCHEM(OBJ) G INSCHEM2
 U 0 S DX=59,DY=16 X XY S WRITE=$$CONFIRM^%VZEOUI("Ecraser ?")=1
 I WRITE D:ECHO IC("suppression") D SUPSCHEM(OBJ)
INSCHEM2 
 I WRITE D:ECHO IC("chargement") S @ENSLOAD@("SCHEMA",OBJ)=""
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
 ;

