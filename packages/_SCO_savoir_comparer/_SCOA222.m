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

;%SCOA222^INT^1^59547,73887^0
SCOA2 ;
 
 
 
 
 
 
 
MALUS(D,MALUS) 
 
 
 I $D(@LMALUS@(D)) Q
 N REG,AT,OR,V1,V2,I,J S J=0
 G:D="" FMALUS
 S REG="^[QUI]SCOMPREG"
 
 S AT="" F I=0:0 S AT=$O(@REG@(D,AT)) Q:AT=""  S OR="" F I=0:0 S OR=$O(@REG@(D,AT,OR)) Q:OR=""  S V1="" F I=0:0 S V1=$O(@REG@(D,AT,OR,V1)) Q:V1=""  S V2="" F I=0:0 S V2=$O(@REG@(D,AT,OR,V1,V2)) Q:V2=""  D AFFECTM
 S @LMALUS@(D)=J
FMALUS 
 Q
AFFECTM 
 S M=@REG@(D,AT,OR,V1,V2,"MALUS")
 S @LMALUS@(D,M,AT,OR,V1,V2)=""
 S J=J+1
 Q
 
BONUS 
 S ^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"MALUS")=^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"MALUS")-5E-1
 Q
 
 
 
 
 
 
 
 
 
 
EMPIL(NIV,CONTEXT) 
 N I
 I '($D(@CONTEXT)) S @CONTEXT=0
 S @CONTEXT=@CONTEXT+1
 F I="DOM","AT","OR","V1","V2","MALUS","LDOM","FIRST","NBREG","ACCOR","DESACOR" S @CONTEXT@(@CONTEXT,I)=@I
 S NIV=@CONTEXT
 Q
 
DEPIL(VIDE,CONTEXT) 
 N NIV,VAR
 S NIV=@CONTEXT I NIV=0 S VIDE=1 Q
 S VAR="" F I=0:0 S VAR=$O(@CONTEXT@(NIV,VAR)) Q:VAR=""  S @VAR=@CONTEXT@(NIV,VAR)
 S VIDE=0
 K @CONTEXT@(NIV)
 S @CONTEXT=@CONTEXT-1
 Q
 
AFF N LLIB D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,0,5,80,1)
 D REV^%VVIDEO S DX=60,DY=0 X XY W $$^%QZCHW(" Objet source ") D NORM^%VVIDEO
 D CARSP^%VVIDEO(0,5,5,80,1)
 D REV^%VVIDEO S DX=60,DY=5 X XY W $$^%QZCHW(" Objet cible ") D NORM^%VVIDEO
 D CARSP^%VVIDEO(0,10,3,80,1)
 D REV^%VVIDEO S DX=60,DY=10 X XY W $$^%QZCHW(" Taux d'accord ") D NORM^%VVIDEO
 D CARSP^%VVIDEO(0,13,9,80,1)
 D REV^%VVIDEO S DX=60,DY=13 X XY W $$^%QZCHW(" Regle ") D NORM^%VVIDEO
 Q
 
AFFSOU(R,O) 
 D CLFEN^%VVIDEO(1,1,3,78)
 N LIB S LIB=$$^%QZCHW("REPERTOIRE")_" :  < "_R_" >",DX=4,DY=1 X XY W LIB
 S LIB=$$^%QZCHW("OBJET")_"      :  < "_O_" >",DX=4,DY=3 X XY W LIB
 Q
AFFCIB(R,O) 
 D CLFEN^%VVIDEO(1,6,3,78)
 N LIB S LIB=$$^%QZCHW("REPERTOIRE")_" :  < "_R_" >",DX=4,DY=6 X XY W LIB
 S LIB=$$^%QZCHW("OBJET")_"      :  < "_O_" >",DX=4,DY=8 X XY W LIB
 Q
