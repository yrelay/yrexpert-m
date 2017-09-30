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

;%QSGEIND^INT^1^59547,73881^0
%QSGEIND ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREER(REP,IND,ORD,REEL,MSG) 
 N LIEN
 S LIEN=1 G MORE
 
CREER1(REP,IND,ORD,REEL,MSG,LIEN) 
MORE N NIV,PAR,PAR2,REPP,LPERF,NOMP
 S NIV=^[QUI]RQSNCLES(REP),PAR=$P(IND,",",NIV),PAR2=$P(IND,",",NIV+1)
 I $L(IND,",")'=NIV S MSG=$$^%QZCHW("le nom de l'individu a creer est incorrect") Q 1
 I NIV=1 G CRENOM
 D PEREFILS^%QSGEL2(REP,.REPP,.LPERF)
 I REPP="" S MSG=$$^%QZCHW("impossible de trouver le repertoire pere") Q 1
 I LPERF="" S MSG=$$^%QZCHW("impossible de trouver le lien entre cet individu et son pere") Q 1
 S NOMP=$P(IND,",",1,NIV-1)
 I LIEN,'($$IR^%QSGEST5(REPP,NOMP)) S MSG=$$^%QZCHW("l'individu pere n'existe pas") Q 1
 I ORD="" S ORD=PAR
CRELIE 
 I LIEN,REEL D ADDO^%QSGEST3(REPP,NOMP,ORD,LPERF,REP,PAR)
CRENOM 
 I '(REEL) Q 0
 D PA^%QSGESTI(REP,IND,"NOM",PAR,1)
 
 I '($$AIR^%QSGE5(REP,IND,"NOM")) Q 1
 
 
 Q 0
 
EXIMOZ() Q $$OKR^%INCOIN("MOZ")
 
 
 
 
 
 
 
NOMOK(REP,IND) 
 N NIV,BASE
 I REP="" Q $$^%QZCHW("la chaine vide n'est pas un nom de repertoire")
 S BASE=$$NOMINT^%QSF(REP)
 I BASE="" Q REP_" "_$$^%QZCHW("n'est pas un nom de repertoire")
 S NIV=^[QUI]RQSNCLES(BASE)
 I IND="" Q $$^%QZCHW("la chaine vide n'est pas un nom d'individu")
 I $L(IND,",")'=NIV Q IND_" "_$$^%QZCHW("le nom de l'individu a creer ne contient le bon nombre de "","" soit")_" "_NIV
 Q ""
 
CREPER(REP,IND,ORD,MSG) 
 N NIV,PAR,REPP,LPERF,NOMP,OK
 S NIV=^[QUI]RQSNCLES(REP),PAR=$P(IND,",",NIV)
 I $L(IND,",")'=NIV S MSG=$$^%QZCHW("le nom de l'individu a creer est incorrect") Q 1
 I $$IR^%QSGEST5(REP,IND) G CRELP
 
 D PA^%QSGESTI(REP,IND,"NOM",PAR,1)
 
 
CRELP I NIV=1 Q 0
 
 D PEREFILS^%QSGEL2(REP,.REPP,.LPERF)
 I REPP="" S MSG=$$^%QZCHW("impossible de trouver le repertoire pere") Q 1
 I LPERF="" S MSG=$$^%QZCHW("impossible de trouver le lien entre cet individu et son pere") Q 1
 S NOMP=$P(IND,",",1,NIV-1)
 S OK=$$CREPER(REPP,NOMP,"",.MSG)
 Q:OK=1 1
 I ORD="" S ORD=PAR
 I '($$EXILIEN^%QSGES21(NOMP,LPERF,IND)) D ADDO^%QSGEST3(REPP,NOMP,ORD,LPERF,REP,PAR)
 Q 0

