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

;%SCOA2^INT^1^59547,73887^0
SCOA2 ;
 
 
 
 
 
MALUS(D,MALUS) 
 
 I $D(@LMALUS@(D)) Q
 N M,T,REG,AT,OR,V1,V2,I,J S J=0
 G:D="" FMALUS
 S REG="^[QUI]SCOMPREG"
 S AT="",T="NON.EGALITE"
 F I=0:0 S AT=$O(@REG@(D,T,AT)) Q:AT=""  S OR="" F I=0:0 S OR=$O(@REG@(D,T,AT,OR)) Q:OR=""  S V1="" F I=0:0 S V1=$O(@REG@(D,T,AT,OR,V1)) Q:V1=""  S V2="" F I=0:0 S V2=$O(@REG@(D,T,AT,OR,V1,V2)) Q:V2=""  D AFFECTM
 S AT="",T="EGALITE"
 F I=0:0 S AT=$O(@REG@(D,T,AT)) Q:AT=""  S OR="" F I=0:0 S OR=$O(@REG@(D,T,AT,OR)) Q:OR=""  S M=@REG@(D,T,AT,OR,"MALUS"),@LMALUS@(D,M,AT,OR,"=","=",T)="",J=J+1
 S @LMALUS@(D)=J
FMALUS Q
AFFECTM 
 S M=@REG@(D,T,AT,OR,V1,V2,"MALUS")
 S @LMALUS@(D,M,AT,OR,V1,V2,T)=""
 S J=J+1
 Q
 
BONUS N T
 S T=$O(@LMALUS@(DOM,MALUS,AT,OR,V1,V2,""))
 I T="EGALITE" S ^[QUI]SCOMPREG(DOM,T,AT,OR,"MALUS")=^[QUI]SCOMPREG(DOM,T,AT,OR,"MALUS")-5E-1,@EV@(NIV,DOM,"SUCCES")=@EV@(NIV,DOM,"SUCCES")+1 Q
 S ^[QUI]SCOMPREG(DOM,T,AT,OR,V1,V2,"MALUS")=^[QUI]SCOMPREG(DOM,T,AT,OR,V1,V2,"MALUS")-5E-1,@EV@(NIV,DOM,"SUCCES")=@EV@(NIV,DOM,"SUCCES")+1
 D:VISU AFFACC(ACCOR,@EV@(NIV,DOM,"SUCCES")/NBREG)
 Q
 
 
 
 
 
EMPIL(NIV,CONTEXT) 
 N I
 I '($D(@CONTEXT)) S @CONTEXT=0
 F I="DOM","AT","OR","V1","V2","MALUS","LDOM","FIRST","NBREG","ACCOR","DESACOR","NIV" S @CONTEXT@(@CONTEXT,I)=@I
 S @CONTEXT=@CONTEXT+1
 S NIV=@CONTEXT
 Q
DEPIL(VIDE,CONTEXT) 
 N VAR,OK,NIVO,A
 S OK=1
 I NIV=0 S VIDE=1 Q
 I NBREG=0 S OK=0
 S DOM=$ZP(@LDOM@(""))
 I ACCOR>((@EV@(NIV,DOM,"SUCCES")/NBREG)+@EV@(NIV,DOM,"NON.EVALUES")) S OK=0
 S NIVO=NIV
 S VAR="" F I=0:0 S VAR=$O(@CONTEXT@(NIVO-1,VAR)) Q:VAR=""  S @VAR=@CONTEXT@(NIVO-1,VAR)
 S VIDE=0 K @CONTEXT@(NIVO) S @CONTEXT=@CONTEXT-1
 I '(OK) Q
 D BONUS
 Q
 
AFF N LLIB,LAR D CLEPAG^%VVIDEO
 S LAR=$S(IBMPC:79,1:80)
 D CARSP^%VVIDEO(0,0,5,LAR,1),TIT(60,0,"Objet reference")
 D CARSP^%VVIDEO(0,5,5,LAR,1),TIT(60,5,"Objet cible")
 D CARSP^%VVIDEO(0,10,3,LAR,1),TIT(60,10,"Taux d'accord")
 D CARSP^%VVIDEO(0,13,9,LAR,1),TIT(60,13,"Regle")
 Q
TIT(X,Y,MSG) 
 D REV^%VVIDEO S DX=X,DY=Y X XY W " "_$$^%QZCHW(MSG)_" " D NORM^%VVIDEO
 Q
 
AFFSOU(R,O) 
 N LAR S LAR=$S(IBMPC:77,1:78)
 D CLFEN^%VVIDEO(1,1,3,LAR),BLD^%VVIDEO
 N LIB S LIB=$$^%QZCHW("repertoire")_" :  < "_R_" >",DX=4,DY=1 X XY W LIB
 S LIB=$$^%QZCHW("objet")_"      :  < "_O_" >",DX=4,DY=3 X XY W LIB
 D NORM^%VVIDEO
 Q
