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

;LKYUC^INT^1^59547,74868^0
LKYUC ;
 
 
 
 
 
 
 
 
REFUS S (REFUSE,STOPUC)=1 Q
 
ACCOR S (REFUSE,STOPUC)=0 Q
 
LONG 
 D POS^%VYCH Q:(REFUSE=1)!(STOPUC=1)
 I RESUL(ICC)>500 D ^%VZEAVT($$^%QZCHW("Cet entier positif doit etre inferieur a 500")) G REFUS
 G ACCOR
 
NUM 
 N NOUV
 I RESUL(ICC)="" G POP
 D ENTP^%VYCH Q
POP 
 S NOUV=$ZP(@NOMTAB@(RESUL(1),""))+1
 S TAB(ICC)=NOUV D ^%VAFFICH G ACCOR
 
EXI 
 N NOMTAB
 S NOMTAB=^%SCRE("LKXENRD","GLOSTOC")
 I '($D(@NOMTAB@(RESUL(1),RESUL(ICC)))) D ^%VZEAVT($$^%QZCHW("Ce numero d'enregistrement n'a pas ete defini")) G REFUS
 G ACCOR
 
LONGCAR 
 D POS^%VYCH Q:(REFUSE=1)!(STOPUC=1)
 N %A,%I,%J,NOMTAB,REP,ATR,POS,STOP,DER
 S NOMTAB=^%SCRE("LKXENRD","GLOSTOC")
 I @NOMTAB@(RESUL(1),RESUL(3))<RESUL(ICC) D ^%VZEAVT($$^%QZCHW("La position doit etre inferieure a la longueur de l'enregistrement")) G REFUS
 G ACCOR
 
 
 S NOMTAB=^%SCRE("LKXVALD","GLOSTOC")
 S REP="",STOP=0
 S ATR="" F %A=0:0 S ATR=$O(@NOMTAB@(RESUL(1),ATR)) Q:(ATR="")!(STOP=1)  S POS="" F %J=0:0 S POS=$O(@NOMTAB@(RESUL(1),ATR,RESUL(3),POS)) Q:POS=""  D TCAR Q:STOP=1
 I STOP=1 G REFUS
 G ACCOR
TCAR 
 I $D(@NOMTAB@(RESUL(1),ATR,RESUL(3),RESUL(ICC))) D ^%VZEAVT($$^%QZCHW("Cette position est deja occupee pour l'attribut")_" "_ATR) S STOP=1 Q
 I $P(@NOMTAB@(RESUL(1),ATR,RESUL(3),POS),"^",1)<RESUL(ICC) Q
 I RESUL(ICC)<POS Q
 D ^%VZEAVT($$^%QZCHW("Cette position est deja occupee pour l'attribut")_" "_ATR)
 S STOP=1 Q
 
DER 
 I RESUL(4)<RESUL(3) D ^%VZEAVT($$^%QZCHW("La position du dernier caractere doit etre superieure a celle du premier caractere")) G REFUSE
 G ACCOR
 
FORM 
 N F S F=RESUL(ICC)
 I F="?" D LIST^%QMDAUC,^%VAFIGRI,^%VAFISCR G REFUS
 I F'="" S REFUSE='($$EX^%QMDAUC(F)) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Format inconnu")) Q
 I RESUL(ICC-1)="N" G ACCOR
 G REFUS
 
DAT 
 I RESUL(ICC)="N" G DV
 N REP,ATR,L,NOMTAB
 S ATR=$TR(RESUL(2),"~","^")
 I ATR="CONSTANTE" G DV
 S ATR=$P(ATR,"^"),L=$P(ATR,"^",2,99)
 S NOMTAB=^%SCRE("LKXENRG","GLOSTOC")
 S REP=$P(@NOMTAB@(RESUL(1)),"^",3)
 S REP=$$NOMINT^%QSF(REP)
 I $$CHEM(L,.REP)=0 D ^%VZEAVT($$^%QZCHW("Attribut")_" : "_$$^%QZCHW("Lien(s) incorrect(s)")) G REFUS
 S REP=$$NOMLOG^%QSF(REP)
 I $$TYPE^%QSGESPE(ATR_"/"_REP)'="DATE" D ^%VZEAVT($$^%QZCHW("Cet attribut n'est pas de type date")) G REFUS
 G ACCOR
