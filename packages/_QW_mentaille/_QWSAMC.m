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

;%QWSAMC^INT^1^59547,73886^0
QWSAMC(DOM,REG) 
 
 
 
 
 N C,I,LC,LA,LCE,TABC,GCOMP,BASAT
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""CMC"")",DOM)
 S GCOMP=$$CONCAS^%QZCHAD(GCOMP,REG)
 S GTEXT=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""MC"")",DOM)
 S GTEXT=$$CONCAS^%QZCHAD(GTEXT,REG)
 S TABC(1)="CONDITION",TABC(3)="ACTION",TABC(2)="ETAT"
 S (LC,LA,LCE)=1
 G 18
L0 D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CONDITION","ACTION","ETAT" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G L0
1 G FIN
6 G FIN
18 D REAFFI G L0
 
COND 
 D ^%QULIMO(0,6,80,6,$$CONCAS^%QZCHAD(GTEXT,1),.LC,"ADDCOND^%QWSAMC","SUPCOND^%QWSAMC") G L0
 
ETAT 
 D ^%QULIMO(0,12,80,5,$$CONCAS^%QZCHAD(GTEXT,2),.LCE,"ADDETAT^%QWSAMC","SUPETAT^%QWSAMC") G L0
 
ACTI 
 D ^%QULIMO(0,17,80,6,$$CONCAS^%QZCHAD(GTEXT,3),.LA,"ADDACTI^%QWSAMC","SUPACTI^%QWSAMC") G L0
 
FIN 
 F I=2:1 Q:'($D(@GTEXT@(1,I)))  I @GTEXT@(1,I,"ET") S @GCOMP@("P",@GTEXT@(1,I-1,"LCODE"),"AVEC")=@GTEXT@(1,I,"LCODE"),@GCOMP@("P",@GTEXT@(1,I,"LCODE"),"LIE")=""
 S BASAT=0
 S I="" F %I=1:1 S I=$O(@GCOMP@("PM",I)) Q:I=""  I $D(@GCOMP@("PM",I,"A","NORULE")) S BASAT=1 Q
 S:BASAT @GCOMP@("T")="NORULE"
 S:'(BASAT) @GCOMP@("T")=""
 Q
 
REAFFI D CLEPAG^%VVIDEO
 D AFFHEAD^%QWSARGU(DOM,REG),FOND
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""MC"","""_DOM_""","""_REG_""",1)",0,6,80,6)
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""MC"","""_DOM_""","""_REG_""",2)",0,12,80,5)
 D REAFF^%QULIMO3(1,1,"^[QUI]RQSGLO(""QW"",""MC"","""_DOM_""","""_REG_""",3)",0,17,80,6)
 Q
 
FOND D CARSP^%VVIDEO(0,6,6,80,0)
 S DX=29,DY=6 X XY W $$^%QZCHW("Conditions")
 D CARSP^%VVIDEO(0,12,5,80,0)
 S DX=29,DY=12 X XY W $$^%QZCHW("Etat des variables systemes")
 D CARSP^%VVIDEO(0,17,6,80,0)
 S DX=29,DY=17 X XY W $$^%QZCHW("Actions")
 Q
 
 
 
ADDCOND 
 N SX,SY,RA,NEWNB,GANA,ET,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("P",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOMP@("P"),NEWNB)=@GCOMP@("P")+1
 S GANA=$$CONCAS^%QZCHAD(GCOMP,"P,"_NEWNB)
 S OK=$$COND^%QWANA(.Y1,GANA,"NORMAL","ET","REAFFI^%QWSAMC")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 D AFF^%QULIMO("ET",ET)
 Q
SUPCOND 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("P",RA)
 S OK=1 Q
 
ADDACTI 
 N SX,SY,RA,NEWNB,GANA
 S SX=DX,SY=DY
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("R",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOMP@("R"),NEWNB)=@GCOMP@("R")+1
 S GANA=$$CONCAS^%QZCHAD(GCOMP,"R,"_NEWNB)
 S OK=$$VERBE^%QWANA(Y1,GANA)
 I '(OK) K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 Q
SUPACTI 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("R",RA)
 S OK=1 Q
 
ADDETAT 
 N SX,SY,RA,NEWNB,GANA,ET,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("PM",RA)
 D INIT^%QWANA(SX,SY,1)
 S (@GCOMP@("PM"),NEWNB)=@GCOMP@("PM")+1
 S GANA=$$CONCAS^%QZCHAD(GCOMP,"PM,"_NEWNB)
 S OK=$$COND^%QWANA(.Y1,GANA,"META","ET","REAFFI^%QWSAMC")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 D AFF^%QULIMO("ET",ET)
 Q
SUPETAT 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCOMP@("PM",RA)
 S OK=1 Q
 
 
 
AFFI(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","MC",DOM,REG)))
 D REAFFI
 Q
 
AJOUT(DOM,REG) 
 I '($D(^[QUI]RQSGLO("QW","MC",DOM,REG))) S (^[QUI]RQSDON("QW","CMC",DOM,REG,"P"),^[QUI]RQSDON("QW","CMC",DOM,REG,"R"),^[QUI]RQSDON("QW","CMC",DOM,REG,"PM"))=0
 D QWSAMC(DOM,REG)
 Q
 
MODIF(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","MC",DOM,REG)))
 D QWSAMC(DOM,REG)
 Q
 
SUPP(DOM,REG) 
 Q:'($D(^[QUI]RQSGLO("QW","MC",DOM,REG)))
 K ^[QUI]RQSDON("QW","CMC",DOM,REG)
 K ^[QUI]RQSGLO("QW","MC",DOM,REG)
 Q

