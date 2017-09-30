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

;%QMDRUTI^INT^1^59547,73877^0
QMDRUTI ;
 
 
 
 
 
 
 
 
 
 
 
 
REGSTAND() 
 Q "STANDARD"
 
EXIEXT(REG) 
 Q:REG="" 0
 N V
 S V=$D(^[QUI]PLCAREGI(REG))'=0
 Q V
 
EXIINT(REG) 
 Q:REG="" 0
 N V
 S V=$D(^[QUI]PLPLACAL(REG))'=0
 Q V
 
ADDJOUR(DATEINT,NBJ,REG,ERR) 
 Q:(DATEINT="")!(NBJ="") ""
 Q:NBJ=0 DATEINT
 N PAR1,PAR2,RES,%I
 S PAR1=$P(DATEINT,","),PAR2=$P(DATEINT,",",2)
 S:REG="" REG=$$REGSTAND
 I '($D(^[QUI]PLPLACAL(REG))) S ERR=1 Q ""
 F %I=1:1:NBJ S PAR1=$O(^[QUI]PLPLACAL(REG,PAR1)) Q:PAR1=""
 I PAR1="" S ERR=2 Q ""
 S RES=PAR1_$S(PAR2'="":","_PAR2,1:"")
 Q RES
 
RETJOUR(DATEINT,NBJ,REG,ERR) 
 Q:(DATEINT="")!(NBJ="") ""
 Q:NBJ=0 DATEINT
 N PAR1,PAR2,RES,%I
 S PAR1=$P(DATEINT,","),PAR2=$P(DATEINT,",",2)
 S:REG="" REG=$$REGSTAND
 I '($D(^[QUI]PLPLACAL(REG))) S ERR=1 Q ""
 F %I=1:1:NBJ S PAR1=$ZP(^[QUI]PLPLACAL(REG,PAR1)) Q:PAR1=""
 I PAR1="" S ERR=1 Q ""
 S RES=PAR1_$S(PAR2'="":","_PAR2,1:"")
 Q RES
 
DATE(JOUR,REGIME,DATE,MERR) 
 I JOUR="" S MERR=$$^%QZCHW("Date non definie") Q 0
 I REGIME="" S MERR=$$^%QZCHW("Regime calendaire non defini") Q 0
 I '($$EXIINT(REGIME)) S MERR=$$^%QZCHW("Regime calendaire inexistant") Q 0
 I $D(^[QUI]PLPLACAL(REGIME,JOUR)) S DATE=JOUR Q 1
 S DATE=$O(^[QUI]PLPLACAL(REGIME,JOUR))
 Q:DATE'="" 1
 S MERR=$$^%QZCHW("Regime calendaire incomplet")
 Q 0
 
NBJ(REG,DATDEP,DATAR) 
 Q:'($$EXIINT(REG)) ""
 Q:DATDEP'<DATAR 0
 N NBJ,%N
 S NBJ=0
 F %N=0:0 S DATDEP=$O(^[QUI]PLPLACAL(REG,DATDEP)) Q:DATDEP=""  Q:DATDEP>DATAR  S NBJ=NBJ+1
 I DATDEP="" Q ""
 Q NBJ
 ;

