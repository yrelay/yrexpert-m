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

;%SDEDES5^INT^1^59547,73888^0
SDEDES5 ;
 
 
 
 
 
TEXTE 
 I ((VAL(3)="")&(VAL(4)=""))&(VAL(7)="") S MERR=$$^%QZCHW("Le point de depart n'est pas defini") G ERR
 I VAL(7)="" S COOR(1)="( "_VAL(3)_" ; "_VAL(4)_" )" G TEXT1
 S OK=$$CREPT(VAL(3),VAL(4),VAL(7),1) Q:'(OK)
 S COOR(1)=VAL(7)
TEXT1 
 S TEXT=VAL(1)_" ; TEXTE ; "_VAL(2)_" ; "_COOR(1)_" ; "_VAL(5)_" ; "_VAL(6)
 I VAL(8)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(8)
 G ANAL
 
 
FLECHE 
 I ((VAL(7)="")&(VAL(8)=""))&(VAL(13)="") S MERR=$$^%QZCHW("Le point de depart n'est pas defini") G ERR
 I VAL(13)="" S COOR(1)="( "_VAL(7)_" ; "_VAL(8)_" )" G FLECH1
 S OK=$$CREPT(VAL(7),VAL(8),VAL(13),1) Q:'(OK)
 S COOR(1)=VAL(13)
FLECH1 I (VAL(11)'="")&(VAL(12)'="") G FLECHF2
 I VAL(14)="" S COOR(2)="( "_VAL(9)_" ; "_VAL(10)_" )" G FLECH2
 S OK=$$CREPT(VAL(9),VAL(10),VAL(14),2) Q:'(OK)
 S COOR(2)=VAL(14)
FLECH2 S TEXT=VAL(1)_" ; FLECHE ; "_VAL(2)_" ; "_VAL(3)_" ; "_VAL(4)_" ; "_VAL(5)_" ; "_$S(VAL(6)="":"""""",1:VAL(6))_" ; 1 ; "_COOR(1)_" ; "_COOR(2)
 G FLECHF3
 
FLECHF2 S TEXT=VAL(1)_" ; FLECHE ; "_VAL(2)_" ; "_VAL(3)_" ; "_VAL(4)_" ; "_VAL(5)_" ; "_$S(VAL(6)="":"""""",1:VAL(6))_" ; 2 ; "_COOR(1)_" ; "_VAL(11)_" ; "_VAL(12)_" ; "_VAL(14)
FLECHF3 I VAL(15)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(15)
 G ANAL
 
 
RACCORD 
 S TEXT=VAL(1)_" ; RACCORD ; "_VAL(2)_" ; "_VAL(3)_" ; "_VAL(4)_" ; "_VAL(5)_" ; "_VAL(6)_" ; "_VAL(7)
 I VAL(8)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(8)
 G ANAL
 
 
DROITE 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(10)="") S MERR=$$^%QZCHW("Le point de depart n'est pas defini") G ERR
 I VAL(10)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G DROIT1
 S OK=$$CREPT(VAL(4),VAL(5),VAL(10),1) Q:'(OK)
 S COOR(1)=VAL(10)
DROIT1 I (VAL(8)'="")&(VAL(9)'="") G DROITF2
 I VAL(11)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G DROIT2
 S OK=$$CREPT(VAL(6),VAL(7),VAL(11),2) Q:'(OK)
 S COOR(2)=VAL(11)
DROIT2 S TEXT=VAL(1)_" ; DROITE ; "_VAL(2)_" ; "_VAL(3)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)
 G DROIT3
 
DROITF2 S TEXT=VAL(1)_" ; DROITE ; "_VAL(2)_" ; "_VAL(3)_" ; 2 ; "_COOR(1)_" ; "_VAL(8)_" ; "_VAL(9)_" ; "_VAL(11)
 G DROIT3
DROIT3 I VAL(12)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(12)
 G ANAL
 
 
POINT 
 G:(VAL(4)="")&(VAL(5)="") POINT1
 
 I ((VAL(4)="")!VAL(5))="" S MERR=$$^%QZCHW("Abscisse et ordonnee doivent etre definies") G ERR
 S TEXT=VAL(1)_" ; POINT ; "_VAL(6)_" ; "_VAL(2)_" ; "_VAL(3)_" ; ( "_VAL(4)_" ; "_VAL(5)_" )"
 G POINT2
 
POINT1 
 S TEXT=VAL(1)_" ; POINT ; "_VAL(6)_" ; "_VAL(2)_" ; "_VAL(3)
POINT2 I VAL(7)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(7)
 G ANAL
 
 
ANAL 
 N NBL
 D ALLEG
 I $$CONF(TEXT,.NBL)=0 S OK=0 G FANAL
 S OK=$$LIGNE^%SDEANT1(TEXT,1,22-NBL,ANCNOM,1,0,.NOM,.TEXT,.MERR)
FANAL D RESTOR
 Q
 
ERR 
 D ERR^%PKSAISI(MERR,0)
 S OK=0
 Q
 
CONF(TEXT,NBL) 
 
 N LIGNE,I,REPO
 S NBL=$$LIGN^%QULIMO6(TEXT,76,"LIGNE")
 S DX=2,DY=22-NBL D CLEBAS^%VVIDEO
 F I=1:1:NBL X XY W LIGNE(I) S DY=DY+1
 D POCLEPA^%VVIDEO
 S REPO=$$MES^%VZEOUI($$^%QZCHW("confirmez-vous cette syntaxe")_" ? ","O")
 D POCLEPA^%VVIDEO
 I REPO'=1 Q 0
 
 S VVYH=21-NBL,VVYB=23
 Q 1
 
CREPT(X,Y,NOMP,NUM) 
 N NP
 S NP=$E(NOMP,2,$L(NOMP))
 
 I $D(@GLOBJ@("PT",NP)) Q 1
 
 I (X="")&(Y="") G CREER
 I (X'="")&(Y'="") G CREER
 
 Q 0
CREER 
 I $$ELEM^%SDEPOIN(VAL(1),ANCNOM,NP,NUM,0,GLOBJ,X,Y,.MERR)=1 Q 1
 Q 0
 
ALLEG 
 N TYPE
 S TYPE=$$TABID^%INCOIN("ORDINATEUR")
 I (TYPE'="PDP")&(TYPE'="IBM-PC") Q
 N GLO,GLO2
 F III="ENVL","PTEC","PK","VAL","Y","POSY","LARG" S TAB135(III)=$S($D(@III)=1:@III,1:"")
 D INIT2^%QCAMEM,VAR^%QCAMEM("TAB135")
 K PK,VAL,Y,POSY,LARG,ENVL,PTEC,III,TAB135
 Q
 
RESTOR 
 N TYPE
 S TYPE=$$TABID^%INCOIN("ORDINATEUR")
 I (TYPE'="PDP")&(TYPE'="IBM-PC") Q
 N GLO,GLO2
 D RVAR^%QCAMEM
 Q

