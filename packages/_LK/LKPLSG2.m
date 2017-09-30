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

;LKPLSG2^INT^1^59547,74867^0
LKPLSG2 ;;09:35 AM  20 Oct 1993; 23 Sep 93  9:15 AM ; 20 Oct 93  9:35 AM
 
CRELOT 
 
 S NOMSTK="" F %N=0:0 S NOMSTK=$$NXTRIAO^%QSTRUC8(REPA,ART,LARTLOT,NOMSTK) Q:NOMSTK=""  Q:$$OAIR^%QSGE5(REPSTO,NOMSTK,LLOTSTA,STAT)
 I NOMSTK'="" S OQTE=$$^%QSCALIN(REPSTO,NOMSTK,"STOCK.DISPONIBLE",1) G LOT2
 S NOMSTK=$$GEN^%QCAPOP(RACPOP)
 S x=$$CREER^%QSGEIND(REPSTO,NOMSTK,"",1,.MSG)
 D ADDS^%QSGES26(REPSTO,NOMSTK,LLOTSTA,REPS,STAT)
 D ADDS^%QSGES26(REPSTO,NOMSTK,LLOTART,REPA,ART)
 S OQTE=0
LOT2 
 S QTAFF=$S(NAT="=":QTE,NAT="+":OQTE+QTE,OQTE<QTE:QTE,1:OQTE-QTE)
 D PA^%QSGESTI(REPSTO,NOMSTK,"STOCK.PHYSIQUE",QTAFF,1)
 D PA^%QSGESTI(REPSTO,NOMSTK,"STOCK.DISPONIBLE",QTAFF,1)
 D PA^%QSGESTI(REPSTO,NOMSTK,"DATE.ENTREE.EN.STOCK",DATJOUR,1)
 D PA^%QSGESTI(REPSTO,NOMSTK,"ETAT","EN.STOCK",1)
 D PA^%QSGESTI(REPSTO,NOMSTK,"QUANTITE.ENTREE",QTAFF,1)
 D PA^%QSGESTI(REPSTO,NOMSTK,"QUANTITE.TOTALE.AFFECTEE",0,1)
 Q
 
 
 
MAJSTOCK(ATTRIBUT) 
 N OLDV,ATT
 F ATT="STOCK.ENTREE","STOCK.EN.COURS","STOCK.PHYSIQUE" S OLDV=$$^%QSCALIN(REPA,ART,ATT,1)+0 D PA^%QSGESTI(REPM,MVT,"ANCIEN."_ATT,OLDV,1) S:ATT=ATTRIBUT ANCIEN=OLDV
 
 I NAT="-",ANCIEN<QTE D AJOUT^%QS0XG1(LISTERR,MVT)
 S VAL=$S(NAT="=":QTE,NAT="+":ANCIEN+QTE,NAT="-":ANCIEN-QTE)
 D PA^%QSGESTI(REPS,STAT,ATTRIBUT,VAL,ART)
 D PA^%QSGESTI(REPM,MVT,ATTRIBUT,VAL,1)
 D PA^%QSGESTI(REPA,ART,ATTRIBUT,VAL,1)
 I NAT="=" D PA^%QSGESTI(REPA,ART,"QUANTITE.DERNIER.INVENTAIRE",VAL,ATTRIBUT),PA^%QSGESTI(REPA,ART,"DATE.DERNIER.INVENTAIRE",DATJOUR,ATTRIBUT)
 S V(1)=ATTRIBUT_" de "_ART_" = "_VAL
 S x=$$TRACER^%TLOB11(1,1)
 Q

