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

;%QWSADM^INT^1^59547,73886^0
QWSADM(DOM) 
 
 
 
 
 N C,I,LC,LT,TABC,GCOR3,PERE,FILS,VXPERE,GCOMP,GTEXT,GCODE
 S (LC,LT)=1
 S GTEXT=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""DOM"")",DOM)
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""CD"")",DOM)
 S GCODE=$$CONCAS^%QZCHAD(GCOMP,"CODE")
 S:$D(@GCOMP@("PERE")) VXPERE=@GCOMP@("PERE")
 D REAFFI
LL S TABC(1)="CONDITION",TABC(2)="PERE"
L0 D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CONDITION","PERE" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G L0
1 G FIN
6 G FIN
18 D REAFFI G LL
 
COND 
 D ^%QULIMO(0,6,80,5,$$CONCAS^%QZCHAD(GTEXT,"SOURCE"),.LC,"ADDCOND^%QWSADM","SUPCOND^%QWSADM") G LL
 
PERE 
 S Y1="" I $D(@GTEXT@("PERE")) S Y1=@GTEXT@("PERE")
 D LIRE2^%VREAD("",Y1,15,38,3,3,"","$$UCPERE^%QWSADM",.CTR,.Y1)
 I (CTR="A")!(CTR="F") G LL
 I Y1="" G PERE
 S @GTEXT@("PERE")=Y1
 G PERE
 
FIN 
 I $D(@GTEXT@("PERE")) G FINOK
 K @(GTEXT),@(GCOMP)
 Q
FINOK S PERE=@GTEXT@("PERE")
 I $D(VXPERE) K ^[QUI]RQSDON("QW","CD",VXPERE,"FILS",DOM)
 S ^[QUI]RQSDON("QW","CD",PERE,"FILS",DOM)=""
 S @GCOMP@("PERE")=PERE
 F I=2:1 Q:'($D(@GTEXT@("SOURCE",I)))  I @GTEXT@("SOURCE",I,"ET") S @GCODE@(@GTEXT@("SOURCE",I-1,"LCODE"),"AVEC")=@GTEXT@("SOURCE",I,"LCODE"),@GCODE@(@GTEXT@("SOURCE",I,"LCODE"),"LIE")=""
 Q
 
 
 
REAFFI D CLEPAG^%VVIDEO
 D AFFHEAD^%QWSADMU(DOM),FOND
 D AFFPERE
 D REAFF^%QULIMO3(1,1,$$CONCAS^%QZCHAD(GTEXT,"SOURCE"),0,6,80,4)
 Q
 
AFFPERE 
 I $D(@GTEXT@("PERE")) S DX=16,DY=4 X XY W @GTEXT@("PERE")
 Q
 
FOND 
 D CARSP^%VVIDEO(0,3,3,40,0)
 S DX=1,DY=4 X XY W $$^%QZCHW("Domaine pere")," : "
 D CARSP^%VVIDEO(0,6,5,80,0)
 S DX=29,DY=6 X XY W $$^%QZCHW("Condition")
 Q
 
 
 
ADDCOND 
 N SX,SY,RA,NEWNB,GANA,ET,VAL
 S SX=DX,SY=DY,VAL=Y1
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCODE@(RA)
 D INIT^%QWANA(SX,SY,1)
 S:'($D(@GCODE)) @GCODE=0 S (@GCODE,NEWNB)=@GCODE+1
 S GANA=$$CONCAS^%QZCHAD(GCODE,NEWNB)
 S OK=$$COND^%QWANA(.Y1,GANA,"NORMAL","ET","REAFFI^%QWSADM")
 I '(OK) S Y1=VAL K @(GANA) Q
 D AFF^%QULIMO("LCODE",NEWNB)
 D AFF^%QULIMO("ET",ET)
 Q
SUPCOND 
 N RA
 S RA=$$VAL^%QULIMO("LCODE")
 I RA'="" K @GCODE@(RA)
 S OK=1
 Q
 
UCPERE(YY1,REAF) 
 N DP,%DP,NOKH
 Q:YY1="" 1
 S NOKH=0,DP=YY1 F %DP=0:0 S:DP=DOM NOKH=1 Q:DP=DOM  Q:DP="GENERAL"  S DP=^[QUI]RQSGLO("QW","DOM",DP,"PERE")
 I NOKH D ^%VZEAVT($$^%QZCHW("Cette valeur introduirait un cycle dans les domaines")) Q 0
 Q 1
 
 
AFFI(DOM) 
 N GTEXT
 S GTEXT=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""DOM"")",DOM)
 D REAFFI Q
 
MODIF(DOM) 
 D QWSADM(DOM) Q
 
AJOUT(DOM) 
 D QWSADM(DOM) Q
 
SUPP(DOM) 
 N TYP,PERE
 S PERE=^[QUI]RQSGLO("QW","DOM",DOM,"PERE")
 K ^[QUI]RQSGLO("QW","DOM",DOM)
 K ^[QUI]RQSDON("QW","CD",DOM),^[QUI]RQSDON("QW","CD",PERE,"FILS",DOM)
 
 
 F TYP="R1","R3","R4","MC" K ^[QUI]RQSGLO("QW",TYP,DOM)
 
 F TYP="C1","C3","C4","CMC" K ^[QUI]RQSDON("QW",TYP,DOM)
 
 F TYP=1:1:4 K ^[QUI]RQSDON("QW","REM",TYP,DOM)
 
 K ^[QUI]RQSGLO("QW","ABADO",DOM)
 Q

