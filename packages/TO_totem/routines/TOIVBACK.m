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

;TOIVBACK^INT^1^59547,74872^0
TOIVBACK ;
 
 
 
 K ^L($J) S ^L($J,1)=%ART,^L($J,1,%ART)=%DOM,^L($J,1,%ART,%DOM)=%IMPL,(^L($J,$$^%QZCHW("HAUT")),^L($J,$$^%QZCHW("BAS")))=1 K @(%TE),@(%TS),@(%TC),@(%TR),^TT($J)
 F %P=1:1 S P=^L($J,$$^%QZCHW("BAS")) Q:^L($J,$$^%QZCHW("HAUT"))<P  S A=^L($J,P),D=^L($J,P,A),I=^L($J,P,A,D),^L($J,$$^%QZCHW("BAS"))=P+1 D T1 G:%ETM FIN
 D MODIF,^TO4TRITO
 
FIN K A,A2,%A2,D,D2,%D2,DEFA,DEFI,F,%F,I,%I,LF,^L($J),P,P2,^TT($J),X1,X2 Q
T1 K LF S F=-1 F %F=1:1 S F=$N(^[QUI]SENSFICH(A,1,D,I,F)) Q:F=-1  D T11 G:%ETM FIN
 D SINON Q
T11 S LF(F)="" I $N(^[QUI]SENSFICH(A,0,D,F,"BES",-1))=-1 D SANPAR Q
 S D2=-1 F %D2=1:1 S D2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2)) Q:D2=-1  S A2=-1 F %A2=1:1 S A2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2)) Q:A2=-1  D T2 Q:%ETM
 Q
T2 S I2=-1 F %I2=1:1 S I2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2,I2)) Q:I2=-1  D T21 Q:%ETM  D T3
 Q
T21 I (D2=$$^%QZCHW("IMPLICI"))&((A2=$$^%QZCHW("MATIERE"))&(%KNM=0)) S %ETM=1
 Q
T3 S A21=$S(A2=$$^%QZCHW("ARTICLE"):%ART,(D2=$$^%QZCHW("IMPLICI"))&((A2=$$^%QZCHW("MATIERE"))&(%KNM=1)):%MC(1),1:A2)
 I '($D(^L($J,"TRAI",A21,D2,I2))) S P=^L($J,$$^%QZCHW("HAUT"))+1,^L($J,P)=A21,^L($J,P,A21)=D2,^L($J,P,A21,D2)=I2,^L($J,$$^%QZCHW("HAUT"))=P,^L($J,"TRAI",A21,D2,I2)=""
 S ^TT($J,A,D,I,F,A21,D2,I2)="" Q
 
SANPAR S LF(F,"NEANT")="",^TT($J,A,D,I,F,"NEANT","NEANT","NEANT")="" I $D(^[QUI]IREPFICH(A,F)),$P(^[QUI]IREPFICH(A,F),"^",3) S LF($$^%QZCHW("SINON"))=F Q
 
SINON Q:'($D(LF($$^%QZCHW("SINON"))))  S SF=LF($$^%QZCHW("SINON")),NF=-1 F %NF=0:0 S NF=$N(LF(NF)) Q:(NF=-1)!(NF=SF)  S X2=A_"^"_NF,X1=A_"^"_SF,@%TE@(X2,X1)=1,@%TS@(X1,X2)=1,@%TC@(X1)=$S($D(@%TC@(X1)):@%TC@(X1)+1,1:1) Q
 
MODIF S I="" F %I=0:0 S I=$Q(@("^TT("_$J_I_")")) Q:I'[("("_$J)  S I=$E(I,$F(I,"(",0),$L(I)-1),I=$E(I,$F(I,",",0)-1,$L(I)) D T
 S I="" F %I=0:0 S I=$Q(@("^TT("_$J_I_")")) Q:I'[("("_$J)  S I=$E(I,$F(I,"(",0),$L(I)-1),I=$E(I,$F(I,",",0)-1,$L(I)) X "S X1="_$P(I,",",2)_",X2="_$P(I,",",5) I '($D(@%TC@(X1_"^"_X2))) S @%TC@(X1_"^"_X2)=0
 Q
T Q:I["""NEANT"",""NEANT"",""NEANT"""  S A=$P(I,",",2),F=$P(I,",",5),A2=$P(I,",",6),D2=$P(I,",",7),P2=$P(I,",",8) X "S AA="_A_",FA="_F_",A2A="_A2 S X1=AA_"^"_FA
 S F2=-1 F %F=0:0 S F2=$N(@("^TT("_$J_","_A2_","_D2_","_P2_","_F2_")")) Q:F2=-1  X "S F2A="_F2 S X2=A2A_"^"_F2A S:'($D(@%TE@(X2,X1))) @%TE@(X2,X1)=1,@%TS@(X1,X2)=1,@%TC@(X1)=$S($D(@%TC@(X1)):@%TC@(X1)+1,1:1)
 Q
 
TEST S %TE="^ENTREE($J)",%KNM=0,%ETM=0,%TS="^SORTIE($J)",%TC="^CARD($J)",%TR="^RESULT($J)"
 W !,$$^%QZCHW("Article : ") R %ART Q:%ART=""
 W !,$$^%QZCHW("Domaine : ") R %DOM Q:%DOM=""
 W !,$$^%QZCHW("Parametre :") R %IMPL Q:%IMPL=""
 W ! D ^TOIVBACK Q

