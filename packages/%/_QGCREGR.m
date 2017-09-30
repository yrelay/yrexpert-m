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

;%QGCREGR^INT^1^59547,73876^0
GRCREGRO ;
CREAGRO S CTRLA=0 D POCLEPA^%VVIDEO W %ngro," a creer:  " S DX=$X W *-1 D ^%VLEC G:CTRLA!(Y1="") FIN1 S GR=-1
LCG S GR=$N(@GROUPE@(1,GR)) G:GR=-1 OKCG G:GR'=Y1 LCG
 D POCLEPA^%VVIDEO,BLD^%VVIDEO W %ngro," ",GR," deja cree",%eg," !  " D ^%VSQUEAK H 2 D NORM^%VVIDEO G CREAGRO
OKCG G:'($$OKLIST(Y1)) CREAGRO
 S GROSEL=Y1,PAD=NBPAD I ^PAD($J,0)=20 S PAD=PAD+1,NBPAD=NBPAD+1,^PAD($J,0)=5
 S @GROUPE@(1,GROSEL)="",@GROUPE@(1,GROSEL,"CARD")=0
 S SG=GROSEL D SG^%QGEVASG
 D CREPAD^%QGPAG S %GR=-1,POS=1 F U=0:0 S %GR=$N(@GROUPE@(1,%GR)) Q:%GR=GROSEL  S POS=POS+1
 S PAD=(POS\15)+1 D APD^%QGPAG G FIN1
FIN1 S RETOUR=1 Q
OKLIST(NLISTE) 
 N A
 S @("A="_CREA1)
 Q A

