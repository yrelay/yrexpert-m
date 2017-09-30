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

;%ACHIDE5^INT^1^59547,73864^0
%ACHIDE5 ;
 
 
 
 
 
 
 
 
ACC N IND,N
 S M=0
 I $D(@STO@("SEL")) K @STO@("SEL") D AFF^%ACHIDEF
 D SELM(STO,SECT,1)
 S N=$O(@STO@("SEL",""))
 
 I N="" S M=1 G FAC
 D MAJ(1)
 S IND=SECT_","_$$NOM(N)
 
 D ^%QSATTRI(IND,REPFI,0,0,80,22)
 D MAJ(0)
FAC I M=0 D AFF^%ACHIDEF
 Q
 
MAJ(B) 
 I B=0 G REC
 I @STO@("MAJ")=1 Q
 D CREFILS^%ACHINDI(GLOSTO,SECT,REPPI,REPFI,LIEN,TEMPO)
 S @STO@("MAJ")=1
REC 
 K @GLOSTO@(SECT,"CAR"),@GLOSTO@(SECT,"ATR")
 D RECAR^%ACHINDI
 Q
 
 
DIS 
 I @STO@("DISTANCE")=1 Q
 
 D MAJ(1)
 D CALC^%ACHIDIS(GLOSTO,SECT,REPFI)
 Q
 
 
SELM(STO,SECT,TYP) 
 
 
 N %F,I,X1,N
 D POCLEPA^%VVIDEO X XY W $$^%QZCHW("CTRLA : sortie, CTRLF : execution, CTRLG : suppression, [RETURN] : selection")
 S DY=$O(@STO@("PLAN","")) S:DY'="" DX=$O(@STO@("PLAN",DY,""))+1,DY=DY+1
 I DY="" S DX=@STO@("POS","DXG"),DY=@STO@("POS","DYH")
DEP D POS^%ACHIDEF(DY,DX) X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,7,13 G:I=X1 @I
 G ER
B 
 I DY=@STO@("POS","DERY") S DY=@STO@("POS","DYH") G DEP
 S DY=(DY+HC)-1 G DEP
H 
 I DY=@STO@("POS","DYH") S DY=@STO@("POS","DERY") G DEP
 S DY=DY-(HC-1) G DEP
G 
 I DX=@STO@("POS","DXG") S DX=@STO@("POS","DERX") G DEP
 S DX=DX-(LC-1) G DEP
D 
 I DX=@STO@("POS","DERX") S DX=@STO@("POS","DXG") G DEP
 S DX=(DX+LC)-1 G DEP
1 I TYP'=2 K @STO@("SEL")
 I TYP=2 K @STO@("PAR")
 Q
6 Q
7 
 I TYP=2 G ER
 G:'($D(@STO@("PLAN",DY-1,DX-1))) ER
 S N=$P(@STO@("PLAN",DY-1,DX-1),"^",3) G:N="" D
 I $D(@STO@("SEL",N*1)) D AFFS(0,$P(@STO@("SEL",N*1),"^"),$P(@STO@("SEL",N*1),"^",2)) K @STO@("SEL",N*1)
 G D
13 
 G:'($D(@STO@("PLAN",DY-1,DX-1))) ER
 S N=$P(@STO@("PLAN",DY-1,DX-1),"^",3) G:N="" D
 
 I TYP=2 S @STO@("PAR",N*1)="" G 6
 I '($D(@STO@("SEL",N*1))) D AFFS(1,DY,DX) S @STO@("SEL",N*1)=DY_"^"_DX
 
 I TYP=1 G 6
 G D
ER D ^%VSQUEAK G DEP
 
AFFS(R,Y,X) 
 N DY,DX
 S DY=Y,DX=X X XY
 I R=1 D UDL^%VVIDEO X XY
 W $S(ATT="":N,$D(@STO@("CAR",N*1,ATT)):$E(@STO@("CAR",N*1,ATT),1,LC-2),1:$J("",LC-1))
 I R=1 D NORM^%VVIDEO
 Q
 
 
PARC 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Cette recherche peut etre tres longue, confirmez-vous")_" ?")'=1 Q
 N MODU,MEN,ADR,CTR,GLO
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MEN") K @(MEN)
 S @MEN@(1)=$$^%QZCHW("Groupe.selectionne")_"^"_"PGS",@MEN@(1,"COM")=$$^%QZCHW("Parcours sur les modules selectionnes")
 S @MEN@(2)=$$^%QZCHW("Selection")_"^"_"PSE",@MEN@(2,"COM")=$$^%QZCHW("Selection de modules")
 S @MEN@(3)=$$^%QZCHW("Tous")_"^"_"PAL",@MEN@(3,"COM")=$$^%QZCHW("Pour tous les modules")
ACP S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") K @(MEN),@STO@("PAR") Q
 G:ADR'="" @ADR G ACP
 
PGS S GLO=$$CONCAS^%QZCHAD(STO,"SEL")
 S ADR="CONS^%ACHIDE5"
 G PAR
 
PSE 
 D SELM(STO,SECT,0)
 I $D(@STO@("SEL")) D AFF^%ACHIDEF
 G PGS
 
PAL S GLO=$$CONCAS^%QZCHAD(STO,"PLNUM")
 S ADR="CONS^%ACHIPAR"
 G PAR
 
PAR 
 I '($D(@GLO)) G ACP
 
 D SELM(STO,SECT,2)
 S MODU=$O(@STO@("PAR","")) I MODU="" G ACP
 I '($D(@GLO@(MODU))) D ^%VZEAVT($$^%QZCHW("Ce module n'est pas un module selectionne")) G PAR
 S MODU=$$NOM(MODU)
 
 D DIS,PARC^%ACHIPAR(REPPI,SECT,REPFI,MODU,ADR)
 
 D VISU^%ACHIPAR(REPPI,SECT,REPFI,MODU)
 S M=0 D AFF^%ACHIDEF
 G ACP
 
CONS 
 N %I,ATD,FILS,I,J,V
 S ATD=$$ATDIST^%ACHINDI
 S FILS=$$LIEN1^%QSGEL2(REPPI,REPFI,2)
 
 S I="" F %I=0:0 S I=$$NXTRIAO^%QSTRUC8(REPPI,REPFI,FILS,I) Q:I=""  S V=$$VALEUR^%QSTRUC8(REPPI,REPFI,FILS,I) D PSV^%QSGESTI(REPFI,SECT_","_V,ATR)
 
 S I=""
 F %I=0:0 S I=$O(@STO@("SEL",I)) Q:I=""  S J="" F %I=0:0 S J=$O(@STO@("SEL",J)) Q:J=""  S NI=$$NOM(I),NJ=$$NOM(J),D=$$^%QSCALIN(REPFI,SECT_","_NI,ATD,NJ) S:D="" D=10E10 S @GLAM@(1,"LIG",NI,NJ)=D,@GLAM@(1,"COL",NJ,NI)=D
 Q
 
NOM(N) 
 Q $S($D(@STO@("CAR",N,"NOM")):@STO@("CAR",N,"NOM"),1:N)

