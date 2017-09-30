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

;TOTBPAR4^INT^1^59547,74876^0
TOTBPAR4 ;
 
 S P=0
PARC G:%N=-1 S1 S (%P,%AN)=%N D @PREF S %P=$S(%P="":-1,1:%P_",-1"),%NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_""""),%X=%R
S2 F %I=1:1 Q:%X=-1  S P(P)=%N,P(P+1)=%X,P(P+2)=%AN,P=P+3,%N=%X,(%P,%AN)=%N D @PREF S %P=$S(%P="":-1,1:%P_",-1"),%NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_""""),%X=%R
S1 S %AN=P(P-1),%X=P(P-2),%N=P(P-3),P=P-3,%P=%X,%NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_""""),%X=%R
 F %I=1:1 Q:(%X'=-1)!(P=0)  S %AN=P(P-1),%X=P(P-2),%N=P(P-3),P=P-3,%P=%X,%NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_""""),%X=%R
 G:%X'=-1 S2 Q
 
TEST D ^%VTIME W !,$$^%QZCHW("Global : ") R G Q:G=""
 S PREF="PREF^TOTBPAR4",POSF="POSF^TOTBPAR4",FILS="FILS^TOTBPAR4",FRERE="FRERE^TOTBPAR4",%N="" D ^TOTBPAR4,AFF^%VTIME
 G TEST
FILS S %P=$S(%P="":-1,1:%P_",-1")
FRERE S %NN=$N(@(G_"("_%P_")")),%R=$S(%NN=-1:-1,1:$S(%AN="":"",1:%AN_",")_""""_%NN_"""") Q
PREF W !,%AN Q
POSF Q

