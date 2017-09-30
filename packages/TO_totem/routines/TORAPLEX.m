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

;TORAPLEX^INT^1^59547,74874^0
TORAPLEX ;
 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("LEXIQUE <====> S.F"))
 S DX=5,DY=7 X XY W "Rapprochement pour l'article : " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN
 S ARTI=Y1 W " OK !",!,!
 S ADR="TRAIT^TORAPLEX",RLEX=1 K ^[QUI]RAPLEXSF(ARTI)
 S VISU=1
RECABR 
 S ETUD="IMPL",NOMTAB="^[QUI]IMPLICI(ARTI",FONTAB="^[QUI]FIMPLICI(ARTI",F1=18,NFOR=1,NCLE=3,PNUM=2 D ^%VTENR G:STOP=1 FIN
 S ETUD="IMPTRIP",NOMTAB="^[QUI]IMPTRIP" K VALCLE S VALCLE(1)="VALI"_ARTI_"/",PNUM=2,NFOR=1,F1=18,NCLE=3 D ^%VKMULG G:STOP=1 FIN
 S ETUD="NOME",NOMTAB="^[QUI]NOMENC(ARTI",FONTAB="^[QUI]FNOMENC(ARTI",F1=18,NFOR=1,NCLE=3,PNUM=2 D ^%VTENR G:STOP=1 FIN
 S ETUD="FORM",NOMTAB="^[QUI]FORMULE(ARTI",FONTAB="^[QUI]FFORMULE(ARTI",F1=17,F2=19,NFOR=2,NCLE=5,PNUM=1 D ^%VTENR G:STOP=1 FIN
 S ETUD="SELMAT",NOMTAB="^[QUI]SELMAT(ARTI",FONTAB="^[QUI]FSELMAT(ARTI",NFOR=1,F1=17,NCLE=4,PNUM=1 D ^%VTENR G:STOP=1 FIN
 S ETUD="PHAS",NOMTAB="^[QUI]PHASE(ARTI",FONTAB="^[QUI]FPHASE(ARTI",NFOR=0,NCLE=4,PNUM=1 D ^%VTENR G:STOP=1 FIN
FIN Q
 
TRAIT G:'(VISU) TRAIT0
 R *XX:0 D TOUCHE^%INCCLAV(XX,.XX) G:XX=1 STOP
 W *-1 D GREF
TRAIT0 S FF=PNUM+15 F UUW=PNUM:2:FF S PPCH=(UUW-PNUM)#4,BRAQG=$P(%RS(UUW),",",1),BRAQD=$P(%RS(UUW),",",2) D TRAIT1
 F WW=1:1:NFOR S XDP="("_%RS(@("F"_WW))_")" D FORM
 Q
TRAIT1 F PCH=BRAQG,BRAQD I PCH'="" S PCH=$S(PCH["'":$P(PCH,"'",1),1:PCH),%PCH=PCH D ^%QZNBN1 I '(ISNUM) D ^%LXABR,EXPLIC
 Q
EXPLIC 
 I '(VISU) Q:CONCUR'=1  S @GLOLX@(PCHCOMP)="totem rap" Q
 I CONCUR'=1 G SUIT
 I PCH=PCHCOMP S EXP=PCH_"="_PCHCOMP G FINI
 
 
 S PREC=PCH
 I $D(^[QUI]TOSYNONY(PREC)) S PRECS=$N(^[QUI]TOSYNONY(PREC,-1)) Q:PRECS=-1  S EXP=PCH_"="_PREC_" Synonyme de "_PRECS_". A changer !" G FINI
 S EXP=PCH_"="_PCHCOMP G FINI
SUIT I CONCUR=0 S EXP=$S(UUW>FF:PCH_" est inconnu",1:PCH_" est inconnu"_$S(PPCH=0:"",1:",considere comme valeur literale")) G FINI
 S EXP=PCH_" est ambigu"
 G FINI
FINI W !,!,"Dans ",REF,!,?10,EXP
 S ^[QUI]RAPLEXSF(ARTI,RLEX)=REF_"|"_EXP,RLEX=RLEX+1
 Q
 
GREF S REF=ARTI_" " F VV=2:1:NCLE S REF=REF_@("B"_VV)_" "
 S RREF=$P($P(NOMTAB,"]",2),"(",1),RREF=$S(RREF="SELMAT":"Selection matiere",RREF="IMPTRIP":"Implicite de triplets",1:RREF),REF=RREF_" "_REF
 Q
 
FORM Q:XDP["$"  D ^%ABRECPO
 S IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S (%PCH,PCH)=$E(XDP,IK+1,IKS-1) S:PCH["'" (PCH,%PCH)=$P(PCH,"'",1) D ^%QZNBN1 I '(ISNUM) D ^%LXABR,EXPLIC
 Q
STOP S STOP=1 Q
 
INTERNE(GLOLX) 
 N ADR,GLREF,VU,ARTI
 S VU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S ADR="TRAIT^TORAPLEX",RLEX=1
 K @(VU)
 S VISU=0
 F GLREF="^[QUI]IMPLICI","^[QUI]IMPTRIP","^[QUI]NOMENC","^[QUI]FORMULE","^[QUI]FORMULE","^[QUI]SELMAT","^[QUI]PHASE" D GLINT
 K @(VU)
 Q
 
GLINT S ARTI=""
BINT S ARTI=$O(@GLREF@(ARTI))
 Q:ARTI=""
 G:$D(@VU@(ARTI)) BINT
 S @VU@(ARTI)=""
 D RECABR
 G BINT

