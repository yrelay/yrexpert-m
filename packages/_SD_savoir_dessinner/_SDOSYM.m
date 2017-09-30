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

;%SDOSYM^INT^1^59547,73889^0
SDOSYM(OBJ,VERS,%PORT,%TERM,ENS) 
 
 
 
 
 
 N R,ANGLE,X,Y,XT,YT,XD,YD,XA,YA,GLOBJ,MODE,NEW,GLCOMP,GLTEXT,DEB,TEMP
 S GLOBJ=$$DEF^%SDOCMS(OBJ,VERS)
 S GLCOMP=$$COMP^%SDOCMS(OBJ,VERS)
 S GLTEXT=$$TEXT^%SDOCMS(OBJ,VERS)
 N MENMOD,ADR,CTR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S NEW=$$CONCAS^%QZCHAD(TEMP,"RECOP")
 S DROITE=$$CONCAS^%QZCHAD(TEMP,"DROITE")
 S POINT=$$CONCAS^%QZCHAD(TEMP,"POINT")
 S MENMOD=$$CONCAS^%QZCHAD(TEMP,"MENU")
 D MENU(MENMOD)
 D EFFBAS^%SDUMEN
MEN 
 D AFF^%SDUMEN(0,0,MENMOD)
 D SEL^%SDUMEN(MENMOD,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G MEN
 G @ADR
FIN 
 D EFF^%PBP5EC(0)
 K @(TEMP)
 Q
 
DEPL S MODE="D" G DEB
 
RECOP S MODE="R" G DEB
DEB 
 D EFFBAS^%SDUMEN,AFFI^%SDUMEN(0,0,"Pointez le premier point de l'axe de symetrie avec la mire")
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD)
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 Q
 D POINT^%PBMFN(XD,YD,0)
 
 D AFFI^%SDUMEN(0,0,"Pointez le deuxieme point de l'axe de symetrie avec la mire")
L1 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA)
 D EFFBAS^%SDUMEN
 I R=0 D POINT^%PBMFN(XD,YD,1) S OK=0 Q
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D AXE(XD,YD,ANGLE,0)
 N EL,%EL,NEL S EL="",NEL=0 D ALFA^%SDEDEF,POCLEPA^%VVIDEO
 S DEB=$ZP(@GLOBJ@("EL",""))
LOOP 
 S EL=$O(@ENS@("EL",EL))
 G:EL="" FLOOP
 W "."
 I MODE="R" G LOOP1
 S @GLOBJ@("EL",EL,"PRES")=$$SYM(EL,XD,YD,ANGLE)
 I @GLOBJ@("EL",EL,"TYPE")=$$^%QZCHW("POINT") S @POINT@(EL)=""
 G LOOP
LOOP1 
 S NEL=NEL+1,@NEW@(NEL+DEB,"PRES")=$$SYM(EL,XD,YD,ANGLE)
 S @NEW@(NEL+DEB,"EL")=EL
 I @GLOBJ@("EL",EL,"TYPE")=$$^%QZCHW("POINT") S @POINT@(EL)=NEL+DEB G LOOP
 I @GLOBJ@("EL",EL,"TYPE")=$$^%QZCHW("DROITE") S @DROITE@(EL)=NEL+DEB
 G LOOP
 
FLOOP 
 I MODE="D" D DEPL^%SDOSYM2 G FIN
 D RECOP^%SDOSYM2
 G FIN
 
 
SYM(EL,XT,YT,ANGLE) 
 N ELEM
 S ELEM=^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES")
 G @$P(ELEM,"^",1)
 
 
1 D TR3
 D INVERS
 Q ELEM
 
2 D TR3
 Q ELEM
 
3 D TR1
 Q ELEM
 
4 D TR2
 Q ELEM
 
5 D TR2
 Q ELEM
 
6 D TR3
 D INVERS
 Q ELEM
 
7 D TR2
 Q ELEM
 
8 D TR2
 Q ELEM
 
9 D TR2
 Q ELEM
 
