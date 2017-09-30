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

;TOV521A^INT^1^59547,74876^0
TOV521A ;
 
 S %NARTI=-1 F %UU=1:1 S %NARTI=$N(^TACOMPIL($I,%NARTI)) Q:%NARTI=-1  S ARTI=^TACOMPIL($I,%NARTI) D MATSTOCK
 D:^VERIF($I)'=1 ^TOV521R G FIN
MATSTOCK S SFMAT=ARTI,LSFMAT=$L(SFMAT),AN=$C($A($E(SFMAT,LSFMAT))-1),MATINI=$E(SFMAT,1,LSFMAT-1)_AN_"z",MSS=MATINI K ^[QUI]EXAPMC(SFMAT) S ^[QUI]EXAPMC(SFMAT,0)=0
BOUCL S MSS=$N(^[QUI]DESMACH(MSS)) G:(MSS=-1)!($E(MSS,1,LSFMAT)'=SFMAT) END S FMS=$N(^[QUI]DESMACH(MSS,-1)),^[QUI]EXAPMC(SFMAT,MSS)=0
SUIT S NUM=-1 F UI=0:0 S NUM=$N(^[QUI]PEXPMACH(MSS,NUM)) Q:NUM=-1  D GET
 G BOUCL
END Q
GET S %NOM="^[QUI]PEXPMACH(MSS,NUM)" I $D(@%NOM)=10 D ^%VKMULNG G SUI
 S RS=@%NOM D ^%VKMULC
SUI F III=1:3:22 I $D(%RS(III)),%RS(III)'="" S ^[QUI]EXAPMC(SFMAT,MSS)=^[QUI]EXAPMC(SFMAT,MSS)+1 I '($D(^[QUI]EXAPMC(SFMAT,0,%RS(III)))) S ^[QUI]EXAPMC(SFMAT,0,%RS(III))=1,^[QUI]EXAPMC(SFMAT,0)=^[QUI]EXAPMC(SFMAT,0)+1
 Q
FIN K LSFMAT,RRS,%NOM,A,AN,SFMAT,MATAS,MATINI,MSS,FMS,RS,%GG,UI,%FF,NF,III,PRX,%CP,%TYPEX Q

