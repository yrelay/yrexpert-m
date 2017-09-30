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

;%SDOTRSF^INT^1^59547,73889^0
SDOTRSF(OBJ,VERS,%PORT,%TERM) 
 
 
 
 
 
 N MENTRF,MENSEL,ADR,CTR,TEMP,NUM,NUM2,SOURCE,SAVE,DIF
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENTRF=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S MAT=$$ADR^%SDOMAT,DEJAF=0
 D MENU(MENTRF)
AFF1 D EFFBAS^%SDUMEN
DIAL 
 D AFF^%SDUMEN(0,0,MENTRF)
DIAL2 D SEL^%SDUMEN(MENTRF,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
FIN 
 K @(TEMP)
 Q
 
 
 
TRL 
 D SEL^%SDOTRL(OBJ,VERS,%PORT,%TERM)
 G DIAL
 
SYM 
 D SEL^%SDOSYM(OBJ,VERS,%PORT,%TERM)
 G DIAL
 
ROT 
 D SEL^%SDOROT(OBJ,VERS,%PORT,%TERM)
 G DIAL
 
AGR 
 D SEL^%SDOAGR(OBJ,VERS,%PORT,%TERM)
 G DIAL
 
 
 
MENU(MN) 
 S @MN@(1)=$$^%QZCHW("TRANSLATION")_"^"_"TRL"
 S @MN@(2)=$$^%QZCHW("SYMETRIE")_"^"_"SYM"
 S @MN@(3)=$$^%QZCHW("ROTATION")_"^"_"ROT"
 S @MN@(4)=$$^%QZCHW("AGRANDISSEMENT")_"^"_"AGR"
 Q
 
 
 
 
ZOOM(EL,ZOOM) Q $$TRANS(EL,0,0,0,ZOOM)
 
ROTATION(EL,ANGL) Q $$TRANS(EL,0,0,ANGL,1)
 
TRANSLAT(EL,DX,DY) Q $$TRANS(EL,DX,DY,0,1)
 
 
TRANS(EL,XT,YT,AN,EC) 
 N R,X,Y
 N ELEM S ELEM=^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES")
 G @$P(ELEM,"^",1)
 
1 D TR3
 Q ELEM
 
2 D TR3
 Q ELEM
 
3 D TR1
 S PT=$$NOPTEL^%SDEGEST(OBJ,VERS,EL)
 I PT="" G 31
 S ^[QUI]SDOBJ(OBJ,VERS,"PTR",PT,"X")=X
 S ^[QUI]SDOBJ(OBJ,VERS,"PTR",PT,"Y")=Y
31 Q ELEM
 
4 D TR2
 Q ELEM
 
5 D TR2
 Q ELEM
 
6 D TR3
 Q ELEM
 
7 D TR2
 Q ELEM
 
8 D TR2
 Q ELEM
 
9 D TR2
 Q ELEM
 
10 
 S X=$P(ELEM,"^",3),Y=$P(ELEM,"^",4)
 D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y)
 S $P(ELEM,"^",3)=X,$P(ELEM,"^",4)=Y
 
 S X=$P(ELEM,"^",6),Y=$P(ELEM,"^",7)
 D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y)
 S $P(ELEM,"^",6)=X,$P(ELEM,"^",7)=Y
 Q ELEM
 
TR1 
 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y)
 S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y
 Q
TR2 
 D TR1
 S X=$P(ELEM,"^",4),Y=$P(ELEM,"^",5)
 D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y)
 S $P(ELEM,"^",4)=X,$P(ELEM,"^",5)=Y
 Q
TR3 
 D TR2
 S X=$P(ELEM,"^",6),Y=$P(ELEM,"^",7)
 D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y)
 S $P(ELEM,"^",6)=X,$P(ELEM,"^",7)=Y
 Q

