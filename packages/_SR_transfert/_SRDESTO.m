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

;%SRDESTO^INT^1^59547,73891^0
SRDESTO ;
 
 
 
 
 
 N SA
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition du stockage des valeurs"),0)
 S SA=$$UN^%PKCHOIX($$ADR^%SRSAIS2,10,3,17)
 Q:SA=""
 D STO(SA)
 G CHS
 
STO(SA) 
 N %C,%R,PK,X,Y,CTR
 N ADS,ADR,GLO,GLOA,GLOI,GLOIL,GLOL,I,MODE,POS,VALA,VALI,VALIL,VALL
 D ^%VZCDB($$^%QZCHW("Definition du transfert pour le masque")_" "_SA,0)
 D ^%SRDESTI
 S ADS=$$CONCAT^%QZCHAD(ADR,""""_SA_"""")
MEN S %R=21
 K Y
 S Y="10\CLH\6\\\Individus,Individus.liens,Liens,Attributs,Supprimer,Dupliquer"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") FIN
 G:CTR'="" MEN
 
 I X=1 G INDIV
 
 I X=2 G INDLIE
 
 I X=3 G LIEN
 
 I X=4 G ATR
 
 I X=5 D SUP,EFF(9) G MEN
 
 D DUP
 G MEN
 
INDIV 
 S @VALI=$P(ADS,")",1)_",""INDIVIDUS"""
 D GEST(GLOI,VALI,"INDIVIDUS")
 G MEN
 
INDLIE 
 S @VALIL=$P(ADS,")",1)_",""INDLIENS"""
 D GEST(GLOIL,VALIL,"INDLIENS")
 G MEN
 
ATR 
 S @VALA=$P(ADS,")",1)_",""ATTRIBUTS"""
 D GEST(GLOA,VALA,"ATTRIBUTS")
 G MEN
 
LIEN 
 S @VALL=$P(ADS,")",1)_",""LIENS"""
 D GEST(GLOL,VALL,"LIENS")
 G MEN
 
FIN I INIT=1 K @(VAL)
 Q
 
DUP 
 N SAD
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez le masque a dupliquer"),0)
 S SAD=$$UN^%PKCHOIX(ADR,10,3,17)
 I SAD'="" D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ADR,""""_SAD_""""),ADS)
 Q
 
GEST(GLO,VAL,CLE) 
 N TIT,CTR
 S TIT=$S(CLE="INDLIENS":"individus liens",1:$$MIN^%VMINUSC(CLE))
 D EFF(9)
DEB S %R=21
 K Y
 S Y="25\BLH\2\"_TIT_"\\Ajouter,Lister"
 D ^%PKPOP
 Q:(CTR="A")!(CTR="F")
 G:CTR'="" DEB
 S MODE=1
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX(@VAL_")",VAL) I I="" G DEB
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR)
 G MENC
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 
 S POS=@VAL@(1)
 
MENC S %R=21
 K Y
 S Y="13\CLH\5\"_TIT_"\\Ajouter,Modifier,Dupliquer,Supprimer,Lister"
 D ^%PKPOP
 Q:(CTR="A")!(CTR="F")
 G:CTR'="" MENC
 
 I X=2 S MODE=1 G DEF
 
 I X=3 S MODE=2 G DEF
 
 I X=4 D SUPF(GLO,VAL,CLE) G MENC
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX(@VAL_")",VAL)
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR)
 G MENC
 
EFF(Y) 
 S DX=0,DY=Y D CLEBAS^%VVIDEO
 Q
 
 
 
CHOIX(GL,VAL) 
 S I=$$UN^%PKCHOIX(GL,1,3,17) I I="" G FC
 S MODE=1,POS=I
 S @VAL@(1)=$P(@GL@(I),$C(0),1)
FC Q I
 
 
 
SUP 
 I $$POCLE^%PKOUNO($$^%QZCHW("Suppression de toute la definition du stockage")_" ? ","N")'=1 Q
 K @ADR@(SA)
 D INIV^%SRDESTI
 Q
 
SUPF(GLO,VAL,CLE) 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression de cette fiche")_" ? ","N")'=1 G FS
 K @ADS@(CLE,POS)
 F I=1:1:4 S @VAL@(I)=""
 I CLE="ATTRIBUTS" S @VAL@(5)="",@VAL@(6)=""
 E  S @VAL@(5)="N"
 D ^%PKAFFI(0,0,1,GLO,VAL,.ERR)
FS D POCLEPA^%VVIDEO
 Q
 
 
SUPTR(NOM) 
 
 K @($$CONCAT^%QZCHAD($$ADRS^%SRDESTI,""""_NOM_""""))
 
 K @($$ADRERWA^%SRSTVAL(NOM))
 
 K @($$ADRC^%SRSTVAL(NOM))
 
 K @($$ADROK^%SRBATCH(NOM)),@($$ADRNOK^%SRBATCH(NOM))
 Q

