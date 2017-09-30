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

;%QXPSTO^INT^1^59547,73887^0
%QXPSTO ;;03:12 PM  6 Aug 1992; 30 Jul 92  6:05 PM ; 07 Aug 92  6:09 PM
 
 
 
 
 
 
 
 
 
 
 
 
 N R,%R,I,%I,ND,NDPLUS,ETU,V,REFI,REFA,O
 N INDSUP,MODIF,ORDSUP,ATTSUP,REPLIEN,TYPAT
 S REPLIEN=$$LIENI^%QSGEL3
 S DEV=0
 S ETU=WHOIS("ETUDE"),NDPLUS=WHOIS("NDCOUR")+1
 S INDSUP=$$TEMP^%SGUTIL
 S ATTSUP=$$TEMP^%SGUTIL
 S ORDSUP=$$TEMP^%SGUTIL
 S MODIF=$$TEMP^%SGUTIL
 
 
 S R=""
BCLR S R=$O(^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R)) G:R="" SUITE G:(R="%")!(R="L0") BCLR G:R=REPLIEN LIEN S I=""
BCLI S I=$O(^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I)) G:I="" BCLR
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I,NDPLUS)) I ND'="" S REFI=^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I,ND)
 I REFI=$C(0) S @INDSUP@(R,I)="" G BCLI
 S A=""
BCLA S A=$O(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A)) G:A="" BCLI
 S TYPAT=$$TYPEL^%QSGES90(A)
 G:(TYPAT>0)!(TYPAT<6) BCLA
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A,NDPLUS)) G:ND="" BCLA
 S REFA=^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A,ND)
 I REFA=$C(0) S @ATTSUP@(REFI,A)="" G BCLA
 S O=""
BCLO S O=$O(^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O)) G:O="" BCLA
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O,NDPLUS))
 G:(ND="")!(ND=0) BCLO
 S VAL=^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O,ND)
 I VAL=$C(0) S @ORDSUP@(R,I,A,O)="" G BCLO
 S @MODIF@(R,I,A,O)=VAL G BCLO
 
 
LIEN G BCLR
 S I=""
LLI S I=$O(^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I)) G:I="" BCLR
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I,NDPLUS)) I ND'="" S REFI=^[QUI]ETU(ETU,"ENS","M2","CONTEXTE",R,I,ND)
 I REFI=$C(0) S @INDSUP@(R,I)="" G LLI
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,"NOM.LIEN",NDPLUS)) G:ND="" BCLA
 S NOML=^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,"NOM.LIEN",ND)
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,"DESTINATION."_NOML,NDPLUS))
 S DEST=^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,"NOM.LIEN",ND)
 S A=""
LLA S A=$O(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A)) G:A="" LLI
 S TYPAT=$$TYPEL^%QSGES90(A)
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A,NDPLUS)) G:ND="" BCLA
 S REFA=^[QUI]ETU(ETU,"ENS","M2","ATTRIBUT",REFI,A,ND)
 I REFA=$C(0) S @ATTSUP@(REFI,A)="" G BCLA
 S O=""
LLLO S O=$O(^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O)) G:O="" BCLA
 S ND=$ZP(^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O,NDPLUS))
 G:(ND="")!(ND=0) BCLO
 S VAL=^[QUI]ETU(ETU,"ENS","M2","VALEURS",REFA,O,ND)
 I VAL=$C(0) S @ORDSUP@(R,I,A,O)="" G BCLO
 S @MODIF@(R,I,A,O)=VAL G BCLO
 
 
 
SUITE U DEV W "archivage temporaire",!,"pour restauration d'etude",!
 S R=""
WR S R=$O(@MODIF@(R)) G:R="" SUIT2 S I=""
WI S I=$O(@MODIF@(R,I)) G:I="" WR
 U DEV W !,R,"^",I,"^"
 S A=""
WA S A=$O(@MODIF@(R,I,A)) I A="" W ! G WI
 S O=""
WO S O=$O(@MODIF@(R,I,A,O)) G:O="" WA
 U DEV W !,A,"^",O,"^",@MODIF@(R,I,A,O)
 G WO
 
SUIT2 Q
 ;
 ;

