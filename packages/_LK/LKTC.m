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

;LKTC^INT^1^59547,74867^0
LKTC ;
 
DFS(ROOT,FCT) 
 D DFS2(1,ROOT,"","G")
 Q
DFS2(NIV,PATH,PAR,FLAG) 
 N PR,FILS,I,PATH1
 I FLAG="S" Q
 S PATH1=PATH_")"
 S @("PR="_FCT_"(NIV,PATH1,PAR,FLAG)")
 I (PR="S")!(PR="O") S FLAG=PR
 I ((PR'="F")&(FLAG'="S"))&(FLAG'="O") D FILS
 Q
FILS S FILS=$O(@PATH1@(""))
 F I=1:0 Q:((FILS="")!(FLAG="S"))!(FLAG="O")  D DFS2(NIV+1,PATH_","""_FILS_"""",FILS,.FLAG) S FILS=$O(@PATH1@(FILS))
 I FLAG="O" S FLAG="G"
 Q
VISU(NI,CHEM,PARA,FL) N R,I,VAL
 S VAL="indefinie" S:($D(@CHEM)#10)=1 VAL=@CHEM
 W !,NI," ",CHEM," ---> ",VAL,?40,"(F)rere (P)ere (O)ncle (G)o (S)top " R *R S R=$C(R) Q R
 
CONCAT(R,P) I P="" Q R
 I R["(" S R=$E(R,1,$L(R)-1)
 I R'["(" S P="("_$E(P,2,$L(P))
 Q R_P_")"
TEST K  X ^TOT D INIT,DFS("^TX(1","$$VISU") Q
INIT N G
 S G="^TX"
 S @G@(1,"ARC1")="XX"
 S @G@(1,"ARC1","P1")="XP1"
 S @G@(1,"ARC1","P2")="XP2"
 S @G@(1,"ARC1","P3")="XP3"
 S @G@(1,"ARC1","OP1","PP1")="YP11"
 S @G@(1,"ARC1","OP1","PP2")="YP12"
 S @G@(1,"ARC1","OP2","PP2")="YP21"
 S @G@(1,"ARC1","OP2","PP1")="YP22"
 S @G@(1,"ARC2")="XX"
 S @G@(1,"ARC2","P1")="XP1"
 S @G@(1,"ARC2","P2")="XP2"
 S @G@(1,"ARC2","P3")="XP3"
 S @G@(1,"ARC2","OP1","PP1")="YP11"
 S @G@(1,"ARC2","OP3","PP1")="YP31"
 S @G@(1,"ARC2","OP3","PP2")="YP31"
 S @G@(1,"ARC2","OP3","PP3")="YP31"
 S @G@(1,"ARC2","OP3","POP1","PP2")="YP31"
 S @G@(1,"ARC2","OP3","POP2","PP3")="YP31"
 Q
 ;
 ;

