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

;LKTA^INT^1^59547,74867^0
LKTA ;
 
DFS(ROOT,FCT) N I,PATH,PAR,PATH1,PR S PATH="",I=0,PR="" D DFS2 Q
DFS2 S I=I+1,PAR="PAR("_I_")",PATH=PATH_","_PAR,PATH1=ROOT_PATH_")",@PAR="",@PAR=$O(@PATH1) F J=1:0 Q:(@PAR="")!(PR="S")  D DFS1 S:PR'="P" @PAR=$O(@PATH1)
P S PATH=$E(PATH,1,$L(PATH)-$L(",PAR("_I_")")),PATH1=ROOT_PATH_")",I=I-1,PAR="PAR("_I_")"
FIN Q
DFS3 
DFS1 S @("PR="_FCT_"(I,.PAR,PATH1)")
 I PR="S" Q
 I PR="P" S @PAR=""
 I PR'="P",(($D(@PATH1)\10)=1)&(PR'="F") G DFS2
 Q
VISU(NIV,PARA,CHEMIN) N R,CHEM,I
 S VAL="indefinie",CHEM="" S:($D(@CHEMIN)#10)=1 VAL=@CHEMIN
 F I=1:1:NIV S CHEM=CHEM_","_PARA(I)
 W !,NIV,"  ",CHEM,"  --->  ",VAL,?40,"(F)rere (P)ere (O)ncle (G)o (S)top " R *R S R=$C(R) S:R="G" R=1 Q R
 
TEST K  X ^TOT
 D INIT
 S ROOT="^TX(1",PATH="",I=0
 D DFS("^TX(1","$$VISU")
 
 Q
 
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
 
DFSR(I,ROOT,PATH,FCT) N J,PAR,PATH1
 S PAR="PAR1("_I_")",PATH=PATH_","_PAR,PATH1=ROOT_PATH_")",@PAR="",@PAR=$O(@PATH1)
 F J=1:1 Q:@PAR=""  D DFSR1 S @PAR=$O(@PATH1)
 Q
DFSR1 I ($D(@PATH1)\10)=1 D DFSR(I+1,ROOT,PATH,FCT)
 S @("PR="_FCT_"(I,.PAR1,PATH1)")
 Q
TEST2 K  X ^TOT D INIT,DFSR(1,"^TX(1","","$$VISU") Q
 
XDFS(ROOT,FCT) N I,PATH,PAR,PATH1,PR S PATH="",I=0,PR="" D XDFS2 Q
XDFS2 S I=I+1,PAR="PAR("_I_")",PATH=PATH_","_PAR,PATH1=ROOT_PATH_")",@PAR="",@PAR=$O(@PATH1) F J=1:0 Q:@PAR=""  D XDFS1 S @PAR=$O(@PATH1)
 S PATH=$E(PATH,1,$L(PATH)-$L(",PAR("_I_")")),PATH1=ROOT_PATH_")",I=I-1,PAR="PAR("_I_")"
 Q
XDFS1 S @("PR="_FCT_"(I,.PAR,PATH1)")
 
 
 I PR'="P",(($D(@PATH1)\10)=1)&(PR'="F") G XDFS2
 Q
 ;
 ;