DV S ICC=ICC+1,TAB(ICC)="" D ^%VAFFICH S ICC=ICC-1
 G ACCOR
 
DATV(REP,ATR,ATD,MSG) 
 I ATD="N" Q 1
 N L,AT
 S AT=$P(ATR,"^"),L=$P(ATR,"^",2,99)
 I $$CHEM(L,.REP)=0 S MSG=$$^%QZCHW("Attribut")_" : "_$$^%QZCHW("Lien(s) incorrect(s)") Q 0
 S REP=$$NOMLOG^%QSF(REP)
 I $$TYPE^%QSGESPE(AT_"/"_REP)'="DATE" S MSG=$$^%QZCHW("L'attribut")_" "_AT_" "_$$^%QZCHW("n'est pas de type date") Q 0
 Q 1
 
VNUM 
 I RESUL(ICC)="N" S ICC=ICC+1,TAB(ICC)=0 D ^%VAFFICH S ICC=ICC-1
 Q
 
LONGN 
 I RESUL(ICC)="" S TAB(ICC)=0 D ^%VAFFICH G ACCOR
 D ENTP^%VYCH Q
 
DEF 
 
 I RESUL(ICC)["^" D ^%VZEAVT($$^%QZCHW("La valeur par defaut ne doit pas contenir de ^")) G REFUS
 G ACCOR
 
ATT 
 N NOMTAB,MOT
 I RESUL(ICC)="" G REFUS
 I RESUL(ICC)="CONSTANTE" G ACCOR
 N L,REP,ATR,MOT
 S ATR=$TR(RESUL(ICC),"~","^")
 I (ATR["^SOURCE")!(ATR["^DESTINATION") D ^%VZEAVT($$^%QZCHW("Un lien ne peut commencer ni par SOURCE, ni par DESTINATION")) G REFUS
 S MOT=$P(ATR,"^")
 S RESUL(ICC)=MOT
 S L=$P(ATR,"^",2,99)
 S NOMTAB=^%SCRE("LKXENRG","GLOSTOC")
 S REP=$P(@NOMTAB@(RESUL(1)),"^",3)
 S REP=$$NOMINT^%QSF(REP)
 I $$CHEM(L,.REP)=0 D ^%VZEAVT($$^%QZCHW("Lien(s) incorrect(s)")) G REFUS
 D LISTATT2^%VYREP(REP) Q:(REFUSE=1)!(STOPUC=1)
 D ABR^%LXUC4 Q:(REFUSE=1)!(STOPUC=1)
 I $$LEX^%LXSTOCK(RESUL(ICC),.MOT)'=1 G REFUS
 S MOT=MOT_$S(L="":"",1:"~"_$TR(L,"^","~"))
 S TAB(ICC)=MOT D ^%VAFFICH
 G ACCOR
 
LIEN(REP,ATR,MSG) 
 
 S MSG=""
 I ATR="CONSTANTE" Q 1
 N L,MOT,MOT2
 S MOT=$P(ATR,"~"),L=$P(ATR,"~",2,99)
 I $$CHEM($TR(L,"~","^"),.REP)=0 S MSG=$$^%QZCHW("Lien(s) incorrect(s) pour")_" "_ATR Q 0
 I $$LEX^%LXSTOCK(MOT,.MOT2)'=1 S MSG=$$^%QZCHW("L'attribut")_" "_MOT_" "_$$^%QZCHW("est incorrect") Q 0
 S ATR=MOT2_L,MSG=""
 Q 1
 
CHEM(LIEN,REP) 
 
 Q:LIEN="" 1
 Q:REP="" 0
 N %I,LI
 F %I=1:1 S LI=$P(LIEN,"^",%I) Q:LI=""  S REP=$$REPD^%QSGEL2(REP,LI) Q:REP=""
 Q REP'=""

