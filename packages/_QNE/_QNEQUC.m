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

;%QNEQUC^INT^1^59547,73879^0
QNEQUC ;
 
 
 
 
 
GAM 
 N REP
 I RESUL(ICC)="" S (REFUSE,STOPUC)=0 Q
 S REP=$$NOMINT^%QSF(RESUL(3))
 D LISTIND^%VYREP(REP),IND^%VYREP(REP)
 Q
 
REP 
 I RESUL(ICC)="" S (REFUSE,STOPUC)=1 Q
 I RESUL(ICC)'="?" S (REFUSE,STOPUC)='($$EXGAM^%MZINTER(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce repertoire n'est pas un repertoire gamme")) Q
 D AFF^%VYREP("^TABIDENT(WHOIS,""MOZART"")")
 Q
 
LAT 
 I RESUL(ICC)="" S (REFUSE,STOPUC)=0 Q
 I RESUL(ICC)'="?" S (REFUSE,STOPUC)='($$EX^%QMLILA(RESUL(ICC))) Q
 
 D AFF^%VYREP($$ADR^%QMLILA)
 Q
TRT 
 I RESUL(ICC)="" S (REFUSE,STOPUC)=0 Q
 I RESUL(ICC)="?" D AFF^%VYREP("^[QUI]TTL") Q
 S (REFUSE,STOPUC)='($$EXISTE^%TLINTER(RESUL(ICC)))
 I REFUSE D ^%VZEAVT($$^%QZCHW("Traitement inconnu"))
 Q
 
LISTE(UT) 
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)=""
 N FILS
 S FILS=$$OI^%MZINTER(RESUL(3))
 I RESUL(ICC)="?" G LIS
 D IND^%VYREP("L0") I REFUSE=1 D ^%VZEAVT($$^%QZCHW("Liste inconnue")) Q
 Q:(UT="S")!(UT="C")
 
 S (REFUSE,STOPUC)='($$BASE^%QSGEST7(RESUL(ICC))=FILS)
 I REFUSE D ^%VZEAVT($$^%QZCHW("Cette liste ne contient pas des")_" "_$$NOMLOG^%QSF(FILS))
 Q
LIS 
 N GL,%I,IND,GLAFF
 S GLAFF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLAFF") K @(GLAFF)
 S GL=$$LISTIND^%QSGEST6("L0")
 D ^%VZEATT,@UT
 I '($D(@GLAFF)) S (REFUSE,STOPUC)=1 D ^%VZEAVT($$^%QZCHW("Aucune liste")) Q
 D AFF^%VYREP(GLAFF)
 K @(GLAFF) Q
 
S 
 S IND=$ZP(@GL@("EQS"))
 F %I=0:0 S IND=$O(@GL@(IND)) Q:IND=""  Q:$E(IND,1,3)'="EQS"  I $$BASE^%QSGEST7(IND)="L0" S @GLAFF@(IND)=""
 Q
C 
 S IND=$ZP(@GL@("EQC"))
 F %I=0:0 S IND=$O(@GL@(IND)) Q:IND=""  Q:$E(IND,1,3)'="EQC"  I $$BASE^%QSGEST7(IND)="L0" S @GLAFF@(IND)=""
 Q
E 
 N PRE
 S IND=""
 F %I=0:0 S IND=$O(@GL@(IND)) Q:IND=""  S PRE=$E(IND,1,3) I ((PRE'="EQS")&(PRE'="EQC"))&(PRE'="TMP"),$$BASE^%QSGEST7(IND)=FILS S @GLAFF@(IND)=""
 Q

