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

;%QXPETG2^INT^1^59547,73887^0
%QXPETG2 ;;10:53 AM  2 Apr 1993; 07 Dec 92  2:52 PM ; 02 Apr 93 11:11 AM
 
 
 
SAISIE(ETU) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S VALDEF(1)=ETU,VALDEF(2)="",VALDEF(3)=$S($D(^[QUI]ETU(ETU,"MOTEUR")):^[QUI]ETU(ETU,"MOTEUR"),1:"TRAITEMENT")
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) 0
 F I=1:1:3 S VALDEF(I)=$P(STOCK,$C(0),I)
 S ^[QUI]ETU(ETU,"MOTEUR")=VALDEF(3)
 K STOCK,@(GLO)
 Q 1
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=3
 S @GLO@("FL")="LDR"
 
 S @GLO="Caracteristiques de l'etude"
 S @GLO@("H")=6,@GLO@("V")=4
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Etude"," ","Moteur" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=30 F I=1:1:NBC S @GLO@("LARG",I)=30
 S @GLO@("SUIV",3)=3,@GLO@("PREC",3)=3
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",3)="Moteur qui gere les niveaux de paravent :"_$C(0)_"MANUEL, HEVEA ou TRAITEMENT"
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",3)="D OKMOT^%QXPETG2"
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 S @GLO@("OBLIGAT",1)=OBLIG
 S @GLO@("OBLIGAT",2)=TJSOK
 S @GLO@("OBLIGAT",3)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 
 
OKMOT 
 N TO,SAVR,TEMP,M1,SAVR
 S SAVR=%R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S M1=$$CONCAS^%QZCHAD(TEMP,"M1")
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G CF2
 I X'="",((X="MANUEL")!(X="TRAITEMENT"))!(X="HEVEA") G CFOK
CFNOK S %R=SAVR,OK=0 Q
CFOK S %R=SAVR,OK=1 Q
 
CF2 S @M1@("MANUEL")="",@M1@("TRAITEMENT")="",@M1@("HEVEA")=""
 S X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("Moteur"),0) G:X="" CFNOK
 G CFOK
 ;

