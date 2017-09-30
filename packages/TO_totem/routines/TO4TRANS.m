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

;TO4TRANS^INT^1^59547,74871^0
TO4TRANS ;
 
 K ^TREEDOM($I),^GLOSOL($I) S %SOL=0,^TREEDOM($I,0)=VCOMP,ADR="TRAIT^TO4TRANS",TABG="^[QUI]COMPARAT(YA,NAPAR,VCOUR)",NOMTREE="^TREEDOM($I" D ^%QCAGTU1
 G:%SOL=0 END D ^TO4VTRAN G END
TRAIT S TWREF=%TREFC,VCOUR=@NOM,NFILS=1,NEXF=-1 I VCOUR=VSOURCE S %SOL=%SOL+1,^GLOSOL($I,%SOL)=$I_","_$E(TWREF,$L($P(TWREF,",",1))+2,299),STOP=$$^%QZCHW("F") G FIN
 D ANTE F UU=0:0 S NEXF=$N(@TABG@(NEXF)) Q:NEXF=-1  I '($D(^%ANTECED($I,VCOUR,NEXF))),NEXF'=VCOMP S @("^TREEDOM("_TWREF_","_NFILS_")")=NEXF,NFILS=NFILS+1
FIN Q
END K ^TREEDOM($I),^GLOSOL($I),%SOL,NEXF,NFILS,UU,VCOUR Q
ANTE K ^%ANTECED($I),^LISANTE($I)
 S ^LISANTE($I,VCOUR)="" Q:TWREF'[","  S POSI=0,NUMANT=1 F Z1=0:0 S POSI=$F(TWREF,",",POSI) Q:POSI=0  S SSREF=$E(TWREF,1,POSI-2) D:($D(@("^[QUI]TREEDOM("_SSREF_")"))=11)!($D(@("^[QUI]TREEDOM("_SSREF_")"))=1) GETANT
 Q
GETANT Q:SSREF=TWREF  S ANTE=@("^[QUI]TREEDOM("_SSREF_")"),^%ANTECED($I,VCOUR,ANTE)=POSI,^LISANTE($I,VCOUR,NUMANT)=ANTE,NUMANT=NUMANT+1
 Q

