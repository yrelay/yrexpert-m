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

;%ABVALEG^INT^1^59547,73864^0
%ABVALEG ;
 
 S AMPASY=MPASY,ALCHP=LCHP,AESPC=ESPC,(LCHP,ESPC)=LARCOL,DY=PY-%D,DX=10,NVL=1
GET D POCLEPA^%VVIDEO W $$^%QZCHW("Valeur legale No "),NVL S DX=10,DY=PY-%D X XY D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S C=Y1 G:C="?" LIST
 I C'["[" G SUIT
 S PTG=$P(C,",",1),PTG=$E(PTG,2,$L(PTG)),PTD=$P(C,",",2),PTD=$S(PTD["]":$E(PTD,1,$L(PTD)-1),1:PTD) F %PCH=PTG,PTD D ^%QZNBN1 G:'(ISNUM) REFUS
 I PTD<PTG G REFUS
 S ^[QU]STRUCT(NOMG,2,%V,PY,3,"TERVAL",PTG_"^"_PTD)=1,NVL=NVL+1
REFUS X XY W CNULI G GET
SUIT S ^[QU]STRUCT(NOMG,2,%V,PY,3,C)=1,NVL=NVL+1 X XY W CNULI G GET
FIN X XY W CNULI S MPASY=AMPASY,LCHP=ALCHP,ESPC=AESPC D POCLEPA^%VVIDEO Q
LIST G:'($D(^[QU]STRUCT(NOMG,2,%V,PY,3))) RET S CONT=1,II=-1,ADX=DX,ADY=DY D POCLEPA^%VVIDEO W $$L13^%QSLIB1 S DX=ADX,DY=ADY
 F UU=0:0 S II=$N(^[QU]STRUCT(NOMG,2,%V,PY,3,II)) G:II=-1 LIST D:II="TERVAL" LISVAL G:CONT=0 RET X XY W:II'="TERVAL" II R *RET D TOUCHE^%INCCLAV(RET,.RET) G:RET=1 RET K:RET=83 ^[QU]STRUCT(NOMG,2,%V,PY,3,II) X XY W CNULI
LISVAL S CONT=1,JJ=-1 F VV=0:0 S JJ=$N(^[QU]STRUCT(NOMG,2,%V,PY,3,"TERVAL",JJ)) Q:JJ=-1  X XY W "["_$P(JJ,"^",1)_","_$P(JJ,"^",2)_"]" R *RET D TOUCHE^%INCCLAV(RET,.RET) S:RET=1 CONT=0 G:RET=1 RET K:RET=83 ^[QU]STRUCT(NOMG,2,%V,PY,3,"TERVAL",JJ) X XY W CNULI
 Q
RET X XY W CNULI G GET

