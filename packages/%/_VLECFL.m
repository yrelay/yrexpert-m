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

;%VLECFL^INT^1^59547,74035^0
VLECFL(VDEF,MES,REAFF,UCONT,DX1,DY1,LA,CTR,YY1) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,UCONT1,FIN,REAF
 S:($D(RM)#10)=0 RM=80
 S:LA="" LA=RM
 S UCONT1="FIN="_$$CONCAT^%QZCHAD(UCONT,".YY1,.REAF")
 S:DX1="" DX=$X S:DY1 DY=$Y
 S FIN=1
 F I=0:0 Q:$$CMS
 Q
CMS() S DX=DX1,DY=DY1,REAF=0
 S:($D(RM)#10)=0 RM=80 X XY W MES
 D GET^%VLECFL2(VDEF,$X,$Y,$X-1,$$MIN(($X-1)+LA,RM),.CTR,.YY1)
 I CTR="A" S YY1=$$^%QCAZG("YY1") Q 1
 I UCONT'="" S @(UCONT1) D:REAF&(REAFF'="") @REAFF
 S VDEF=YY1 Q FIN
MIN(A,B) Q:A<B A Q B
 
S(VDEF,MES,UCONT,DX1,DY1,CTR,YY1) 
 D VLECFL(VDEF,MES,"",UCONT,DX1,DY1,"",.CTR,.YY1)
 Q
S1(VDEF,MES,DX1,DY1,CTR,YY1) 
 D VLECFL(VDEF,MES,"","",DX1,DY1,"",.CTR,.YY1)
 Q
MES(VDEF,MES,CTR,YY1) 
 D VLECFL(VDEF,MES,"","","","","",.CTR,.YY1)
 Q
TEST D CLEPAG^%VVIDEO
 S VDEF="Valeur def",MES="voici le message : ",REAFF="RE^%VLECFL"
 S UCONT="$$UC^%VLECFL(""TATA"")",DX1=10,DY1=10,LA=30
 D ^%VLECFL(VDEF,MES,REAFF,UCONT,DX1,DY1,LA,.CTR,.YY1)
 D ^%VZEAVT("Controle "_CTR_"   Valeur "_YY1)
 Q:YY1=1  Q  G TEST
UC(V,YY1,REAF) 
 D ^%VZEAVT(V_$$^%QZCHW(" n est pas egal a ")_YY1_$$^%QZCHW(" mais ce n'est pas grave !"))
 I $$NUM^%QZNBN(YY1)=0 D ^%VZEAVT("un numerique merci 1 pour finir") S REAF=1 Q 0
 Q 1
RE D CLEPAG^%VVIDEO W !,"REAFFICHEAGE EN COUR" H 1 Q

