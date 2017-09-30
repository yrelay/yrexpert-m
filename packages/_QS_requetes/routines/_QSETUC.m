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

;%QSETUC^INT^1^59547,73881^0
QSETUC ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXI(ET) 
 I ET="" S (REFUSE,STOPUC)=1 Q
 I %AJM="C" S (REFUSE,STOPUC)=0 Q
 S (STOPUC,REFUSE)=$D(^[QUI]QSETAT(ET)) D:REFUSE ^%VZEAVT($$^%QZCHW("Cet etat existe deja")) Q
 
LONG(G) 
 N %I,I,LARG
 
 S REFUSE=1 I RESUL(ICC)="" D ^%VZEAVT($$^%QZCHW("Vous devez obligatoirement definir la longueur")) Q
 S I=$S(G="P":5,1:4),LARG=0
 F %I=ICC:-(I):5 S LARG=LARG+RESUL(%I)
 I LARG>120 D ^%VZEAVT($$^%QZCHW("Attention, la somme de toutes les longueurs est trop importante, elle ne doit pas depasser 120")) Q
 S REFUSE=0 Q
 
INT 
 I RESUL(IC)="?" D ^%VZEAVT($$^%QZCHW("O pour faire un sous-total des valeurs de l'attribut, N sinon")) S REFUSE=1
 Q
 
INTN(N) 
 Q:N=""
 I N="?" D ^%VZEAVT($$^%QZCHW("O si le champ est numerique, N sinon")) S REFUSE=1 Q
 S PATOUCH(IC+1)=$S(N="O":0,1:1)
 S ICC=ICC+1,REFUSE=1,TAB(ICC)=$J("",6) D ^%VAFFICH
 S TAB(ICC)="" D ^%VAFFICH
 S ICC=ICC-1,REFUSE=0
 Q
 
ATR 
 N OLD,OLDB,REPA,REPE
 S OLD=RESUL(ICC),RESUL(ICC)=$$GETLBLAN^%VTLBLAN($P(OLD,"("))
 I OLD="" S REFUSE=0 Q
 S RESUL(ICC)=$TR(RESUL(ICC),"~","^")
 
 S REPA=$P(RESUL(ICC),"^",2),RESUL(ICC)=$P(RESUL(ICC),"^",1)
 
 D EXIOP^%LXUC5 Q:REFUSE
 D CHBKPT^%LXUC5 Q:REFUSE
 D FULL^%LXUC4 Q:REFUSE
 I REPA="" G FATR
 
 S REPE=$P(^[QUI]QSETAT(RESUL(1)),"^",6),REFUSE=1
 I $$TYPE^%QSGEST9($$NOMINT^%QSF(REPE),REPA)=0 D ^%VZEAVT($$^%QZCHW("L'attribut")_" "_REPA_" "_$$^%QZCHW("n'est pas un attribut lien du repertoire ")_REPE) Q
FATR 
 S OLDB=RESUL(ICC),TAB(ICC)=$J("",20),REFUSE=0 D ^%VAFFICH
 S TAB(ICC)=OLDB_$S(REPA="":"",1:"~"_REPA)_$S($P(OLD,"(",2)="":"",1:" ("_$P(OLD,"(",2)),REFUSE=0
 D ^%VAFFICH
 Q
 
STOCK(G) 
 N %I,B,I,K
 S I=$S(G="P":5,1:4),B=$S(G="P":20,1:17),K=0
 F %I=5:I:B I RESUL(%I-2)'="",RESUL(%I)="" D ^%VZEAVT($$^%QZCHW("Vous devez absolument definir les longueurs")) S K=1 Q
 I K=1 S ABENDSCR=1 Q
 D ^%VAUTOST Q
 
SUP() 
 K @(m("OLDN")),@(m("OLDF"))
 K ^[QUI]ETAT(RESUL(1))
 K ^[QUI]QSETAT(RESUL(1))
 Q 1
 
SUPA(G) 
 K @(m("OLDN")),@(m("OLDF"))
 K ^[QUI]ETAT(RESUL(1))
 I G="S" K ^[QUI]QSETATS(RESUL(1),RESUL(2)) Q 0
 K ^[QUI]QSETATP(RESUL(1),RESUL(2)) Q 0

