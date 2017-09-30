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

;%AMUTXT2^INT^1^59547,73865^0
%AMUTXT2 ;;06:46 PM  15 Nov 1993;
 
 
 
 
 
 
AFFIFEN(TITRE,GLO,ROUMORE) 
 Q $$FENETRE(TITRE,GLO,ROUMORE,10,10,60,9)
 
FENETRE(TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT) 
 N RES
 S ETU=$$INIT(TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT)
 D AFF(ETU)
 S RES=$$RUN(ETU)
 D KILLAFF(ETU)
 D KILL(ETU)
 Q RES
 
INIT(TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT) 
 N ETU,VAR
 N NBLIG,COUR,DEB,TOT,LAR,LGTH,EXIMORE,ACOUR,IA,DEBO
 S ETU=$$TEMP^%SGUTIL
 S NBLIG=9,COUR=1,DEB=1,TOT=@GLO,LAR=58,ACOUR=1,IA=0,DEBO=1
 S LGTH=$$TEMP^%SGUTIL
 S EXIMORE=ROUMORE'=""
 D SAVCOUR
 Q ETU
AFF(ETU) 
 N VAR
 N TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT,NBLIG,COUR,DEB,TOT,LAR,LGTH,EXIMORE,ACOUR,IA,DEBO
 N I,LIG,P,J,AFF
 D RESCOUR
 W /WOPEN(POSX,POSY,LARG,HAUT,1,"","",TITRE,"tc")
 S IA=0
 W /COLOR(7,1)
 W /CLR S DX=1,I=DEB
 G:'($D(@GLO@(I))) AGA
 W:I=COUR /COLOR(1,7)
 S LIG=@GLO@(I),P=1
 F J=1:1 Q:J=DEBO  S LIG=$E(LIG,LAR+1,$L(LIG))
 I DEBO=1 S J=1,AFF=$E(LIG,1,P+LAR),IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+1,DX=0
 F J=1:1 S AFF=$E(LIG,P,(P+LAR)+1) Q:AFF=""  S IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+2
 W:I=COUR /COLOR(7,1)
 S DX=1,I=I+1
 G NXL
NXL G:'($D(@GLO@(I))) AGA
 W:I=COUR /COLOR(1,7)
 S LIG=@GLO@(I),P=1
 S J=1,AFF=$E(LIG,1,P+LAR),IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+1,DX=0
 F J=1:1 S AFF=$E(LIG,P,(P+LAR)+1) Q:AFF=""  S IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+2
 W:I=COUR /COLOR(7,1)
 S DX=1,I=I+1
 G NXL
CUT S DX=1 W:I=COUR /COLOR(1,7)
AGA 
 D SAVCOUR
 Q
 
KILLAFF(ETU) W /WCLOSE Q
KILL(ETU) K @(ETU) Q
 
 
 
 
 
 
RUN(ETU) 
 N VAR
 N TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT,NBLIG,COUR,DEB,TOT,LAR,LGTH,EXIMORE,ACOUR,IA,DEBO
 N I,LIG,P,J,AFF
 D RESCOUR
 G AGARUN
ALLRUN S ACOUR=1
 W /CLR S DX=1,I=DEB,IA=0
NXLRUN G:'($D(@GLO@(I))) AGARUN
 W:I=COUR /COLOR(1,7)
 S LIG=@GLO@(I),P=1
 S J=1,AFF=$E(LIG,1,P+LAR),IA=IA+1 G:IA>NBLIG CUTRUN S DY=IA-1 X XY W AFF S P=(P+LAR)+1,DX=0
 F J=1:1 S AFF=$E(LIG,P,(P+LAR)+1) Q:AFF=""  S IA=IA+1 G:IA>NBLIG CUTRUN S DY=IA-1 X XY W AFF S P=(P+LAR)+2
 S DX=1 W:I=COUR /COLOR(7,1) S I=I+1
 G NXLRUN
CUTRUN S DX=1
 W:I=COUR /COLOR(1,7)
