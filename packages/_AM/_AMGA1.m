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

;%AMGA1^INT^1^59547,73865^0
%AMGA1 ;;12:19 PM  8 Nov 1993;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
JRN(JRN) 
 N LFEN,BEAU,SENS,MOTEUR,GG,GJOURN,GEXEC,MOTEUR
 N TIMEWAIT,profondeur
 D INIVAR^%AMG
 S TOUCHE=$$TEMP^%SGUTIL,GG=$$TEMP^%SGUTIL,LAST=$$TEMP^%SGUTIL
 K ^%vidx($ZZNODE,$J)
 D MENUGEN
 
 D CLEPAG^%VVIDEO
 
 S profondeur="OUI",TIMEWAIT=1
 
 D ^%AMGCAR
 
 
 S LFEN=$$TEMP^%SGUTIL,LMARK=$$TEMP^%SGUTIL
 S BEAU=1,@LFEN=0,SENS=1
 D CLEPAG^%VVIDEO
 D shortwin^%funckey(),AFFKEY
 
 S INST=$ZP(@GJOURN@("")) Q:INST=""
 S DEBX=-3,DEBY=0,DECX=5,DECY=2,ORIGX=DEBX,ORIGY=DEBY
 S NBFAFF=0
 S LIMFAFF=4
 
NXFEN D AFFFEN^%AMGA2
ACT R *xx
 G:xx=21 TOP G:xx=22 BOT G:xx=23 FENPL G:xx=24 FENMO
 G:xx=28 OBJ G:xx=29 REG G:xx=27 ESCA G:xx=26 TRACER G:xx=25 EXPOSE G:xx=31 CARAC
 S MENUCOUR=MENUGEN,MENURET="ACT^%AMGA1"
 G:xx=2 CTRLB^%AMGAO G:xx=5 CTRLE^%AMGAO
 G:xx=13 AUTOM^%AMGAO G:xx=30 AGAIN^%AMGAO
 G:xx=12 CTRLL^%AMGAO
 G:xx=4 DEMO
 I xx'=0 W *7 G ACT
 R *yy
 G:yy=133 MARK G:yy=134 GOMARK
 W *7 G ACT
 
 
FENPL I $$NEXT^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","") D FEN2 G ACT
 W *7 G ACT
 
DEMO I '($$NEXT^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","")) G ACT
 S JRN=NJRN,INST=NINST G NXFEN
 
FENMO I $$FIND^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","") D FEN2 G ACT
 W *7 G ACT
 
 
TOP I INST'=$O(@GJOURN@("")) S INST=$O(@GJOURN@("")) D CHGFEN G ACT
 I $$FIND^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","") D FEN2 G ACT
 W *7 G ACT
 
 
BOT I INST'=$ZP(@GJOURN@("")) S INST=$ZP(@GJOURN@("")) D CHGFEN G ACT
 I $$NEXT^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","") D FEN2 G ACT
 W *7 G ACT
 
 
MARK I $D(@LMARK@(@LFEN)),@LMARK@(@LFEN)=(JRN_"^"_INST) K @LMARK@(@LFEN) D CHGFEN G ACT
 S @LMARK@(@LFEN)=JRN_"^"_INST D CHGFEN G ACT
 
 
GOMARK I $D(@LMARK@(@LFEN)),@LMARK@(@LFEN)'=(JRN_"^"_INST) S JRN=$P(@LMARK@(@LFEN),"^"),INST=$P(@LMARK@(@LFEN),"^",2) D CHGFEN G ACT
 S NXF=$ZP(@LMARK@(@LFEN)) G:NXF="" ACT
 I @LFEN>LIMFAFF G GOM1
 F %I=0:0 Q:@LFEN=NXF  D ENDUTI(@LFEN,1) S NBFAFF=NBFAFF-1,@LFEN=@LFEN-1 D POPDOWN^%AMGA2
 S JRN=$P(@LMARK@(@LFEN),"^"),INST=$P(@LMARK@(@LFEN),"^",2) D CHGFEN
 G ACT
GOM1 F %I=0:0 Q:@LFEN=NXF  K @LMARK@(@LFEN) S @LFEN=@LFEN-1
 F IFF=1:1:LIMFAFF W /WCLOSE,/WCLOSE S NBFAFF=NBFAFF-1
 I NXF'>LIMFAFF W /WCLOSE
 S ORIGX=DEBX,ORIGY=DEBY
 S ORSC=(@LFEN-LIMFAFF)+1,ORSCF=@LFEN-1 S:ORSC<1 ORSC=1
 F IFF=ORSC:1:ORSCF D POPUP^%AMGA2,AFFIFEN^%AMGA2(IFF,@LFEN@(IFF,"JRN"),@LFEN@(IFF,"INST"),ORIGX,ORIGY,0) S NBFAFF=NBFAFF+1
 S (JRN,@LFEN@(@LFEN,"JRN"))=$P(@LMARK@(@LFEN),"^")
 S (INST,@LFEN@(@LFEN,"INST"))=$P(@LMARK@(@LFEN),"^",2)
 D POPUP^%AMGA2,AFFIFEN^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1) S NBFAFF=NBFAFF+1
 G ACT
 
 
