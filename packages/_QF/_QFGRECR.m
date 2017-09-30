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

;%QFGRECR^INT^1^59547,73875^0
QFGRECR ;
 
 
 
 
 
 
 
 
ALIND(NL,FEN,MSG) 
 D COOR(FEN,0,11,79,11)
IND 
 S @FEN@("AFF")="AFFGR^%QFGRECR"
 S @FEN@("CADRE")="CADRE^%QFGRECR"
ISA S MSG=""
 S @FEN@("T")=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 S @FEN@("A")=$S(@FEN@("T"):$$ADRLT^%QSGEST7(NL),1:$$ADRLIS^%QSGEST7(NL))
 S @FEN@("ATT")=1
 S @FEN@("LIS")=NL
 S @FEN@("B")=$$BASE^%QSGEST7(NL)
 I @FEN@("A")="" S MSG=$$^%QZCHW("Impossible de retrouver les individus de la liste")_" "_NL
 Q
ALINDPP(NL,FEN,FEN2,MSG) 
 D COOR(FEN,0,1,79,21)
 S @FEN@("SYN")=@FEN2@("SYN"),@FEN@("SYN.A")=@FEN2@("SYN.A")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(FEN2,"C"),$$CONCAS^%QZCHAD(FEN,"C"))
 G ISA
 
 
 
AZOOM(NL,FEN,MSG) 
 D COOR(FEN,0,12,79,10)
 G IND
 
 
 
AGROUP(NL,FEN,MSG) 
AGR D COOR(FEN,0,3,79,8)
 S @FEN@("AFF")="AFFI^%QFGRECR"
GSA S MSG=""
 S @FEN@("T")=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 S @FEN@("A")=$S(@FEN@("T"):$$ADRLT^%QSGEST7(NL),1:$$ADRLIS^%QSGEST7(NL))
 S @FEN@("ATT")=1
 S @FEN@("CADRE")="CADRE^%QFGRECR"
 S @FEN@("LIS")=NL
 S @FEN@("B")=$$BASE^%QSGEST7(NL)
 I @FEN@("A")="" S MSG=$$^%QZCHW("Impossible de retrouver les individus de la liste")_" "_NL Q
 Q
ALGRPP(NL,FEN,FEN2,MSG) 
 D COOR(FEN,0,1,79,21)
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(FEN2,"C"),$$CONCAS^%QZCHAD(FEN,"C"))
 S @FEN@("SYN")=@FEN2@("SYN"),@FEN@("SYN.A")=@FEN2@("SYN.A")
 G GSA
 
ALGRIN(NL,FEN,FEN2,MSG) 
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(FEN2,"C"),$$CONCAS^%QZCHAD(FEN,"C"))
 S @FEN@("SYN")=@FEN2@("SYN"),@FEN@("SYN.A")=@FEN2@("SYN.A")
 D AGR
 S @FEN@("CADRE")="CADRG^%QFGRECR"
 Q
 
COOR(FEN,DX,DY,LH,LV) 
 S @FEN@("X")=DX,@FEN@("Y")=DY
 S @FEN@("L")=LH,@FEN@("H")=LV
 Q
 
 
ENTETE O $I D CLFEN^%VVIDEO(0,0,3,RM-1)
 D ^%VZCDB(@VT@("TITRE"),0)
 Q:UTIL'="E"
 W $$XY^%VVIDEO1(0,1)_$$^%QZCHW("commentaire")_"    : "_$$BLD^%VVIDEO1_$E(@VT@("COMM"),1,43)_$$NORM^%VVIDEO1
 W $$XY^%VVIDEO1(45,1)_$$^%QZCHW("date maj etude")_" : "_$$BLD^%VVIDEO1_@VT@("DATE")
 W $$XY^%VVIDEO1(0,2)_$$NORM^%VVIDEO1_$$^%QZCHW("Equilibre.reel")_" : "_$$BLD^%VVIDEO1_$S(@VT@("EQUIR")="***":"***",1:$J(@VT@("EQUIR"),1,2))_$$NORM^%VVIDEO1
 W $$XY^%VVIDEO1(25,2)_$$^%QZCHW("Taux oper. affectes")_" : "_$$BLD^%VVIDEO1_@VT@("TAUX")_$$NORM^%VVIDEO1
 W $$XY^%VVIDEO1(60,2)_$$^%QZCHW("Cycle reel")_" : "_$$BLD^%VVIDEO1_@VT@("CYCLER")_$$XY^%VVIDEO1(0,2)_$$NORM^%VVIDEO1
 Q
 
