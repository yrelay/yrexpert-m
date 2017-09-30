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

;TO3GMODP^INT^1^59547,74870^0
TO3GMODP ;
 
 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLF pour ajouter une phase")," " S TYMOD="MODIFICATION" D ^TO3TYMOD S DY=DEBP+1,DX=2 X XY
DEB S MPASX=4,MPASY=1,NXI=1,NXS=111,NYI=DEBP-1,NYS=20 X XY D ^TO3PHGOT U 0 G:X1=1 FIN G:X1=6 AJOUT G:C="" DEB D MAJ G DEB
AJOUT S TYMOD=$$^%QZCHW("AJOUT") D ^TO3TYMOD S (ADPY,DPY)=-1 F GF=0:0 S DPY=$N(^POSENR($I,DPY)) Q:DPY=-1  S ADPY=DPY
NOP S:ADPY=-1 ADPY=9 S DY=ADPY+1,PPX=2 D EXIS S DX=2 X XY D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DE=DY,FI=DY D ^%ABNETTO K ^POSENR($I,DY) S TYMOD="MODIFICATION" D ^TO3TYMOD S DX=2,DY=ADPY+1 X XY G DEB
 S NOP=Y1,^POSENR($I,DY,DX)=NOP
SECT S PPX=10 D EXIS S DX=10 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G NOP
 S SECT=Y1,^POSENR($I,DY,DX)=SECT
OPER S PPX=30 D EXIS S DX=30 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G SECT
 S OPER=Y1,^POSENR($I,DY,DX)=OPER
CIG S PPX=54 D EXIS S DX=54 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G OPER
 S CIG=Y1,^POSENR($I,DY,DX)=CIG
TE S PPX=98 D EXIS S DX=98 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G CIG
 S TE=Y1,^POSENR($I,DY,DX)=TE
CT S PPX=110 D EXIS S DX=110 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G TE
 S CT=Y1,^POSENR($I,DY,DX)=CT,^POSENR($I,DY)=NOP_"^"_SECT_"^"_OPER_"^"_CIG_"^"_TE_"^"_CT,^[QUI]RAISON(NUFA,TWREF,NOP)="PHASEMODIFICATION",^[QUI]RAISON(NUFA,TWREF,OPER_"/"_NOP)="FORMULEMODIFICATION"
 S ^[QUI]RAISON(NUFA,TWREF,CIG_"/"_NOP)="OUTCONSMODIFICATION"
 S ^[QUI]PHAS(NUFA,TWREF,NOP)=OPER_"/"_NOP,^[QUI]COUT(NUFA,TWREF,OPER_"/"_NOP)=CT,^[QUI]DUREE(NUFA,TWREF,OPER_"/"_NOP)=TE,^[QUI]SECT(NUFA,TWREF,OPER_"/"_NOP)=SECT,^[QUI]CONS(NUFA,TWREF,OPER_"/"_NOP)=CIG
 S TYMOD="MODIFICATION" D ^TO3TYMOD S DX=2,DY=DEBP+1 G DEB
MAJ Q:'($D(^POSENR($I,PY)))
 S PI=1 F IT="NOP","SECT",$$^%QZCHW("OPER"),"CIG",$$^%QZCHW("TE"),"CT" S @IT=$P(^POSENR($I,PY),"^",PI),PI=PI+1
 I PX=2 S ^[QUI]PHAS(NUFA,TWREF,C)=OPER_"/"_C,^[QUI]RAISON(NUFA,TWREF,C)="PHASEMODIFICATION" K ^[QUI]PHAS(NUFA,TWREF,OLDC),^[QUI]RAISON(NUFA,TWREF,OLDC) S ^POSENR($I,PY)=C_"^"_SECT_"^"_OPER_"^"_CIG_"^"_TE_"^"_CT G END
 I PX=10 S ^[QUI]SECT(NUFA,TWREF,OPER_"/"_NOP)=C,^POSENR($I,PY)=NOP_"^"_C_"^"_OPER_"^"_CIG_"^"_TE_"^"_CT G END
 I PX'=30 G 50
 S ^[QUI]PHAS(NUFA,TWREF,NOP)=C_"/"_NOP,^[QUI]COUT(NUFA,TWREF,C_"/"_NOP)=CT,^[QUI]DUREE(NUFA,TWREF,C_"/"_NOP)=TE,^[QUI]SECT(NUFA,TWREF,C_"/"_NOP)=SECT,^[QUI]RAISON(NUFA,TWREF,C)="FORMULEMODIFICATION",^[QUI]CONS(NUFA,TWREF,C_"/"_NOP)=CIG
 K ^[QUI]COUT(NUFA,TWREF,OLDC_"/"_NOP),^[QUI]DUREE(NUFA,TWREF,OLDC_"/"_NOP),^[QUI]SECT(NUFA,TWREF,OLDC_"/"_NOP),^[QUI]CONS(NUFA,TWREF,OLDC_"/"_NOP),^[QUI]RAISON(NUFA,TWREF,OLDC) S ^POSENR($I,PY)=NOP_"^"_SECT_"^"_C_"^"_CIG_"^"_TE_"^"_CT G END
50 I PX=98 S ^[QUI]DUREE(NUFA,TWREF,OPER_"/"_NOP)=C,^POSENR($I,PY)=NOP_"^"_SECT_"^"_OPER_"^"_CIG_"^"_C_"^"_CT G END
110 I PX=110 S ^[QUI]COUT(NUFA,TWREF,OPER_"/"_NOP)=C,^POSENR($I,PY)=NOP_"^"_SECT_"^"_OPER_"^"_CIG_"^"_TE_"^"_C G END
54 I PX'=54 G FIN
 S OCONS=^POSENR($I,PY,PX) F UU=1:1 S CS=$P(OCONS,"|",UU) Q:CS=""  K ^[QUI]RAISON(NUFA,TWREF,CS_"/"_NOP)
 S ^[QUI]CONS(NUFA,TWREF,OPER_"/"_NOP)=C,^POSENR($I,PY)=NOP_"^"_SECT_"^"_OPER_"^"_C_"^"_TE_"^"_CT
 F UU=1:1 S CS=$P(C,"|",UU) Q:CS=""  S ^[QUI]RAISON(NUFA,TWREF,CS_"/"_NOP)="OUTCONSMODIFICATION"
FIN Q
EXIS Q:'($D(^POSENR($I,DY,PPX)))  S CPPX=^POSENR($I,DY,PPX),LCPPX=$L(CPPX),DX=PPX X XY F LL=1:1:LCPPX W " "
 K ^POSENR($I,DY,PPX) Q
END S DX=PX X XY Q

