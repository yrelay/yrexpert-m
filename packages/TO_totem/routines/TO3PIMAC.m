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

;TO3PIMAC^INT^1^59547,74870^0
TO3PIMAC ;
 
TRAIT K ^NOFONCT,^[QUI]PAR(ARTI),^[QUI]PARP(ARTI),^[QUI]HM(ARTI),^[QUI]UNITE(ARTI),MEM,^[QUI]AMBI(ARTI),^[QUI]UNKN(ARTI),^[QUI]AIMPMAC(ARTI),^[QUI]CIMPMAC(ARTI),^[QUI]GLOETUD(ARTI),^[QUI]EXPRLONG(ARTI)
 K ^[QUI]ATOCTREV(ARTI),^[QUI]CTOCTREV(ARTI)
 K ^[QUI]LIBCYCLE(ARTI),^[QUI]AMBICYCL(ARTI),^[QUI]CYCLE(ARTI),^[QUI]PARINDEF(ARTI),^[QUI]NOMARL(ARTI),^[QUI]NOMSRL(ARTI),^[QUI]NONTRI(ARTI),^[QUI]RANG(ARTI),^[QUI]INVRANG(ARTI),NUMNOM(ARTI),^[QUI]REPFICH(ARTI),^[QUI]IREPFICH(ARTI),^[QUI]SENSFICH(ARTI)
 K ^[QUI]CYCLE(ARTI),^[QUI]LIBCYCLE(ARTI),^[QUI]IMPBIS(ARTI),^[QUI]TREEIMP(ARTI),^[QUI]TRI(ARTI),^NFISIMP($I,ARTI),^REFTREE($I,ARTI),^NIVPAR($I,ARTI),^ORDNIV($I,ARTI),^ESTFONCT,^NOFONCT S (YA,YY)=ARTI
LOOP S NPAR=1,A=-1,(YY,YA)=ARTI,^[QUI]CPTEUR("NUFICH",ARTI)=1
MATSTOCK S SFMAT=ARTI,LSFMAT=$L(SFMAT),AN=$C($A($E(SFMAT,LSFMAT))-1),MATINI=$E(SFMAT,1,LSFMAT-1)_AN_"z",MATAS=MATINI
 S MSS=$N(^[QUI]DESMACH(MATAS)) G:(MSS=-1)!($E(MSS,1,LSFMAT)'=SFMAT) SSS S FMS=$N(^[QUI]DESMACH(MSS,-1)) G:FMS=-1 FIN
 S %NOM="^[QUI]DESMACH(MSS,FMS)" I $D(@%NOM)=10 D ^%VKMULNG G SUIT
 S RS=@%NOM D ^%VKMULC
SUIT S ^[QUI]PAR(ARTI,NPAR)=$$^%QZCHW("TAUX.HORAIRE"),^[QUI]PARP(ARTI,$$^%QZCHW("TAUX"),$$^%QZCHW("HORAIRE"))=1,^[QUI]EXPL(ARTI,$$^%QZCHW("TAUX.HORAIRE"))=NPAR,NPAR=NPAR+1
 S NUM=-1 F UI=0:0 S NUM=$N(^[QUI]PEXPMACH(MSS,NUM)) Q:NUM=-1  S RS=^[QUI]PEXPMACH(MSS,NUM) D ^%VKMULC F III=1:3:22 I %RS(III)'="" S ^[QUI]PAR(ARTI,NPAR)=%RS(III),^[QUI]EXPL(ARTI,%RS(III))=NPAR,PRX=%RS(III) D GUNITE,^%ABBUILT S NPAR=NPAR+1
 S ^[QUI]PAR(ARTI,NPAR)=$$^%QZCHW("ARTICLE"),^[QUI]PARP(ARTI,$$^%QZCHW("ARTICLE"))=NPAR,NPAR=NPAR+1
SSS S A=-1 F CYY=1:1 S A=$N(^[QUI]IMPMAC(YY,A)) Q:A=-1  S CP=$N(^[QUI]IMPMAC(YY,A,-1)) D GUNITI S ^[QUI]PAR(YY,NPAR)=A,PRX=A D GUNITI,^%ABBUILT S ^[QUI]TREEIMP(ARTI,CYY)=A,^REFTREE(YY,A)=CYY,^NFISIMP($I,YY,CYY)=1,^NIVPAR($I,YY,A)=1,NPAR=NPAR+1
FIN Q
GUNITE S ^[QUI]UNITE(SFMAT,%RS(III))=%RS(III+2) Q
GUNITI S CHUN=^[QUI]IMPMAC(YY,A,CP),^[QUI]UNITE(YY,A)=$P(CHUN,"^",1) Q