REAFF1 D CLEPAG^%VVIDEO,ENTETE
 Q
 
REAFF D CLEPAG^%VVIDEO,ENTETE
 D AFFGR1,AFFI1
 Q
 
AFFGR D CLEPAG^%VVIDEO,ENTETE
AFFGR1 D USE^%QUAPAGM(CFEN("G")),AFFICH^%QUAPAGM
 D USE^%QUAPAGM(CFEN("I"))
 Q
 
AFFI D CLEPAG^%VVIDEO,ENTETE
AFFI1 D USE^%QUAPAGM(CFEN("I")),AFFICH^%QUAPAGM
 I CFEN("I")="QFGRZOOM" D ^%VZCDB($$^%QZCHW("zoom")_" "_ZOOM,11)
 D USE^%QUAPAGM(CFEN("G"))
 Q
 
MAJFEN(ZOOM) 
 D USE^%QUAPAGM("QFGRIND"),INIT2^%QUAPAGM
 I ZOOM'="" D USE^%QUAPAGM("QFGRZOOM"),INIT2^%QUAPAGM
 D USE^%QUAPAGM("QFGROUP"),INIT2^%QUAPAGM
 D REAFF
 Q
 
CADRE(Z,X,Y,L,H) 
 I CFEN="G",Z=CFEN("G") D CARLA^%VVIDEO(X,Y,L,H) Q
 I CFEN="I",Z=CFEN("I") D CARLA^%VVIDEO(X,Y,L,H) Q
 D CARSA^%VVIDEO(X,Y,L,H)
 Q
 
CADREU(G) D USE^%QUAPAGM(CFEN(G)),CADRE^%QUAPAGM
 D USE^%QUAPAGM(CFEN(CFEN)) Q
 
CADRES D USE^%QUAPAGM(CFEN("G")),CADRE^%QUAPAGM
 D USE^%QUAPAGM(CFEN("I")),CADRE^%QUAPAGM
 I CFEN'="" N Z D USE^%QUAPAGM(CFEN(CFEN)) S Z=^Z($J) D NPAG^%QUAPA2M($$XPAG^%QUAPAGM)
 Q
 
CADRG(Z,X,Y,L,H) 
 D CARSA^%VVIDEO(X,Y,L,H)
 S DX=X+5,DY=Y D REV^%VVIDEO
 X XY W $$^%QZCHW("Groupes contenant")_" "_INDCOUR
 D NORM^%VVIDEO Q
 
INITAFF(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,CFEN) 
 N MSG
 D AGROUP(LLISTEN,FGR,.MSG)
 D OPEN^%QUAPAGM(FGR,"QFGROUP")
 D ALIND(LISTIND,FIND,.MSG)
 D OPEN^%QUAPAGM(FIND,"QFGRIND")
 
 I ZOOM'="" D AZOOM(ZOOM,FZOOM,.MSG),OPEN^%QUAPAGM(FZOOM,"QFGRZOOM")
 D REAFF
 Q
ENDAFF D CLOSE^%QUAPAGM("QFGRIND")
 D CLOSE^%QUAPAGM("QFGROUP")
 D CLOSE^%QUAPAGM("QFGRZOOM")
 Q
 
SYN(VT1,V,C) 
 N GR,VAL
 S GR=$O(@GROAFF@(V,""))
 S VAL=$$AFGR^%QFGRACT(GR)
 Q VAL
 
INSEP(VT1,V,C) 
 N INS S INS=@VT@("INSEPI")
 I $D(@INS@(V)) Q "."_$P($$AFGR^%QFGRACT(@INS@(V)),".",2)
 Q ""
INCOMP(VT1,V,C) 
 N INC S INC=@VT@("INC")
 I $D(@INC@(V)) Q "."_$P($$AFGR^%QFGRACT(@INC@(V)),".",2)
 Q ""