10 
 S X=$P(ELEM,"^",3),Y=$P(ELEM,"^",4)
 D SYMP^%PBCACV(XT,YT,X,Y,ANGLE,.X,.Y)
 S $P(ELEM,"^",3)=$J(X,1,0),$P(ELEM,"^",4)=$J(Y,1,0)
 S X=$P(ELEM,"^",6),Y=$P(ELEM,"^",7)
 D SYMP^%PBCACV(XT,YT,X,Y,ANGLE,.X,.Y)
 S $P(ELEM,"^",6)=$J(X,1,0),$P(ELEM,"^",7)=$J(Y,1,0)
 
 Q ELEM
 
TR1 
 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D SYMP^%PBCACV(XT,YT,X,Y,ANGLE,.X,.Y)
 S $P(ELEM,"^",2)=$J(X,1,0),$P(ELEM,"^",3)=$J(Y,1,0)
 Q
TR2 
 D TR1
 S X=$P(ELEM,"^",4),Y=$P(ELEM,"^",5)
 D SYMP^%PBCACV(XT,YT,X,Y,ANGLE,.X,.Y)
 S $P(ELEM,"^",4)=$J(X,1,0),$P(ELEM,"^",5)=$J(Y,1,0)
 Q
TR3 
 D TR2
 S X=$P(ELEM,"^",6),Y=$P(ELEM,"^",7)
 D SYMP^%PBCACV(XT,YT,X,Y,ANGLE,.X,.Y)
 S $P(ELEM,"^",6)=$J(X,1,0),$P(ELEM,"^",7)=$J(Y,1,0)
 Q
 
AXE(X,Y,ANGLE,EFF) 
 N X1,X2,X3,X4,Y1,Y2,Y3,Y4,A,B,C
 D ^%PBPZGRA
 D NEWP^%PBCACV(X,Y,100,$$NORM^%PBCACV(ANGLE+90),.X1,.Y1)
 D NEWP^%PBCACV(X,Y,100,$$NORM^%PBCACV(ANGLE-90),.X2,.Y2)
 D HORTO^%PBMFN(X1,Y1,X2,Y2,.X3,.Y3,.X4,.Y4,.A,.B,.C)
 S X3=$$Y^%PBMFN(X3),Y3=$$Y^%PBMFN(Y3),X4=$$X^%PBMFN(X4),Y4=$$Y^%PBMFN(Y4)
 D DROITE^%PBP5EC(X3,Y3,X4,Y4,EFF,"M",0)
 Q
INVERS 
 N XP1,YP1,XP2,YP2
 S XP1=$P(ELEM,"^",2),YP1=$P(ELEM,"^",3)
 S XP2=$P(ELEM,"^",4),YP2=$P(ELEM,"^",5)
 S $P(ELEM,"^",2)=XP2,$P(ELEM,"^",3)=YP2
 S $P(ELEM,"^",4)=XP1,$P(ELEM,"^",5)=YP1
 Q
 
MENU(MN) 
 S @MN@(1)=$$^%QZCHW("DEPLACEMENT")_"^"_"DEPL"
 S @MN@(2)=$$^%QZCHW("RECOPIE")_"^"_"RECOP"
 Q
 
 
 
 
SEL(OBJ,VERS,%PORT,%TERM) 
 N MENUS,TAB,EL,TAB2
 S MENUS(1)="TOUS.LES.ELEMENTS"_"^"_"TOUS"
 S MENUS(2)="SELECTION"_"^"_"QQ"
AFF1 D EFFBAS^%SDUMEN
DIAL 
 D AFF^%SDUMEN(0,0,"MENUS")
DIAL2 D SEL^%SDUMEN("MENUS",.ADR,.CTR)
 I (CTR="A")!(CTR="F") G END
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
END 
 D ^%SDOMAT(OBJ,VERS)
 Q
TOUS 
 D ^%SDOSYM(OBJ,VERS,%PORT,%TERM,$$DEF^%SDOCMS(OBJ,VERS))
 G END
 
QQ 
 S TAB=$$TEMP^%QZCHAD("ELEM","") K @(TAB)
 S TAB2=$$TEMP^%QZCHAD("ELEM2","") K @(TAB2)
 D ^%SDESEL(OBJ,VERS,%PORT,%TERM,TAB,0)
 I '($D(@TAB)) Q
 S EL="" F I=0:0 S EL=$O(@TAB@(EL)) Q:EL=""  S @TAB2@("EL",EL)="" K @TAB@(EL)
 D ^%SDOSYM(OBJ,VERS,%PORT,%TERM,TAB2)
 K @(TAB),@(TAB2)
 G END

