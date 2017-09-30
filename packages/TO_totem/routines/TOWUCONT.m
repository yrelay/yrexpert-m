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

;TOWUCONT^INT^1^59547,74877^0
TOWUCONT ;
 
EP S REFUSE=0,%NBEP=0 G:RESUL(IC)["," EP1 G:RESUL(IC)["-" EP2
 S PCH=RESUL(IC) D TO^%QZNBN1 I (ISNUM=0)!(PCH<0) S REFUSE=1 G FINEP
 S PCH=PCH*1,PCH1=$J(PCH,1,1)*1 I PCH'=PCH1 S REFUSE=1 G FINEP
 G FINEP
EP1 F E=1:1 S PCH=$P(RESUL(IC),",",E) Q:PCH=""  D TO^%QZNBN1 S PCH=PCH*1,PCH1=$J(PCH,1,1)*1 I ((ISNUM=0)!(PCH'>0))!(PCH'=PCH1) S REFUSE=1 G FINEP
 I (E=1)&(PCH="") S REFUSE=1 G FINEP
 S %NBEP=E-1 G FINEP
EP2 S (E1,PCH)=$P(RESUL(IC),"-",1) D TO^%QZNBN1 S PCH=PCH*1,PCH1=$J(PCH,1,1)*1 I ((ISNUM=0)!(PCH'>0))!(PCH'=PCH1) S REFUSE=1 G FINEP
 S (E2,PCH)=$P(RESUL(IC),"-",2) D TO^%QZNBN1 S PCH=PCH*1,PCH1=$J(PCH,1,1)*1 I ((ISNUM=0)!(PCH'>0))!(PCH'=PCH1) S REFUSE=1 G FINEP
 I E1>E2 S REFUSE=1 G FINEP
 G FINEP
FINEP K PCH,E1,E2,E,ISNUM Q
ACCOR S REFUSE=0 I RESUL(IC)="" S REFUSE=1
 Q
DACCOR S REFUSE=0 I RESUL(IC-1)="" S REFUSE=1
 Q
EXI S REFUSE=0,LIM=IC I LIM=4,(RESUL(IC)[",")!(RESUL(IC)["-") S LIM=3
 S %TAB="^[QUI]OCGRIL(""GAMLAC""" F C=1:1:LIM Q:RESUL(C)=""  S %TAB=%TAB_","""_RESUL(C)_""""
 S %TAB=%TAB_")" I '($D(@%TAB)) S REFUSE=1
 K LIM,C,%TAB Q
ACCEPT S REFUSE=0 I (RESUL(IC-4)="")&(RESUL(IC)'="") S REFUSE=1 G FINACC
 I (RESUL(IC-4)'="")&(RESUL(IC)="") S REFUSE=1 G FINACC
FINACC Q
EPEQUI S REFUSE=0 G:RESUL(IC)["," EPEQU1 G:RESUL(IC)["-" EPEQU2 I (RESUL(IC-4)[",")!(RESUL(IC-4)["-") S REFUSE=1 G FEPEQU
 G FEPEQU
EPEQU1 I RESUL(IC-4)'["," S REFUSE=1 G FEPEQU
 F EE=1:1 S PCH=$P(RESUL(IC),",",EE) Q:PCH=""
 I (EE-1)'=%NBEP S REFUSE=1 G FEPEQU
 G FEPEQU
EPEQU2 I RESUL(IC-4)'["-" S REFUSE=1 G FEPEQU
 G FEPEQU
FEPEQU K EE Q
DELTEP S REFUSE=0 Q:RESUL(IC)'["-"  S INFS=$P(RESUL(IC-4),"-",1),SUPS=$P(RESUL(IC-4),"-",2),INFC=$P(RESUL(IC),"-",1),SUPC=$P(RESUL(IC),"-",2),DELTS=SUPS-INFS,DELTC=SUPC-INFC I DELTS'=DELTC S REFUSE=1
 K INFS,INFC,SUPS,SUPC,DELTS,DELTC Q

