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

;%HXICALC^INT^1^59547,73869^0
HXICALC(L,T,R,NUM,PAS,ECL,NUM2,PAS2,FT,FG,FE,PARGL,PARGLC,ABC,OPTH,ABC2,OPTH2,AR,ATE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N INDCOCOU,Q,PARGLS,BORNE,ADLIST,CARDNOCU,INDIVIDU,VALINT,VALREG,VALTOT,VALECL,IND,STOT
 N I,LL,M,SOMCOL,MOY,REP,ZZ,BASE,FIRST,TEMP,GLO1,GLO2,REPR,REPE,TOTAL,MAX
 K @(PARGL),@(PARGLC)
 S PARGLS=$E(PARGL,1,$L(PARGL)-1)
 S GL1=PARGLS_",1)"
 D ^%HXIALC1(L,T,R,NUM,PAS,GL1,FT,FG,ABC,OPTH,AR)
 I ECL'=0 S LIM1=@GL1,GL2=PARGLS_",2,INDCOCOU)" D ^%HXIALC2(L,T,ECL,NUM2,PAS2,GL1,GL2,FT,FE,ABC2,OPTH2,ATE) F INDCOCOU=1:1:LIM1 F Q=1:1:@GL2 S @PARGLC@(2,INDCOCOU,@GL2@(Q,"TEXT"))=Q
 F I=1:1:@GL1 S @PARGLC@(1,@GL1@(I,"TEXT"))=I
 K @(TEMP) Q

