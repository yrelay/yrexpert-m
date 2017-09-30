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
;! Nomprog     : TOXXVERI                                                     !
;! Module      : TO (Toutes versions XX)                                      !
;! But         : Examiner une etude                                           !
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

;TOXXVERI^INT^1^59769,39455^0
TOXXVERI ;
 D PAGE G QU
 
 
 
 
VISU(NUFA) 
 N %A,%ARR,%ART,%CAR,%DDATE,%DEC,%DIM,%FIG,%HHEUR,%LARR,%NBCAR,%NCH
 N %PPAGE,%RR,%RRR,%T,%TAD,%TTITR,%U,%UOR,%UV,%W,AB,ADR,ANUFA,ART
 N ARTAFF,ATT,B,BIG,C2,COMP,CTRLA,CTRLF,DAT,DATACOUR,DEV,DOLARI,DURTOT
 N DX,DXD,DY,DYB,DYM,DYP,E,GRAPH,HEURE,I,ID,IDT,IMPR,ISNUM,LG,LI,LIB
 N LIB,LILIM,LIP,LIS,LOPT,LOSTAR,LSTAR,MSG1,MSG2,NDX,NDY,NEXT,NIV,NOEV
 N NOM,NOMTREE,NT,NU,NUC,NUDEBRO,NUM,NVIRG,OBJ,ODX,ODY,OKPH,OPT,OR,OROUT
 N OSFA,PA,PCH,PNUFA,PP,PRIMATOT,PRITOT,PX,PY,QA,QT,QTEART,QTEMAT,RAPA
 N REP,RESULT,RET,RO,RS,RT,SFA,SFMAT,STOP,STP,SUITTB,T,TBMOV,TBSUIT,TEST,TEXP
 N TOID,TOUS,TPL,TRS,TUOR,TWREF,TYPA,U,UNIT,UU,V,VL,X1,X2,X3,Y1,YA,YB
 N Z,ZP,ZZ,NB
 S Y1=NUFA
 D PAGE,EXT1,AFFET,VERIF
 Q
VERIF S OBJ="ART" D OBJ,^TOXXRAIS Q
EXT1 Q:'($D(^[QUI]TREEWORK(Y1,0)))  S ART=$P(^[QUI]TREEWORK(Y1,0),"^",2) Q:'($D(^[QUI]ANTETUDE(ART,Y1)))  S NUFA=Y1,SFA=ART D ^TO3VSFAB
 D AFFET
 Q
 
PAGE D CLEPAG^%VVIDEO,80^%VVIDEO,CUROF^%VVIDEO
 
 D BLD^%VVIDEO,REV^%VVIDEO,CARSA^%VVIDEO(50,0,29,6)
 
 S DX=56,DY=1 X XY W $S($D(^KLNTOT($J)):" L I N K ",1:" T O T E M ") S DX=56,DY=4 X XY W $$^%QZCHW("RAISONNEMENT") X XY D NORM^%VVIDEO
 D CURON^%VVIDEO S TBFIG($P($ZPOS,"^",2),1)="CAD" D ^%VZCFIG S %FIG="CAD" D BLD^%VVIDEO,DES^%VZCFIG
 
 S DX=2,DY=1 X XY D REV^%VVIDEO X XY W $J("",46) D NORM^%VVIDEO
 S TWREF=0 K TBFIG S TBFIG($P($ZPOS,"^",2),1)="DES" D ^%VZCFIG S %FIG="DES" D DES^%VZCFIG
 D CARSA^%VVIDEO(0,11,49,10)
 D CARSA^%VVIDEO(50,6,29,15)
 D CARSA^%VVIDEO(0,21,49,3)
 D CARSA^%VVIDEO(50,21,29,3)
 D COPY^TOXXRAIS Q
QU D CLEBA^TOXXRAIS W $$^%QZCHW("Etude")," ?:",$$^%QZCHW("liste")," ?/:",$$^%QZCHW("article conditionne")
 S (DX,DY)=4 X XY W $J("",33) D ^%VLEC G:$A(Y1)<32 END G LIS:Y1["?"
 G:$D(^[QUI]TREEWORK(Y1)) EXT S %NTO=Y1 D ^TONUMTOT S Y1=%NTO
EXT G QU:'($D(^[QUI]TREEWORK(Y1,0))) S ART=$P(^[QUI]TREEWORK(Y1,0),"^",2) G QU:'($D(^[QUI]ANTETUDE(ART,Y1))) S NUFA=Y1,SFA=ART D ^TO3VSFAB
EXPLI D AFFET G VERI
AFFET S MSG=^[QUI]ANTETUDE(ART,NUFA,0),DAT=$P(MSG,"^",3),HEUR=$P($P(MSG,"^",4),"'",1),DX=3,DY=4 X XY W $J("",45) X XY W NUFA,"     (",DAT," - ",HEUR,")"
 D WART Q
VERI S OBJ="ART" D OBJ,^TOXXRAIS G TOXXVERI
FIN Q
END D CLEPAG^%VVIDEO,80^%VVIDEO K ^OBJORD($J),^OBJVU($J) G FIN
WART S %TAD=$J("",46) D REV^%VVIDEO,BLD^%VVIDEO
 F MSG=%TAD,ART S MSG=$E(MSG,1,46),DX=22-($L(MSG)\2),DY=1 S:DX<2 DX=2 X XY W MSG
 S ARTAFF=ART D NORM^%VVIDEO Q
OBJ K ^OBJORD($J),^OBJVU($J) S NUO=1,%TAD="T0^TOXXVERI",NOMTREE="^[QUI]TREEWORK("""_NUFA_"""" D ^%QCAGTW K TW,RS,AR,ID,NU,NUO Q
T0 S TW=$P($P(%T,",",2,500),")",1),RS=@%T,AR=$P(RS,"^",1),ID=$P(RS,"^",4),NU=$S($D(^OBJVU($J,AR)):^OBJVU($J,AR),1:0)+1,^OBJVU($J,AR)=NU,^OBJVU($J,AR,TW)=ID,^OBJORD($J,NUO)=AR_"^"_TW_"^"_($L(TW,",")-1)_"^"_ID,NUO=NUO+1 Q
RETOT G:'($D(^[QUI]TREEWORK(NUFA,0))) FIN S ART=$P(^[QUI]TREEWORK(NUFA,0),"^",1) D PAGE,AFFET S OBJ="ART" D OBJ,^TOXXRAIS G END
 
LIS S (ART,NUFA,TWREF)="",KEY=$P(Y1,"?",1) D 80^%VVIDEO,^TOXXRAI6 G:NUFA="" TOXXVERI
 
 S Y1=NUFA
 D PAGE G EXT
CAD ;;~L~H~47~2~0/~L~H~47~2~3/~L~H~47~2~5/~L~V~2~1~1/~L~V~1~1~4/~L~V~2~48~1/~L~V~1~48~4/~KS~l~1~0/~KS~t~1~3/~KS~m~1~5/~KS~k~48~0/~KS~u~48~3/~KS~j~48~5/
 ;;
DES ;;~L~H~47~1~6/~L~H~47~1~8/~L~H~47~1~10/~L~V~1~1~7/~L~V~1~1~9/~L~V~1~48~7/~L~V~1~48~9/~KS~l~1~6/~KS~t~1~8/~KS~m~1~10/~KS~k~48~6/~KS~u~48~8/~KS~j~48~10/
 ;;
 ;
 ;

