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

;TOEXPMAT^INT^1^59547,74872^0
TOEXPMAT ;
 
LOOP S NPAR=1,A=-1,(YY,YA)=ARTI
MATSTOCK S SFMAT=ARTI,LSFMAT=$L(SFMAT),AN=$C($A($E(SFMAT,LSFMAT))-1),MATINI=$E(SFMAT,1,LSFMAT-1)_AN_"z",MATAS=MATINI
 S MSS=$N(^[QUI]MATSTOCK(MATAS)) G:(MSS=-1)!($E(MSS,1,LSFMAT)'=SFMAT) END S FMS=$N(^[QUI]MATSTOCK(MSS,-1))
 S NF=-1 F %FF=1:1 S NF=$N(^[QUI]MATSTOCK(MSS,FMS,NF)) Q:NF=-1  D GET
 G SUI2
GET S %NOM="^[QUI]MATSTOCK(MSS,FMS,NF)" I $D(@%NOM)=10 D ^%VKMULNG G SUIT
 S RS=@%NOM D ^%VKMULC
SUIT K RRS S III=-1 F %GG=1:1 S III=$N(%RS(III)) Q:III=-1  S RRS(III)=%RS(III)
 K %RS F III=1:3:13 I $D(RRS(III)),RRS(III)'="" S PRX=RRS(III),^[QUI]EXPL(ARTI,RRS(III))=NPAR D GUNITE,^%ABBUILT S NPAR=NPAR+1 I $D(^[QUI]EXPGIMP(RRS(III))) S %CP=RRS(III),%TYEXP="%%" D ^%AB3GPSY
 Q
SUI2 K RRS S ^[QUI]EXPL(ARTI,$$^%QZCHW("PRIX"))=NPAR,^[QUI]FULL(ARTI,$$^%QZCHW("PRIX"))=NPAR,NPAR=NPAR+1,^[QUI]EXPL(ARTI,$$^%QZCHW("QTE.STOCK"))=NPAR,^[QUI]FULL(ARTI,$$^%QZCHW("QTE.STOCK"))=NPAR,NPAR=NPAR+1
 S ^[QUI]FULL(ARTI,$$^%QZCHW("ARTICLE"))=NPAR,^[QUI]EXPL(ARTI,$$^%QZCHW("ARTICLE"))=NPAR,NPAR=NPAR+1,^[QUI]FULL(ARTI,$$^%QZCHW("MATIERE"))=NPAR,^[QUI]EXPL(ARTI,$$^%QZCHW("MATIERE"))=NPAR
END K LSFMAT,%NOM,A,AN,SFMAT,MATAS,MATINI,MSS,FMS,RS,%GG,%FF,NF,III,PRX,%CP,%TYPEX Q
GUNITE S ^[QUI]UNITE(SFMAT,RRS(III))=RRS(III+2) Q

