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

;TOTBACK^INT^1^59547,74875^0
TOTBACK ;
 
T D ^TOTBACKA S %N="""BUT"",""BUT"",""BUT"",0",FILS="FILS^TOTBACK",FRERE="FRERE^TOTBACK",G="^[QUI]BACKIMPL" D ^TOTBPAR2 Q
FILS S %RR=$Q(@(G_"("_%P_")"))
BFS I %RR'[("("_%P) S %R=-1 G FS
 S %NN=$E(%RR,$F(%RR,"(",0),$L(%RR)-1),%N2=$N(@(G_"("_$P(%NN,",",5)_","_$P(%NN,",",6)_","_$P(%NN,",",7)_",-1)")) I %N2=-1 S %RR=$Q(@(G_"("_$P(%RR,"(",2))) G BFS
 S %R=$P(%NN,",",5)_","_$P(%NN,",",6)_","_$P(%NN,",",7)_","_%N2
FS Q
FRERE S %RR=$N(@(G_"("_%P_")")) I %RR=-1 S %R2=$P(%P,",",1)_","_$P(%P,",",2)_","_$P(%P,",",3) G ENCORE
 S %R=$P(%P,",",1)_","_$P(%P,",",2)_","_$P(%P,",",3)_","_%RR Q
ENCORE S %RR=$Q(@(G_"("_%AN_","_%R2_")")) I %RR'[("("_%AN) S %R=-1 Q
 I $N(@(G_"("_%R2_"-1)"))=-1 S %R2=$E(%RR,$F(%RR,"(",0),$L(%RR)-1),%R2=$P(%R2,",",5)_","_$P(%R2,",",6)_","_$P(%R2,",",7) G ENCORE
 S %R=%R2_","_$N(@(G_"("_%R2_"-1)")) Q
 
TEST W !,$$^%QZCHW("Article : ") R %ART Q:%ART=""
 W !,$$^%QZCHW("Domaine : ") R %DOM Q:%DOM=""
 W !,$$^%QZCHW("Parametre :") R %IMPL Q:%IMPL=""
 S PREF="PREF^TOTBACK",POSF="POSF^TOTBACK",G="^BACKIMPL($J)"
 D T Q
PREF W !,$$^%QZCHW("Niveau : "),%NIV,$$^%QZCHW(" Noeud : "),%N Q
POSF W !,$$^%QZCHW("Niveau : "),%NIV,$$^%QZCHW(" Noeud : "),%N Q

