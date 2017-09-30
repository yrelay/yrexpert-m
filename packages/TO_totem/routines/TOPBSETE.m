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

;TOPBSETE^INT^1^59547,74874^0
TOPBSETE ;
 
 K ^SELEC($I) S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=7,LG=0,NBLI=0
CRA S DX=0,DY=DY+1 X XY W "No TOTEM : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" TRAIT
 S SFA=Y1 G:$E(SFA,$L(SFA))="?" LISFAB
 I '($D(^[QUI]TREEWORK(SFA))) D ^TOPBLIET S:DILAV NBLI=NBLI+1,SLIB(NBLI)=SFA D:'(DILAV) ^%VSQUEAK W:'(DILAV) "  ???" G CRA
 S NBLI=NBLI+1,SLIB(NBLI)=SFA,TWREF=-1 F TW=1:1 S TWREF=$N(^[QUI]TREEWORK(SFA,TWREF)) Q:TWREF=-1  S TRWK=^[QUI]TREEWORK(SFA,TWREF),ARC=$P(TRWK,"^",10),LG=LG+1,^SELEC($I,0,LG)=SFA_"^"_TWREF_"^"_ARC
 G CRA
TRAIT D ^TOPBETMG
FIN K ^SELEC($I),SLIB,Y1,CTRLA,CTRLF Q
LISFAB K VALCLE,^LISTAFF($I) S LI=50,EGAP=0,CONT=0
 S DX=0,DY=8 D CLEBAS^%VVIDEO W "Un instant..." D L7^%QSLIB S DX=0,DY=7 X XY
 S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(1)=ARFA,VALCLE(3)=0,ADR="ARFAB^TOPBAFET",%PROGTR="^TOPBTRSE" D ^%VKMULG,^TOPBAFPA
 S DX=0,DY=5 D CLEBAS^%VVIDEO F %BB=1:1 Q:'($D(SLIB(%BB)))  S DY=DY+1 X XY W "No TOTEM : ",SLIB(%BB) I $Y=21 S DX=0,DY=5 D CLEBAS^%VVIDEO
 S NBLI=%BB-1 G CRA

