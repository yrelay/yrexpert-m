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

;%QFOBJ^INT^1^59547,73875^0
GROBJ ;
AFFOBJ N AFF,AFF1
 S LI=$Y
 D ON^%VZEATT
 I GROSEL="" D POCLEPA^%VVIDEO,BLD^%VVIDEO W "Veuillez selectionner un",%eg," ",%ngro,", SVP." D ^%VSQUEAK H 2 D NORM^%VVIDEO G FINCHG
 Q:'($D(^PAG($J,PAG,LI)))  I $D(^[QUI]GROAFF(NUFA,^PAG($J,PAG,LI)))=1 D POCLEPA^%VVIDEO,BLD^%VVIDEO W %nind," deja affecte",%ei," a ",^[QUI]GROAFF(NUFA,^PAG($J,PAG,LI)),"  " D ^%VSQUEAK H 2 D NORM^%VVIDEO S DX1=2,DY1=LI G FIN1
 
 I '($$OKAFF(@CUSTOM1@("AFFOBJ"),GROSEL,^PAG($J,PAG,LI),.AFF)) G FINX
 D PLACER(@CUSTOM1@("PLACER"),NUFA,GROSEL,^PAG($J,PAG,LI),^ATTR($J,"O",6),.AFF1)
 S SG=GROSEL,OBJ=^PAG($J,PAG,LI),ATTR=^ATTR($J,"O",6) D ALS^%QFPAG
 I AFFLIST S LIG=LI D BLD^%VVIDEO,AFLIG^%QFPAG,NORM^%VVIDEO S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG G FINX
 I '(AFFLIST) S LIEF=LI D EFLIG^%QFPAG S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG G FINX
 
RAPPEL N AFF1
 S DX1=2,DY1=$Y,LI=DY1 Q:'($D(^PAG($J,PAG,LI)))
 I $D(^[QUI]GROAFF(NUFA,^PAG($J,PAG,LI)))=0 D POCLEPA^%VVIDEO,BLD^%VVIDEO W "non encore affecte",%ei,"." D NORM^%VVIDEO,^%VSQUEAK H 2 G FIN1
 D ON^%VZEATT
 S OBJ=^PAG($J,PAG,LI),SG=^[QUI]GROAFF(NUFA,OBJ)
 
 S ATTR=^ATTR($J,"O",6)
 D RAPP1(@CUSTOM1@("RAPPEL"),NUFA,SG,OBJ,ATTR,.AFF1)
 S LIG=LI
 D AFLIG^%QFPAG,APD^%QFPAG G FIN0
FIN1 S RETOUR=1 Q
FIN2 S RETOUR=2 Q
FINCHG S RETOUR=-1 Q
FIN0 I AFF1 D SCREESH^%QFECRAN S RETOUR=1 Q
 S RETOUR=0 Q
FINX 
 D SCREESH^%QFECRAN S RETOUR=1 Q
 S RETOUR=0
 Q
 
 
 
 
 
 
 
 
 
 
OKAFF(ADR,GR,OBJ,RETOUR) 
 N A
 I ADR="" S RETOUR=2 Q
 S @("A="_ADR)
 Q A
 
 
 
 
 
 
PLACE(NUFA,ATTR,SG,OBJ) 
 S ^[QUI]GROUPE(NUFA,1,SG,"OBJET",OBJ)=1
 S ^[QUI]GROAFF(NUFA,OBJ)=SG
 D OBJ^%QFEVASG
 Q
 
 
 
 
 
 
 
 
PLACER(PLACER,NUFA,SG,OBJ,ATTR,AFF) 
 N PLACE
 S AFF=0
 I PLACER="" D PLACE(NUFA,ATTR,SG,OBJ) Q
 S PLACE="PLACE^%QFOBJ("""_NUFA_""","""_ATTR_""")"
 D @PLACER
 Q
 
 
 
 
 
 
RAPP(NUFA,ATTR,SG,OBJ) 
 K ^[QUI]GROUPE(NUFA,1,SG,"OBJET",OBJ),^[QUI]GROAFF(NUFA,OBJ)
 D SUPOBJ^%QFEVASG
 Q
 
 
 
 
 
 
 
 
RAPP1(RAPPEL,NUFA,SG,OBJ,ATTR,AFF) 
 N RAPP
 S AFF=0
 I RAPPEL="" D RAPP(NUFA,ATTR,SG,OBJ) Q
 S RAPP="RAPP^%QFOBJ("""_NUFA_""","""_ATTR_""")"
 D @RAPPEL
 Q

