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

;%SDCEDIT^INT^1^59547,73888^0
SDCEDIT ;
 
 
 
 
 N %C,%R,COL,IMPR,PK,SOR,VERS,X,Y
DEB 
 D ^%SDCOL($$^%QZCHW("Impression d'une collection"),1,.COL,.VERS)
 
 I COL="" Q
 K PK
SOR 
 S DX=10,DY=13 D CLEBAS^%VVIDEO W $$^%QZCHW("Impression sur") S SOR=$$^%VZESOR("E") G:SOR=-1 DEB
 
 S IMPR="",DX=10,DY=16 X XY
 I SOR=1 S IMPR=$E($$^%VZECH2($$^%QZCHW("Impression")_" ","STANDARD","GRAPHIQUE"),1) G:IMPR=1 SOR
 G IMP
 
IMPR(COL,VERS,SOR,IMPR) 
 
IMP N %C,%R,CTR,IMP,LIGNE,LIM,NUM,PK,STO,TEMP,X,Y
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LIGNE=$$CONCAS^%QZCHAD(TEMP,"LIGNE")
 I SOR=0 S LIM=21,IMP=0 G IM2
 I IMPR="S" S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 E  S IMP=$S($D(^TABIDENT(WHOIS,"TABTRA")):^TABIDENT(WHOIS,"TABTRA"),1:0)
 S LIM=$S(IMPR="G":62,$D(^TABIDENT(WHOIS,"IMPRCOUR")):^TABIDENT(WHOIS,"IMPRCOUR")-5,1:60)
 O IMP
IM2 
 S STO=$$DEF^%SDCCMS(COL,VERS)
MEN 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Impression de la collection")_" "_COL_" ("_VERS_")",0)
 K @(LIGNE)
 K Y
 S Y="15\BLH\4\\\caracteristiques,objets,points,tout"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G MEN
 
 I X=2 G OBJET
 
 I X=3 G POINT
 
 I X=4 G TOUT
 
CARAC D IMPR^%SDCOCAR(COL,VERS,LIGNE)
 D AFFIC^%SDCEDI2
 G MEN
 
OBJET K Y,@(LIGNE)
 S Y="20\BLH\2\\\liste,tout"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G MEN
 I CTR'="" G OBJET
 
 I X=1 D IMPOB
 
 I X=2 D IMPOBE
 D AFFIC^%SDCEDI2
 G MEN
 
POINT K Y,@(LIGNE)
 S Y="20\BLH\2\\\liste,appartenance"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G MEN
 I CTR'="" G POINT
 
 I X=1 D IMPPT^%SDCEDI2
 
 I X=2 D IMPPTO^%SDCEDI2
 D AFFIC^%SDCEDI2
 G MEN
 
TOUT D IMPR^%SDCOCAR(COL,VERS,LIGNE)
 S @LIGNE@($ZP(@LIGNE@("z"))+1)=$C(0)
 D IMPOBE
 S @LIGNE@($ZP(@LIGNE@("z"))+1)=$C(0)
 D IMPPTO^%SDCEDI2
 D AFFIC^%SDCEDI2
 G MEN
 
FIN K @(TEMP)
 Q
 
IMPOB 
 N I,J,K,NOBJ,OBJ,VO
 S J=$ZP(@LIGNE@("z"))+1
 
 F I=J,J+1 S @LIGNE@(I)=" "
 S @LIGNE@(I+1)=$J("",30)_$$^%QZCHW("OBJETS")
 S @LIGNE@(I+2)=$J("",30)_"------"
 S @LIGNE@(I+3)=" "
 S @LIGNE@(I+4)=$$^%QZCHW("numero")_$J("",5)_$$^%QZCHW("nom")_$J("",20)_$$^%QZCHW("version")_$J("",7)_$$^%QZCHW("echelle")_" "_$$^%QZCHW("angle")_$J("",2)_"X0"_$J("",2)_"Y0"
 S @LIGNE@(I+5)=" "
 S I=I+6
 S NOBJ=""
 F K=1:1 S NOBJ=$O(@STO@("OBJ",NOBJ)) Q:NOBJ=""  D IMPO
 Q
 
IMPO 
 S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,""))
 S @LIGNE@(I)=$$JUST(NOBJ,8)_$$JUST(OBJ,25)_$$JUST(VO,16)_$$JUST(@STO@("OBJ",NOBJ,"ECH"),7)_$$JUST(@STO@("OBJ",NOBJ,"ANG"),7)_$$JUST(@STO@("OBJ",NOBJ,"X"),6)_$$JUST(@STO@("OBJ",NOBJ,"Y"),6)
 S I=I+1
 Q
 
JUST(CH,N) 
 Q $E(CH,1,N)_$J("",N-$L(CH))
 
IMPOBE 
 N ADR,I,J,K,NOBJ,NUM,OBJ,VO,TIT
 S J=$ZP(@LIGNE@("z"))+1
 
 F I=J,J+1 S @LIGNE@(I)=" "
 S @LIGNE@(I+1)=$J("",30)_$$^%QZCHW("OBJETS")
 S @LIGNE@(I+2)=$J("",30)_"------"
 S TIT(1)=$TR($J("",6)," ","*")_" "_$$^%QZCHW("Objet numero")_"  "
 S TIT(2)=$J("",10)_$$^%QZCHW("nom")_$J("",6)
 S TIT(3)=$J("",10)_$$^%QZCHW("version")_$J("",2)
 S TIT(4)=$J("",5)_$$^%QZCHW("echelle")_" = "
 S TIT(5)=$J("",5)_$$^%QZCHW("angle")_" = "
 S TIT(6)=$$^%QZCHW("abscisse point d'origine")_" = "
 S TIT(7)=$$^%QZCHW("ordonnee point d'origine")_" = "
 S I=I+3
 S NOBJ=""
BCLO S NOBJ=$O(@STO@("OBJ",NOBJ)) I NOBJ="" S @LIGNE@(I)=" " Q
 S @LIGNE@(I)=" ",@LIGNE@(I+1)=TIT(1)_NOBJ_" "_$TR($J("",6)," ","*")
 S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,""))
 S @LIGNE@(I+2)=" ",@LIGNE@(I+3)=TIT(2)_OBJ
 S @LIGNE@(I+4)=TIT(3)_VO
 S I=I+5,@LIGNE@(I)=" ",@LIGNE@(I+1)=TIT(4)_@STO@("OBJ",NOBJ,"ECH")_$J("",15)_TIT(6)_@STO@("OBJ",NOBJ,"X")
 S @LIGNE@(I+2)=TIT(5)_@STO@("OBJ",NOBJ,"ANG")_$J("",17)_TIT(7)_@STO@("OBJ",NOBJ,"Y")
 S I=I+3,@LIGNE@(I)=" "
 S ADR=$$TEXT^%SDOCMS(OBJ,VO)
 I '($D(@ADR)) S @LIGNE@(I+1)=$TR($J("",5)," ","-")_$$^%QZCHW("aucun element"),I=I+1 G FBCL
 S @LIGNE@(I+1)=$TR($J("",5)," ","-")_$$^%QZCHW("elements")
 S @LIGNE@(I+2)=" ",I=I+2
 S NUM=""
 F K=1:1 S NUM=$O(@ADR@(NUM)) Q:NUM=""  S I=I+1,@LIGNE@(I)=$J("",2)_$E(@ADR@(NUM),1,79)
FBCL S @LIGNE@(I+1)=" "
 S @LIGNE@(I+2)=$TR($J("",10)," ","*")
 S I=I+3
 G BCLO

