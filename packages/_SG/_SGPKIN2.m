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

;%SGPKIN2^INT^1^59547,73891^0
%SGPKIN2 ;;12:06 PM  2 Jul 1993; ; 02 Jul 93 12:08 PM
 
 
INTRT S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("TRAITEMENTS",OBJ)="",WRITE=0 G INTRT2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E("traitement "_OBJ_" ",1,50)
 I NOTALL,'($D(@ETTL@(OBJ))) S WRITE=0 D IC("non selectionne") G INTRT2
 I $$NOKOBJ^%INCOIN2("TRAITEMENT",OBJ) S WRITE=0 G INTRT2
 S WRITE=1
 U 0 I $$EXISTE^%TLGEST(OBJ) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),NETTOIE^%TLGEST(OBJ)
INTRT2 I WRITE D IC("chargement"),CREER^%TLGEST(OBJ) S @ENSLOAD@("TRT",OBJ)=""
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:$E(X,1,3)="^^^"  Q:X=""  I WRITE S ^[QUI]TTL(OBJ,1,J)=X
 G:X="" INTRT3
 
 I '(WRITE) G INT21
INT20 G:$E(X,1,3)'="^^^" INT21
 S X=$E(X,4,$L(X))
 D AFFVAL^%TLGEST(OBJ,"CARD",1,$P(X,"^"))
 D AFFVAL^%TLGEST(OBJ,"AUTEUR",1,$P(X,"^",2))
 D AFFVAL^%TLGEST(OBJ,"DATE.DERNIERE.MODIFICATION",1,$P(X,"^",3))
INT21 S X=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I X'="" G:WRITE INT20 G INT21
INTRT3 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]TTL(OBJ,2,J)=X
 G @RET
 
IC(TXT) S DX=59,DY=14 X XY W $J("",18) X XY W $E($$^%QZCHW(TXT),1,18) Q
 
INMOD S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("MODELES",OBJ)="",WRITE=0 G INMOD2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E("modele "_OBJ_" ",1,50)
 I NOTALL,'($D(@EMOD@(OBJ))) U 0 S WRITE=0 D IC("non selectionne") G INMOD2
 I $$NOKOBJ^%INCOIN2("MODELE",OBJ) S WRITE=0 G INMOD2
 S WRITE=1
 U 0 I $$EXISTE^%EDDGEST(OBJ) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),SUPP^%EDDGEST(OBJ)
INMOD2 I WRITE D IC("chargement"),CREER^%EDDGEST(OBJ) S @ENSLOAD@("MOD",OBJ)=""
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]EDMOD(OBJ,"VAR",J)=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]EDMOD(OBJ,"LIGNE",J)=X
 G @RET
 
INFOR S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("FORMATS",OBJ)="",WRITE=0 G INFOR2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E($$^%QZCHW("format")_" "_OBJ_" ",1,50)
 I NOTALL,'($D(@EFOR@(OBJ))) U 0 S WRITE=0 D IC("non selectionne") G INFOR2
 I $$NOKOBJ^%INCOIN2("FORMAT",OBJ) S WRITE=0 G INFOR2
 S WRITE=1
 U 0 I $$EXISTE^%EDFGEST(OBJ) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),SUPP^%EDFGEST(OBJ)
INFOR2 I WRITE D IC("chargement"),CREER^%EDFGEST(OBJ) S @ENSLOAD@("FOR",OBJ)=""
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]EDFORMAT(OBJ,"ORIENTATION")=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]EDFORMAT(OBJ,"LIGNES",J)=X
 G @RET
 
INREQ S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("REQUETES",OBJ)="",WRITE=0 G INREQ2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E($$^%QZCHW("requete")_" "_OBJ_" ",1,50)
 I NOTALL,'($D(@EREQ@(OBJ))) U 0 S WRITE=0 D IC("non selectionne") G INREQ2
 S WRITE=1
 U 0 I $D(^[QUI]RQS1(OBJ)) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression"),^%QSUPREQ(OBJ,0)
INREQ2 I WRITE D IC("chargement") S @ENSLOAD@("RQS",OBJ)=""
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]RQS1(OBJ,"BASE")=X
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]RQS1(OBJ,"COMM")=X
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]RQS1(OBJ,"DATE.CREATION")=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]RQS1(OBJ,"VARIABLES",J)=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  I WRITE S ^[QUI]RQS1(OBJ,"CONTRAINTES",J)=X
 I WRITE D CREEREQ^%QSQUEST(OBJ)
 G @RET
 
INPSV S OBJ=$$READ^%SYSUTI1(IOFI,.OKLEC)
 I EXAM S @ENSOBJ@("PASSERELLES SUITE DE VALEURS",OBJ)="",WRITE=0 G INPSV2
 U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $E($$^%QZCHW("passerelle")_" "_OBJ_" ",1,50)
 I NOTALL,'($D(@EPSV@(OBJ))) U 0 S WRITE=0 D IC("non selectionne") G INPSV2
 S WRITE=1
 U 0 I $D(^[QUI]LKY2(OBJ)) S DX=59,DY=16 X XY S WRITE=$S(ECRAS=1:1,ECRAS=0:0,1:$$CONFIRM^%VZEOUI("Ecraser ?")=1) I WRITE D IC("suppression") K ^[QUI]LKY2(OBJ),^[QUI]LKYENR2(OBJ),^[QUI]LKYATR2(OBJ),LKYPROT(OBJ)
INPSV2 I WRITE D IC("chargement") S @ENSLOAD@("PSV",OBJ)=""
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]LKY2(OBJ)=X
 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]LKYPROT(OBJ)=X
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]LKYENR2(OBJ,X)=Y
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  S Y=$$READ^%SYSUTI1(IOFI,.OKLEC),Z=$$READ^%SYSUTI1(IOFI,.OKLEC),T=$$READ^%SYSUTI1(IOFI,.OKLEC) I WRITE S ^[QUI]LKYATR2(OBJ,X,Y,Z)=T
 G @RET
 
 
 
INLEX S WRITE=1-EXAM
 I WRITE U 0 S DX=4,DY=14 X XY W $J(" ",74) X XY W $$^%QZCHW("Mots du lexique")
 F J=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  D INLEX2
 G @RET
INLEX2 F IC=1:1:5 S COM(IC)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S UNI=$$READ^%SYSUTI1(IOFI,.OKLEC),ABUN=$$READ^%SYSUTI1(IOFI,.OKLEC)
 Q:'(WRITE)
 I '($D(^[QUI]TOLEX(X))) D STOCK^%LXAJMOD(X,COM(1),COM(2),COM(3),COM(4),COM(5),UNI,ABUN,"")
 Q

