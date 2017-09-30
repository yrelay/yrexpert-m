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

;%SDEGES3^INT^1^59547,73889^0
SDEGES3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFCOND(ELEM,COND,COMPIL) 
 S @GLOBJ@("EL",ELEM,"COND")=COND
 S @GLOBJ@("EL",ELEM,"COND","COMPIL")=COMPIL
 Q
 
 
 
 
 
CONDI(ELEM) 
 N C
 I '($D(@GLOBJ@("EL",ELEM,"COND"))) Q ""
 S C=@GLOBJ@("EL",ELEM,"COND")
 Q C
 
 
 
 
 
 
 
MAJVAR(OBJ,VERS) 
 N GLO,NUMEL,VAR
 S GLO=$$DEF^%SDOCMS(OBJ,VERS)
 
 K @GLO@("IND"),@GLO@("VAR"),@GLO@("ATT")
 
 S NUMEL=""
BCEL S NUMEL=$O(@GLO@("EL",NUMEL)) I NUMEL="" Q
 
 S VAR=""
BCVA S VAR=$O(@GLO@("EL",NUMEL,"VAR",VAR)) I VAR="" G BCIN
 S @GLO@("VAR",VAR)=""
 G BCVA
 
BCIN S VAR=$O(@GLO@("EL",NUMEL,"IND",VAR)) I VAR="" G BCAT
 S @GLO@("IND",VAR)=""
 G BCIN
 
BCAT I $D(@GLO@("EL",NUMEL,"ATT")) S @GLO@("ATT")=""
 G BCEL
 ;
 ;

