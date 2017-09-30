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

;%SDESAID^INT^1^59547,73889^0
SDESAID ;
 
 
 
 
 
 
 K @(TEMPREF)
 I MOD=1 S Y1=@GLOBJ@("EL",ANCNOM,"SYNT") G AIDE
 S Y1=NOEL_$C(0)
 G @("H"_$E(TYPE,1,3))
 
HARC 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_@PRES@(3,"X")_$C(0)_@PRES@(3,"Y")_$C(0)_$C(0)_$C(0)_$C(0)
 S Y1=Y1_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+3)
 G AIDE
 
HCER 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)
 G AIDE
 
HREC 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_$C(0)_$C(0)_"""N"""_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)
 G AIDE
 
HELL 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_@PRES@(3,"X")_$C(0)_@PRES@(3,"Y")_$C(0)_$C(0)_$C(0)_$C(0)
 S Y1=Y1_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+3)
 G AIDE
 
HTEX 
 S Y1=Y1_TAILLE_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_$C(0)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)
 G AIDE
 
HDEM 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_@PRES@(3,"X")_$C(0)_@PRES@(3,"Y")_$C(0)_$C(0)_$C(0)_$C(0)
 S Y1=Y1_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+3)
 G AIDE
 
HFLE 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_EXT_$C(0)_SIMP_$C(0)_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_$C(0)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)
 G AIDE
 
HRAC 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)
 G AIDE
 
HDRO 
 S Y1=Y1_EPAIS_$C(0)_TRAIT_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_@PRES@(2,"X")_$C(0)_@PRES@(2,"Y")_$C(0)_$C(0)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+2)
 G AIDE
 
HPOI 
 S Y1=Y1_EPAIS_$C(0)_VIS_$C(0)_@PRES@(1,"X")_$C(0)_@PRES@(1,"Y")_$C(0)_"P"_($ZP(@GLOBJ@("PT","z"))+1)
 G AIDE
 
AIDE 
 I $$TABID^%INCOIN("ORDINATEUR")'="PDP" G AIDE2
 I '($D(TEXT)) S TEXT=""
 
 D MEM^%QCAMEM
 K (NOEL,TEXT,MOD,TYPE,VIS,EPAIS,EXT,SIMP,Y1,DH,ANCNOM,CPT,GLOBJ,GLTEXT,GLCOMP,TEMPO,PRES,GLAFF,GLOTYP,TEMPREF,UCONT,TEMP,NOCOMPIL,%PROVEN,POSIT,QUI,WHOIS)
 D CURRENT^%IS,VARSYS^%QCSAP
AIDE2 
 S OK=$$^%SDEDESC(MOD,TYPE,Y1,ANCNOM,GLOBJ,PRES,.NOEL,.TEXT)
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D RESTOR
 G:'(OK) FINER
 G FINOK^%SDESAIS
 
FINER 
 K:MOD=0 @GLTEXT@(CPT)
 Q 0
 
RESTOR 
 N I,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR") K @(TEMP)
 F I="NOEL","TEXT","OK" I $D(@I) S @TEMP@(I)=@I
 D RMEM^%QCAMEM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR")
 F I="NOEL","TEXT","OK" I $D(@TEMP@(I)) S @I=@TEMP@(I)
 K @(TEMP) Q

