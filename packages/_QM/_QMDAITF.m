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

;%QMDAITF^INT^1^59547,73877^0
QMDAITF ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREA(ATTR,REP,FOR) 
 N GLOB,LF,BR,%B
 Q:((ATTR="")!(REP=""))!(FOR="")
 I '($D(^RQSGLU("QMDA"))) D ^%QMDAINI
 Q:'($D(^RQSGLU("QMDA","FORM",FOR)))
 S LF=^RQSGLU("QMDA","FORM",FOR)
 I REP'="*" D SX^%QSGESTK("ATTRIBUT",ATTR_"/"_REP),INSAT(ATTR_"/"_REP,ATTR,REP) Q
 
 D REPA^%QSGEST9("GLOB") S BR=""
 F %B=0:0 S BR=$O(GLOB(BR)) Q:BR=""  S ATR=ATTR_"/"_BR D SX^%QSGESTK("ATTRIBUT",ATR),INSAT(ATR,ATTR,BR)
 Q
 
INSAT(LA,A,R) 
 D PA^%QSGESTI("ATTRIBUT",LA,"TYPE","DATE",1),PA^%QSGESTI("ATTRIBUT",LA,"NOM",LA,1),PA^%QSGESTI("ATTRIBUT",LA,"ATTRIBUT",A,1)
 D PA^%QSGESTI("ATTRIBUT",LA,"REPERTOIRE",R),PA^%QSGESTI("ATTRIBUT",LA,"FORMAT",FOR,1)
 D PA^%QSGESTI("ATTRIBUT",LA,"LIBELLE.FORMAT",LF,1)
 Q

