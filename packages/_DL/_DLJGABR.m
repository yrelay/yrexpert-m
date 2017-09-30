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

;%DLJGABR^INT^1^59547,73868^0
PLJGABR ;
VAL 
 N TAF
 K ^V($J)
 S ERREUR='($$EXPRESS^%DLJANAL($P(^[QUI]DLJ(WB1,WB2,WB3,WB4),"^"),VISU,.COMP,.MESERR))
 I ERREUR G FIN
 K ^[QUI]ADLJ(WB1,WB2,WB3,WB4)
 S ^[QUI]ADLJ(WB1,WB2,WB3,WB4)=COMP
 D GLOCOP^%QCAGLC("^V("_$J_",""PAR"")","^[QUI]ADLJ(WB1,WB2,WB3,WB4,""PAR"")")
 G FIN
 
COND 
 N CONDI,COMP,COMP1,COMP2,COMP3,OPER,EXPR1,EXPR2,UN,ETOU,%LCH,ETOU,COMPT,CONTAB
 S %LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180)
 K ^V($J)
 S COND=1,ETOU="&",COMP="",COMPT=""
 S CONTAB=^[QUI]DLJCOND(WB1,WB2,WB3,WB4,WB5)
 S CD=1
LOOP S EXPR1=$P(CONTAB,"^",CD)
 G:EXPR1="" SUIT
 S ERREUR='($$EXPRESS^%DLJANAL(EXPR1,VISU,.COMP1,.MESERR))
 G:ERREUR FIN
 S OPER=$P(CONTAB,"^",CD+1)
 I OPER="" S MESERR=$$^%QZCHW("Comparateur non defini") G AFER
 S ERREUR='($$COMPAR^%DLJANAL(OPER,VISU,.RESOP,.UN,.MESERR))
 G:ERREUR FIN
 S EXPR2=$P(CONTAB,"^",CD+2)
 G:'(UN) LOOP2
 S ERREUR='($$EXPRESS^%DLJANAL(EXPR2,VISU,.COMP2,.MESERR))
 G:ERREUR FIN
 S COMP=COMP_"("_COMP1_RESOP_COMP2_")"
 G STOCOND
 
LOOP2 S ERREUR='($$TERN^%DLJANAL(COMP1,RESOP,EXPR2,VISU,.COMPT,.MESERR))
 G:ERREUR FIN
 S COMP=COMP_COMPT
 
STOCOND S ERREUR='($$ETOU^%DLJANAL($P(CONTAB,"^",CD+3),.ETOU,VISU,.MESERR))
 G:ERREUR FIN
 S COMP=COMP_ETOU
 I $L(COMP)>%LCH S MESERR=$$^%QZCHW("Chaine resultant de la compilation trop longue") G AFER
 S CD=CD+4
 G LOOP
 
SUIT 
 D GLOCOP^%QCAGLC("^V("_$J_",""PAR"")","^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5,""PAR"")")
 S ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5,"OPERATEUR")=ETOU
 S COMP=$E(COMP,1,$L(COMP)-1)
 S:COMP="" COMP=1
 S ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5)=COMP
FIN K ^V($J)
 K AEXEC,IE,IT,ITS,LEX,T,VPOL,WW,LOCA
 Q
 
AFER I VISU D ^%VZEAVT(MESERR)
 S ERREUR=1
 G FIN

