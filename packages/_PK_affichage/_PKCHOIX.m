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
;! Nomprog     : %PKCHOIX                                                     !
;! Module      : PK                                                           !
;! But         : Liste déroulante                                             !
;!                                                                            !
;! Description : Choix dans une liste déroulante                              !
;!                                                                            !
;! Soit un GLOBAL ^TEST(1)="Test 1 choix"                                     !
;!                ^TEST(2)="Test 2 choix"                                     !
;!                ^TEST(3)="Test 3 choix"                                     !
;!         XG : 10                                                            !
;!         YH : 10                                                            !
;!         LV : 10                                                            !
;!                                                                            !
;!         ┌──────────────┐                                                   !
;!         │ Test 1 choix │                                                   !
;!         │ Test 2 choix │                                                   !
;!         │ Test 3 choix │                                                   !
;!         └──────────────┘                                                   !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

PKCHOIX ;
 
UN(GLO,XG,YH,LV) 
 N TITRE,LD,ROUTINT
 S TITRE="",LD=0,ROUTINT=""
 
COMM1 N INTAV,INTAR,LARG,GLOREF
 S LARG=75-XG,GLOREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REF")
 S INTAV="K @GLOREF F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=$E($$S^%QAX(S),1,LARG),@GLOREF@(CPT)=S Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="K @GLOREF F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=$E($$S^%QAX(S),1,LARG),@GLOREF@(CPT)=S Q:CPT=1  S S=$ZP(@GLO@(S))"
 
COMM2 N GLOSEL
 S GLOSEL=""
 G COMM4
 
COMM3() 
 
COMM4 N CHXP S CHXP=1
COMM5 D NUMKP^%VVIDEO
 I ($O(@GLO@(""))="")!($O(@GLO@(""))="z") D MESS^%PKUTIL(10,22,$$^%QZCHW("Ensemble vide"),1) Q ""
 N %S,%R,CPT,DERN,S,T,Y,X,LF,LS,LP,PK,RES
 N CTR,NOPAG,PAG,MPAG
 D ^%VZEATT
 S S="" F PAG=0:1 S S=$O(@GLO@(S)) Q:(S="")!(S="z")
 S MPAG=PAG\LV
 S:(MPAG*LV)'=PAG MPAG=MPAG+1
 S CTR="",PAG=0,DERY=""
 G PLUS
LEC0 D POCLEPA^%VVIDEO
 S Y=XG_"\YCL"_$S(LD:"D",1:"")_"\1\"_TITRE_"\\"
LEC S %R=YH
 D ^%PKPOP2(0)
 I CTR="A" K:GLOSEL'="" @(GLOSEL) S RES="" G FIN
 I CTR="F" S RES="" G FIN
 I CTR="?" D:ROUTINT'="" @ROUTINT G LEC
 G:CTR="+" PLUS
 G:CTR="-" MOINS
 G:CTR="P" PAGE
 I CTR'="" D ^%VSQUEAK G LEC
 G:'(CHXP) LEC
 
 S RES=@GLOREF@(X)
 G:GLOSEL="" FIN
 
 I $D(@GLOSEL@(RES)) K @GLOSEL@(RES) G LEC
 S @GLOSEL@(RES)=""
 G LEC
 
FIN K @(GLOREF)
 Q RES
 
PLUS I ($O(@GLO@(DERY))="")!($O(@GLO@(DERY))="z") D ^%VSQUEAK G LEC
 S PREMY=$O(@GLO@(DERY))
 S PAG=PAG+1
 D ALLER
 G LEC0
 
MOINS I $ZP(@GLO@(PREMY))="" D ^%VSQUEAK G LEC
 S DERY=$ZP(@GLO@(PREMY))
 S PAG=PAG-1
 D INVER
 G LEC0
 
ALLER S CPT=0
 S S=PREMY
 K Y
 X INTAV
 S DERY=Y($ZP(Y("")))
 Q
 
INVER S CPT=LV+1
 S S=DERY
 K Y
 X INTAR
 S PREMY=Y($O(Y("")))
 Q
 
