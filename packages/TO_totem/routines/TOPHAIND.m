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

;TOPHAIND^INT^1^59547,74874^0
TOPHAIND ;
 D TR S KJI=-1 K ORD S ORD=0
LRF S KJI=$N(^REF($J,KJI)) G:KJI=-1 FIN K KJ,RFI,RFJ S REF=^REF($J,KJI),RFI="",RF=""""_YA_"""",NOP=$P(REF,"^",2)
 
 F %U=1,3 S KJ(%U)=$P(REF,"^",%U),RFJ(%U)=$S($D(KA(%U)):KA(%U)_".",1:"")_KJ(%U),RFI(%U)=$S($D(KRI(%U)):KJ(%U)_"|"_KRI(%U),1:"")
 S:'($D(ORD(KJ(1)))) ORD=ORD+1,ORD(KJ(1))=1,(DEC,NUP)=$S($D(KA(3)):1,1:0) S:DEC'=0 DEC=$S(ORD(KJ(1))<10:"0",1:"")_ORD(KJ(1))
 S CT=$S($D(KA(1)):$L(NOP)-1,1:0),@("PU="_"1E"_CT),PU=(ORD-1)*PU,CT=$S(CT=0:NOP,1:PU+NOP),NOPC=CT_$S(NUP=0:"",1:"."_DEC) S:NUP'=0 ORD(KJ(1))=ORD(KJ(1))+1
 S RFJ(2)=NOPC,RF=RF_","""_RFJ(1)_""","""_NOPC_""","""_RFJ(3)_"""",RFI=RFI(1)_"##"_RFI(3)_"#"
 S ^TENTATIV($I,NUFA,TWREF,"PHAS",RFJ(1),RFJ(3),RFJ(2))=0,^GLOETUD($I,NUFA,TWREF,"PHAS",1,BISPH)="!!^"_RFI_"^"_RF_"^"""_YA_""","_SIB,BISPH=BISPH+1 G LRF
FIN K RFJ,KJI,RF,RFI,KA,KR,KI,KRI,VT,KJ,NU,IND Q
TR K KA,KR F %U=2:2 S KI=$P(SIB,"""",%U) Q:KI=""  S KR(%U/2)=KI S:KI["~" KA(%U/2)=$P(KI,"~",1)
 K KRI S KI=-1 F %U=1:1 S KI=$N(^[QUI]INDICE(YA,"KEY",NF,KI)) Q:KI=-1  S KRI(KI-1)=^[QUI]INDICE(YA,"KEY",NF,KI)
 K VT S KJ=-1,%U=0
LKJ S %U=%U+1,KJ=$N(KR(KJ)) G:KJ=-1 FKJ I '($D(KRI(KJ))) S VT(%U,KR(KJ))=1 G LKJ
 S IND=KRI(KJ),NU=-1 F %V=1:1 S NU=$N(^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU)) G:NU=-1 LKJ S VI=^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU),VT(%U,VI)=1
FKJ D ^TOGCOMBI("VT","^","^REF($J)") Q

