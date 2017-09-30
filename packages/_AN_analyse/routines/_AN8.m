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

;%AN8^INT^1^59547,73866^0
%AN8 ;
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
GRAPH(CH,P) N C,L,N,VALPLA,RESULT,%GDX,NORES,TEMPO D INIT^%ANGEPIL
 N NOCOMPIL
 S NOCOMPIL=0
 K ^SANAREQ($J)
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="L",@TEMPO@(3)="N",@TEMPO@(4)="VALPLA" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0 D CAR,EMPIL^%ANGEPIL("GRAPH1^%AN8")
 I C=":" S NORES=0,%COMPIL=";" G DEPIL^%ANGEPIL
 S %GDX="OUI"
 G:C="%" AFFECT
 S N=$$^%QZCHW("$ALIGNER"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") ALIGNER^%AN19
 S N=$$^%QZCHW("$CADRE"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") CADRE^%AN19
 S N=$$^%QZCHW("$ETIQUETTE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N ETIQ^%AN14
 S N=$$^%QZCHW("$FIN"),L=$L(N) G:$E(CH,P,(P+L)-1)=N FIN^%AN14
 S N=$$^%QZCHW("$FOND.DE.PAGE.CALENDAIRE"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") FOND^%AN34
 S N=$$^%QZCHW("$HACHURER"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") HACHUR^%AN42
 S N=$$^%QZCHW("$HACHURER.FORT"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") HACHURF^%AN42
 S N=$$^%QZCHW("$PLACER"),L=$L(N) I $E(CH,P,P+L)=(N_"(") S VALPLA="" G PLACER
 S N=$$^%QZCHW("$PLACERD"),L=$L(N) I $E(CH,P,P+L)=(N_"(") S VALPLA="D" G PLACER
 S N=$$^%QZCHW("$PLACERP"),L=$L(N) I $E(CH,P,P+L)=(N_"(") S VALPLA="P" G PLACER
 S N=$$^%QZCHW("$REPETER"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") BOUCLER^%AN40
 S N=$$^%QZCHW("$TRAIT"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") TRAIT
 S N=$$^%QZCHW("$WAIT"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") WAIT^%AN38
 D M("Action inconnue ...") K @(TEMPO) D EPIL^%ANGEPIL Q 0
GRAPH1 D EPIL^%ANGEPIL K @(TEMPO) Q:RESULT=0 0
 D KILL^%ANA(NORES)
 Q 1
 
TRAIT K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="X1",@TEMPO@(4)="X2",@TEMPO@(5)="Y1",@TEMPO@(6)="Y2",@TEMPO@(7)="%COMP1",@TEMPO@(8)="%COMP2",@TEMPO@(9)="%COMP3",@TEMPO@(10)="%COMP4"
 D EMPV^%ANGEPIL(TEMPO) S (NORES,X1,X2,Y1,Y2)=0
 S (%COMP1,%COMP2,%COMP3,%COMP4)=""
 F I=1:1:$L($$^%QZCHW("$TRAIT"))+1 D LEC
 D EMPIL^%ANGEPIL("TRAIT1^%AN8") G EXPRESS^%AN4
TRAIT1 G:RESULT=0 DEPIL^%ANGEPIL S X1=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("TRAIT2^%AN8") G EXPRESS^%AN4
TRAIT2 I RESULT=0 D KILL^%ANA(X1) G DEPIL^%ANGEPIL
 S Y1=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1),KILL^%ANA(Y1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("TRAIT3^%AN8") G EXPRESS^%AN4
TRAIT3 I RESULT=0 D KILL^%ANA(X1),KILL^%ANA(Y1) G DEPIL^%ANGEPIL
 S X2=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP3=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("TRAIT4^%AN8") G EXPRESS^%AN4
TRAIT4 I RESULT=0 D KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2) G DEPIL^%ANGEPIL
 S Y2=NORES
 D CAR I C'=")" D M("Une ) a la fin S.V.P. ..."),KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2),KILL^%ANA(Y2) S RESULT=0 G DEPIL^%ANGEPIL
 
 
 
 
 S %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP1_",^V($J,""%"",""%Y"",1)="_%COMP2_",^V($J,""%"",""%X2"",1)="_%COMP3_",^V($J,""%"",""%Y2"",1)="_%COMPIL_" S %FONC=""SEGMENT.TEXTE"" D GRAPH^%EDCENVL"
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRAIT")
 D SET^%ANA(NORES,1,X1),SET^%ANA(NORES,2,Y1),SET^%ANA(NORES,3,X2),SET^%ANA(NORES,4,Y2) G DEPIL^%ANGEPIL
 
 
PLACER K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="CH2",@TEMPO@(3)="I",@TEMPO@(4)="X",@TEMPO@(5)="Y",@TEMPO@(6)="%COMP1",@TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP30",@TEMPO@(9)="%COMP4",@TEMPO@(10)="%COMP5" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,X,Y)=0,(%COMP1,%COMP2,%COMP30,%COMP4,%COMP5)=""
 F I=1:1:$L($$^%QZCHW("$PLACER"))+1 D LEC
 D:VALPLA'="" LEC
 S %COMP5=%COMPIL,%COMPIL="",%COMP1="S VALPLA="_""""_VALPLA_""""
 D EMPIL^%ANGEPIL("PLACER1^%AN8") G EXPRESS^%AN4
PLACER1 G:RESULT=0 DEPIL^%ANGEPIL S CH2=NORES
 S %COMP30="S %9STR="_%COMPIL
 D CAR I C=")" G ETEX
 I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(CH2) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL="" D LEC,EMPIL^%ANGEPIL("PLACER2^%AN8") G EXPRESS^%AN4
PLACER2 I RESULT=0 D KILL^%ANA(CH2) G DEPIL^%ANGEPIL
 S X=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(CH2),KILL^%ANA(X) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_";" D LEC,EMPIL^%ANGEPIL("PLACER3^%AN8") G EXPRESS^%AN4
PLACER3 I RESULT=0 D KILL^%ANA(CH2),KILL^%ANA(X) G DEPIL^%ANGEPIL
 S Y=NORES
 S %COMP2="S ^V($J,""%"",""%X"",1)="_$P(%COMPIL,";",1)_",^V($J,""%"",""%Y"",1)="_$P(%COMPIL,";",2)
ETEX D CAR I C'=")" D M("Une ) a la fin S.V.P. ..."),KILL^%ANA(X),KILL^%ANA(Y),KILL^%ANA(CH2) S RESULT=0 G DEPIL^%ANGEPIL
 I (((($L(%COMPIL)+$L(%COMP1))+$L(%COMP2))+$L(%COMP30))+$L(%COMP5))>450 D M("Cette phrase est trop longue et ne peut etre compilee"),KILL^%ANA(X),KILL^%ANA(Y),KILL^%ANA(CH2) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL="D COOR^%EDCENVL "_%COMP30_" S %FONC=""TEXT"" D ^%PBPZ"
 S:%COMP2'="" %COMPIL=%COMP2_" "_%COMPIL
 S %COMPIL=%COMP5_%COMP1_" "_%COMPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PLACER"_VALPLA)
 D SET^%ANA(NORES,1,CH2),SET^%ANA(NORES,2,X),SET^%ANA(NORES,3,Y)
 G DEPIL^%ANGEPIL
 
 
AFFECT K @(TEMPO) S @TEMPO@(1)="ATT",@TEMPO@(2)="C",@TEMPO@(3)="EXPR",@TEMPO@(4)="OP",@TEMPO@(5)="%COMP22",@TEMPO@(6)="%COMP23",@TEMPO@(7)="%COMP24"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0
 D CAR I C'="%" D M("Tout nom d'attribut local commence par un % ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP22=%COMPIL_"S ",%COMPIL=""
 D EMPIL^%ANGEPIL("AFFECT1^%AN8") G VARTEMP^%AN3
AFFECT1 G:RESULT=0 DEPIL^%ANGEPIL S ATT=NORES
 D CAR I C'="=" D M("Il manque un signe = dans l'affectation ..."),KILL^%ANA(ATT) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP23=$P(%COMPIL,"(",2,$L(%COMPIL,"(")),%COMP23=$E(%COMP23,1,$L(%COMP23)-1)
 S %COMP24=$P(%COMP23,",",2,$L(%COMP23,","))
 S %COMP23=$P(%COMP23,",") S:%COMP24="""""" %COMP24=1
 S %COMPIL=%COMP22_"^V($J,""%"","_%COMP23_","_%COMP24_")="
 D LEC,EMPIL^%ANGEPIL("AFFECT2^%AN8")
 G EXPRESS^%AN4
AFFECT2 I RESULT=0 D KILL^%ANA(ATT) G DEPIL^%ANGEPIL
 S EXPR=NORES
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","AFFECTATION"),SET^%ANA(NORES,1,ATT),SET^%ANA(NORES,2,EXPR) G DEPIL^%ANGEPIL