PAGE D LIRE^%VREAD($$^%QZCHW("Page")_" (/"_MPAG_") : ",PAG,0,78,23,23,.CT,.NOPAG)
 G:CT'="" LEC
 G:NOPAG="" LEC
 G:(NOPAG+0)'=NOPAG ERRP
 G:NOPAG<0 ERRP
 I NOPAG=PAG D POCLEPA^%VVIDEO G LEC
 I (NOPAG-1)=PAG S PAG=NOPAG G PLUS
 I (PAG-1)=NOPAG S PAG=NOPAG G MOINS
 I NOPAG<PAG G PAGM
 S NBP=(NOPAG-PAG)-1
 S S=$O(@GLO@(DERY))
 G:S="" LEC
 F %I=0:1:NBP Q:(S="")!(S="z")  S PREMY=S F CPT=1:1:LV S S=$O(@GLO@(S)) Q:(S="")!(S="z")
 S:(S="")!(S="z") %I=%I-1
 S PAG=(PAG+%I)+1
 D ALLER
 G LEC0
PAGM S NBP=(PAG-NOPAG)-1
 S S=$ZP(@GLO@(PREMY))
 G:S="" LEC
 F %I=0:1:NBP Q:S=""  S DERY=S F CPT=1:1:LV S S=$O(@GLO@(S)) Q:(S="")!(S="z")
 S PAG=(PAG-%I)-1
 D INVER
 G LEC0
 
ERRP D ^%VSQUEAK,POCLEPA^%VVIDEO
 G LEC
 
 
 
 
TIT(GLO,XG,YH,LV,TITRE,LD) 
 N ROUTINT
 S ROUTINT=""
 G COMM1
 
 
 
 
TITINT(GLO,XG,YH,LV,TITRE,LD,ROUTINT) 
 G COMM1
 
 
 
 
 
 
 
NUM(GLO,XG,YH,LV,TITRE,LD) 
 N INTAV,INTAR,ROUTINT,LARG,GLOREF
 S LARG=75-XG,GLOREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REF")
 K @(GLOREF)
 S ROUTINIT=""
 S INTAV="K @GLOREF F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=$E($$S^%QAX(@GLO@(S)),1,LARG),@GLOREF@(CPT)=@GLO@(S) Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="K @GLOREF F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=$E($$S^%QAX(@GLO@(S)),1,LARG),@GLOREF@(CPT)=@GLO@(S) Q:CPT=1  S S=$ZP(@GLO@(S))"
 G COMM2
 
 
 
 
NUMINT(GLO,XG,YH,LV,TITRE,LD,ROUTINT) 
 N INTAV,INTAR,LARG,GLOREF
 S LARG=75-XG,GLOREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REF")
 K @(GLOREF)
 S INTAV="K @GLOREF F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=$E(@GLO@(S),1,LARG),@GLOREF@(CPT)=@GLO@(S) Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="K @GLOREF F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=$E(@GLO@(S),1,LARG),@GLOREF@(CPT)=@GLO@(S) Q:CPT=1  S S=$ZP(@GLO@(S))"
 G COMM2
 
TEST D CLEPAG^%VVIDEO
TEST1 W !,"GLOBAL : " R GLO Q:GLO=""
 I '($D(@GLO)) W "  Inexistant !!!" G TEST1
 W !,"XG : " R XG
 W !,"YH : " R YH
 W !,"LV : " R LV
TEST2 S CH=$$NUM(GLO,XG,YH,LV,"",0)
 W !,"CHOIX : ",CH R *YY
 I CH="" G TEST
 D CLEPAG^%VVIDEO
 G TEST2
 
 
AFF(GLO,XG,YH,LV,TITRE) 
 N LD,CHXP,ROUTINT,INTAV,INTAR,LARG,GLOREF,GLOSEL
 S LD=0,ROUTINT=""
 S LARG=75-XG,GLOREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REF")
 S INTAV="K @GLOREF F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=$E($$S^%QAX(S),1,LARG),@GLOREF@(CPT)=S Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="K @GLOREF F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=$E($$S^%QAX(S),1,LARG),@GLOREF@(CPT)=S Q:CPT=1  S S=$ZP(@GLO@(S))"
 S GLOSEL=""
 S CHXP=0
 G COMM5
 ;

