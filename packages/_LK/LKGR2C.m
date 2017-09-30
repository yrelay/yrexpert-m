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

;LKGR2C^INT^1^59547,74867^0
LKGR2C ;
 
 
 
 
 
TRAIT 
 N VAL,IKEY,KEYRS,CLEF
 S TABKEY=0 D ^%QCAGLCN(%T,"TABKEY")
 G:(TABKEY-CLFORI)<NBKEY PROBLEM
 S VAL=@%T,KEYRS=TABKEY-NBKEY
 F IKEY=TABKEY:-1:KEYRS+1 S VAL=TABKEY(IKEY)_"^"_VAL
 I KEYRS=CLFORI G SINON
 S CLEF=TABKEY(CLFORI+1) F IKEY=CLFORI+2:1:KEYRS S CLEF=CLEF_","_TABKEY(IKEY)
 S GLOAR=$$CONCAS^%QZCHAD(GLO2,CLEF_","_CPTEUR),@GLOAR=VAL
 G FINSI
SINON S GLOAR=$$CONCAS^%QZCHAD(GLO2,CPTEUR),@GLOAR=VAL
FINSI S CPTEUR=CPTEUR+1
 Q
PROBLEM 
 S @GLOPB@(CPTPB)=%T,CPTPB=CPTPB+1
 Q
 
 
 
 
 
 
 
 
 
 
 
 
TRANSF(GLO1,GLO2,GLOPB,NBKEY) 
 N CPTEUR,CPTPB,TABKEY,CLFORI
 S CLFORI=0 D ^%QCAGLCN(GLO1,"CLFORI")
 S (CPTEUR,CPTPB)=1
 D ADR^%QCAGTW(GLO1,"TRAIT^LKGR2C")
 Q
TEST 
 N GLO1,GLO2,GLOPB
 S TESTCOP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TESTCOP")
 K @(TESTCOP)
 S @TESTCOP@("ORIGINE","A","A")=11
 S @TESTCOP@("ORIGINE","A","B")=12
 S @TESTCOP@("ORIGINE","A","C")=13
 S @TESTCOP@("ORIGINE","C")=3
 S @TESTCOP@("ORIGINE","A","B","C")=123
 S GLO1=$$CONCAS^%QZCHAD(TESTCOP,"ORIGINE")
 S GLO2=$$CONCAS^%QZCHAD(TESTCOP,"ARRIVE")
 S GLOPB=$$CONCAS^%QZCHAD(TESTCOP,"PROBLEME")
 D TRANSF(GLO1,GLO2,GLOPB,2)
 Q
ENVOI 
 N GLO1,GLO2,GLOPB
 S GLO1="^[QUI]ANNR"
 S GLO2="^[QUI]LK(""LKGR"",""A1"",""D"",1)"
 S GLOPB="^[QUI]ANNR3"
 D TRANSF(GLO1,GLO2,GLOPB,2)
 Q
 ;

