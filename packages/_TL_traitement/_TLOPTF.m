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

;%TLOPTF^INT^1^59547,74030^0
%TLOPTF ;;02:51 PM  22 Apr 1992;
 
 
 
 
 
 
 
LONGUEUR(IVDEB,NBPAR) 
 N RES
 I (V(IVDEB+1)=$C(0))!(NBPAR=1) S RES=$L(V(IVDEB)) Q RES
 S RES=$L(V(IVDEB),V(IVDEB+1)) Q RES
 
 
 
HEURE(IDEBV,NBPAR) 
 Q $$^%ANHEURE
 
 
 
 
 
 
 
EXP(IDEBV,NBPAR) 
 N RES
 S RES=$$EXP^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
SQR(IDEBV,NBPAR) 
 N RES
 S RES=$$SQR^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
SQ(IDEBV,NBPAR) 
 N RES
 S RES=$$SQ^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
CHRONOME(IDEBV,NBPAR) 
 N RES
 I V(IDEBV+1)="DEMARRAGE" D INIT^%QMDACHR(V(IDEBV)) Q $H
 S DUREE=$$INTERV^%QMDACHR(V(IDEBV))
 S RES=DUREE_" soit "_$$TRAD^%QMDACHR(DUREE)
 Q RES
 
 
 
 
 
 
 
COS(IDEBV,NBPAR) 
 N RES
 S RES=$$COS^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
ARCSIN(IDEBV,NBPAR) 
 N RES
 S RES=$$ARCSIN^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
ARCOS(IDEBV,NBPAR) 
 N RES
 S RES=$$ARCCOS^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
ABSOLUE(IDEBV,NBPAR) 
 N RES
 S RES=$$ABS^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
TANG(IDEBV,NBPAR) 
 N RES
 S RES=$$TG^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
ARCOTANG(IDEBV,NBPAR) 
 N RES
 S RES=$$ARCCOTG^%TLCAMTH(V(IDEBV))
 Q RES
 
 
 
 
 
 
 
ALEAN(IDEBV,NBPAR) 
 N RES
 S RES=$R(V(IDEBV)+1)
 Q RES
 
 
 
 
 
 
 
 
 
ALEAL(IDEBV,NBPAR) 
 Q V((IDEBV+1)+$R(NBPAR-1))

