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

;LKMMCV^INT^1^59547,74867^0
LKMMCV ;
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(TYPE,GR,REC,OUT) 
 N I,ATT,LS,MSG
 I '($D(@GR(3)@(REC,"NOM"))) Q $$^%QZCHW("il est necessaire d'avoir un champs NOM")
 S LS=$L($P(@GR(1)@(REC),"^",$$POS^LKMZ(TYPE,1,"SEP")))
 S @OUT@("LKEX",1,0,"%MARQUE","T",1)="CST^LKEXZ(""****TURLU*****"")"
 S ATT=$O(@GR(3)@(REC,""))
 F I=0:1 Q:ATT=""  D INT1 S ATT=$O(@GR(3)@(REC,ATT))
 Q ""
INT1 N VAL
 S VAL=@GR(3)@(REC,ATT)
 S @OUT@("LKEX",1,0,ATT,"T",1)="EXTR^LKEXZ("_$P(VAL,"^",$$POS^LKMZ(TYPE,3,"FIRST"))_","_($P(VAL,"^",$$POS^LKMZ(TYPE,3,"LAST"))-LS)_")"
 S @OUT@("LKEX",1,0,ATT,"T",2)="NET^LKEXZ"
 S @OUT@("LKEX",1,0,ATT,"T",3)="ALPHA"
 Q
 
 
INT2(TYPE,GR,REC,OUT) 
 N ATT,FIRST,LS,ORDRE,NUM,VAL,V,LG,CARNS
 
 S LS=$L($P(@GR(1)@(REC),"^",$$POS^LKMZ(TYPE,1,"SEP")))
 S @OUT@("LKEX",1,0,"%MARQUE",1,"T",1)="CST^LKEXZ(""****TURLU*****"")"
 S ATT=""
ATT 
 S ATT=$O(@GR(3)@(REC,ATT)) Q:ATT=""
 S NUM=""
NUM 
 S NUM=$O(@GR(3)@(REC,ATT,NUM)) G:NUM="" ATT
 S FIRST=""
POS 
 S FIRST=$O(@GR(3)@(REC,ATT,NUM,FIRST)) G:FIRST="" NUM
 D INT21
 G POS
INT21 S VAL=@GR(3)@(REC,ATT,NUM,FIRST)
 
 S ORDRE=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"INDICE"))
 I ORDRE="" S ORDRE=1
 
 G NOUVEAU
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",1)="EXTR^LKEXZ("_FIRST_","_($P(VAL,"^",$$POS^LKMZ(TYPE,3,"LAST"))-LS)_")"
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",2)="NET^LKEXZ"
 
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",3)="ALPHA^LKEX"
 
 S V=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"NUMERIQUE"))
 I V'="O" G INT22
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",4)="ELIM^LKEXZ("_$P(VAL,"^",$$POS^LKMZ(TYPE,3,"CAREMP"))_","_""""")"
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",5)="NUM2^LKEX"
 G INT22
 
NOUVEAU S @OUT@("LKEX",1,0,ATT,ORDRE,"T",1)="EXTR^LKEXZ("_FIRST_","_($P(VAL,"^",$$POS^LKMZ(TYPE,3,"LAST"))-LS)_")"
 S V=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"NUMERIQUE"))
 I V'="O" S @OUT@("LKEX",1,0,ATT,ORDRE,"T",2)="NET^LKEXZ",@OUT@("LKEX",1,0,ATT,ORDRE,"T",3)="ALPHA^LKEX" G INT22
 
 S LG=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"LONGUEUR"))
 S CARNS=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"CAREMP"))
 S @OUT@("LKEX",1,0,ATT,ORDRE,"T",2)="SPENUM^LKEXZ("_LG_","""_CARNS_""")"
INT22 
 
 S @OUT@("LKEX",1,0,ATT,ORDRE,"E")=NUM
 
 S V=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"DATE"))
 I V="O" S @OUT@("LKEX",1,0,ATT,ORDRE,"D")=V,@OUT@("LKEX",1,0,ATT,ORDRE,"F")=$P(VAL,"^",$$POS^LKMZ(TYPE,3,"FORMAT"))
 Q

