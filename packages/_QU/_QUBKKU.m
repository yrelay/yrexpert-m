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

;%QUBKKU^INT^1^59547,73884^0
%QUBKKU ;;10:24 AM  26 Feb 1992; ; 19 May 93  4:28 PM
 
 
 
 
 
 
 
 
UC(TEMP) 
 D UCCONF(TEMP,"T")
 Q
 
UCJ(TEMP) D UCCONF(TEMP,"J") Q
UCT(TEMP) D UCCONF(TEMP,"T") Q
UCC(TEMP) D UCCONF(TEMP,"C") Q
 
 
 
 
UCCONF(TEMP,SWITCH) 
 N LIS,FORM,KEMPLOI,C,%C,%COL,NBCOL,NV,NEWL,CONDIT,LIS2,CFC,FORM2,MOD,CORR,GLODEF,NOECRAS
 S LIS=$$CONCAS^%QZCHAD(TEMP,"L"),CORR=$$CONCAS^%QZCHAD(TEMP,"C")
 S KEMPLOI=@TEMP@("ADKEMPL"),CONDIT=@TEMP@("ADCONDIT")
 S FORM=@TEMP@("ADFORM"),FORM2=@TEMP@("ADFORM2")
 I @CONDIT@("NBCOND")'=0 S LIS2=@TEMP@("FCOND",LIGCOUR,"ADLIS")
 S GLODEF=@TEMP@("ADGLODEF")
 S LIGTB1=LIGCOUR
 S REP=@TEMP@("VREP"),IND=@CORR@(LIGCOUR),NBCOL=@TEMP@("VNBCOL")
 G:Y1="?" PTING
 
 D LOADTAB
 G:SWITCH="T" PLO
 G:'($D(C(COLCOUR))) PLO G:C(COLCOUR)=Y1 PLO
 I SWITCH="J" D MESS^%PKUTIL(4,18,$$^%QZCHW("Vous ne pouvez pas modifier cette valeur"),1) S REAF=1,OK=0 Q
 I Y1'="" G:$$CONFIRM^%PKUTIL(4,18,60,$$^%QZCHW("Ecraser la valeur actuelle de l'attribut")_" ("_C(COLCOUR)_") "_$$^%QZCHW("avec la valeur saisie")_" ("_Y1_") ?")=1 PLO S REAF=1,OK=0 Q
 G:$$CONFIRM^%PKUTIL(4,18,60,$$^%QZCHW("Supprimer la valeur actuelle de l'attribut")_" ("_C(COLCOUR)_") ?")=1 PLO S REAF=1,OK=0 Q
PLO 
 
 I '($D(@KEMPLOI@("C",COLCOUR))) S REAF=0,OK=1 Q
 S C(COLCOUR)=Y1
 
 S NOECRAS=$$TEMP^%SGUTIL D CASCADE^%QUBKKAU("C",COLCOUR) K @(NOECRAS)
 
 
 G:'(MOD("CFC")) UC2
 
 S VAL="" F CO=1:1:@CONDIT@("NBCOL") S VAL=VAL_$S($D(CFC(CO)):CFC(CO),1:"")_"^"
 S @LIS2@(1)=VAL
 
