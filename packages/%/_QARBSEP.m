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

;%QARBSEP^INT^1^59547,73875^0
ARBSEPA(ARB,NOEUD,TAB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N D,F1,F2,MAT,NMAT,O,REG,REGM,RES
 D MSG^%VZEATT($$^%QZCHW("Separation du noeud")_" "_NOEUD)
 S MAT=@ARB@("MAT",NOEUD,"NOUVELLE")
 
 
 S REGM=0,O=""
BREG S O=$O(@GLAM@(MAT,"DIST",O)) I O="" G FREG
 S D=""
BREG2 S D=$O(@GLAM@(MAT,"DIST",O,D)) I D="" G BREG
 S REG=$$MIN(GLAM,MAT,"COL",O,D)+$$MIN(GLAM,MAT,"LIG",D,O)
 I (REGM=REG)&(REG=0) S @TAB@("REGRET")=0,RES=D_"^"_O
 
 I REG>REGM S @TAB@("REGRET")=REG,REGM=REG,RES=D_"^"_O
 
 G BREG2
FREG 
 D MSG^%VZEATT($$^%QZCHW("Chemin suivi")_" = "_RES)
 
 S F1=$ZP(@ARB@("INV",""))
 I (F1+0)=0 S F1=$ZP(@ARB@("INV",F1))
 S F1=F1+1,F2=F1+1
 S @TAB@("STO","ELEM",F2)="",@TAB@("STO","ELEM",F1)=""
 S @TAB@("STO","NOM",F2)="NON "_RES,@TAB@("STO","NOM",F1)=RES
 
 S @TAB@("STO","TYPE",F2)="INTERDIT",@TAB@("STO","TYPE",F1)="AUTORISE"
 
 D COPM^%QARBEVA(GLAM,MAT,.NMAT)
 
 S @TAB@("STO","MAT",F2,"ANCIENNE")=MAT,@TAB@("STO","MAT",F1,"ANCIENNE")=NMAT
 
 S O=$P(RES,"^",1),D=$P(RES,"^",2)
 D TUER(GLAM,NMAT,"LIG",O),TUER(GLAM,NMAT,"COL",D)
 D MAJ0^%QARBEVA(GLAM,MAT)
 
 D CIRCUIT(ARB,NOEUD,GLAM,O,D,NMAT)
 Q 1
 
MIN(GL,MAT,IND,N,DE) 
 N D,MIN,V
 S D="",MIN=10E10
BM S D=$O(@GL@(MAT,IND,N,D)) I D="" Q MIN
 I D=DE G BM
 S V=@GL@(MAT,IND,N,D)
 I V<MIN S MIN=V
 G BM
 
TUER(GL,MAT,IND,N) 
 
 N D,V
 S D=""
BT S D=$O(@GL@(MAT,IND,N,D)) I D="" K @GL@(MAT,IND,N) Q
 K @GL@(MAT,$S(IND="LIG":"COL",1:"LIG"),D,N)
 G BT
 
CIRCUIT(ARB,N,GL,O,D,MAT) 
 N ORI,PARC
 
 S PARC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PARC") K @(PARC)
 S @PARC@(O)=D
 D PARC^%QARBSEL(ARB,N,PARC)
 S ORI=""
BO S ORI=$O(@PARC@(ORI)) I ORI="" K @(PARC) Q
 D CIRC(ORI)
 G BO
CIRC(S) 
 
 N DE,DD
 S DE=S
CIR1 S DD=@PARC@(DE) I DD=S Q
 I $D(@PARC@(DD)) S DE=DD G CIR1
 I '($D(@GL@(MAT,"COL",S,DD))) Q
 S @PARC@(DD)=S
 
 I $$ALL^%QARBSEL(ARB,PARC)=0 S @GL@(MAT,"COL",S,DD)=10E10,@GL@(MAT,"LIG",DD,S)=10E10
 K @PARC@(DD)
 Q
 
 
TEST 
 G TEST^%QARBEVA

