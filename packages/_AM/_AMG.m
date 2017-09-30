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

;%AMG^INT^1^59547,73865^0
%AMG ;;04:43 PM  27 Oct 1993; ; 13 Mar 93  4:14 PM
 
 K ^%vidx($I)
 N U,A,B
 S U=$$TEMP^%SGUTIL
 D INIVAR
 D INIGLOUC
 S TITRE="1"_$C(0)_"1"_$C(0)_"etudes"_$C(0)
 D ^%QULELU(GRAPHETU,"^[QUI]DEFETU",12,3,U,TITRE)
 K @(U)
 Q
ACCES(TP) 
 N ETU
 S ETU=@TP@("O")
 D JRN^%AMGA1(ETU)
 S MODG=0
 Q
 
 
ABRV(L,LG) S V=@L Q $E(V,6,$L(V))
 
 
FULL(TP) 
 N GAG,VAL S GAG=@TP@("O")
 Q GAG_"  (type "_TYPE_" valeur "_VAL_")"
 
INFO(TP) 
 Q 1_$C(0)_1_$C(0)_"etude "_$S($D(^[QUI]DEFETU(@TP@("O"),"MOTEUR")):^[QUI]DEFETU(@TP@("O"),"MOTEUR"),1:"")_$C(0)_2_$C(0)_1_$C(0)_$S($D(^[QUI]DEFETU(@TP@("O"),"CAR1")):^[QUI]DEFETU(@TP@("O"),"CAR1"),1:"")
 
 
 
INIGLOUC 
 S @U@("AUTRE",1)="ACCES^%AMG",@U@("AUTRE",1,"TXT")="etude",@U@("AUTRE",1,"COM")="acces a l'etude",@U@("AUTRE",1,"CTR")="B",@U@("AUTRE",1,"NUMUC")=1
 S @U@("AUTRE",2)="SUP^%AMG",@U@("AUTRE",2,"TXT")="suppression",@U@("AUTRE",2,"COM")="suppression"
 
 
 S @U@("INFO")="$$INFO^%AMG"
 Q
 
SUP(TP) 
 D SUPET(@TP@("O")) S (MODG,REAF)=1 Q
 
SUPET(JRN) 
 N GJOURN,GEXEC,DEFETU,GRAPHETU,ETUP,ETUF,EXPL
 D INIVAR
 K @(GJOURN),@(GEXEC)
 I $D(^[QUI]DEFETU(JRN,"pere")) S ETUP=$P(^[QUI]DEFETU(JRN,"pere"),"^"),INSTP=$P(^[QUI]DEFETU(JRN,"pere"),"^",2) K ^[QUI]DEFETU(ETUP,"fille",INSTP,1),^[QUI]GRAPHETU(ETUP,JRN)
 S ETUF="" F %E=0:0 S ETUF=$O(^[QUI]GRAPHETU(JRN,ETUF)) Q:ETUF=""  K ^[QUI]DEFETU(ETUF,"pere")
 K ^[QUI]DEFETU(JRN)
 K ^[QUI]GRAPETU(JRN)
 
 F EXPL="AFFITRANS","VALTRANS","VALCXT" K ^[QUI]RQSDON(EXPL,JRN)
 Q
 
EXIETU(JRN) Q $D(@DEFETU)
 
NOUVET() Q $$GEN^%QCAPOP("EXP")
 
INIT(JRN,MO,CAR1,CAR2,CAR3,CAR4,CAR5) 
 N DEFETU,GJOURN,GEXEC
 D INIVAR^%AMG
 S @GJOURN=0
 S @GJOURN@(0,"T")=""
 S @GJOURN@(0,"D")=CAR1_$C(0)_CAR2_$C(0)_CAR3_$C(0)_CAR4_$C(0)_CAR5
 S @GJOURN@(0)=$H_$C(0)_"TEXTE"_$C(0)_"debut de l'etude "_JRN
 S @DEFETU@("DATE")=$H
 S @DEFETU@("MOTEUR")=MO
 S @DEFETU@("CAR1")=CAR1,@DEFETU@("CAR2")=CAR2,@DEFETU@("CAR3")=CAR3,@DEFETU@("CAR4")=CAR4
 Q
 
 
 
 
 
 
 
 
 
 
CHAINER(ETUCOUR,INST,NEWMOT) 
 N ETURES,FICO,A,B
 D INIVAR^%AMG
 S JRN=ETUCOUR
 S JRN2=$$GEN^%QCAPOP("EXP")
 G LIER
 
 
 
 
 
CHAINAUTO(NEWMOT) 
 N GLOCEJ,GLOJRN,JRN,DERL,ETURES,FICO,A,B,JRN2
 D INIVAR^%AMG
 S JRN2=$$GEN^%QCAPOP("EXP")
 S JRN=$$GET^%SGVAR("JRN")
 Q:JRN="" JRN2
 S GLOCEJ=$$CONCAS^%QZCHAD("^[QUI]JOURN",JRN)
 S GLOJRN=$$CONCAS^%QZCHAD(GLOCEJ,"J")
 S INST=@GJOURN,ETUCOUR=JRN
 
LIER S:'($D(@DEFETU@("fille",INST))) @DEFETU@("fille",INST)=0
 S (FICO,@DEFETU@("fille",INST))=@DEFETU@("fille",INST)+1
 S @DEFETU@("fille",INST,FICO)=JRN2
 S @GRAPHETU@(JRN,JRN2)=""
 S JRN=JRN2
 S @DEFETU@("pere")=ETUCOUR_"^"_INST
 Q JRN2
 
 
INIVAR 
 S GJOURN="^[QUI]JOURN(JRN)"
 S GEXEC="^[QUI]EXEC(JRN)"
 S DEFETU="^[QUI]DEFETU(JRN)"
 S GRAPHETU="^[QUI]GRAPHETU"
 S MOTEUR="^[QUI]DEFETU(JRN,""MOTEUR"")"
 Q
 ;