AGARUN D:(TOT'=0)&EXIMORE MORE
NO R *x
 
 I TOT'=0 W:EXIMORE /WCLOSE,/COLOR(7,1)
 G:x=1 UP G:x=11 DOWN G:x=13 RETURN
 I $D(ttttt) D SAVCOUR Q:x=27 -1 S TOUCHE=x Q COUR
 G:x'=27 NO
 
 
 
 D SAVCOUR
 Q -1
 
 D:(TOT'=0)&EXIMORE MORE
 G NO
 
UP G:COUR=1 AGARUN
 I (ACOUR-$$L(COUR-1))<1 S COUR=COUR-1,DEB=COUR,DEBO=1 G ALLRUN
 S DY=ACOUR-1 X XY W @GLO@(COUR)
 S COUR=COUR-1
 S ACOUR=ACOUR-$$L(COUR)
 S DY=ACOUR-1 X XY W /COLOR(1,7),@GLO@(COUR),/COLOR(7,1)
 G AGARUN
 
DOWN G:COUR=TOT AGARUN
 I ((ACOUR+$$L(COUR))+$$L(COUR+1))>(NBLIG+1) G SCRD
 I ACOUR=NBLIG S DEB=DEB+1,COUR=COUR+1,DEBO=1 G ALLRUN
 G:COUR=TOT NO
 
 S DY=ACOUR-1 X XY W @GLO@(COUR)
 S ACOUR=ACOUR+$$L(COUR)
 S COUR=COUR+1,DY=ACOUR-1 X XY W /COLOR(1,7),@GLO@(COUR),/COLOR(7,1)
 G AGARUN
SCRD W /CLR
 S COUR=COUR+1,ACOUR=(NBLIG-$$L(COUR))+1
 S I=COUR,IA=NBLIG+1
SCRDB I IA'>1 S DEB=I+1 G SCRDF
 I (IA-$$L(I))>0 S IA=IA-$$L(I) W:I=COUR /COLOR(1,7) S DY=IA-1 X XY W @GLO@(I) W:I=COUR /COLOR(7,1) S I=I-1 G SCRDB
 S NBLI=$$L(I),LIG=@GLO@(I)
 S P=0 F J=IA:1:NBLI S P=(P+LAR)+2
 S DEB=I
 S DEBO=(NBLI-IA)+2
 S IA=0,DX=0
 F J=1:1 S AFF=$E(LIG,P,(P+LAR)+1) Q:AFF=""  S IA=IA+1,DY=IA-1 X XY W AFF S P=(P+LAR)+2
 S DX=1
SCRDF G AGARUN
 
SAVCOUR F VAR="TITRE","GLO","ROUMORE","POSX","POSY","LARG","HAUT","NBLIG","COUR","DEB","TOT","LAR","LGTH","EXIMORE","ACOUR","DEBO" S:$D(@VAR) @ETU@(VAR)=@VAR
 Q
RESCOUR F VAR="TITRE","GLO","ROUMORE","POSX","POSY","LARG","HAUT","NBLIG","COUR","DEB","TOT","LAR","LGTH","EXIMORE","ACOUR","DEBO" S:$D(@ETU@(VAR)) @(VAR_"=@ETU@(VAR)")
 Q
 
L(II) N V I $D(@LGTH@(II)) S V=@LGTH@(II) Q V
 S V=($L(@GLO@(II))\LAR)+1,@LGTH@(II)=V Q V
 
RETURN 
 
 
 D SAVCOUR
 Q COUR
 
MORE N VALAFF,NBL,NBC,IL,DX,DY
 S @("VALAFF="_ROUMORE_"(COUR)")
 S NBL=$L(VALAFF,$C(0))
 S NBC=1 F IL=1:1:NBL S:$L($P(VALAFF,$C(0),IL))>NBC NBC=$L($P(VALAFF,$C(0),IL))
 W /COLOR(1,7),/WOPEN(70-NBC,3,NBC+2,NBL,1,"","","","tc") D CUROF^%VVIDEO
 F IL=1:1:NBL S DX=0,DY=IL-1 X XY W $P(VALAFF,$C(0),IL)
 Q
 
TEST N TEMP
 S TEMP=$$TEMP^%SGUTIL
 F I=1:1:30 S @TEMP@(I)=I_$$TL
 S @TEMP=30
 S (A,B)=""
 S r=$$AFFIFEN("titre",TEMP,"$$UCM^%AMUTXT2")
 
 Q
TEST2 N TEMP
 S TEMP=$$TEMP^%SGUTIL
 F I=1:1:30 S @TEMP@(I)=I_$$TL
 S @TEMP=30
 S (A,B)=""
 S ETU=$$INIT("titre",TEMP,"$$UCM^%AMUTXT2",10,10,60,9)
 F  D AFF(ETU) S RES=$$RUN(ETU) D KILLAFF(ETU) Q:RES=-1  D ^%VZEAVT("on repart"_@ETU@("DEB"))
 D KILL(ETU)
 Q
 
UCM(I) Q I
 
TL() N R S R=$R(3)
 Q:R=0 "eme ligne"
 Q:R=1 " eme ligne, mais n'est-elle pas un peu longue ? c'est possible mais elle devrait etre wrappee"
 Q:R=2 " eme ligne, mais n'est-elle pas un peu longue ? c'est possible mais elle devrait etre wrappee d'autant plus qu'on a encore rajoute des infos"

