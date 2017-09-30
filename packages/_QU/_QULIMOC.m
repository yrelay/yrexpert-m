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

;%QULIMOC^INT^1^59547,73885^0
QULIMOC(I,L,XG,YH,DH,DV,PLAFD,GL,PAGEZ,BOUT,TYPE,MODE,NL,PAGE,%YB,%YH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PLAN,PLAF
 S PLAN=(YH+DV)-1,PLAF=YH
 
 
 
 I ((TYPE="P")&(MODE=0))&(%YB<PLAN) S %YB=%YB+1,TYPE="L" D REAFF^%QULIMO3(I+1,1,L,XG,%YB-1,DH,((YH+DV)-%YB)+1) Q
 
 I (((BOUT=0)&(TYPE="P"))&(MODE=0))&(%YB'<PLAN) S:NL=0 NL=1 S %YH=PLAF,%YB=$$MIN((PLAF+NL)+1,PLAN) D REAFF^%QULIMO3(I+1,1,L,XG,%YB-1,DH,((YH+DV)-%YB)+1) Q
 
 I (((BOUT=1)&(TYPE="P"))&(MODE=0))&(%YB'<PLAN) Q
 
 
 
 I ((TYPE="P")&(MODE=1))&(PAGE'>2) S %YH=PLAFD,%YB=PLAN D REAFF^%QULIMO3($$R^%QULIMO3(GL,PAGEZ,1),$$L^%QULIMO3(GL,PAGEZ,1),L,XG,YH,DH,(PLAFD-YH)+2) Q
 
 I ((TYPE="P")&(MODE=1))&(PAGE>2) S %YH=PLAF,%YB=PLAN Q
 
 I (TYPE="L")&(MODE=1) S %YB=%YB-1 D REAFF^%QULIMO3(I+1,1,L,XG,%YB-1,DH,((YH+DV)-%YB)+1) Q
 
 
 I (TYPE="P1")&(PAGE'=1) S %YH=PLAFD,%YB=PLAN,TYPE="P2" D REAFF^%QULIMO3($$R^%QULIMO3(GL,PAGEZ,1),$$L^%QULIMO3(GL,PAGEZ,1),L,XG,YH,DH,(PLAFD-YH)+2) Q
 Q
MIN(A,B) 
 Q:A<B A Q B

