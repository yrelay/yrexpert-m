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

;TO3GFICH^INT^1^59547,74870^0
TO3GFICH ;
 
QUES D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW($$^%QZCHW("Generation des fiches ""Instructions"" et ""Retour atelier"" du lancement No : ")) S DX=30,DY=DY+2 X XY W $$^%QZCHW("- ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN I '($D(^[QUI]TREEWORK(Y1))) W " ??? " H 2 G QUES
 S NUFA=Y1 D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW($$^%QZCHW("GENERATION EN COURS....."))
 K ^[QUI]ETUDLAN(NUFA),^[QUI]FICHINST(NUFA),^[QUI]RETATEL(NUFA) S NUC=0,NIV=2,ADR="TRAIT^TO3GFICH",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1
 G FIN
TRAIT D ^TO3GREF S NUC=NUC+1,DATAC=@NOM,YB=$P(DATAC,"^",2),IDTOT=$P(DATAC,"^",4),QTE=^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),MATIERE=$S($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("MATIERE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("MATIERE")),1:""),DELAI=$$^%QZCHW(" ")
 S NUOP=-1 F ZZ=0:0 S NUOP=$N(^[QUI]PHAS(NUFA,TWREF,NUOP)) Q:NUOP=-1  D GFICH
 Q
GFICH S NAOP=^[QUI]PHAS(NUFA,TWREF,NUOP)
 S CHDU=$S($D(^[QUI]DUREE(NUFA,TWREF,NAOP)):^[QUI]DUREE(NUFA,TWREF,NAOP),1:"")
 S CHSE=$S($D(^[QUI]SECT(NUFA,TWREF,NAOP)):^[QUI]SECT(NUFA,TWREF,NAOP),1:"")
 S SECT=CHSE,DUR=CHDU,REF="("""_NUFA_""","""_YB_""","""_NUC_""","""_NUOP_""","""_DELAI_""")"
 S @("^[QUI]ETUDLAN"_REF)=QTE_"^"_IDTOT_"^"_NAOP_"^"_SECT_"^"_MATIERE_"^"_%DAT_"^^"_DUR
 S @("^[QUI]FICHINST"_REF)="",@("^[QUI]RETATEL"_REF)=DUR_"^^^^^^"_SECT
FIN Q

