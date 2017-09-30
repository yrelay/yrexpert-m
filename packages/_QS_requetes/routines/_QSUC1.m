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

;%QSUC1^INT^1^59547,73883^0
QSUC1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(VAL) 
 I VAL'="?" S %QUE=VAL G EXIS
 S REFUSE=1 D ^%QSCHQUE,CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR Q:%QUE=""
 S TAB(IC)=%QUE D ^%VAFFICH S REFUSE=0 Q
EXIS S REFUSE='($$REP^%QSGEST5($$NOMINT^%QSF(%QUE))) I REFUSE D ^%VZEAVT($$^%QZCHW("Ce repertoire n'existe pas"))
 Q
 
COMP(VAL) 
 S REFUSE=0
 Q:VAL="="  Q:VAL="'="  Q:VAL="<"  Q:VAL=">"  Q:VAL="'<"  Q:VAL="'>"
 Q:VAL="["  Q:VAL="'["  Q:VAL="[]"  Q:VAL="]]"  Q:VAL="[["  Q:VAL="]["
 Q:VAL="'[]"  Q:VAL="']]"  Q:VAL="'[["  Q:VAL="']["
 S REFUSE=1
 D ^%VZEAVT($$^%QZCHW("Comparateurs possibles : = '= < '< > '> [ [] ]] [[ ]["))
 Q
 
ETOILE(AT) 
 Q:AT'="*"
 S REFUSE=0,TAB(3)="*",ICC=3 D ^%VAFFICH
 S TAB(4)="*",ICC=4 D ^%VAFFICH
 Q
 
VAL(VAL) 
 N PRE
 S REFUSE=0,PRE=RESUL(ICC-1)
 I (((((((PRE="[[")!(PRE="]]"))!(PRE="]["))!(PRE="[]"))!(PRE="'[["))!(PRE="']]"))!(PRE="']["))!(PRE="'[]") G DBL
 Q:$$ADR^%QZNBN1(VAL)
 S RESUL(IC)=$TR(VAL,"""","")
 Q
DBL 
 N P,D
 S P=$P(VAL,","),D=$P(VAL,",",2),REFUSE=1
 I (P="")!(D="") D ^%VZEAVT($$^%QZCHW("Vous devez definir un intervalle de valeurs separees par une virgule")) Q
 I $$ADR^%QZNBN1(P)=0 D ^%VZEAVT($$^%QZCHW("Vous devez definir des valeurs numeriques")) Q
 I $$ADR^%QZNBN1(D)=0 D ^%VZEAVT($$^%QZCHW("Vous devez definir des valeurs numeriques")) Q
 S REFUSE=0
 Q
 
ATTR 
 S A=RESUL(IC) Q:A=""
 I A'="?" D ATT2^%VYREP($$NOMINT^%QSF(RESUL(1))) D:REFUSE ^%VZEAVT($$^%QZCHW("Attribut inconnu pour le repertoire ")_RESUL(1)) Q
 D LISTATT2^%VYREP(RESUL(1)) Q
 
ATR 
 N OLD,OLDB
 S OLD=RESUL(ICC),RESUL(ICC)=$$GETLBLAN^%VTLBLAN($P(OLD,"("))
 I OLD="" S REFUSE=0 Q
 D EXIOP^%LXUC5 Q:REFUSE
 D CHBKPT^%LXUC5 Q:REFUSE
 D FULL^%LXUC4 Q:REFUSE
 S OLDB=RESUL(ICC),REFUSE=1,TAB(ICC)=$J("",20),REFUSE=0 D ^%VAFFICH
 S REFUSE=1,TAB(ICC)=OLDB_$S($P(OLD,"(",2)="":"",1:" ("_$P(OLD,"(",2)),REFUSE=0 D ^%VAFFICH
 Q
 
VALDEF 
 I RESUL(ICC-1)="" D ^%VZEAVT($$^%QZCHW("veuillez saisir d'abord le nom de l'attribut")) S REFUSE=1 Q
 S REFUSE=0
 I RESUL(ICC)="" Q
 
 I $$FINT^%QMDAUC(RESUL(1),RESUL(ICC-1),RESUL(ICC))=1 Q
 
 D ^%VZEAVT($$^%QZCHW("la date a une forme incorrecte"))
 S REFUSE=1
 Q
 
 
STOCK 
 D ^%VAUTOST Q:ABENDSCR=1
 N I,REP,ATR
 S REP=$$NOMINT^%QSF(RESUL(1))
 F I=7:2:21 S ATR=RESUL(I-1) D STO
 Q
STO 
 I ATR="" Q
 I RESUL(I)="" Q
 
 I $$TYPE^%QSGESPE(ATR_"/"_RESUL(1))="DATE" Q
 D INSER^%QSPRVAL(REP,ATR,RESUL(I),1)
 Q

