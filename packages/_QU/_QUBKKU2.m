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

;%QUBKKU2^INT^1^59547,73884^0
%QUBKKU2 ;;09:57 AM  20 Apr 1993; ; 20 Apr 93  9:58 AM
 
 
 
UCFCJ(TEMP) D UCFCSW(TEMP,"J") Q
UCFCT(TEMP) D UCFCSW(TEMP,"T") Q
UCFCC(TEMP) D UCFCSW(TEMP,"C") Q
 
UCFCSW(TEMP,SWITCH) 
 N LIS,FORM,KEMPLOI,C,%C,%COL,NBCOL,NV,NEWL,CONDIT,CFC,LIGTB1,FORM2,NBCOL,NEWL,CORR,GLODEF,NOECRAS
 S LIS=$$CONCAS^%QZCHAD(TEMP,"L"),CORR=$$CONCAS^%QZCHAD(TEMP,"C")
 S KEMPLOI=@TEMP@("ADKEMPL"),FORM=@TEMP@("ADFORM")
 S FORM2=@TEMP@("ADFORM2"),CONDIT=@TEMP@("ADCONDIT")
 S GLODEF=@TEMP@("ADGLODEF"),LIGTB1=@TEMP@("LIGCOUR")
 S LIS2=@TEMP@("FCOND",LIGTB1,"ADLIS")
 
 S REP=@TEMP@("VREP"),IND=@CORR@(LIGTB1),NBCOL=@TEMP@("VNBCOL")
 
 
 D LOADTAB^%QUBKKU
 G:SWITCH="T" FEN2C
 G:'($D(CFC(COLCOUR))) FEN2C G:CFC(COLCOUR)=Y1 FEN2C
 I SWITCH="J" D MESS^%PKUTIL(4,18,$$^%QZCHW("Vous ne pouvez pas modifier cette valeur"),1) S REAF=1,OK=0 Q
 I Y1'="" G:$$CONFIRM^%PKUTIL(4,18,60,$$^%QZCHW("Ecraser la valeur actuelle de l'attribut")_" ("_CFC(COLCOUR)_") "_$$^%QZCHW("avec la valeur saisie")_" ("_Y1_") ?")=1 FEN2C S REAF=1,OK=0 Q
 G:$$CONFIRM^%PKUTIL(4,18,60,$$^%QZCHW("Supprimer la valeur actuelle de l'attribut")_" ("_CFC(COLCOUR)_") ?")=1 FEN2C S REAF=1,OK=0 Q
FEN2C 
 S CFC(COLCOUR)=Y1
 
 I '($D(@KEMPLOI@("CFC",COLCOUR))) S REAF=0,OK=1 Q
 
 S NOECRAS=$$TEMP^%SGUTIL D CASCADE^%QUBKKAU("CFC",COLCOUR) K @(NOECRAS)
 
 G:'(MOD("CFC")) UCF2
 
 S VAL="" F CO=1:1:@CONDIT@("NBCOL") S VAL=VAL_$S($D(CFC(CO)):CFC(CO),1:"")_"^"
 S @LIS2@(1)=VAL
 
UCF2 G:'(MOD("F")) UCF3
 
 S NEWL=$$TEMP^%SGUTIL
 S NBOK=0
 F FE=1:1:@CONDIT@("NBCOND") S NBOK=NBOK+@TEMP@("VALCOND",LIGTB1,FE)
 F FE=1:1:@CONDIT@("NBCOND") S @NEWL@(FE)=$S(NBOK=0:0,'(@TEMP@("VALCOND",LIGTB1,FE)):0,NBOK=1:75,NBOK=2:35,1:(80-(4*NBOK))\NBOK)
 D MODLG^%QUBKVA(@TEMP@("FCOND",LIGTB1,"NUMSTRU"),NEWL)
 K @(NEWL)
 
UCF3 G:'(MOD("C")) UCF4
 
 S VAL=""
 F CO=1:1:NBCOL S VAL=VAL_$S($D(C(CO)):C(CO),1:"")_"^"
 S @LIS@(LIGTB1)=VAL
 D ^%QUBKVA(@TEMP@("NUMSTRU"))
 
UCF4 S OK=1,REAF=MOD("CFC")
 Q
 ;
 ;