AFFCIB(R,O) 
 N LAR S LAR=$S(IBMPC:77,1:78)
 D CLFEN^%VVIDEO(1,6,3,LAR)
 N LIB S LIB=$$^%QZCHW("repertoire")_" :  < "_R_" >",DX=4,DY=6 X XY W LIB
 S LIB=$$^%QZCHW("objet")_"      :  < "_O_" >",DX=4,DY=8 X XY W LIB
 Q
AFFACC(A1,A2) 
 N A3,LAR S LAR=$S(IBMPC:77,1:78)
 S DX=1,DY=11 X XY W $J(" ",LAR)
 N LIB S LIB=$$^%QZCHW("vise")_" :  < "_$J(A1,1,3)_" >",DX=4,DY=11 X XY W LIB
 S A3=$S(A2="****":A2,1:$J(A2,1,3))
 S LIB=$$^%QZCHW("courant")_" :  < "_A3_" >",DX=45 X XY W LIB Q
 Q
AFFREG(D,A,I,V1,V2) 
 N LAR S LAR=$S(IBMPC:77,1:78)
 D CLFEN^%VVIDEO(1,14,7,LAR)
 N LIB
 S LIB=$$^%QZCHW("domaine")_"  :  < "_D_" >",DX=4,DY=14 X XY W LIB
 S LIB=$$^%QZCHW("attribut")_" :  < "_A_" >",DY=16 X XY W LIB
 S LIB=$$^%QZCHW("indice")_" :  < "_I_" >",DX=50 X XY W LIB
 S LIB=$$^%QZCHW("valeur attribut reference")_" :  < "_V1_" >",DX=4,DY=18 X XY W LIB
 S LIB=$$^%QZCHW("valeur attribut cible")_"     :  < "_V2_" >",DY=20 X XY W LIB
 Q
 
CLEAR 
 N LAR S LAR=$S(IBMPC:77,1:78)
 S DX=1,DY=11 X XY W $J(" ",LAR)
 D CLFEN^%VVIDEO(1,14,7,LAR)
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
 D:ETU'="" JOURNAL^%SCOA3
 Q:NIV>0
 I '($$IR^%QSGEST5($$NOMINT^%QSF(REPC),OBJCIB)) G FIND0
 D PA^%QSGESTI($$NOMINT^%QSF(REPC),OBJCIB,"TAUX.ACCORD",@EV@(0,DOM,"TAUX.ATTEINT"),1)
 D PA^%QSGESTI($$NOMINT^%QSF(REPC),OBJCIB,"DOMAINE",DOM,1)
 D PA^%QSGESTI($$NOMINT^%QSF(REPC),OBJCIB,"INDIVIDU.REFERENCE",OBJS,1)
 D PA^%QSGESTI($$NOMINT^%QSF(REPC),OBJCIB,"REPERTOIRE.REFERENCE",REPS,1)
FIND0 I ACCOR>@EV@(0,DOM,"TAUX.ATTEINT") K @(EV) Q
 K @(EV)
 D STOCK^%QSGES11(NLIST,OBJCIB)
 I ARPREM="OUI" S STOP=1 K @LDOM@(DOM)
 Q
CRLIST(LLL,REPC) 
 S LLL=$$GEN^%QCAPOP("CPL")
 D ^%QSGES11($$NOMINT^%QSF(REPC),LLL,"CPL",0,"SAVOIR.COMPARER","")
 Q
EVAL 
 N I,A,NONEVAL S A="",@EV@(NIV,DOM,"NON.EVALUES")=0
 F I=0:0 S A=$O(@EV@(NIV,DOM,"ATTRIBUT",A)) Q:A=""  D EVAL0
 I VISU D AFFACC^%SCOA2(ACCOR,$S(NBREG'=0:@EV@(NIV,DOM,"SUCCES")/(NBREG+@EV@(NIV,DOM,"NON.EVALUES")),1:0)) H 2
 S @EV@(NIV,DOM,"REGLE")=NBREG
 Q
EVAL0 I @EV@(NIV,DOM,"ATTRIBUT",A)'=0 Q
 S @EV@(NIV,DOM,"NON.EVALUES")=@EV@(NIV,DOM,"NON.EVALUES")+1
 Q
 
SAVDOM 
 N I,D S D=""
 F I=0:0 S D=$O(@LISDOM@(D)) Q:D=""  S @SAVDOM@(D)=@LISDOM@(D)
 Q
 
RESDOM 
 N I,D S D=""
 F I=0:0 S D=$O(@SAVDOM@(D)) Q:D=""  S @LISDOM@(D)=@SAVDOM@(D)
 Q

