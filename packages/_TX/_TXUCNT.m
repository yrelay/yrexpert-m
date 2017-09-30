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

;%TXUCNT^INT^1^59547,74033^0
IFMUCON ;
 
 
 
 
 
 
 
 
 
 
 
VID 
 S REFUSE=0 I RESUL(ICC)="" S REFUSE=1
 Q
 
DOS 
 S REFUSE=1
 I RESUL(ICC)="" S TAB(ICC)=$$POP D ^%VAFFICH
 I $$IR^%QSGEST5("PATIENT",RESUL(ICC)) D ^%VZEAVT($$^%QZCHW("Numero deja affecte")) Q
 S REFUSE=0 D ^%VAFFICH Q
POP() N I,%I,GL
 S GL=$$LISTIND^%QSGEST6("PATIENT"),I=""
 D ^%VZEATT
 F %I=0:0 S I=$ZP(@GL@(I)) Q:I=""  I $$ADR^%QZNBN1(I) Q
 Q I+1
 
PR 
 D VID Q:REFUSE=1
 S REFUSE='($D(^[QUI]TLDIAL(RESUL(ICC)))) I REFUSE D ^%VZEAVT($$^%QZCHW("Protocole inexistant"))
 Q
 
EXI 
 S REFUSE=0 Q:'($$VAR^%QSGE5("PATIENT","NOM.FAMILLE",RESUL(2)))
 N STOP,I
 S I=$$VERIF(RESUL(2),RESUL(4),RESUL(6),.STOP)
 I STOP=1 S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Ce patient existe deja sous le numero de dossier ")_I)
 Q
 
VERIF(NOM,PREN,NAIS,STOP) 
 N %I,IND,GL
 S GL=$$LAV^%QSGEST6("PATIENT","NOM.FAMILLE"),IND="",STOP=0
 F %I=0:0 S IND=$O(@GL@(NOM,IND)) Q:(IND="")!(STOP=1)  S I=$O(@GL@(NOM,IND,"")) I ($$^%QSCALVA("PATIENT",I,"PRENOM")=PREN)&($$^%QSCALVA("PATIENT",I,"DATE.NAISSANCE")=NAIS) S STOP=1
 Q $S(STOP=1:I,1:"")

