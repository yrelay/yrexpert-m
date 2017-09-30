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

;TO391LAT^INT^1^59547,74869^0
TO391LAT ;
 
 S PC1=$P(IPC,"'",1),PC2=$P(IPC,"'",2)
 I PC2=$$^%QZCHW("MATIERE") S IPC=$$^%QZCHW("MATIERE") D ^TO392LAT G FIN
 G:$D(^[QUI]FULL(PC2)) ART
 I $D(^[QUI]FLIMPLI(ARTI,PC2))!($D(^[QUI]EXPL(ARTI,PC2))!$D(^[QUI]CONSTANT(PC2))) G FIN
ART S GRIL1="FLIMPLI",GRIL2=""""_ARTI_""","""_NP_""","""_NF_"""",GRIL3=""""_ARTI_""","""_$P(TABNAM,"]",2)_""","""_NP_""","""_NF_""""
 S TCOU="^[QUI]"_GRIL1_"("_GRIL2_")" G:'($D(@TCOU)) FIN
 S RT="("_GRIL3_",""^V($I,"""""_PC2_""""","""""_PC1_""""")"")",@("^[QUI]PARINDEF"_RT)=1,^[QUI]REFLATER(ARTI,PC2,PC1)=1
 S @("^[QUI]NONTRI("_GRIL2_")")=1 D GETNU S ^[QUI]IMPBIS(ARTI,ORD)="("_GRIL2_")" G FIN
FIN Q
GETNU S TTB="^[QUI]IMPBIS(ARTI)",NUM=-1,ORD=-1 F WWQ=0:0 S NUM=$N(@TTB@(NUM)) Q:NUM=-1  S ORD=NUM
 S ORD=$S(ORD=-1:1,1:ORD+1)
 Q

