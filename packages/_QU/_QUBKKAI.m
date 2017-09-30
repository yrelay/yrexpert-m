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

;%QUBKKAI^INT^1^59547,73884^0
%QUBKKAI ;;02:15 PM  20 Feb 1992;
 
 
 
 
 
 
 
DEFSTRU N %II,IIND,ADRL,IND,NBOK,NEWL,LIS2
 K @(LIS)
 S ADRL=$$ADRLT^%QSGEST7(LISTE)
 I ADRL'="" S IIND="" F LIGTB1=1:1 S IIND=$O(@ADRL@(IIND)) G:IIND="" FDEF S IND=@ADRL@(IIND) D INSIND
 S ADRL=$$ADRLIS^%QSGEST7(LISTE)
 I ADRL'="" S IND="" F LIGTB1=1:1 S IND=$O(@ADRL@(IND)) G:IND="" FDEF D INSIND
FDEF S @TEMP@("NUMSTRU")=$$^%QUBKVI(GL,LIS,TEMP)
 Q
 
INSIND S @CORR@(LIGTB1)=IND
 S @LIS@(LIGTB1)=""
 Q:@CONDIT@("NBCOND")=0
 S (LIS2,@TEMP@("FCOND",LIGTB1,"ADLIS"))=$$TEMP^%SGUTIL
 S @LIS2@(1)=""
 
 S @TEMP@("FCOND",LIGTB1,"NUMSTRU")=$$^%QUBKVI($$CONCAS^%QZCHAD(CONDIT,"DEF"),LIS2,TEMP)
 Q
 
 
 
LOAD N %II,IIND,ADRL,IND,NBOK,NEWL,KEMPLOI,FORM,FORM2,NOECRAS
 S KEMPLOI=@TEMP@("ADKEMPL"),FORM=@TEMP@("ADFORM"),FORM2=@TEMP@("ADFORM2")
 S NEWL=$$TEMP^%SGUTIL,NOECRAS=$$TEMP^%SGUTIL
 K @(LIS)
 F LIGTB1=1:1 Q:'($D(@CORR@(LIGTB1)))  S IND=@CORR@(LIGTB1) K @(NOECRAS) D AJIND
 K @(NEWL)
 Q
 
 
AJIND N C,CFC,MOD,I,COLO
 
 
 S CO="" F %CO=1:1 S CO=$O(@GLODEF@("C",CO)) Q:CO=""  S VAL=$$^%QSCALIN(REP,IND,$P(@GLODEF@("C",CO),"^",2),$P(@GLODEF@("C",CO),"^",3)) I VAL'="" S C(%CO)=VAL
 
 
 
 
 
 F FE=1:1:@CONDIT@("NBCOND") S @TEMP@("VALCOND",LIGTB1,FE)=0
 S COLO=$O(C("")) G:COLO="" SUITE
 F %I=1:1:100 S TMOD=0 D UNTOUR G:TMOD=0 SUITE
UNTOUR S COLO="" F %J=0:0 S COLO=$O(C(COLO)) Q:COLO=""  D CASCADE^%QUBKKAU("C",COLO) S TMOD=(MOD("C")+MOD("CFC"))+MOD("F")
 Q
 
SUITE 
 
 G:@CONDIT@("NBCOND")=0 SUITE2
 
 S LIS2=@TEMP@("FCOND",LIGTB1,"ADLIS") K @(LIS2)
 S VAL=""
 F CO=1:1:@CONDIT@("NBCOL") S VAL=VAL_$S($D(CFC(CO)):CFC(CO),1:"")_"^"
 S @LIS2@(1)=VAL
 
 
 S NBOK=0 F IFC=1:1:@CONDIT@("NBCOND") S NBOK=NBOK+@TEMP@("VALCOND",LIGTB1,IFC)
 K @(NEWL)
 F IFC=1:1:@CONDIT@("NBCOND") S @NEWL@(IFC)=$S(NBOK=0:0,'(@TEMP@("VALCOND",LIGTB1,IFC)):0,1:75\NBOK)
 D MODLG^%QUBKVA(@TEMP@("FCOND",LIGTB1,"NUMSTRU"),NEWL)
 
 
SUITE2 S VAL=""
 F CO=1:1:NBCOL S VAL=VAL_$S($D(C(CO)):C(CO),1:"")_"^"
 S @LIS@(LIGTB1)=VAL
 Q
 ;
 ;
 ;

