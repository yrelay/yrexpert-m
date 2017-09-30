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

;%VYREP^INT^1^59547,74036^0
%VYREP ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
IND(REP) S (REFUSE,STOPUC)='($$IR^%QSGEST5(REP,RESUL(ICC))) Q
 
ATT1(REPI) N REP,I,MOT S REP=$P(REPI,"^",1),I=$P(REPI,"^",2)
 D ABR^%LXUC4 Q:(REFUSE=1)!(STOPUC=1)
 I $$LEX^%LXSTOCK(RESUL(ICC),.MOT)'=1 S (REFUSE,STOPUC)=1 Q
 S RESUL(ICC)=MOT
 S (REFUSE,STOPUC)='($$AIR^%QSGEST5(REP,I,RESUL(ICC))) Q
 
ATT2(REP) N MOT D ABR^%LXUC4 Q:(REFUSE=1)!(STOPUC=1)
 I $$LEX^%LXSTOCK(RESUL(ICC),.MOT)'=1 S (REFUSE,STOPUC)=1 Q
 S RESUL(ICC)=MOT
 S (REFUSE,STOPUC)='($$AR^%QSGEST5(REP,RESUL(ICC))) Q
 
VAL(REPIA) S REP=$P(REPIA,"^",1),I=$P(REPIA,"^",2),A=$P(REPIA,"^",3)
 S (REFUSE,STOPUC)='($$VAIR^%QSGEST5(REP,I,A,RESUL(ICC))) Q
 
LAV(REPA) S REP=$P(REPA,"^",1),A=$P(REPA,"^",2)
 S (REFUSE,STOPUC)='($$VAR^%QSGEST5(REP,A,RESUL(ICC))) Q
 
LISTIND(REP) 
 N NOM
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 S NOM=$$LISTIND^%QSGEST6(REP)
 D AFF(NOM)
 Q
 
LISTATT1(REPI) 
 N NOM
 S REP=$P(REPI,"^",1)
 S I=$P(REPI,"^",2)
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 S NOM=$$LISTATT1^%QSGEST6(REP,I)
 D AFF(NOM)
 Q
 
LISTATT2(REP) 
 N NOM
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 S NOM=$$LISTATT2^%QSGEST6(REP)
 D AFF(NOM)
 Q
 
LISTVAL(REPIA) 
 S REP=$P(REPIA,"^",1)
 S I=$P(REPIA,"^",2)
 S A=$P(REPIA,"^",3)
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 D LISTVAL^%QSTRUC8(REP,I,A,NOM)
 D AFF(NOM)
 K @(NOM)
 Q
 
LAVE(REPA) 
 S REP=$P(REPA,"^",1)
 S A=$P(REPA,"^",2)
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 S NOM=$$LAV^%QSGEST6(REP,A)
 D AFF(NOM)
 Q
 
AFF(NOM) 
 N CHOIX
 S (REFUSE,STOPUC)=0
 I NOM="" S (REFUSE,STOPUC)=1 Q
 S CHOIX=$$SEL^%QSGEST6(NOM)
 D ^%VAFIGRI
 D ^%VAFISCR
 I (CHOIX'="")&(CHOIX'=-1) S (RESUL(ICC),TAB(ICC))=CHOIX D ^%VAFFICH Q
 S (RESUL(ICC),TAB(ICC))=" " D ^%VAFFICH
 S (REFUSE,STOPUC)=1 Q

