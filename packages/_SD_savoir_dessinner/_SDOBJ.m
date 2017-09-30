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

;%SDOBJ^INT^1^59547,73889^0
SDOBJ(TIT,EXI,OBJ,VERS) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL
 D CLEPAG^%VVIDEO,^%VZCDB(TIT,0)
 D INIT
 S @VAL=$P(STO,")",1)
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 I '($D(@STO)) S (OBJ,VERS)="" G FIN
 S OBJ=$P(@STO,$C(0),1)
 S VERS=$P(@STO,$C(0),3)
FIN K @(TEMP)
 Q
 
INIT 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S STO=$$CONCAS^%QZCHAD(TEMP,"STO")
 S GLO=$$ADRF
 I $D(@GLO) G INIV
 S @GLO=""
 S @GLO@("H")=10,@GLO@("V")=6,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=3,@GLO@("L")=50,@GLO@("PLL")=7
 S @GLO@("CHAMPS",1)="Objet",@GLO@("CHAMPS",2)=" "
 S @GLO@("CHAMPS",3)="Version"
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=1:1:3 S @GLO@("LARG",I)=50
 S @GLO@("SUIV",1)=3,@GLO@("PREC",1)=3
 S @GLO@("SUIV",3)=1,@GLO@("PREC",3)=1
 F I=1:1:3 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:3 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=2"
 
INIV 
 K @GLO@("UCONT.CHAMPS"),@GLO@("UCONT")
 I (EXI=1)!(EXI=2) S @GLO@("UCONT.CHAMPS",1)="D LOBJ^%SDOBJ",@GLO@("UCONT.CHAMPS",3)="D LVOBJ^%SDOBJ"
 I EXI=1 S @GLO@("UCONT")="D EXIOV^%SDOBJ"
 I EXI=0 S @GLO@("UCONT")="D NEXI^%SDOBJ"
 
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 F I=1:1:3 S @VAL@(I)=""
 D POCLEPA^%VVIDEO
 Q
 
ADRF() 
 Q "^SAVMASQ(""SD"",""OBJ"",""DEF"")"
 
LOBJ 
 Q:$$GETLBLAN^%VTLBLAN(X)'="?"
 N OBJET,II
 S OBJET="" F II=0:1 S OBJET=$O(^[QUI]SDOBJ(OBJET)) Q:OBJET=""
 I II=1 S OBJET=$O(^[QUI]SDOBJ(""))
 I II'=1 S OBJET=$$UN^%PKCHOIX("^[QUI]SDOBJ",10,12,8)
 S X=OBJET
 S:OBJET="" OK=0
 S REUC=1
 Q
 
LVOBJ 
 Q:$$GETLBLAN^%VTLBLAN(X)'="?"
 I $$GETLBLAN^%VTLBLAN(VAL(1))="" S OK=0 Q
 N VERS,II
 S VERS="" F II=0:1 S VERS=$O(^[QUI]SDOBJ(VAL(1),VERS)) Q:VERS=""
 I II=1 S VERS=$O(^[QUI]SDOBJ(VAL(1),""))
 I II'=1 S VERS=$$UN^%PKCHOIX($$CONCAS^%QZCHAD("^[QUI]SDOBJ",VAL(1)),10,12,8)
 S X=VERS
 S REUC=1
 S:VERS="" OK=0
 Q
 
EXIOV 
 I '($$EXI^%SDOCMS(VAL(1),VAL(3))) S OK=0 D MESS^%PKUTIL(10,21,$$^%QZCHW("Cet objet n'existe pas"),1)
 Q
 
NEXI 
 I $$EXI^%SDOCMS(VAL(1),VAL(3)) S OK=0 D MESS^%PKUTIL(10,21,$$^%QZCHW("Cet objet existe deja"),1)
 Q

