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

;%SRSAISI^INT^1^59547,73891^0
SRSAISI ;
 
 
 
 
 
 
 
 N ADC,ADG,ADR,ADV,GLO,GLOC,GLON,GLOU,GLOUC,GLOV,I,INIT,MODE,NOM,NUM,POS
 N %C,%R,PK,X,Y,VAL,VALS,VALC,VALN,VALU,VALUC,VALV,TAB,CTR
 S INIT=0
DEB D TITRE
 K Y
DEB1 S Y="25\BLH\2\\\Ajouter,Lister"
 D ^%PKPOP
 G:((CTR="A")!(CTR="F"))!(CTR=-1) FIN
 G:CTR'="" DEB1
 D ^%SRSAIS2
 S @VALS=$P(ADR,")",1)
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX I I="" G DEB
 D ^%PKAFFI(1,0,1,GLO,VALS,.ERR)
 G MEN
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VALS,.ERR)
 
 S NOM=@VALS@(1)
 
MEN S %R=9
 K Y
 S Y="15\CLH\4\\\Ajouter,Modifier,Dupliquer,Supprimer,Champs,Lister,Execution,Visualiser"
 D ^%PKPOP
 G:((CTR="A")!(CTR="F"))!(CTR=-1) FIN
 G:CTR'="" MEN
 
 I X=1 S MODE=0 G DEF
 
 I X=2 S MODE=1 G DEF
 
 I X=3 S MODE=2 G DEF
 
 I X=4 D SUP,POCLEPA^%VVIDEO G MEN
 
 I X=6 S I=$$CHOIX D ^%PKAFFI(1,0,1,GLO,VALS,.ERR) G MEN
 
 I X=7 G CONTROL
 
 I X=8 G AFFICH
 
 
 S MODE=0
 
 S @VALC=$P($$CONCAT^%QZCHAD(ADR,""""_NOM_""""),")",1)_",""CHAMPS"""
 S ADC=@VALC_")"
DEBC D EFF(11)
 K Y
 S Y="25\BLH\2\\\Ajouter,Lister"
DEBC1 D ^%PKPOP
 S MODE=1
 I ((CTR="A")!(CTR="F"))!(CTR=-1) D EFF(11) G MEN
 G:CTR'="" DEBC1
 
 I X=1 S MODE=0 G DEFC
 
 S I=$$CHOIXC I I="" G DEBC
 D ^%PKAFFI(1,0,1,GLOC,VALC,.ERR) G MENC
DEFC 
 D ^%PKSAISI(MODE,0,1,0,1,GLOC,VALC,.ERR)
 
 S POS=@VALC@(1)
 
MENC S ADG=$P($$CONCAS^%QZCHAD(ADC,POS),")",1)
 S %R=21
 K Y
 S Y="13\CLH\4\\\Ajouter,Modifier,Dupliquer,Supprimer,Lister,Type,Valeurs.legales,Note.d'aide"
MENC1 D ^%PKPOP
 I ((CTR="A")!(CTR="F"))!(CTR=-1) D EFF(8) G MEN
 G:CTR'="" MENC1
 
 I X=2 S MODE=1 G DEFC
 
 I X=3 S MODE=2 G DEFC
 
 I X=4 D SUPC,POCLEPA^%VVIDEO G MENC
 
 I X=5 S I=$$CHOIXC D ^%PKAFFI(1,0,1,GLOC,VALC,.ERR) G MENC
 
 I X=6 G UCONT
 
 I X=7 G LEGAL
 
 I X=8 G AIDE
 
 S MODE=0
 G DEFC
 
AFFICH 
 I '($D(@ADR@(NOM,"CHAMPS"))) D ^%VZEAVT($$^%QZCHW("Aucun champ n'est defini pour cette saisie")) G MEN
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COMPIL") K @(TAB)
 
 D ^%SRCOMP(NOM,TAB)
 D ACT^%SRACTIV(NOM,1,TAB) K @(TAB)
 D ^%VZEAVT(""),TITRE
 D ^%PKAFFI(1,0,1,GLO,VALS,.ERR)
 G MEN
 
CONTROL 
 S @VALU=$P($$CONCAT^%QZCHAD(ADR,""""_NOM_""""),")",1)_",""UCONTS"""
 D ^%PKSAISI(1,0,0,0,1,GLOU,VALU,.ERR)
 G MEN
 
UCONT 
 S @VALUC=ADG_",""CONTROLES"""
 
 D ^%PKSAISI(1,0,1,0,1,GLOUC,VALUC,.ERR)
 D EFF(17),^%PKAFFI(1,0,1,GLOC,VALC,.ERR)
 G MENC
 
AIDE 
 S @VALN=ADG_",""AIDE"""
 D EFF(2)
 D ^%PKSAISI(1,0,1,0,1,GLON,VALN,.ERR)
 G AFLEG
 
LEGAL 
 S @VALV=ADG_",""VALEG"""
 S ADV=@VALV_")"
 D EFF(2)
DEBV S %R=22
 K Y
 S Y="25\BLH\2\\\Ajouter,Lister"
DEBV1 D ^%PKPOP
 S MODE=1
 G:((CTR="A")!(CTR="F"))!(CTR=-1) AFLEG
 G:CTR'="" DEBV1
 
 I X=1 S MODE=0 G DEFV
 
 S I=$$CHOIXV I I="" G DEBV
 D ^%PKAFFI(1,0,1,GLOV,VALV,.ERR) G MENV
DEFV 
 D ^%PKSAISI(MODE,0,1,0,1,GLOV,VALV,.ERR)
 
 S NUM=@VALV@(1)
 
MENV S %R=22
 K Y
 S Y="15\CLH\5\\\Ajouter,Modifier,Dupliquer,Supprimer,Lister"
MENV1 D ^%PKPOP
 G:((CTR="A")!(CTR="F"))!(CTR=-1) AFLEG
 G:CTR'="" MENV1
 
 I X=2 S MODE=1 G DEFV
 
 I X=3 S MODE=2 G DEFV
 
 I X=4 D SUPV,POCLEPA^%VVIDEO G MENV
 
 I X=5 S I=$$CHOIXV D ^%PKAFFI(1,0,1,GLOV,VALV,.ERR) G MENV
 
 S MODE=0
 G DEFV
 
AFLEG 
 D EFF(2)
 D ^%PKAFFI(1,0,1,GLO,VALS,.ERR)
 D ^%PKAFFI(1,0,1,GLOC,VALC,.ERR)
 G MENC
 
FIN I INIT=1 K @(VAL)
 Q
 
EFF(Y) 
 S DX=0,DY=Y D CLEBAS^%VVIDEO
 Q
 
TITRE D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition d'un masque de saisie"),0)
 Q
 
 
 
CHOIX() 
 S I=$$UN^%PKCHOIX(ADR,1,3,17) I I="" G FC
 S MODE=1,NOM=I
 S @VALS@(1)=$P(@ADR@(I),$C(0),1)
FC Q I
 
CHOIXC() 
 S I=$$UN^%PKCHOIX(ADC,61,12,8)
 I I="" G FCC
 
 S @VALC@(1)=$P(@ADC@(I),$C(0),1)
 S MODE=1,POS=I
FCC Q I
 
CHOIXV() 
 S I=$$UN^%PKCHOIX(ADV,61,5,15)
 I I="" G FCV
 
 S @VALV@(1)=$P(@ADV@(I),$C(0),1)
 S MODE=1,NUM=I
FCV Q I
 
 
 
SUP 
 I $$POCLE^%PKOUNO($$^%QZCHW("Suppression de la definition, compilation, valeurs et transfert")_" ? ","N")'=1 Q
 K @ADR@(NOM)
 D INIT^%SRSAIS2
 D ^%PKAFFI(0,0,1,GLO,VALS,.ERR)
 
 K @($$ADR^%SRVALID(NOM)),@($$ADR^%SRCOMP(NOM))
 
 K @($$ADR^%SRACTIV(NOM))
 
 K ^[QUI]RQSGLO("SR","CPT",NOM)
 
 D SUPTR^%SRDESTO(NOM)
 Q
 
SUPC 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 Q
 K @ADC@(POS)
 D INIC^%SRSAIS2
 D ^%PKAFFI(0,0,1,GLOC,VALC,.ERR)
 Q
 
SUPV 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 Q
 K @ADV@(NUM)
 F I=1:1:16 S @VALV@(I)=""
 D ^%PKAFFI(0,0,1,GLOV,VALV,.ERR)
 Q

