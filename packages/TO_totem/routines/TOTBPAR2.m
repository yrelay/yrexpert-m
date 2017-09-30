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

;TOTBPAR2^INT^1^59547,74876^0
TOTBPAR2 ;
 
 S (P,C,%HALT,%NIV,%FEUIL,%CYCL)=0,%AN=""
PARC Q:%N=-1  S %CYCL=$D(C(%N)) Q:%CYCL  S %NIV=%NIV+1 S:%N'="" C(%N)="" S %P=%N D @FILS S %FEUIL=%R=-1 D @PREF S %X=%R,P(P)=%N,P(P+1)=%AN,P(P+2)=%CYCL,P(P+3)=%FEUIL,P=P+4,%AN=%N
 F %I=0:0 Q:%X=-1  S P(P)=%X,P=P+1,%N=%X D PARC S P=P-1,%X=P(P),%P=%X D @FRERE S %X=%R
 S P=P-4,%N=P(P),%AN=P(P+1),%CYCL=P(P+2),%FEUIL=P(P+3) D @POSF S %NIV=%NIV-1 K C(%N) Q
 
TEST D ^%VTIME W !,"Global : " R G Q:G=""  S PREF="PREF^TOTBPAR2",POSF="POSF^TOTBPAR2",FILS="FILS^TOTBPAR2",FRERE="FRERE^TOTBPAR2",%N="" D ^TOTBPAR2,AFF^%VTIME G TEST
FILS S %NN=$S(%P="":"-1",1:%P_",-1"),%NN=$N(@(G_"("_%NN_")")),%R=$S(%NN=-1:-1,1:$S(%P="":"",1:%P_",")_""""_%NN_"""") Q
FRERE Q:%NIV=0  S %NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_"""") Q
PREF W !,"PREF ",%NIV,",",%AN,",",%N W:%FEUIL $$^%QZCHW("  Feuille") W:%CYCL $$^%QZCHW("  Cycle detecte") Q
POSF W !,"POSF ",%NIV,",",%AN,",",%N W:%FEUIL $$^%QZCHW("  Feuille") W:%CYCL $$^%QZCHW("  Cycle detecte") Q

