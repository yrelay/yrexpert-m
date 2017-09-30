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

;%SDEANTI^INT^1^59547,73888^0
SDEANTI ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ISESS(NOM,VERS,GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO) 
 N LIB,I
 D INIT^%ANGEPIL
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 
 S I=0
 F LIB="C","P","J","L1","RESULT","L2","L3","LL1","POSIT","ERRMES","CH","SX","SY","T","NORES","%PROVEN","NOCOMPIL","ATTD","APPD","NOM","TYPE","ADRET","NOLIB","HB","PLIB" S I=I+1,@TEMPO@(I)=LIB
 F LIB="AIDE","TYPE","%COMPIL","GLOTYP","GLOBJ","GLTEXT","GLCOMP" S I=I+1,@TEMPO@(I)=LIB
 F LIB=1:1:7 S I=I+1,@TEMPO@(I)="PAR"_LIB
 D EMPV^%ANGEPIL(TEMPO)
 K @(TEMPO)
 S %PROVEN="SD",POSIT=1
 S NOCOMPIL=0,(ATTD,APPD)=0
 S ^SANAREQ($J)=0
 
 S GLOTYP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TYPE")
 S I=0
 F LIB="POINT","DROITE","CERCLE","ARC","RECTANGLE","ELLIPSE","DEMIE.ELLIPSE","FLECHE","TEXTE","RACCORDEMENT" S I=I+1,@GLOTYP@(I)=$$^%QZCHW(LIB),@GLOTYP@(I,"L")=$L(@GLOTYP@(I))
 S TEMPREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REFANA")
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE")
 
 S GLOBJ=$$DEF^%SDOCMS(NOM,VERS)
 S GLTEXT=$$TEXT^%SDOCMS(NOM,VERS)
 S GLCOMP=$$COMP^%SDOCMS(NOM,VERS)
 Q
 
 
 
 
 
 
 
 
ESESS(GLOTYP,TEMPREF) 
 K @(GLOTYP)
 K @(TEMPREF)
 K ^SANAREQ($J)
 D DEPV^%ANGEPIL
 D EPIL^%ANGEPIL
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COND(NOM,Y1,DX,DY,VISU,MERR) 
 N OK
 K ^DOC($J)
 S SX=DX,SY=DY,CH=Y1
 S MERR="",%COMPIL=""
 I VISU=1 D INIT^%AN7(SX,SY)
 I VISU=0 D INIT2^%AN7(SX,SY)
 S NORES=0,RESULT=1,P=1
 D EMPIL^%ANGEPIL("FCOND^%SDEANTI")
 G COND^%AN4
 
FCOND G:'(RESULT) ERRLIG
 D CAR
 I C'="" S MERR=$$^%QZCHW("Caracteres en trop a la fin de la ligne") G MERLIG
 S OK=1
 D CONDOK^%SDEGES2(NOM)
 D AFCOND^%SDEGES3(NOM,CH,%COMPIL)
 
FINLIG D END^%AN7,KILL^%ANA(NORES)
 K @(TEMPO),@(TEMPREF),^DOC($J)
 Q OK
 
MERLIG G:'(ERRMES) ERRLIG
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 
ERRLIG S %COMPIL="",OK=0
 G FINLIG
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q

