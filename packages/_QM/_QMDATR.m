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

;%QMDATR^INT^1^59547,73877^0
QMDATR(REP,ATR,GLO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %G,%O,CPT,GL,GLOB,IND,O,REPI,STOP,TYP,VAL
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL") K @(GL)
 S REPI=$$NOMINT^%QSF(REP)
 Q:$$TYPE^%QSGESPE(ATR_"/"_REPI)'="DATE"
 S GLOB=$$LISTIND^%QSGEST6(REP),IND="",(CPT,STOP)=0
 F %G=0:0 S IND=$O(@GLOB@(IND)) Q:IND=""  D TRANS(IND)
 S @GLO=CPT
 K @(GL) Q '(STOP)
 
TRANS(IND) 
 K @(GL),TYP
 D MVG^%QSCALVA(REPI,IND,ATR,GL,.TYP)
 Q:@GL=0
 W !,IND," ",@(GL)
 S O="" F %O=0:0 S O=$O(@GL@(O)) Q:O=""  S VAL=@GL@(O) D TEST
 Q
 
TEST 
 I '($$FINT^%QMDAUC(REPI,ATR,.VAL)) W !,?20,"Incorrect" S STOP=1,@GLO@(IND,O)=@GL@(O),CPT=CPT+1 Q
 D PS^%QSGESTI(REPI,IND,ATR,@GL@(O),O)
 D PA^%QSGESTI(REPI,IND,ATR,VAL,O)
 W !,?20,VAL Q