ESCA I $D(@LFEN@(@LFEN,"ETUREG")) S ETUREG=@LFEN@(@LFEN,"ETUREG") D KILLAFF^%AMUTXT2(ETUREG),KILL^%AMUTXT2(ETUREG) G ACT
 W /WCLOSE,/WCLOSE S NBFAFF=NBFAFF-1
 K @LMARK@(@LFEN)
 S @LFEN=@LFEN-1 G:@LFEN=0 FIN
 G:@LFEN<LIMFAFF ESCA2
 F IFF=1:1:LIMFAFF-1 W /WCLOSE,/WCLOSE W:$D(@LFEN@(@LFEN-IFF,"ETUREG")) /WCLOSE S NBFAFF=NBFAFF-1
 I @LFEN=LIMFAFF W /WCLOSE
 S ORIGX=DEBX,ORIGY=DEBY
 S ORSC=(@LFEN-LIMFAFF)+1,ORSCF=@LFEN@-1
 F IFF=ORSC:1:ORSCF D POPUP^%AMGA2,AFFIFEN^%AMGA2(IFF,@LFEN@(IFF,"JRN"),@LFEN@(IFF,"INST"),ORIGX,ORIGY,0) D:$D(@LFEN@(IFF,"ETUREG")) AFF^%AMUTXT2(@LFEN@(IFF,"ETUREG")) S NBFAFF=NBFAFF+1
 S JRN=@LFEN@(@LFEN,"JRN"),INST=@LFEN@(@LFEN,"INST")
 D POPUP^%AMGA2,AFFIFEN^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1) S NBFAFF=NBFAFF+1
 I $D(@LFEN@(@LFEN,"ETUREG")) S ETUREG=@LFEN@(@LFEN,"ETUREG") G REPRAFF^%AMGAR
 G ACT
ESCA2 S ETUREG="" I $D(@LFEN@(@LFEN,"ETUREG")) S ETUREG=@LFEN@(@LFEN,"ETUREG") W /WCLOSE
 S JRN=@LFEN@(@LFEN,"JRN"),INST=@LFEN@(@LFEN,"INST") D POPDOWN^%AMGA2
 
 D SCROLL^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1)
 I ETUREG'="" G REPRAFF^%AMGAR
 G ACT
 
EXPOSE D FENEXPO
EXPO2 I '($$NEXT^%AMFIND2(JRN,INST,.NJRN,.NINST,"",profondeur,"","","","","","","")) W /WCLOSE G ACT
 W /WCLOSE
 D FEN2,FENEXPO H TIMEWAIT
 I $$ISCTRLA^%SYSCLAV W /WCLOSE G ACT
 G EXPO2
 
FENEXPO W /COLOR(7,6),/WOPEN(60,1,16,1,1,"","","","tc") D CUROF^%VVIDEO W "expose en cours " Q
 
TRACER S TYPE=$$CHOIXOBJ^%AMGAT(@MOTEUR,$$^%QZCHW("Quel est le type de l'objet a tracer ?")) G:TYPE="" ACT
 S NBKEY=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS")
 F I=1:1:6 S @GG@(I)=""
 G:'($$GET^%AMGAO2(GG,TYPE,$$^%QZCHW("tracer les evolutions d'un objet de type "_TYPE))) ACT
 D FENEXPO
TRAC2 I '($$NEXT^%AMFIND2(JRN,INST,.NJRN,.NINST,TYPE,profondeur,NBKEY,@GG@(1),@GG@(2),@GG@(3),@GG@(4),@GG@(5),@GG@(6))) K @(GG) W /WCLOSE G ACT
 W /WCLOSE
 D FEN2,FENEXPO H TIMEWAIT
 I $$ISCTRLA^%SYSCLAV W /WCLOSE G ACT
 G TRAC2
 
 
OBJ G OBJ^%AMGAO
 
 
REG G REG^%AMGAR
 
CARAC D ^%AMGCAR G ACT
 
FIN D ^%funckey("")
 D longwin^%funckey()
 Q
 
ENDUTI(FEN,KILL) 
 N ETUREG
 W /WCLOSE,/WCLOSE
 Q:'($D(@LFEN@(FEN,"ETUREG")))
 S ETUREG=@LFEN@(FEN,"ETUREG") D KILLAFF^%AMUTXT2(ETUREG) D:KILL KILL^%AMUTXT2(ETUREG)
 Q
 
FEN1 S INST=NINST,JRN=NJRN
 
CHGFEN 
 W /WCLOSE,/WCLOSE
 
 S @LFEN@(@LFEN,"JRN")=JRN,@LFEN@(@LFEN,"INST")=INST
 D AFFIFEN^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1)
 Q
 
 
 S @LFEN@(@LFEN,"JRN")=JRN,@LFEN@(@LFEN,"INST")=INST
 D SCROLL^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1)
 Q
 
 
FEN2 I NJRN'=JRN W /COLOR(7,6),/WOPEN(55,1,20,1,1,"","","","tc") D CUROF^%VVIDEO W $$^%QZCHW("changement d'etude") H 1 D CURON^%VVIDEO W /WCLOSE,/AA
 G FEN1
 
 
AFFKEY D ^%funckey(MENUGEN) Q
 
 
MENUGEN S MENUGEN="top,bottom,+,-,expose,tracer,objets,regle,encore,caract" Q

