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

;LKYVAL1^INT^1^59547,74868^0
LKYVAL1(NOM) 
 
 
 
 
 
 N FIRST,IND,INDP,LAST,LT,PRE,DEF
 
 S ADR=$$CONCAS^%QZCHAD("^[QUI]LKYATR2",NOM)
 S ATT="",STOP=0
AT S ATT=$O(@ADR@(ATT)) G:ATT="" VERIF
 I $$LIEN^LKYUC(REP,ATT,.MSG)=0 D INS(MSG) G ATN
 
 I ATT["~" S @GL@("LIEN",ATT)=""
ATN S NUM=""
 F I=0:0 S NUM=$O(@ADR@(ATT,NUM)) Q:NUM=""  D T
 G AT
 
VERIF 
 I STOP=1 Q
 S NUM=""
NUM S NUM=$O(@GL@("D",NUM)) Q:NUM=""
 S (MSG,IND)="",LT=0,PRE=0
 F I=0:0 S IND=$O(@GL@("D",NUM,IND)) Q:IND=""  D T1 Q:MSG'=""  S PRE=(@GL@("D",NUM,IND,"T")+IND)-1,INDP=IND
 I MSG'="" Q
 G NUM
 
T I '($D(^[QUI]LKYENR2(NOM,NUM))) D INS($$^%QZCHW("Le numero d'enregistrement")_" "_NUM_" "_$$^%QZCHW("n'a pas ete defini")) S STOP=1 Q
 I NUM>@GL@("ENR","NBRE") D INS($$^%QZCHW("Le numero d'enregistrement de")_" "_ATT_" "_$$^%QZCHW("est superieur au nombre d'enregistrements"))
 S FIRST=""
TF S FIRST=$O(@ADR@(ATT,NUM,FIRST)) Q:FIRST=""
 I @GL@("ENR",NUM)<FIRST D INS($$^%QZCHW("La position du 1er caractere pour")_" "_ATT_" "_$$^%QZCHW("doit etre inferieure a la longueur de l'enregistrement"))
 S CONT=$$CONCAS^%QZCHAD(ADR,ATT_","_NUM_","_FIRST)
 S MSG=$$OUT^%QZCHGE(CONT,1,.LAST)
 I MSG'=0 D INS($$^%QZCHW("La position du dernier caractere pour")_" "_ATT_" "_$$^%QZCHW("n'est pas definie")) S STOP=1,LAST=0 G TA
 I @GL@("ENR",NUM)<LAST D INS($$^%QZCHW("La position du dernier caractere pour")_" "_ATT_" "_$$^%QZCHW("doit etre inferieure a la longueur de l'enregistrement"))
 I ((FIRST>LAST)!(FIRST<0))!(LAST<0) D INS($$^%QZCHW("La position ds l'enregistrement pour")_" "_ATT_" "_$$^%QZCHW("est incorrecte (1ere = ")_FIRST_$$^%QZCHW(" derniere = ")_LAST_")") S STOP=1
TA I ATT="CONSTANTE" G TV
 
 S MSG=$$OUT^%QZCHGE(CONT,2,.VAL)
 I MSG'=0 D INS($$^%QZCHW("Le numero d'ordre de")_" "_ATT_" "_$$^%QZCHW("n'est pas defini"))
 S MSG=$$OUT^%QZCHGE(CONT,4,.VAL)
 I MSG'=0 D INS($$^%QZCHW("L'indicateur de valeur numerique de")_" "_ATT_" "_$$^%QZCHW("n'est pas definie")) G TC
 I (VAL'="N")&(VAL'="O") D INS($$^%QZCHW("L'indicateur de valeur numerique de")_" "_ATT_" "_$$^%QZCHW("doit etre egal a N ou O")) S VAL="N"
 I VAL="N" G TC
 S MSG=$$OUT^%QZCHGE(CONT,5,.VAL)
 I MSG'=0 D INS($$^%QZCHW("La longueur de")_" "_ATT_" "_$$^%QZCHW("n'est pas definie")) G TC
 S:VAL="" VAL=0
 I '($$POS^%QZNBN(VAL)) D INS($$^%QZCHW("La longueur de")_" "_ATT_" "_$$^%QZCHW("doit avoir une valeur strictement positive"))
TC S MSG=$$OUT^%QZCHGE(CONT,6,.VAL)
 I MSG'=0 D INS($$^%QZCHW("Le caractere non significatif de")_" "_ATT_" "_$$^%QZCHW("n'est pas defini"))
 S MSG=$$OUT^%QZCHGE(CONT,7,.VAL)
 I MSG'=0 D INS($$^%QZCHW("L'indicateur d'attribut de type date de")_" "_ATT_" "_$$^%QZCHW("n'est pas defini"))
 I (VAL'="N")&(VAL'="O") D INS($$^%QZCHW("L'indicateur d'attribut de type date de")_" "_ATT_" "_$$^%QZCHW("doit etre egal a N ou O")) S VAL="N"
 I VAL="N" G TV
 I $$DATV^LKYUC(REP,ATT,VAL,.MSG)=0 D INS(MSG) S VAL="N"
 S MSG=$$OUT^%QZCHGE(CONT,8,.VAL)
 I MSG'=0 D INS($$^%QZCHW("Le format de")_" "_ATT_" "_$$^%QZCHW("n'est pas defini")) G TV
 I '($$EX^%QMDAUC(VAL)) D INS($$^%QZCHW("Le format de")_" "_ATT_" "_$$^%QZCHW("est inconnu"))
TV S MSG=$$OUT^%QZCHGE(CONT,3,.DEF)
 I MSG'=0 D INS($$^%QZCHW("La valeur par defaut de")_" "_ATT_" "_$$^%QZCHW("n'est pas definie")) S DEF="",STOP=1
 S @GL@("D",NUM,FIRST,"T")=(LAST-FIRST)+1
 S @GL@("D",NUM,FIRST,"ATT")=ATT
 S @GL@("D",NUM,FIRST,"V")=DEF
 G TF
 
T1 S MSG=$$BOUC(PRE,IND) I MSG'="" D INS(MSG) Q
 S LT=@GL@("D",NUM,IND,"T")+LT
 I LT>@GL@("ENR",NUM) S MSG=$$^%QZCHW("La taille cumule des champs est superieure a celle de l'enregistrement")_" "_NUM D INS(MSG)
 Q
 
INS(M) 
 D INS^LKYVALI(M)
 Q
 
BOUC(PRE,IND) 
 N LSEP
 
 S LSEP=$L($$^%QCAZG($$CONCAS^%QZCHAD(GL,"SEP")))
 
 I (PRE+LSEP)<(IND-1) S @GL@("D",NUM,PRE+1,"T")=(IND-PRE)-1,LT=((LT+IND)-PRE)-1
 Q ""
 
CH(NUM,POS) 
 N CH
 S CH=$$^%QCAZG($$CONCAS^%QZCHAD(GL,"D,"_NUM_","_POS_",ATT"))
 Q $S(CH="":$$^%QCAZG($$CONCAS^%QZCHAD(GL,"D,"_NUM_","_POS_",V")),1:CH)

