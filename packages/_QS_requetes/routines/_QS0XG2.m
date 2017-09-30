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

;%QS0XG2^INT^1^59547,73880^0
%QS0XG2 ;;10:56 AM  5 Nov 1992; ; 30 Sep 93 11:24 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GETX(LISTE,IND) 
 N G,I,%I,B,J,LS
 Q:LISTE="" "" Q:IND="" ""
 I WHOIS("ETUDE")'=0 G GETXE
 S B=$$BASE^%QSGEST7(LISTE) Q:B="" ""
 S LS=$$ADRLIS^%QSGEST7(LISTE) Q:LS="" ""
 Q $S($D(@LS@(IND)):@LS@(IND),1:"")
GETXE 
 S I=$$REFL^%QXPGESD(WHOIS("ETUDE"),LISTE) Q:I="" ""
 S J=$S(IND="":"",1:$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND))
 Q J
 
 
 
 
 
SUIVXL(LISTE,IND,ORD) 
 N G,I,%I,B,J,LS
 Q:LISTE="" "" Q:IND="" ""
 I WHOIS("ETUDE")'=0 G SUIVLEI
 S B=$$BASE^%QSGEST7(LISTE) Q:B="" ""
 S LS=$$ADRLIS^%QSGEST7(LISTE) Q:LS="" ""
 S G=$$ADRLT^%QSGEST7(LISTE) G:G="" SUIVL2
 S J=""
 S I=$S(IND="":"",1:ORD) F %I=0:0 S I=$O(@G@(I)) Q:I=""  S J=@G@(I) Q:$$IR^%QSGE5(B,J)
 Q J
SUIVL2 S I=IND F %I=0:0 S I=$O(@LS@(I)) Q:I=""  Q:$$IR^%QSGE5(B,I)
 Q I
SUIVLEI 
 S I=$$REFL^%QXPGESD(WHOIS("ETUDE"),LISTE) Q:I="" ""
 S G="",J=$S(IND="":"",1:$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND))
 S J=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,J,.G)
 Q $S(J="":"",1:G)
 
 
INLIS(LISTE,IND) 
 N I,ADR,J
 Q:LISTE="" 0 Q:IND="" 0
 I WHOIS("ETUDE")=0 S ADR=$$ADRLIS^%QSGEST7(LISTE) Q:ADR="" 0 Q $D(@ADR@(IND))
 S I=$$REFL^%QXPGESD(WHOIS("ETUDE"),LISTE) Q:I="" ""
 S J=$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND)
 Q:J="" 0
 S J=$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,J)
 Q J'=$C(0)

