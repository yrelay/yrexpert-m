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

;LKTE^INT^1^59547,74867^0
LKTE ;
DFS(ROOT,FCT) 
 D DFS2(1,ROOT,"","","G")
 Q
DFS2(NIV,ROOT,PATH,X,FLAG) 
 N I,PR,PATH1
 S X="X("_NIV_")",PATH=X,PATH1=$$CONCAS^%QZCHAD(ROOT,PATH),PR=FLAG
 S @X=""
DEB S @X=$O(@PATH1)
 F I=1:0 Q:$D(@PATH1)<9  D D1 G:PR="S" FIN Q:(PR="F")!(PR="O")  S NIV=NIV+1,X="X("_NIV_")",PATH=PATH_","_X,PATH1=ROOT_PATH_")",@X="",@X=$O(@PATH1)
 S:PR="F" @X=$O(@PATH1) G:PR="O" O
 F I=1:0 Q:@X=""  D D1 G:PR="S" FIN Q:PR="O"  S @X=$O(@PATH1)
O S NIV=NIV-1,X="X("_NIV_")",PATH=$E(PATH,1,($L(PATH)-$L(X))-1),PATH1=ROOT_PATH_")"
 F I=1:0 Q:(NIV=0)!($O(@PATH1)'="")  S NIV=NIV-1,X="X("_NIV_")",PATH=$E(PATH,1,($L(PATH)-$L(X))-1),PATH1=ROOT_PATH_")"
 Q:NIV=1
 G DEB
FIN Q
D1 S @("PR="_FCT_"(NIV,PATH1,.X,.FLAG)") Q
 
VISU(NI,CHEM,PARA,FL) N R,I,VAL,P
 S VAL="indefinie" S:($D(@CHEM)#10)=1 VAL=@CHEM S P=""
 F I=1:1:NIV S P=P_","_PARA(I)
 W !,NI," ",P," ---> ",VAL,?40,"(F)rere (P)ere (O)ncle (G)o (S)top " R *R S R=$C(R) Q R
 
COMPTE(NI,CHEM,PARA,FL) S XX=$$^%QCAZG("XX")+1 Q "G"
 
TEST K  X ^TOT D INIT,DFS("^TX(1)","$$VISU") Q
TEST2 K  X ^AST D DFS("^[QUI]GRUPLET","$$COMPTE") Q
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

