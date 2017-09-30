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

;%SDESAIS^INT^1^59547,73889^0
SDESAIS(MOD,TYPE,PRES,CXT,GLAFF,ANCNOM,SYNT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N NOEL,TEXT,MERR,EPAIS,TRAIT,TAILLE,VIS,EXT,SIMP,CPT,Y1
 D ^%VZCDB($$^%QZCHW("Syntaxe"),0)
 
 S EPAIS=@CXT@("EPAISSEUR"),TRAIT=@CXT@("TRAIT")
 S TAILLE=@CXT@("TAILLE"),VIS=@CXT@("VIS")
 S EXT=@CXT@("EXT"),SIMP=@CXT@("SIMP")
 K @(TEMPREF),@(GLAFF)
 
 I MOD=1 S Y1=@GLTEXT@(ANCNOM) G INPUT
 
 S ANCNOM=""
 S NOEL=$ZP(@GLTEXT@("COM"))+1,@GLTEXT@(NOEL)="",CPT=NOEL
 S Y1=NOEL_" ; "_TYPE_" ; "
 G @$E(TYPE,1,3)
 
ARC 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" ) ; ( "_@PRES@(3,"X")_" ; "_@PRES@(3,"Y")_" )"
 G INPUT
 
CER 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" )"
 G INPUT
 
REC 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; ""N"" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" )"_" ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" )"
 G INPUT
 
ELL 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" ) ; ( "_@PRES@(3,"X")_" ; "_@PRES@(3,"Y")_" )"
 G INPUT
 
TEX 
 S Y1=Y1_TAILLE_" ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; "
 G INPUT
 
DEM 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" ) ; ( "_@PRES@(3,"X")_" ; "_@PRES@(3,"Y")_" )"
 G INPUT
 
FLE 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; "_EXT_" ; "_SIMP_" ; """" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" ) ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" )"
 G INPUT
 
RAC 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; "_@PRES@(1,"DROITE")_" ; P"_@PRES@(1,"PT")_" ; "_@PRES@(2,"DROITE")_" ; P"_@PRES@(2,"PT")
 G INPUT
 
DRO 
 S Y1=Y1_EPAIS_" ; "_TRAIT_" ; 1 ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" )"_" ; ( "_@PRES@(2,"X")_" ; "_@PRES@(2,"Y")_" )"
 G INPUT
 
POI 
 S Y1=Y1_"P"_($ZP(@GLOBJ@("PT","z"))+1)_" ; "_EPAIS_" ; "_VIS_" ; ( "_@PRES@(1,"X")_" ; "_@PRES@(1,"Y")_" )"
 G INPUT
 
INPUT 
 N NBL
 D AFF(Y1)
 
 S VVYH=5,VVYB=5+NBL
 
 I SYNT=0 G ANA
 D GET^%VLECFL2(Y1,2,5,0,79,.CTR,.Y1)
 G:CTR="H" HELP
 G:CTR'="" FINER
ANA 
 S OK=$$LIGNE^%SDEANT1(Y1,1,5,ANCNOM,1,0,.NOEL,.TEXT,.MERR)
 I OK=1 G FINOK
 G:SYNT=0 FINER G INPUT
 
HELP 
 G ^%SDESAID
FINER 
 K:MOD=0 @GLTEXT@(CPT)
 Q 0
 
FINOK 
 K @(TEMPREF)
 
 I MOD=0,CPT'=NOEL K @GLTEXT@(CPT)
 
FCOND S ANCNOM=NOEL
 I @GLTEXT@(NOEL)="" K @GLTEXT@(NOEL)
 Q OK
 
AFF(Y1) 
 N LIGNE
 S DX=2,DY=5
 
 S NBL=$$LIGN^%QULIMO6(Y1,76,"LIGNE")
 
 F I=1:1:NBL X XY W LIGNE(I) S DY=DY+1
 Q

