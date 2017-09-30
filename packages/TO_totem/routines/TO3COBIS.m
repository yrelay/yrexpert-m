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
;! HL002 ! HL     ! 19/02/07 ! Manque le label YAERR                          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3COBIS^INT^1^59547,74870^0
TO3COBIS ;
 
FILS K ^INDEF($J),TCP
 Q:$D(^[QUI]TOTG("TO3PHAS1",YA,"COMPOSANT"))
 S $ZT=^TOZE($I,"C"),%LIEU=$$^%QZCHW("Composants") D ^TO3WLIEU
 S TCB="^PHASADM($I,NUFA,TWREF,""BISCP"")",NCOMP=-1,JJ=2,NTABN=$$^%QZCHW("COMPOSANTS"),NCLE=3,PNUM=2,F1=18,NFOR=1
LCP S NCOMP=$N(@TCB@(NCOMP)) G:NCOMP=-1 FCP S TCP("REFC")=@TCB@(NCOMP) G:$E(@TCB@(NCOMP),1,2)'="!!" NORM D COMP^TOINDBIS G TRA
NORM S RBIS="("_@TCB@(NCOMP)_")",COMP=$P(RBIS,"""",4),TCP("CPR")=COMP,RFNOM=@TCB@(NCOMP),TCP("IND")=""
TRA D ^TO3CEXIS D:'(EXIS) FILS2 G:%ABEND=1 FCP
 G LCP
FCP K TCP Q
FILS2 
RETERR Q:%ABEND=1  S SOURCE=RFNOM D ^TOTSDEFA("NOMENC") G:'(TSDEF) FIN S TCP("REF")=$P(RFNOM,",",2,999),TCP("COMP")=$P(TCP("REF"),"""",2),TCP("FICH")=^[QUI]REPFICH(YA,"NOMENC",TCP("REF"))
 ;HL002 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=RES1 G ROLO
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR S CONDIT=RES1 G ROLO
NOLO S COND=@("^[QUI]CNOMENC("_RFNOM_")"),@("CONDIT="_COND)
ROLO S ^PHASADM($I,NUFA,TWREF,"ANCOMP",TCP("COMP"),TCP("FICH"))=1
 G:CONDIT=0 FIN D ^TO3SIM2 G:%ABEND=1 FIN G:%SELEC=0 FIN S (RAIS,^[QUI]RAISON(NUFA,TWREF,COMP,TWRF))="^[QUI]NOMENC("_RFNOM_")",^MINIRAIS(NUFA,TWRF)=RFNOM
 S @%TBEV@("CARDNOM")=@%TBEV@("CARDNOM")+1,NEWNODE(@%TBEV@("CARDNOM"))=TWRF,$ZT=^TOZE($I,"C")
 S IN="" F %U=1:1 S IN=$O(^INDEF($J,IN)) Q:IN=""  S ^MINIRAIS(NUFA,TWRF,"IND",IN)=^INDEF($J,IN)
FIN Q
YAERR ;HL002
 W "ERREUR!!!" R *HL

