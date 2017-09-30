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

;TO3GPAR^INT^1^59547,74870^0
TO3GPAR ;
 
TRAIT 
 K ^NOFONCT,^[QUI]PAR(ARTI),^[QUI]PARP(ARTI),^[QUI]HM(ARTI),^[QUI]INTER(ARTI),MEM,^[QUI]AMBI(ARTI),^[QUI]UNKN(ARTI),^[QUI]REFLATER(ARTI),^[QUI]AIMPLICI(ARTI),^[QUI]CIMPLICI(ARTI),^[QUI]ANOMENC(ARTI),^[QUI]CNOMENC(ARTI),^[QUI]AMATIERE(ARTI)
 K ^[QUI]AMBICYCL(ARTI),^[QUI]CYCLE(ARTI),^[QUI]AFORMULE(ARTI),^[QUI]CFORMULE(ARTI),^[QUI]APHASE(ARTI),^[QUI]CPHASE(ARTI),^[QUI]PARINDEF(ARTI),^[QUI]NOMARL(ARTI),^[QUI]NOMSRL(ARTI),^[QUI]NONTRI(ARTI),^[QUI]INVRANG(ARTI),NUMNOM(ARTI)
 K ^[QUI]IMPBIS(ARTI),^[QUI]CMATIERE(ARTI),^[QUI]CSELMAT(ARTI),^[QUI]ASELMAT(ARTI),^[QUI]TREEIMP(ARTI),^[QUI]TRI(ARTI),^[QUI]AMACSEL(ARTI),^[QUI]CMACSEL(ARTI)
 K ^NFISIMP($I,ARTI),^REFTREE($I,ARTI),^NIVPAR($I,ARTI),^ORDNIV($I,ARTI),^NURG(ARTI),^NUIRG(ARTI),^ESTFONCT,^NOFONCT
 K ^[QUI]CCOMPARA(ARTI),^[QUI]CYCLE(ARTI),^[QUI]LIBCYCLE(ARTI),^[QUI]REPFICH(ARTI),^[QUI]TYPLIB(ARTI),^[QUI]TBTSLIB(ARTI),^[QUI]AOUTCONS(ARTI),^[QUI]COUTCONS(ARTI),^[QUI]ADIMOUT(ARTI),^[QUI]CDIMOUT(ARTI) S ^[QUI]CPTEUR("NUFICH",ARTI)=1
 K ^[QUI]GLOETUD(ARTI),^[QUI]EXPRLONG(ARTI),^[QUI]IREPFICH(ARTI),^[QUI]SENSFICH(ARTI),^[QUI]TOIVDEF(ARTI),^[QUI]TOIVTRI(ARTI),^[QUI]ATOCTREV(ARTI),^[QUI]CTOCTREV(ARTI),^[QUI]INDEFIND(ARTI),^[QUI]FONCIND(ARTI)
 K ^[QUI]AAUTREFO(ARTI),^[QUI]CAUTREFO(ARTI),^[QUI]ATPCTGAM(ARTI),^[QUI]CTPCTGAM(ARTI)
FIN Q

