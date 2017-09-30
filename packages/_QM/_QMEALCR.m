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

;%QMEALCR^INT^1^59547,73877^0
QMEALCR ;
 
 
 
 
 
AJ 
 N ABENDSCR,RESUL,NO1,NO2,INDL,GL,AFF,I,%I,VAL,REPN,REPL
 S REPN="NOEUD.I",REPL=$$LIENI^%QSGEL3
 K RESUL S LIBA=$$^%QZCHW("Ajouter"),RESUL(3)=LIBA
AJ2 D CLEPAG^%VVIDEO,AFF^%VACTGRQ("QMEALI1",.RESUL)
 Q:ABENDSCR
 S NO1=$$GETLBLAN^%VTLBLAN(RESUL(1)),NO2=$$GETLBLAN^%VTLBLAN(RESUL(2))
 Q:(NO1="")&(NO2="")
 I (NO1="")!(NO2="") D ^%VSQUEAK G AJ2
 I $$VAIR^%QSGE5(REPN,NO1,"TRANSITION",NO2) D ^%VZEAVT($$^%QZCHW("Il existe deja une transition entre ces 2 noeuds...")) G AJ2
 D ADDS^%QSGEST3(REPN,NO1,"TRANSITION",REPN,NO2)
 S INDL=$$DERNL^%QSGES21(REPN,NO1,"TRANSITION")
 G:INDL="" BOUC
 K GL
 D ^%QMEBCDT("A",0,7,80,16,REPL,INDL,"CONDITION.TRANSITION","","",.GL,.AFF)
 S I=""
 F %I=0:0 S I=$O(GL("AJ","CONDITION.TRANSITION",I)) Q:I=""  D PA^%QSGESTI(REPL,INDL,"CONDITION.TRANSITION",GL("AJ","CONDITION.TRANSITION",I),I)
 F %I=0:0 S I=$O(GL("MOD","CONDITION.TRANSITION",I)) Q:I=""  D PSO^%QSGESTI(REPL,INDL,"CONDITION.TRANSITION",I),PA^%QSGESTI(REPL,INDL,"CONDITION.TRANSITION",GL("MOD","CONDITION.TRANSITION",I),I)
BOUC K RESUL S RESUL(3)=LIBA
 G AJ2
 
 
 
 
UC S REFUSE=0
 Q:RESUL(IC)=""
 S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 I PARA="?" S RESUL(IC)=$$^%QUCHOIX($$LISTIND^%QSGEST6("NOEUD.I"),1,"",0,7,80,16) S:RESUL(IC)="" REFUSE=1 Q
 I '($$IR^%QSGEST5(REPN,PARA)) D ^%VZEAVT($$^%QZCHW("Noeud inexistant...")) S REFUSE=1
 Q

