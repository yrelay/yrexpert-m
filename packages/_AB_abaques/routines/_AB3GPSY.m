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

;%AB3GPSY^INT^1^59547,73863^0
%AB3GPSY ;
 
 K ^PARASSOC($I),^PDEJASOC($I) S %NBASS=1,^PARASSOC($I,%NBASS)=%CP,^PDEJASOC($I,%CP)=1,%NBASS=%NBASS+1
 S NPASSO=-1 F %QZ=1:1 S NPASSO=$N(^PARASSOC($I,NPASSO)) Q:NPASSO=-1  S PASSO=^PARASSOC($I,NPASSO) D GETDEP
 K NPASSO,%QZ,%GG,VALE,PASSO,NUM,RS,%RS,WWQ,%NOM,PRX,%CP,%TYEXP
FIN Q
GETDEP S VALE=$N(^[QUI]EXPGIMP(PASSO,-1)) Q:VALE=-1
 S NOMTAB="^[QUI]EXPGIMP(PASSO,VALE)",NUM=-1 F %GG=1:1 S NUM=$N(@NOMTAB@(NUM)) Q:NUM=-1  D TRAIT
 G FIN
TRAIT I $D(@NOMTAB@(NUM))'=10 S RS=@NOMTAB@(NUM) D ^%VKMULC G SUI
 S %NOM=$P(NOMTAB,")",1)_","""_NUM_""")" D ^%VKMULNG
SUI F WWQ=1:3:29 I $D(%RS(WWQ)),%RS(WWQ)'="" D SUIT
 G FIN
SUIT S ^[QUI]EXPL(YY,%RS(WWQ))=%TYEXP,^[QUI]FULL(YY,%RS(WWQ))=1,PRX=%RS(WWQ) D ^%ABBUILT S NPAR=NPAR+1 I '($D(^PDEJASOC($I,%RS(WWQ)))) S ^PDEJASOC($I,%RS(WWQ))=1,^PARASSOC($I,%NBASS)=%RS(WWQ),%NBASS=%NBASS+1
 I $D(%RS(WWQ+2)) S ^[QUI]UNITE(YY,%RS(WWQ))=%RS(WWQ+2)
 I %TYEXP'="%%" S ^[QUI]RELATION(ARTI,%RS(WWQ),PASSO)=1
 Q

