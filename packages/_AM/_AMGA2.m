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

;%AMGA2^INT^1^59547,73865^0
%AMGA2 ;;12:17 PM  8 Nov 1993;
 
AFFFEN I NBFAFF=0 G POPNOR
 
 
 I NBFAFF<LIMFAFF D:BEAU SCROLL^%AMGA2(@LFEN,@LFEN@(@LFEN,"JRN"),@LFEN@(@LFEN,"INST"),ORIGX,ORIGY,0) G POPNOR
 
 F IFF=1:1:LIMFAFF W /WCLOSE,/WCLOSE S NBFAFF=NBFAFF-1
 I @LFEN=LIMFAFF W /WOPEN(0,0,59,9,"","","","",""),/COLOR(5,5),/CLR,/AA
 S ORIGX=DEBX,ORIGY=DEBY
 S ORSC=(@LFEN-LIMFAFF)+2
 
 F IFF=ORSC:1:@LFEN D POPUP^%AMGA2,AFFIFEN^%AMGA2(IFF,@LFEN@(IFF,"JRN"),@LFEN@(IFF,"INST"),ORIGX,ORIGY,0) S NBFAFF=NBFAFF+1
POPNOR S @LFEN=@LFEN+1,@LFEN@(@LFEN,"JRN")=JRN,@LFEN@(@LFEN,"INST")=INST
 D POPUP^%AMGA2
 
 D AFFIFEN^%AMGA2(@LFEN,JRN,INST,ORIGX,ORIGY,1) S NBFAFF=NBFAFF+1
 Q
 
 
AFFIFEN(NUMF,JRN,INST,ORIGX,ORIGY,LAST) 
 N TITRE,HEUR,TX,ICOM,%IC
 S TX=@GJOURN@(INST)
 S ICOM=INST F %IC=0:0 Q:$D(@GJOURN@(ICOM,"D"))  S ICOM=$ZP(@GJOURN@(ICOM))
 S GEN=@GJOURN@(ICOM,"D")
 S HEUR=$P(TX,$C(0))
 S TITRE=JRN_" : le "_$$DATEX^%QMDATE(HEUR)_" a "_$$HEUREX^%QMDATE(HEUR)
 W /WOPEN(ORIGX,ORIGY,60,9,1,"","",TITRE,"tc")
 W:LAST /COLOR(0,3),/CLR
 S TYPE=$P(TX,$C(0),2)
 I $D(@DEFETU@("fille",INST)) S DX=56,DY=8 X XY W "==>"
 S DX=0,DY=0 X XY W "objet de type "_TYPE,?50,INST
 I $D(@LMARK@(NUMF)),@LMARK@(NUMF)=(JRN_"^"_INST) W ?58,"*"
 D @^%RQSGLO("EXPLIC",@MOTEUR,"ROUFEN") W /AA
 W /WOPEN(ORIGX,ORIGY+11,60,3,1,"","","regle","tc")
 W:LAST /COLOR(0,3),/CLR
 D CUROF^%VVIDEO
 D:TYPE'="TEXTE" @^%RQSGLO("EXPLIC",@MOTEUR,"ROUFENRG") W /AA
 W /AA
 Q
 
 
 
SCROLL(NUMF,JRN,INST,ORIGX,ORIGY,LAST) 
 N TITRE,HEUR,TX,ICOM,%IC
 
 W /WCLOSE
 S TX=@GJOURN@(INST)
 S ICOM=INST F %IC=0:0 Q:$D(@GJOURN@(ICOM,"D"))  S ICOM=$ZP(@GJOURN@(ICOM))
 S GEN=@GJOURN@(ICOM,"D")
 S HEUR=$P(TX,$C(0))
 W:LAST /COLOR(0,3)
 W /CLR
 S TYPE=$P(TX,$C(0),2)
 I $D(@DEFETU@("fille",INST)) S DX=56,DY=8 X XY W "==>"
 S DX=0,DY=0 X XY W "objet de type "_TYPE,?50,INST
 I $D(@LMARK@(NUMF)),@LMARK@(NUMF)=(JRN_"^"_INST) W ?58,"*"
 D @^%RQSGLO("EXPLIC",@MOTEUR,"ROUFEN")
 W /AA
 W /WOPEN(ORIGX,ORIGY+11,60,3,1,"","","regle "_$P(GEN,$C(0),4),"tc")
 W:LAST /COLOR(0,3),/CLR
 D CUROF^%VVIDEO
 D:TYPE'="TEXTE" @^%RQSGLO("EXPLIC",@MOTEUR,"ROUFENRG")
 W /AA
 Q
 
 
 
 
POPUP G:SENS=2 POPUP2
 I ORIGX<17 S ORIGX=ORIGX+DECX,ORIGY=ORIGY+DECY Q
 S ORIGX=2,SENS=2 Q
POPUP2 I ORIGX<17 S ORIGX=ORIGX+DECX,ORIGY=ORIGY-DECY Q
 S ORIGX=2,SENS=1 Q
POPDOWN G:SENS=2 POPDWN2
 I ORIGX>3 S ORIGX=ORIGX-DECX,ORIGY=ORIGY-DECY Q
 S ORIGX=17,SENS=2 Q
POPDWN2 I ORIGX>3 S ORIGX=ORIGX-DECX,ORIGY=ORIGY+DECY Q
 S ORIGX=17,SENS=1 Q
 
NOFOUND W /COLOR(7,6),/WOPEN(60,3,12,1,1,"","","","tc") D CUROF^%VVIDEO
 W "non trouve" R *zzz
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
NODISPO W /COLOR(7,6),/WOPEN(40,3,20,1,1,"","","","tc") D CUROF^%VVIDEO
 W "non disponible" R *zzz
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
ECHEC W /COLOR(7,6),/WOPEN(60,3,12,1,1,"","","","tc") D CUROF^%VVIDEO
 W "echec" R *zzz
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q
 
TEST N GCHAINE,GJOURN,GEXEC
 S GCHAINE=$$TEMP^%SGUTIL,GJOURN=$$TEMP^%SGUTIL,GEXEC=$$TEMP^%SGUTIL
 F t=1:1:10 S @GCHAINE@(t)=t-1 D GEN
 D JOURN^%AMGA1(GCHAINE,GJOURN,GEXEC)
 Q
GEN S @GJOURN@(t,"D")="RESEAU TEST"_$C(0)_"ETAT TEST"_$C(0)_"TTRT1"_$C(0)_"REGI"_$C(0)_"rep"_$C(0)_"ind"
 S @GJOURN@(t,"T")="LONGUEUR = LONGUEUR * 3"
 F i=1:1:10 S @GJOURN@(t,"H",i)=$H_$C(0)_"ATTRIBUT"_$C(0)_"ARTICLE"_$C(0)_"TEST"_$C(0)_"LONGUEUR"_$C(0)_1_$C(0)_i,@GEXEC@("ATTRIBUT","ARTICLE","TEST","LONGUEUR",1,t,i)=i*3
 Q
 ;

