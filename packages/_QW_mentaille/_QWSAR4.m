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

;%QWSAR4^INT^1^59547,73886^0
QWSAR4(DOM,REG) 
 
 
 
 
 N C,CTR,I,LC,LT,TABC,GCOR4,GTEXT,Y1
 S (LC,LT)=1
 S GCOR4=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C4"")",DOM)
 S GCOR4=$$CONCAS^%QZCHAD(GCOR4,REG)
 S GTEXT=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""R4"")",DOM)
 S GTEXT=$$CONCAS^%QZCHAD(GTEXT,REG)
 S TABC(1)="CARACTERISTIQUES",TABC(2)="CONDITION",TABC(3)="CIBLE",TABC(4)="LIEN"
 G 18
L0 D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CARACTERISTIQUES","CONDITION","CIBLE","LIEN" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G L0
 
1 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de la regle")_" ? ")=1 D SUPP(DOM,REG) Q
 G L0
 
6 I ('($D(@GTEXT@("INDI"))))!('($D(@GTEXT@("LIEN")))) D ^%VZEAVT($$^%QZCHW("Le nom de l'individu cible et celui du lien sont indispensables")) G L0
 S @GCOR4@("L")=@GTEXT@("LIEN")
 I '($D(@GTEXT@("ORDRE"))) S @GCOR4@("O","E")=@GCOR4@("I","E")
 F I=2:1 Q:'($D(@GTEXT@(1,I)))  I @GTEXT@(1,I,"ET") S @GCOR4@("P",@GTEXT@(1,I-1,"LCODE"),"AVEC")=@GTEXT@(1,I,"LCODE"),@GCOR4@("P",@GTEXT@(1,I,"LCODE"),"LIE")=""
 Q
18 D REAFFI G L0
 
COND 
 D ^%QULIMO(0,9,80,5,$$CONCAS^%QZCHAD(GTEXT,1),.LC,"ADDCOND^%QWSAR4","SUPCOND^%QWSAR4") G L0
 
LIEN 
 D ^%QULIMO(0,14,80,4,$$CONCAS^%QZCHAD(GTEXT,2),.LT,"ADDACTI^%QWSAR4","SUPACTI^%QWSAR4") G L0
 
CIBL 
 D ^%QULIMO(0,18,80,4,$$CONCAS^%QZCHAD(GTEXT,3),.LT,"ADDACTL^%QWSAR4","SUPACTL^%QWSAR4") G L0
 
CARA 
 S Y1=""
 I $D(@GTEXT@("LIEN")) S Y1=@GTEXT@("LIEN")
 D LIRE2^%VREAD("",Y1,15,78,4,4,"","",.CTR,.Y1)
 I (CTR="A")!(CTR="F") G L0
 S @GTEXT@("LIEN")=Y1
 S Y1=""
 I $D(@GTEXT@("INDI")) S Y1=@GTEXT@("INDI")
 D LIRE2^%VREAD("",Y1,25,78,5,5,"","$$UCIND^%QWSAR4",.CTR,.Y1)
 I (CTR="A")!(CTR="F") G L0
 S @GTEXT@("INDI")=Y1
 S Y1=""
 S:$D(@GTEXT@("ORDRE")) Y1=@GTEXT@("ORDRE")
 D LIRE2^%VREAD("",Y1,19,78,6,6,"","$$UCORD^%QWSAR4",.CTR,.Y1)
 I (CTR="A")!(CTR="F") G L0
 S @GTEXT@("ORDRE")=Y1
 G L0
 
 
REAFFI D CLEPAG^%VVIDEO
 D AFFHEAD^%QWSARGU(DOM,REG)
 D FOND,AFFLIEN,AFFINDI,AFFORD
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""R4"","""_DOM_""","""_REG_""",1)",0,9,80,5)
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""R4"","""_DOM_""","""_REG_""",2)",0,14,80,4)
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""R4"","""_DOM_""","""_REG_""",3)",0,18,80,4)
 Q
 
