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

;%ANINSTX^INT^1^59547,73866^0
ANSINSTX(CH,CTXTX,DEF) 
 
 
 
 
 
 
 Q:DEF="" CH N A,I,P,R,RI,TI,V Q:'($F(CH,"@",0)) CH S P=0
BL S P=$F(CH,"@",P) G:P=0 FL D ATT(CH,P,.A,.I)
 S RI="" I I'="" S RI=$E(I,2,$L(I)-1),@("RI="_RI)
 I '($D(CTXTX(DEF))) S LAT(A_I)=A_I G BL
 S:RI="" RI=1
 S LAT(A_I)=$$^%QSCALIN(CTXTX(DEF,"BASE"),CTXTX(DEF,"OBJET"),A,RI) G BL
FL S R=CH,A=""
 F P=0:0 S A=$ZP(LAT(A)) Q:A=""  S R=$$ZSUBST^%QZCHSUB(R,"@"_A,LAT(A))
 Q R
 
ATT(CH,P,A,I) N C,PP,R S (A,I)=""
 S R="" F PP=P:1 S C=$E(CH,PP) Q:(C'?1NA)&(C'=".")  S R=R_C
 S A=R,C=$E(CH,PP) Q:C'="("
 S PP=PP+1,C=$E(CH,PP) G:C="""" GUIL
 S R="" F PP=PP:1 S C=$E(CH,PP) Q:C'?1N  S R=R_C
 S I=R Q
GUIL S R="" F PP=PP+1:1 S C=$E(CH,PP) Q:(C'?1NA)&(C'=".")  S R=R_C
 S I=""""_R_"""" Q

