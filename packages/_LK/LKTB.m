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

;LKTB^INT^1^59547,74867^0
LKTB ;
BFS(ROOT,FCT) N J,PATH1,PAR,K,DEB,PATH,FILS,PREP
 S DEB=0,K=1,PATH(DEB)=ROOT
 S PATH1=PATH(DEB)_",PAR)",PAR="",PAR=$O(@PATH1)
 F I=1:1 Q:DEB=K  D B1 S PAR=$O(@PATH1)
 Q
B1 S PATH=PATH(DEB),PATH1=PATH_")" K PATH(DEB) S DEB=DEB+1
 I ($D(@PATH1)#10)=1 S @("PREP="_FCT_"(PAR,PATH1,"""_@PATH1_""")")
 I ($D(@PATH1)\10)=1 D STO
 Q
STO S FILS=$O(@(PATH_","""")"))
 F J=1:1 Q:FILS=""  S PATH(K)=PATH_","""_FILS_"""",K=K+1,FILS=$O(@(PATH_",FILS)"))
 Q
VISU(PARA,CHEMIN,VAL) W !,CHEMIN,"  --->  ",VAL Q 1
TEST K  X ^TOT
 D INIT
 D BFS("^TX(1","$$VISU")
 Q
INIT S G="^TX"
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
 ;