FOND D CARSP^%VVIDEO(0,4,5,80,0)
 S DX=29,DY=4 X XY W $$^%QZCHW("Caracteristiques")
 S DX=2,DY=5 X XY W $$^%QZCHW("Nom du lien")," :"
 S DX=2,DY=6 X XY W $$^%QZCHW("Nom de l'individu lie")," :"
 S DX=2,DY=7 X XY W $$^%QZCHW("Numero d'ordre")," :"
 D CARSP^%VVIDEO(0,9,5,80,0)
 S DX=29,DY=9 X XY W $$^%QZCHW("Conditions")
 D CARSP^%VVIDEO(0,14,4,80,0)
 S DX=29,DY=14 X XY W $$^%QZCHW("Actions sur le lien")
 D CARSP^%VVIDEO(0,18,4,80,0)
 S DX=29,DY=18 X XY W $$^%QZCHW("Actions sur l'individu cible")
 Q
 
AFFLIEN 
 I $D(^[QUI]RQSGLO("QW","R4",DOM,REG,"LIEN")) S DX=16,DY=5 X XY W ^[QUI]RQSGLO("QW","R4",DOM,REG,"LIEN")
 Q
AFFINDI 
 I $D(^[QUI]RQSGLO("QW","R4",DOM,REG,"INDI")) S DX=26,DY=6 X XY W ^[QUI]RQSGLO("QW","R4",DOM,REG,"INDI")
 Q
AFFORD I $D(^[QUI]RQSGLO("QW","R4",DOM,REG,"ORDRE")) S DX=19,DY=7 X XY W ^[QUI]RQSGLO("QW","R4",DOM,REG,"ORDRE")
 Q
 
 
AFFI(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","R4",DOM,REG)))
 D REAFFI
 Q
 
AJOUT(DOM,REG) 
 I '($D(^[QUI]RQSGLO("QW","R4",DOM,REG))) S (^[QUI]RQSDON("QW","C4",DOM,REG,"P"),^[QUI]RQSDON("QW","C4",DOM,REG,"R"),^[QUI]RQSDON("QW","C4",DOM,REG,"RL"))=0
 D QWSAR4(DOM,REG)
 Q
 
MODIF(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","R4",DOM,REG)))
 D QWSAR4(DOM,REG)
 Q
 
SUPP(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","R4",DOM,REG)))
 K ^[QUI]RQSDON("QW","C4",DOM,REG)
 K ^[QUI]RQSGLO("QW","R4",DOM,REG)
 
 K ^[QUI]RQSDON("QW","REM",4,DOM,REG)
 Q
 
 
UCIND(YY1,REAF) 
 S SX=DX,SY=DY,GANA=$$CONCAS^%QZCHAD(GCOR4,"I")
 D INIT^%QWANA(SX,SY,1)
 S RES=$$EXPR^%QWANA(.YY1,GANA,"REAFFI^%QWSAR4")
 Q RES
 
UCORD(YY1,REAF) 
 S SX=DX,SY=DY,GANA=$$CONCAS^%QZCHAD(GCOR4,"O")
 D INIT^%QWANA(SX,SY,1)
 S RES=$$EXPR^%QWANA(.YY1,GANA,"REAFFI^%QWSAR4")
 Q RES
 
ADDCOND 
 N SX,SY,RA,NEWNB,GANA,ET,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR4@("P",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOR4@("P"),NEWNB)=@GCOR4@("P")+1
 S GANA=$$CONCAS^%QZCHAD(GCOR4,"P,"_NEWNB)
 S OK=$$COND^%QWANA(.Y1,GANA,"NORMAL","ET","REAFFI^%QWSAR4")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 D AFF^%QULIMO("ET",ET)
 Q
 
SUPCOND 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR4@("P",RA)
 S OK=1 Q
 
ADDACTI 
 D ADDA("R") Q
ADDACTL 
 D ADDA("RL") Q
ADDA(TYPACT) 
 N SX,SY,RA,NEWNB,GANA,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR4@(TYPACT,RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOR4@(TYPACT),NEWNB)=@GCOR4@(TYPACT)+1
 S GANA=$$CONCAS^%QZCHAD(GCOR4,TYPACT_","_NEWNB)
 S OK=$$AFFEC^%QWANA(.Y1,GANA,"REAFFI^%QWSAR4")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 Q
SUPACTI 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR4@("R",RA)
 S OK=1 Q
 
SUPACTL 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOR4@("RL",RA)
 S OK=1 Q

