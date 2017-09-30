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

;%MZLIEN2^INT^1^59547,73872^0
MOZLIEN2 ;
 
 
 
 
 
 
ATTRI 
 I '($$OKR^%INCOIN("QMNF")) D CLEPAG^%VVIDEO S DX=52,DY=10 X XY D BLD^%VVIDEO W "Option non disponible .." S DX=52,DY=12 X XY W "sans le module ""G.D.L""" H 5 D NORM^%VVIDEO,CLEPAG^%VVIDEO Q
 N LIEN,REP,TABLE,TABLE2,INDICE,ATT,GLOST2
 S TABLE=$$CONCAS^%QZCHAD(TEMP,"TABLE") K @(TABLE) S TABLE2=$$CONCAS^%QZCHAD(TEMP,"TABLE2") K @(TABLE2)
 S GLOST2=^%SCRE("MOZLN2","GLOSTOC")_"("_$J_")" K @(GLOST2)
 S LIEN=RESUL(2)
 
 S REP=$$LIENI^%QSGEL3,INDLIEN=$$NOML^%QSGES20(GAM_","_IDC,RESUL(3),LIEN,RESUL(3))
 I $D(^MOZLIEN2($J,EDCL)) D REMPLIR2 G GRIL2
 
 I '($$IR^%QSGE5(REP,INDLIEN)) G GRIL2
 
 D PATOUCH^%QSGES19(.TABLE2)
 
 
 D COP^%QSCALVA(REP,INDLIEN,.TABLE)
 S ATT="" F %U=0:0 S ATT=$O(@TABLE2@(ATT)) Q:ATT=""  K @TABLE@(REP,INDLIEN,ATT)
 S ATT=""
ATTRI1 S ATT=$O(@TABLE@(REP,INDLIEN,ATT)) G GRIL2:ATT="" S VAL=""
ATTRI2 S VAL=$O(@TABLE@(REP,INDLIEN,ATT,VAL)) G ATTRI1:VAL="" S INDICE=""
ATTRI3 S INDICE=$O(@TABLE@(REP,INDLIEN,ATT,VAL,INDICE)) G ATTRI2:INDICE="" S @GLOST2@(ATT,INDICE)=VAL
 G ATTRI3
 
GRIL2 K @GLOST2@("INVERSE."_LIEN)
 X XY D NORM^%VVIDEO,REV^%VVIDEO,^%VZCDB("A T T R I B U T S    D E S    L I E N S ",1)
 D NORM^%VVIDEO,OPC^%MZEDOP(EDCL),^%VCMS("MOZLN2")
 
 K ^MOZLIEN2($J,EDCL)
 S ATT="" F %U=0:0 S ATT=$O(@GLOST2@(ATT)) Q:ATT=""  S INDICE="" F %U=0:0 S INDICE=$O(@GLOST2@(ATT,INDICE)) Q:INDICE=""  S ^MOZLIEN2($J,EDCL,INDLIEN,ATT,INDICE)=$P(@GLOST2@(ATT,INDICE),"^",1)
 
 K @(GLOST2)
 K @(TABLE),@(TABLE2)
 X XY D REV^%VVIDEO,BLD^%VVIDEO,^%VZCDB("G E S T I O N    D E S    L I E N S ",1),NORM^%VVIDEO
 Q
REMPLIR2 
 S ATT="" F %U=0:0 S ATT=$O(^MOZLIEN2($J,EDCL,INDLIEN,ATT)) Q:ATT=""  S INDICE="" F %U=0:0 S INDICE=$O(^MOZLIEN2($J,EDCL,INDLIEN,ATT,INDICE)) Q:INDICE=""  S @GLOST2@(ATT,INDICE)=^MOZLIEN2($J,EDCL,INDLIEN,ATT,INDICE)
 Q
 
 
