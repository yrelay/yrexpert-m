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

;%QMDAFIN^INT^1^59547,73877^0
QMDAFIN(VALEUR) 
 
 
 
 
 
 
 
 
 
 
 N ANN,DTE,H,H1,J,JD,JF,MD,MF,MOIS,MS,SEC,SEM,TRI,TYPE,VALHEUR
 S TYPE=$E(VALEUR,1)
 I "TMSDJ"'[TYPE Q VALEUR
 S VALEUR=$E(VALEUR,2,$L(VALEUR))
 G @TYPE
 
T 
 S TRI=$P(VALEUR,"/",1),ANN=$P(VALEUR,"/",2),MD=$$MOISDT^%QZDAJM(TRI),MF=$$MOISFT^%QZDAJM(TRI)
 S JD=$$JOURMD^%QMDATE(ANN,MD),JF=$$JOURMF^%QMDATE(ANN,MF),JF=(JF-$$JOURMD^%QMDATE(ANN,MF))+1
 Q $$DH1^%QMDATE("01/"_MD_"/"_ANN)_",0/"_($$DH1^%QMDATE(JF_"/"_MF_"/"_ANN)+1)_",0"
 
M 
 S MOIS=$P(VALEUR,"/",1),MOIS=MOIS*1,ANN=$P(VALEUR,"/",2)
 S JF=$$JOURMF^%QMDATE(ANN,MOIS),JD=$$JOURMD^%QMDATE(ANN,MOIS),JF=(JF-JD)+1
 Q $$DH1^%QMDATE("01/"_MOIS_"/"_ANN)_",0/"_($$DH1^%QMDATE(JF_"/"_MOIS_"/"_ANN)+1)_",0"
 
S 
 S ANN=$P(VALEUR,"/",2),SEM=$P(VALEUR,"/",1)
 S H=$$50^%QMDATE1(ANN_SEM)
 Q H_",0/"_(H+7)_",0"
 
D 
 S SEM=$P(VALEUR,"/",1),ANN=$P(VALEUR,"/",3),MOIS=$P(VALEUR,"/",2),MOIS=$S($L(MOIS)=1:0_MOIS,1:MOIS)
 I ((MOIS*1)=1)&(SEM=53) S H=$$DH1^%QMDATE("01/"_MOIS_"/"_ANN),H1=$$50^%QMDATE1(ANN_1)-1 G DF
 S H=$$50^%QMDATE1(ANN_SEM),DTE=$$DATEX^%QMDATE(H),MS=$P(DTE,"/",2)
 I MS=MOIS S JF=$$JOURMF^%QMDATE(ANN,MOIS),JD=$$JOURMD^%QMDATE(ANN,MOIS),JF=(JF-JD)+1,H1=$$DH1^%QMDATE(JF_"/"_MOIS_"/"_ANN) G DF
 S H=$$DH1^%QMDATE("01/"_MOIS_"/"_ANN)
 S:(((MOIS*1)=12)!((MOIS*1)=1))&((SEM=52)!(SEM=53)) SEM=0 S SEM=SEM+1
 S H1=$$50^%QMDATE1(ANN_SEM)-1
DF S:H1>(H+6) H1=H+6
 Q H_",0/"_(H1+1)_",0"
 
J 
 S VALHEUR=$P(VALEUR," ",2,$L(VALEUR," ")),VALEUR=$P(VALEUR," ",1)
 S J=$P(VALEUR,"/",1),J=$S($L(J)=1:0_J,1:J),MOIS=$P(VALEUR,"/",2),MOIS=$S($L(MOIS)=1:0_MOIS,1:MOIS),ANN=$P(VALEUR,"/",3)
 S H=$$10^%QMDATE1(J_"/"_MOIS_"/"_ANN)
 S:H=-1 H=$$10^%QMDATE1(ANN_"/"_MOIS_"/"_J)
 Q:VALHEUR="" H_",0/"_(H+1)_",0"
 S SEC=$$SEC^%QZDAJM(VALHEUR) Q H_","_SEC_"/"_H_","_(SEC+1)

