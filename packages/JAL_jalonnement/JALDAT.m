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

;JALDAT^INT^1^59547,74867^0
JALDAT ;
 
 
 
 
 
 
 
INIT Q:$$^%QCAZG("^JALDAT")=$$ANNEE^%QMDATE
 D MSG^%VZEATT("Initialisation en cours...")
 K ^JALDAT
 N X0,Y0,DDX,DDY,ANNEE,A,S,H,JA,X,Y,CPT,b,r,n
 S b=$$BLD^%VVIDEO1,r=$$REV^%VVIDEO1,n=$$NORM^%VVIDEO1
 D POS
 S ANNEE=$$ANNEE^%QMDATE
 D ANNEES(ANNEE)
FIN S ^JALDAT=$$ANNEE^%QMDATE
 D POCLEPA^%VVIDEO Q
ANNEES(A) 
 S X=X0,Y=Y0,CPT=0,MAX=(A+1)*10000,ANN=A
 S HPS=$$HPS^%QMDAK4(A),^JALDAT(HPS-5E-1)=b_r_$$XY^%VVIDEO1(X,Y)_"<<<<"_n
 F H=HPS:7 S AN=$E($$02^%QMDATE1(H),1,2) Q:AN>(A+1)  D NEWYEAR:AN>ANN S ANN=AN D ANNEES2
 S ^JALDAT("x")=b_r_$$XY^%VVIDEO1(X-DDX,Y)_">>>>"_n
 Q
NEWYEAR 
 S Y0=(Y0+1)+(6*DDY),CPT=0,X=X0,Y=Y0 Q
ANNEES2 
 S ^JALDAT(H+65E-1)=b_$$XY^%VVIDEO1(X,Y)_$$NOSEM^%QMDAK4(H)_n
 S CPT=CPT+1 I CPT=10 S X=X0-DDX,Y=Y+DDY,CPT=0
 S X=X+DDX
 Q
POS S X0=11,Y0=3,DDX=6,DDY=1 Q
 
AFF 
 D INIT N CPT,SE,A,X0,Y0,DDX,DDY D POS
 O $I
 S C=-1 F U=0:0 S C=$N(^JALDAT(C)) Q:C="x"  W $E(^JALDAT(C),5,999)
 Q
AFFA S CPT=0,X=X0,Y=Y0 F S=1:1:52 S SE=$S(S<10:"0"_S,1:S) D AFFS
 Q
AFFS W $$XY^%VVIDEO1(X,Y)_A_SE S CPT=CPT+1
 I CPT=10 S X=X0-DDX,Y=Y+DDY,CPT=0
 S X=X+DDX
 Q
TEST 
 D CLEPAG^%VVIDEO,AFF
LEC S DX=0,DY=20 D CLEBAS^%VVIDEO X XY
 S DATE=$$SAISIE^%VYDAT Q:DATE=""  D AFF S H=$$10^%QMDATE1(DATE) W ^JALDAT($O(^JALDAT(H))) G LEC

