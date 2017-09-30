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

;TOP0RECL^INT^1^59547,74874^0
TOP0RECL ;
 
 Q:'($D(^GLOCLI($I)))  S ILAROD=$I I $D(^GLOCLI(ILAROD,"tous")),^GLOCLI(ILAROD,"tous")=1 K ^GLOCLI(ILAROD,"tous") D PREIMP G:CTRLA!CTRLF FIN D TR G FIN
 D ^TOP0CHNU
IMPR Q:'($D(^EDICLI($J)))  D PREIMP G:CTRLA!CTRLF FIN
 S ARC=-1 F %III=1:1 S ARC=$N(^EDICLI(DOLARI,ARC)) Q:ARC=-1  D I1 I $D(CTRLA) Q:CTRLA=1
FIN C IMPR K ARC,NUFA,TWREF,^EDICLI(DOLARI),ILAROD,%III,%JJJ,%KKK,X1 Q
I1 S NUFA=-1 F %JJJ=1:1 S NUFA=$N(^EDICLI(DOLARI,ARC,NUFA)) Q:NUFA=-1  D I2 I $D(CTRLA) Q:CTRLA=1
 Q
I2 S TWREF=-1 F %KKK=1:1 S TWREF=$N(^EDICLI(DOLARI,ARC,NUFA,TWREF)) Q:TWREF=-1  D @ADIMP S DOLARI=$J I $D(CTRLA) Q:CTRLA=1
 Q
PREIMP S IMPR=0,DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=12 X XY W $$L19^%QSLIB1
 S DX=$X D ^TOLECONE Q:CTRLA!CTRLF  S X1=$C(X1) G:X1="" PREIMP
 S DOLARI=$J,IMPR=0,ADIMP=$S(X1="E":"IMP^TOP0CLAE",1:"^TOP0BACL") Q:X1="E"
 S DX=0,DY=6 D CLEBAS^%VVIDEO W "Impression en cours..." S:$D(^TABIDENT(WHOIS,"PRINTER")) IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR
 Q
TR S ARC=-1 F %III=1:1 S ARC=$N(^GLOCLI(ILAROD,ARC)) Q:ARC=-1  D TR1 I $D(CTRLA) Q:CTRLA=1
 Q
TR1 Q:'($D(^[QUI]PSRLFILI(ARC)))  Q:'($D(^[QUI]PSRLRTES(ARC)))  S NUF=$N(^[QUI]PSRLRTES(ARC,-1)) Q:NUF=-1
 S NUFA=NUF I $D(^[QUI]TREEWORK(NUFA)) D TR3 Q
 F %JJJ=1:1 S NUFA=$N(^[QUI]TREEWORK(NUFA)) Q:(NUFA=-1)!(NUFA'[NUF)  I NUFA'="z" D TR3 I $D(CTRLA) Q:CTRLA=1
 Q
TR3 S TWREF=-1 F %KKK=1:1 S TWREF=$N(^[QUI]TREEWORK(NUFA,TWREF)) Q:TWREF=-1  D @ADIMP S DOLARI=$J I $D(CTRLA) Q:CTRLA=1
 Q

