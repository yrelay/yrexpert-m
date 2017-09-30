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

;%ABCOPY1^INT^1^59547,73864^0
%ABCOPY1 ;;09:55 AM  30 Mar 1993; ; 30 Mar 93 11:38 AM
 
 S DY=3 D CLEBAS^%VVIDEO S PGEC=-1,LI=-1,%TS="   "
 F UU=0:0 S PGEC=$N(^TACOMPIL($I,PGEC)) Q:PGEC=-1  S LI=-1 F VV=0:0 S LI=$N(^TACOMPIL($I,PGEC,LI)) Q:LI=-1  D COPY
FIN Q
 
COPY K ^INTERVAL($I) S RGR=^TACOMPIL($I,PGEC,LI),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR","TYPNORM" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR
 Q:'($$SAISDUP)
 Q:'($$VERIFOK)
 S TIT1=$P(^[QUI]PRONUM(NOMG,NORM,IDENT),"^")
 D COPIE^%ABCOPY(QUI,NOMG,NORM,TYPNORM,IDENT,TIT1,QUI,NOMG2,NORM2,TYPNORM2,IDENT2,TIT2)
 S @LISCRE=@LISCRE+1
 S @LISCRE@(@LISCRE)=NOMG2_"^"_NORM2_"^"_IDENT2_"^"_TYPGR_"^"_TYPNORM2
 Q
VERIFOK() 
 I $D(^[QUI]OCGRIL(NOMG2,NORM2)) D ^%VZEAVT($$^%QZCHW("Il existe deja un abaque avec cette structure et cette norme")) Q 0
 I $D(^[QUI]PRONUM(NOMG2,NORM2,IDENT2)) D ^%VZEAVT($$^%QZCHW("Il existe deja un abaque avec cette structure et cette norme")) Q 0
 Q 1
 
SAISDUP() 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S VALDEF(1)=NOMG,VALDEF(2)=NORM,VALDEF(3)=TYPNORM,VALDEF(4)=IDENT,VALDEF(5)=""
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) 0
 S NOMG2=$P(STOCK,$C(0)),NORM2=$P(STOCK,$C(0),2),TYPNORM2=$P(STOCK,$C(0),3),IDENT2=$P(STOCK,$C(0),4),TIT2=$P(STOCK,$C(0),5)
 F I=1:1:5 S VALDEF(I)=$P(STOCK,$C(0),I)
 K STOCK,@(GLO)
 Q 1
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=5
 S @GLO@("FL")="LDR"
 
 S @GLO="Copie d'abaque"
 S @GLO@("H")=6,@GLO@("V")=4
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Abaque (structure)","Norme ","Type de norme","Identifiant","Titre" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=30 F I=1:1:NBC S @GLO@("LARG",I)=30
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)=""
 S @GLO@("AIDE",2)=""
 S @GLO@("AIDE",3)=""
 S @GLO@("AIDE",4)=""
 S @GLO@("AIDE",5)=""
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=0
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:5 S @GLO@("UCONT.CHAMPS",I)=TJSOK
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:5 S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 ;
 ;

