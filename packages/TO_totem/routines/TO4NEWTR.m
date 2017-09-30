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

;TO4NEWTR^INT^1^59547,74871^0
TO3NEWTR ;
 
 S %LIEU=$$^%QZCHW("Optimisation") D ^TO3WLIEU S TAM=-1,ATWREF=TWREF F WZ=0:0 S TAM=$N(MATSEL(ATWREF,TAM)) G:TAM=-1 END D GPMAT,TRAIT
 G FIN
TRAIT S REFMAT=$N(MATSEL(ATWREF,TAM,-1)),COMAT=MATSEL(ATWREF,TAM,REFMAT),QTARMAT=$P(COMAT,"^",1),TAMF=$P(COMAT,"^",2),TAMFS=$P(COMAT,"^",3),REFAMI=FMATSEL(ATWREF,TAMF),^[QUI]TVPAR(NUFA,ATWREF,$$^%QZCHW("MATIERE"))=TAM,^[QUI]TVPAR(NUFA,ATWREF,"FAMMAT")=TAMF,^[QUI]TVPAR(NUFA,ATWREF,"$ARGMAT")=TAMF
 S ^[QUI]TVPAR(NUFA,ATWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))=QTARMAT*^[QUI]TVPAR(NUFA,ATWREF,$$^%QZCHW("QUANTITE"))
 S ^[QUI]RAISON(NUFA,ATWREF,$$^%QZCHW("MATIERE"))="^[QUI]SELMAT"_REFMAT,^[QUI]RAISON(NUFA,ATWREF,"FAMMAT")="^[QUI]MATIERE"_REFAMI,NODC="^[QUI]TREEWORK(NUFA,"_ATWREF_")",$P(@NODC,"^",5)=QTARMAT,$P(@NODC,"^",6)=TAMFS
 D ^TO3POPNU,DUPTR^TODUPTAB,DUPRA^TODUPTAB,DUPOA^TODUPTAB,DUPTV^TODUPTAB,DUPRL^TODUPTAB,DUPPM^TODUPTAB,PORDMT^TODUPTAB,DUPBIS^TODUPTAB,DUPFA^TODUPTAB,DUPHAD^TODUPTAB,DUPGLO^TODUPTAB,DUPTEN^TODUPTAB,DUPREV^TODUPTAB,DUPMAC^TODUPTAB S TREETUD(NUFAC)=1
 S PMT=-1 F EW=0:0 S PMT=$N(^RAIS($I,TAM,PMT)) Q:PMT=-1  S ^[QUI]RAISMAT(NUFAC,ATWREF,PMT)=^RAIS($I,TAM,PMT)
FIN Q
END F %U=0:1 S TBK=$P($T(TBK+%U),";;",2) Q:TBK=""  F %V=1:1 S TB=$P(TBK,"~",%V) Q:TB=""  K @TB@(NUFA)
GPMAT K ^[QUI]PARMAT(NUFA,ATWREF) S PMT=-1 F EW=0:0 S PMT=$N(^M($I,TAM,PMT)) Q:PMT=-1  S ^[QUI]PARMAT(NUFA,ATWREF,PMT)=^M($I,TAM,PMT)
 Q
TBK ;;^[QUI]ORDEVAL~^[QUI]CPTEUR~^[QUI]PARMAT~^[QUI]TREEWORK~^[QUI]TVPAR~^[QUI]RAISON~TREETUD~^[QUI]COUT~^[QUI]DUREE~^[QUI]PHAS~^[QUI]SECT~^[QUI]DIM~^[QUI]CONS~^[QUI]PARMAC
 ;;^TENTATIV($I)~^GLOETUD($I)~^PHASADM($I)~^NBRGLEV($I)