UC2 G:'(MOD("F")) UC3
 
 S NBOK=0,NEWL=$$TEMP^%SGUTIL
 F FE=1:1:@CONDIT@("NBCOND") S NBOK=NBOK+@TEMP@("VALCOND",LIGCOUR,FE)
 F FE=1:1:@CONDIT@("NBCOND") S @NEWL@(FE)=$S(NBOK=0:0,'(@TEMP@("VALCOND",LIGCOUR,FE)):0,NBOK=1:75,NBOK=2:35,1:(80-(4*NBOK))\NBOK)
 D MODLG^%QUBKVA(@TEMP@("FCOND",LIGCOUR,"NUMSTRU"),NEWL)
 K @(NEWL)
UC3 G:'(MOD("CFC")) UC4
 D ^%QUBKVA(@TEMP@("FCOND",LIGCOUR,"NUMSTRU"))
UC4 G:'(MOD("C")) UC5
 
 S VAL="" F CO=1:1:NBCOL S VAL=VAL_$S($D(C(CO)):C(CO),1:"")_"^"
 S @LIS@(LIGCOUR)=VAL
UC5 S OK=1,REAF=MOD("C")
 Q
 
PTING D CLEPAG^%VVIDEO
 D MEMX^%QCAMEM
 D ^%QSATTRI(IND,REP,2,2,70,20)
 D CLEPAG^%VVIDEO
 K  D RMEMX^%QCAMEM
 S OK=0,REAF=1 Q
 
 
 
UCFC(TEMP) 
 D UCFCSW^%QUBKKU2(TEMP,"T")
 Q
 
 
 
LOADTAB N %COL,FE,VAL
 F %COL=1:1:NBCOL I $P(@LIS@(LIGTB1),"^",%COL)'="" S C(%COL)=$P(@LIS@(LIGTB1),"^",%COL)
 F FE=1:1:@CONDIT@("NBCOND") I @TEMP@("VALCOND",LIGTB1,FE) F %COL=@CONDIT@("DEF","FEN",FE,"D"):1:@CONDIT@("DEF","FEN",FE,"F") S VAL=$P(@LIS2@(1),"^",%COL) I VAL'="" S CFC(%COL)=VAL
 Q
 
 
CTRB(TEMP) 
 N R,LIS,CORR,GLODEF,REP,LISTE,VALAF,FRM,%I,%J
 S LIS=$$CONCAS^%QZCHAD(TEMP,"L")
 S CORR=$$CONCAS^%QZCHAD(TEMP,"C")
 S GLODEF=@TEMP@("ADGLODEF")
 S REP=@TEMP@("VREP"),LISTE=@TEMP@("VLISTE")
 S VALAF(1)=$$^%QZCHW("colonne")_" "_COLCOUR
 S %J=$L(VALAF(1)) F %I=%J:1:70 S VALAF(1)=VALAF(1)_" "
 S VALAF(2)=$$^%QZCHW("attribut")_" "_$P(@GLODEF@("C",COLCOUR),"^",2)
 S VALAF(3)=$S($P(@GLODEF@("C",COLCOUR),"^",3)="":"",1:" "_$$^%QZCHW("indice")_" "_$P(@GLODEF@("C",COLCOUR),"^",3))
 S FRM=$P(@GLODEF@("C",COLCOUR),"^",5)
 S VALAF(4)=$S(FRM="":"",1:$$^%QZCHW("formule")_" "_$E(FRM,1,70))
 S FRM=$E(FRM,71,140)
 I FRM'="" S VALAF(5)=FRM
 S R=$$NUM^%PKCHOIX("VALAF",5,5,8,"",70)
 S REAF=1
 Q
 
CTRBCC(TEMP) 
 N R,LIS,CORR,GLODEF,REP,LISTE,VALAF,FRM,%I,%J
 S LIS=$$CONCAS^%QZCHAD(TEMP,"L")
 S CORR=$$CONCAS^%QZCHAD(TEMP,"CC")
 S GLODEF=@TEMP@("ADGLODEF")
 S REP=@TEMP@("VREP"),LISTE=@TEMP@("VLISTE")
 S VALAF(1)=$$^%QZCHW("colonne")_" "_COLCOUR
 S %J=$L(VALAF(1)) F %I=%J:1:70 S VALAF(1)=VALAF(1)_" "
 S VALAF(2)=$$^%QZCHW("attribut")_" "_$P(@GLODEF@("CC",COLCOUR),"^",3)
 S VALAF(3)=$S($P(@GLODEF@("CC",COLCOUR),"^",4)="":"",1:" "_$$^%QZCHW("indice")_" "_$P(@GLODEF@("CC",COLCOUR),"^",4))
 S FRM=$P(@GLODEF@("CC",COLCOUR),"^",6)
 S VALAF(4)=$S(FRM="":"",1:$$^%QZCHW("formule")_" "_$E(FRM,1,70))
 S FRM=$E(FRM,71,140)
 I FRM'="" S VALAF(5)=FRM
 S R=$$NUM^%PKCHOIX("VALAF",5,14,5,"",70)
 S REAF=1
 Q
 
 
NOWAY(TEMP) S (OK,REAF)=0 Q
 ;

