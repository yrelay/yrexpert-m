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

;%DLJFORA^INT^1^59547,73868^0
DLJFORA ;
 
 N MORES1,MORES2
 S %BLOC=0 I ADEL["FORMU",XDP[":" S %BLOC=1 G END
 D CORRECT^%DLRECPO I CORRECT=0 S AEXEC=0 G END
 S XPX=1,AEXEC=1,IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S PCH=$E(XDP,IK+1,IKS-1) D ABREV Q:ERREUR  S VPOL(XPX)=VXPX,XPX=XPX+1
 G:ERREUR KILL
 D ^%ABRECON G KILL Q
ABREV N P1,P2
 S ROPC="^%DLJFORA" G:$E(PCH,1)="""" PCH
 I PCH["'" S P2=$P(PCH,"'",2),P1=$P(PCH,"'") Q:'($$VAR(P2,.MORES1,.MORES2))  S ^V($J,"PAR",MORES1,MORES2,P1)="",VXPX="^V($J,"""_MORES1_""","_MORES2_","""_P1_""")" Q
PCH D ^%DLJANBR G @AD
CONT G FIN
ZERO I CONCUR=0 G CONCAT
FIN I $E(PCH,1)="$" S VXPX=PCH G END
 Q:'($$VAR("DEFAUT",.MORES1,.MORES2))
 S ^V($J,"PAR",MORES1,MORES2,PCH)="",VXPX="^V($J,"""_MORES1_""","_MORES2_","""_PCH_""")" Q
 S BES("IMPLICITE",PCH)=1,CONCUR=1,PCHCOMP=PCH,%RL=0 D:$D(^[QUI]RANG(WB1,PCHCOMP)) ^%AB3IMPI S VXPX="V(YA,"""_PCHCOMP_""")",%BIL=PCHCOMP,%PYT="P" Q
ESTENT S VXPX=PCH Q
QUIT Q
END Q
CONCAT I $E(PCH,1)="$" S VXPX=PCH G END
 I NOLIT=1 S ^[QUI]UNKN(WB1,PCH,$E(PCH,1,2)_$R(10000))=ADEL_" "_FFF,PCHCOMP=PCH D DEB^%AB3KEMP S VXPX="V(YA,"""_PCHCOMP_""")",%BIL=PCHCOMP,%PYT="UP" G END
 S VXPX=""""_PCH_"""",%BIL=PCH,%PYT="C" G END
KILL K CORRECT,IH,IK,IKS,NOLIT,VI,XPX Q
 
VAR(IDENT,MOTRES1,MOTRES2,MOTRES3) 
 I IDENT="ARTICLE" S MOTRES1="ARTICLE",MOTRES2="ART" Q 1
 I IDENT="PERE" S MOTRES1="ARTICLE",MOTRES2="PERE" Q 1
 I IDENT="DEFAUT" S MOTRES1="ARTICLE",MOTRES2="DEF" Q 1
 I IDENT="TETE" S MOTRES1="ARTICLE",MOTRES2="TETE" Q 1
 I IDENT="GAMME" S MOTRES1="GAMME",MOTRES2="GAMME" Q 1
 I IDENT="LANCEMENT" S MOTRES1=IDENT,MOTRES2="LANC" Q 1
 I IDENT="MACHINE1" S MOTRES1=IDENT,MOTRES2="MAC1" Q 1
 I IDENT="MACHINE2" S MOTRES1=IDENT,MOTRES2="MAC2" Q 1
 I IDENT="OPERATION1" S MOTRES1=IDENT,MOTRES2="OP1" Q 1
 I IDENT="OPERATION2" S MOTRES1=IDENT,MOTRES2="OP2" Q 1
 S MOTRES1="FAMILLE.TECHNO"
 S MOTRES2=""""_IDENT_""""
 Q 1

