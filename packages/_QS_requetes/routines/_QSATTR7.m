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

;%QSATTR7^INT^1^59547,73880^0
%QSATTR7 ;; ; 10 Jul 92 12:20 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DIA(O,BA,DIA,NJEU) 
 N %II,%III,%X,ACCORD,NB,NF,NUM,NUM2,OK,VAL,VAL2,X,TEMP,VALJEU,JEU,%IINF
 K ^LTAN($J),^LTANBIS($J),ROUTAFF
 S ROUTAFF="REAF^%QSATTRI"
 I '($D(^[QUI]TLDIAL(DIA))) D ^%VZEAVT($$^%QZCHW("le dialogue")_" "_DIA_" "_$$^%QZCHW("n'existe pas")) Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TABPR=$$CONCAS^%QZCHAD(TEMP,"ATPR")
 
 D INDIV^%QSATPR($$NOMLOG^%QSF(BA),O,TABPR)
 G:NJEU'="" SJEU
JEU S NJEU=""
 I $D(^[QUI]TLDIALF(DIA)) D CHOIXJ(DIA,.NJEU)
SJEU S VALJEU=$$CONCAS^%QZCHAD(TEMP,"VALJEU") K @(VALJEU)
 S JEU=$S(NJEU="":0,1:1)
 D CLEPAG^%VVIDEO,TITRE
 S (NUM,NUM2)=0,(OK,ACCORD)=0,NF=""
 F %IINF=1:1 S NF=$O(^[QUI]TLDIAL(DIA,NF)) Q:NF=""  S X="" F %X=1:1 S X=$O(^[QUI]TLDIAL(DIA,NF,X)) Q:X=""  S VAL=^[QUI]TLDIAL(DIA,NF,X),NB=$L(VAL,"^") D ATTR
 I ('(OK))&ACCORD S DX=0,DY=0 X XY D OUI G MEN2
 I OK&('(ACCORD)) S DX=0,DY=0 X XY D NON G FIND
 
MEN N MEN,CTR,ADR
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MENU") K @(MEN)
 S @MEN@(1)=$$^%QZCHW("individuel")_"^NPAQT",@MEN@(1,"COM")=$$^%QZCHW("acces aux attributs : indices de maniere individuelle")
 S @MEN@(2)=$$^%QZCHW("par paquet")_"^PAQT",@MEN@(2,"COM")=$$^%QZCHW("acces aux attributs paquets : tous indices par le meme numero d'ordre")
 S:$D(^[QUI]TLDIALF(DIA)) @MEN@(3)=$$^%QZCHW("jeux valeurs")_"^MJEU",@MEN@(3,"COM")=$$^%QZCHW("choix d'un jeux de valeurs : valeurs par defaut des attributs du dialogue")
ACTD S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MEN,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FIND G:ADR'="" @ADR G ACTD
FIND D CLEPAG^%VVIDEO K:$D(TEMP) @(TEMP) Q
NPAQT D NON G ACTD
PAQT D OUI G ACTD
MJEU D CLEPAG^%VVIDEO G JEU
 
MEN2 
 N MEN2,CTR,ADR
 S MEN2=$$CONCAS^%QZCHAD(TEMP,"MENU2") K @(MEN2)
 S @MEN2@(1)=$$^%QZCHW("indice")_"^IND",@MEN2@(1,"COM")=$$^%QZCHW("changement d'indice")
 I $D(^[QUI]TLDIALF(DIA)) S @MEN2@(2)=$$^%QZCHW("jeux valeurs")_"^MJEU",@MEN2@(2,"COM")=$$^%QZCHW("choix d'un jeux de valeurs : valeurs par defaut des attributs du dialogue")
ACTD2 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MEN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FIND G:ADR'="" @ADR G ACTD2
 
IND D OUI G ACTD2
 
ATTR N VALJ,V,VALDEF,%III
 I JEU=1,$D(^[QUI]TLDIALF(DIA,NF,X,NJEU)) S VALJ=^[QUI]TLDIALF(DIA,NF,X,NJEU)
 F %III=1:1:NB S VAL2=$P(VAL,"^",%III) I VAL2'="" D TEST I JEU=1,$D(VALJ) S VALDEF=$P(VALJ,"^",%III),VALDEF=$$GETLBLAN^%VTLBLAN(VALDEF) I VALDEF'="" S @VALJEU@(VAL2)=VALDEF
 Q
TEST Q:$$TYPE^%QSGEST9(BA,VAL2)'=0
 I '($D(@TABPR@(VAL2))) G TES1
 I $$AIR^%QSGE5(BA,O,VAL2) G TES1
 
 
 D PA^%QSGESTI(BA,O,VAL2,$S($D(VALJ):$P(VALJ,"^",%III),1:@TABPR@(VAL2)),1)
TES1 I X="O" S ACCORD=1,NUM2=NUM2+1,^LTANBIS($J,NUM2,VAL2)="" Q
 S NUM=NUM+1,OK=1
 S ^LTAN($J,NUM,VAL2)=$$^%QSCALVA(BA,O,VAL2)
 Q
NON 
 D AFT("individuel")
 D SELECT^%QSATTRI(O,BA,1,4,79,17,"^LTAN($J)",.JEU)
 Q
OUI 
 D AFT("par paquet")
 D PAQDIA^%QSATTRI(O,BA,1,4,79,17,DIA,"^LTANBIS($J)",.JEU)
 Q
TITRE 
 N MSG
 S DX=0,DY=1 X XY W $J("",64)
 S MSG=$$^%QZCHW("dialogue")_" "_DIA
 D ^%VZCD(0,79,0,2,0,0,$S(JEU=1:MSG_"    "_$$^%QZCHW("jeu de valeurs")_" "_NJEU,1:MSG))
 Q
AFT(M) 
 S DX=65,DY=1 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO
 X XY W $$^%QZCHW(M) X XY D NORM^%VVIDEO
 S DX=0,DY=4 X XY D CLEBAS^%VVIDEO Q
 
 
CHJEU(DIA,NJEU) 
 D CHOIXJ(DIA,.NJEU),^%VZEATT,NEWJ,TITRE
 Q
 
NEWJ N %II,%X,NB,NF,VAL,X
 K @(VALJEU),^LTAN($J),^LTANBIS($J)
 S JEU=$S(NJEU="":0,1:1) Q:JEU=0
 S NF=""
 F %II=1:1 S NF=$O(^[QUI]TLDIAL(DIA,NF)) Q:NF=""  S X="" F %X=1:1 S X=$O(^[QUI]TLDIAL(DIA,NF,X)) Q:X=""  S VAL=^[QUI]TLDIAL(DIA,NF,X),NB=$L(VAL,"^") D ATTR
 Q
 
 
CHOIXJ(DIA,NJEU) 
ENC D POCLEPA^%VVIDEO
 S NJEU=$$^%VZAME1($$^%QZCHW("nom du jeu de valeur")_" : ")
 G:NJEU="?" AFFD
EXIJV Q:NJEU=""
 N %J1,%J2,%J3,NF,TYP,JEUV,JVAL
 S JVAL=$$CONCAS^%QZCHAD(TEMP,"JVAL") K @(JVAL)
 S NF=""
 F %J1=1:1 S NF=$O(^[QUI]TLDIALF(DIA,NF)) Q:NF=""  S TYP="" F %J2=1:1 S TYP=$O(^[QUI]TLDIALF(DIA,NF,TYP)) Q:TYP=""  S JEUV="" F %J3=1:1 S JEUV=$O(^[QUI]TLDIALF(DIA,NF,TYP,JEUV)) Q:JEUV=""  S @JVAL@(JEUV)=""
 I '($D(@JVAL@(NJEU))) D ^%VZEAVT($$^%QZCHW("ce jeu de valeurs n'existe pas")) G ENC
 Q
AFFD D CHOIXJ^%TLTRDIA(DIA,.NJEU),CLEPAG^%VVIDEO
 G EXIJV
 
 
CHIND(DIA,XG,YH,LA,HA) 
 N %N,GL,I,IND,LIS,NF,NFI,TABI
CHI D POCLEPA^%VVIDEO
 S IND=$$^%VZAME1($$^%QZCHW("quel est l'indice de l'ensemble des attributs")_" : ")
 Q:IND'="?" IND
 S GL="^[QUI]TLDIALI("""_DIA_""")"
 S TABI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INDICE") K @(TABI)
 S NF=""
NF S NF=$O(@GL@(NF)) G:NF="" AFFI
 S NFI=""
NFI S NFI=$O(@GL@(NF,"O",NFI)) G:NFI="" NF
 S LIS=@GL@(NF,"O",NFI)
 F %N=1:1:11 S I=$P(LIS,"^",%N) I I'="" S @TABI@(I)=""
 G NFI
 
AFFI I '($D(@TABI)) D ^%VZEAVT($$^%QZCHW("aucune valeur possible n'a ete definie")) G CHI
 D CLFEN^%VVIDEO(XG,YH,HA,LA)
 D INIT^%QUCHOIP(TABI,1,"",XG,YH,LA,HA),AFF^%QUCHOIP
 S IND=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(XG,YH,HA,LA)
 K @(TABI)
 Q IND
 ;
 ;
 ;