UCIND 
 S REP=$$REPD^%QSGEL2($$OI^%MZQS,RESUL(IC-1))
 I RESUL(IC)="?" G CHOIX
 I %AJM'="A" S REFUSE=0 Q
 I $$IR^%QSGE5(REP,RESUL(IC)) S REFUSE=0 Q
 S DX=1,DY=22 X XY
 I '($$MES^%VZEOUI("Inexistant, voulez-vous l'inserer ?","N")) D EFF S REFUSE=1,TAB(IC)=$J(" ",30) D ^%VAFFICH S TAB(IC)="" D ^%VAFFICH Q
 D EFF S REFUSE=0 Q
 
CHOIX 
 N GLO,BIDON,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHOIX") K @(TEMP)
 G:%AJM="C" AJMEGC
 ;;NONDTM
 S GLO=$$LISTIND^%QSGEST6(REP)
 ;;FINNONDTM
 ;;DTM
 ;;S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 ;;D LIS2^%QSTRUC2("^[QUI]QUERY1",REP,GLO)
 ;;FINDTM
 S TABLIEN="BIDON"
 G CHOIX2
AJMEGC 
 I '($$AIR^%QSGE5($$OI^%MZQS,GAM_","_IDC,RESUL(IC-1))) D ^%VZEAVT("Il n'existe pas de lien "_RESUL(IC-1)_" pour l'operation "_GAM_","_IDC) S REFUSE=1 Q
 N TABLIEN,TYPE
 S TABLIEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABLIEN") K @(TABLIEN)
 D MVG^%QSCALVA($$OI^%MZQS,GAM_","_IDC,RESUL(1),TABLIEN,.TYPE)
 S GLO=TABLIEN
CHOIX2 D INIT2^%QUCHOIP(GLO,1,"",50,7,28,11,80),AFF^%QUCHOIP
 S RESUL(IC)=$$UN^%QUCHOIP D END^%QUCHOIP
 D CLFEN^%VVIDEO(50,7,13,28)
 S TAB(ICC)=RESUL(IC) D ^%VAFFICH S REFUSE=0
 K @(TABLIEN),@(TEMP) Q
EFF 
 S DX=1,DY=22 X XY W $J(" ",48)
 Q
INDICE 
 I %AJM'="A" S REFUSE=0 Q
 I RESUL(IC)'="" Q
 S TAB(IC)=$ZP(^MOZLIEN2(RESUL(1),"")),TAB(IC)=TAB(IC)+1,REFUSE=1 D ^%VAFFICH S REFUSE=0
 Q
AJ 
 
 N LIG,LC,TYP
 S LIG=$O(^U($J,0,EDCL)) G FIN:LIG=""
 S LC=^U($J,0,LIG),TYP=$P(LC,"^",1) G FIN:TYP'=2
 I '($D(^MOZLIEN($J,EDCL))) G FIN
 D ADR^%QCAGLC("^MOZLIEN("_$J_","_EDCL,"^MOZLIEN("_$J_","_LIG) K ^MOZLIEN($J,EDCL),^MOZLIEN($J,LIG,EDCL)
 D ADR^%QCAGLC("^MOZLIEN2("_$J_","_EDCL,"^MOZLIEN2("_$J_","_LIG) K ^MOZLIEN2($J,EDCL),^MOZLIEN2($J,LIG,EDCL)
 G FIN
SUP 
 
 G FIN:(X="")!(EDP>1)
 N LIG,LC,TYP
 S LC=^U($J,0,EDCL),TYP=$P(LC,"^",1) G FIN:TYP'=2
 S LIG=$O(^U($J,0,EDCL)) G FIN:LIG=""
 K ^MOZLIEN($J,EDCL),^MOZLIEN2($J,EDCL)
 S INTER=EDCL+((LIG-EDCL)/2) I '($D(^MOZLIEN($J,INTER))) G FIN
 D ADR^%QCAGLC("^MOZLIEN("_$J_","_INTER,"^MOZLIEN("_$J_","_EDCL) K ^MOZLIEN($J,INTER),^MOZLIEN($J,EDCL,INTER)
 D ADR^%QCAGLC("^MOZLIEN2("_$J_","_INTER,"^MOZLIEN2("_$J_","_EDCL) K ^MOZLIEN2($J,INTER),^MOZLIEN2($J,EDCL,INTER)
 G FIN
FIN Q
AFFECT S RESUL(1)=$J D FULL^%LXUC4 Q

