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

;TORQXIN^INT^1^59547,74875^0
TORQSXIN ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SUP(ET) 
 D SX^%QSGESTK($$RI,ET)
 Q
 
CRE(ET,REP,IND,LIS) 
 N RI
 S RI=$$RI
 D PA^%QSGESTI(RI,ET,"NOM",ET,1)
 D PA^%QSGESTI(RI,ET,"REPERTOIRE.RECEPTEUR",$$NOMLOG^%QSF(REP),1)
 D PA^%QSGESTI(RI,ET,"INDIVIDU.RECEPTEUR",IND,1)
 D PA^%QSGESTI(RI,ET,"LISTE",LIS,1)
 Q
AJ(ET,ART,HDEF,HFIN,DATE,STATUS) 
 N RI
 S RI=$$RI
 D PA^%QSGESTI(RI,ET,"ARTICLE",ART,1)
 D PA^%QSGESTI(RI,ET,"HEURE.DEBUT",HDEB,1)
 D PA^%QSGESTI(RI,ET,"HEURE.FIN",HFIN,1)
 D PA^%QSGESTI(RI,ET,"DATE",DATE,1)
 D PA^%QSGESTI(RI,ET,"STATUS",STATUS,1)
 Q
 
LMARQ(LISTE) 
 I '($$EX^%QSGEST7(LISTE)) Q
 D PA^%QSGESTI("L0",LISTE,"DATE.ETUDE.TOTEM",$$DATE^%QMDATE,1)
 Q
 
MARQ(LISTE) 
 Q $$AIR^%QSGEST5("L0",LISTE,"DATE.ETUDE.TOTEM")
 
RI() Q "ETUDE.TOTEM"
RE() Q "ETUDE.TOTEM"
 
CNX() Q $$CNX^%INCOIN("TORQS")
 ;
 ;
 ;

