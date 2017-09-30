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

;%QWSAR3^INT^1^59547,73886^0
QWSAR3(DOM,REG) 
 
 
 
 
 N C,I,LC,LT,TABC,GCOR3
 S (LC,LT)=1
 S GCOR3=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C3"")",DOM)
 S GCOR3=$$CONCAS^%QZCHAD(GCOR3,REG)
 G 18
LL S TABC(1)="CONDITION",TABC(2)="ACTION",TABC(3)="REAPPLICABILITE"
L0 D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CONDITION","ACTION","REAPPLICABILITE" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G L0
1 G FIN
6 G FIN
18 D REAFFI G LL
 
COND 
 D ^%QULIMO(0,6,80,5,"^[QUI]RQSGLO(""QW"",""R3"","""_DOM_""","""_REG_""",1)",.LC,"ADDCOND^%QWSAR3","SUPCOND^%QWSAR3") G LL
 
ACTI 
 D ^%QULIMO(0,11,80,12,"^[QUI]RQSGLO(""QW"",""R3"","""_DOM_""","""_REG_""",2)",.LT,"ADDACTI^%QWSAR3","SUPACTI^%QWSAR3")
 G LL
 
REAP 
 D AFFBIS
 S Y1="N"
 I $D(^[QUI]RQSGLO("QW","R3",DOM,REG,"REAP")) S Y1=^[QUI]RQSGLO("QW","R3",DOM,REG,"REAP")
 D LIRE2^%VREAD("",Y1,54,57,3,3,"","$$UCREAP^%QWSAR3",.CTR,.Y1)
 I CTR="A" G LL
 S ^[QUI]RQSGLO("QW","R3",DOM,REG,"REAP")=Y1
 G L0
 
UCREAP(YY1,REAF) 
 I (YY1="O")!(YY1="N") Q 1
 Q 0
 
FIN 
 S @GCOR3@("S")=1
 N GLO
 S GLO=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""R3"")",DOM)
 I $D(@GLO@(REG,"REAP")),@GLO@(REG,"REAP")="O" S @GCOR3@("S")=0
 F I=2:1 Q:'($D(@GLO@(REG,1,I)))  I @GLO@(REG,1,I,"ET") S @GCOR3@("P",@GLO@(REG,1,I-1,"LCODE"),"AVEC")=@GLO@(REG,1,I,"LCODE"),@GCOR3@("P",@GLO@(REG,1,I,"LCODE"),"LIE")=""
 Q
 
REAFFI D CLEPAG^%VVIDEO
 D AFFHEAD^%QWSARGU(DOM,REG),FOND,AFFBIS
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""R3"","""_DOM_""","""_REG_""",1)",0,6,80,4)
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""R3"","""_DOM_""","""_REG_""",2)",0,11,80,8)
 Q
 
ADDCOND 
 N SX,SY,RA,NEWNB,GANA,ET,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR3@("P",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOR3@("P"),NEWNB)=@GCOR3@("P")+1
 S GANA=$$CONCAS^%QZCHAD(GCOR3,"P,"_NEWNB)
 S OK=$$COND^%QWANA(.Y1,GANA,"NORMAL","ET","REAFFI^%QWSAR3")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 D AFF^%QULIMO("ET",ET)
 Q
SUPCOND 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR3@("P",RA)
 S OK=1
 Q
 
ADDACTI 
 N SX,SY,RA,NEWNB,GANA,VAL
 S SX=DX,SY=DY
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR3@("R",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOR3@("R"),NEWNB)=@GCOR3@("R")+1
 S GANA=$$CONCAS^%QZCHAD(GCOR3,"R,"_NEWNB)
 S VAL=Y1
 S OK=$$AFFEC^%QWANA(.Y1,GANA,"REAFFI^%QWSAR3")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 Q
 
SUPACTI 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR3@("R",RA)
 S OK=1
 Q
 
FOND D CARSP^%VVIDEO(0,6,5,80,0)
 S DX=29,DY=6 X XY W $$^%QZCHW("Condition")
 D CARSP^%VVIDEO(0,11,12,80,0)
 S DX=29,DY=11 X XY W $$^%QZCHW("Action")
 Q
 
AFFBIS 
 D CARSP^%VVIDEO(40,3,3,40,0)
 S DX=41,DY=4 X XY W $$^%QZCHW("Repetable")," ? :"
 I $D(^[QUI]RQSGLO("QW","R3",DOM,REG,"REAP")) S DX=55 X XY W ^[QUI]RQSGLO("QW","R3",DOM,REG,"REAP")
 Q
 
 
AFFI(DOM,REG) 
 I '($D(^[QUI]RQSGLO("QW","R3",DOM,REG))) Q
 D REAFFI
 Q
 
AJOUT(DOM,REG) 
 S ^[QUI]RQSGLO("QW","R3",DOM,REG)=""
 I '($D(^[QUI]RQSDON("QW","C3",DOM,REG,"P"))) S ^[QUI]RQSDON("QW","C3",DOM,REG,"P")=0
 I '($D(^[QUI]RQSDON("QW","C3",DOM,REG,"R"))) S ^[QUI]RQSDON("QW","C3",DOM,REG,"R")=0
 D QWSAR3(DOM,REG)
 Q
 
MODIF(DOM,REG) 
 I '($D(^[QUI]RQSGLO("QW","R3",DOM,REG))) Q
 D QWSAR3(DOM,REG)
 Q
 
SUPP(DOM,REG) 
 I '($D(^[QUI]RQSGLO("QW","R3",DOM,REG))) Q
 K ^[QUI]RQSGLO("QW","R3",DOM,REG)
 K ^[QUI]RQSDON("QW","C3",DOM,REG)
 
 K ^[QUI]RQSDON("QW","REM",3,DOM,REG)
 Q

