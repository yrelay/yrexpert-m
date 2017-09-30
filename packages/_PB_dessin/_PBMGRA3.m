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

;%PBMGRA3^INT^1^59547,73873^0
PTGRAPH3 ;
 
 
 
 
 
 
 
 
 
 K ^ARC($J),^MEMA($J),^PAGE($J),^PLACE($J),^REF($J),^REFH($J),^REFV($J) S ^PLACE($J,1,%NOEUD,1,1)="",CP=1,NP=1 D INIPAG S ^PAGE($J,1,1,"POS")=2
 F %P=0:0 S NP=$N(^PLACE($J,-1)) Q:NP=-1  S N=$N(^PLACE($J,NP,-1)),NL=$N(^PLACE($J,NP,N,-1)),PO=$N(^PLACE($J,NP,N,NL,-1)) D TN
 D ^%PBMGRI3 K ^ARC($J),CP,HOR,I,%I,^MEMA($J),N,NL,NP,%P,^PAGE($J),^PLACE($J),PO,^REF($J),^REFH($J),^REFV($J) Q
TN S HOR=0 D:'($D(^PAGE($J,NP))) INIPAG S ^PAGE($J,NP,N,NL,PO)="" S:(NL=1)&(PO=1) ^PAGE($J,NP,NL,"POS")=2 I NL=NBL D REFVER G F
 S I=-1 F %I=0:0 S I=$N(^GRAPH($J,N,I)) Q:I=-1  D TF Q:HOR
F K ^PLACE($J,NP,N,NL,PO) Q
TF I $D(^GRAPH($J,N,I,"OK")) S ^REF($J,NP,N,NL,PO)=^MEMA($J,N,I) Q
 I ^PAGE($J,NP,NL+1,"POS")>NBNH D REFHOR S HOR=1 Q
ADD S ^GRAPH($J,N,I,"OK")="",^PLACE($J,NP,I,NL+1,^PAGE($J,NP,NL+1,"POS"))="",^MEMA($J,N,I)=NP_"/"_NL_"/"_PO,^ARC($J,NP,NP_"^"_NL_"^"_PO,NP_"^"_(NL+1)_"^"_^PAGE($J,NP,NL+1,"POS"))="",^PAGE($J,NP,NL+1,"POS")=^PAGE($J,NP,NL+1,"POS")+1 Q
INIPAG F I=1:1:NBL S ^PAGE($J,NP,I,"POS")=1
 Q
REFVER D AJP S ^REFV($J,NP,N,NL,PO)=CP_"/1/1" Q
REFHOR D AJP S ^REFH($J,NP,N,NL,PO)=CP_"/1/1" Q
AJP S CP=CP+1,^PLACE($J,CP,N,1,1)="" Q