AFFACC(A1,A2) 
 N A3
 S DX=1,DY=11 X XY W $J(" ",78)
 N LIB S LIB=$$^%QZCHW("ADMIS")_" :  < "_$J(A1,1,3)_" >",DX=4,DY=11 X XY W LIB
 S A3=$S(A2="****":A2,1:$J(A2,1,3))
 S LIB=$$^%QZCHW("ATTEINT")_" :  < "_A3_" >",DX=45 X XY W LIB Q
 Q
AFFREG(D,A,I,V1,V2) 
 D CLFEN^%VVIDEO(1,14,7,78)
 N LIB
 S LIB=$$^%QZCHW("DOMAINE")_" :  < "_D_" >",DX=4,DY=14 X XY W LIB
 S LIB=$$^%QZCHW("ATTRIBUT")_" :  < "_A_" >",DY=16 X XY W LIB
 S LIB=$$^%QZCHW("INDICE")_" :  < "_I_" >",DX=50 X XY W LIB
 S LIB=$$^%QZCHW("VALEUR OBJET SOURCE")_" :  < "_V1_" >",DX=4,DY=18 X XY W LIB
 S LIB=$$^%QZCHW("VALEUR OBJET CIBLE")_" :  < "_V2_" >",DY=20 X XY W LIB
 Q
 
CLEAR 
 S DX=1,DY=11 X XY W $J(" ",78)
 D CLFEN^%VVIDEO(1,14,7,78)
 Q
TEST 
 S FIRST=0 D AFF
 D AFFSOU("ARTICLE","COMPOSANT 1")
 D AFFCIB("ARTICLE","COMPOSANT 12")
 D AFFACC("0.9","0.54")
 D AFFREG("FENETRE","TEINTE",1,"VERNIS","NATURELLE")
 D ^%VZEAVT("")
 Q
FINDOM 
 D EVAL
 S OK=$$ARRET^%SCOA1(1)
 Q:'(OK)
 Q:NIV>0
 N LL S LL=""
LOOPL S LL=$O(@NLIST@(LL))
 I LL="" D CRLIST(.LL) G STOCK
 I @NLIST@(LL)'=REPC G LOOPL
STOCK 
 D STOCK^%QSGES11(LL,OBJCIB)
 D PA^%QSGESTI(REPC,OBJCIB,"TAUX.ACCORD",$S(NBREG'=0:$J(1-(DESACOR/NBREG),1,3),1:1),1)
 D PA^%QSGESTI(REPC,OBJCIB,"POCHE",DOM,1)
 D PA^%QSGESTI(REPC,OBJCIB,"INDIVIDU.SOURCE",OBJS,1)
 D PA^%QSGESTI(REPC,OBJCIB,"REPERTOIRE.SOURCE",REPS,1)
 I ARPREM="OUI" S STOP=1 K @LDOM@(DOM)
 Q
CRLIST(LLL) 
 S LLL=$$GEN^%QCAPOP("SCO")
 D ^%QSGES11(REPC,LLL,"SCO",0,"SAVOIR.COMPARER","")
 S @NLIST@(LLL)=REPC
 Q
EVAL 
 N I,A,NONEVAL S A=""
 
 F I=0:0 S A=$O(@EV@(A)) Q:A=""  I @EV@(A)=0 S DESACOR=$S(IGNORE="NON":DESACOR,1:DESACOR+1),NBREG=$S(IGNORE="NON":@LMALUS@(DOM),1:NBREG+1)
 I VISU D AFFACC^%SCOA2(ACCOR,$S(NBREG'=0:1-(DESACOR/NBREG),1:1)) H 2
 K @(EV) Q
 
SAVDOM 
 N I,D S D=""
 F I=0:0 S D=$O(@LISDOM@(D)) Q:D=""  S @SAVDOM@(D)=@LISDOM@(D)
 Q
 
RESDOM 
 N I,D S D=""
 F I=0:0 S D=$O(@SAVDOM@(D)) Q:D=""  S @LISDOM@(D)=@SAVDOM@(D)
 Q

