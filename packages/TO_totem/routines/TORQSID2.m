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

;TORQSID2^INT^1^59547,74875^0
TORQSID2 ;
 
 
 
 
 
 
 
 
 
 
 
 
NINDIV K ^POSENR($I),^VBIS($I),^POSFUL($I),^VALPAR($I),^DON($I)
 S PAGE=1,LI=10,LILIM=19 S:PREM NBTC=NBTC+1 S:'(PREM) PREM=1
 I ECRAN=1 S DX=24,DY=3 X XY W $$^%QZCHW("              ") D BLK^%VVIDEO,BLD^%VVIDEO,^%VCRIFLD(INDIVIDU,25,2,24,39),NORM^%VVIDEO
 W:ECRAN=0 "." Q
TRAIT 
 
 
 
 N VAL,TYPE
 D ^%QSCALVH(BASEL,INDIVIDU,"OBJET.TOTEM",.VAL,.TYPE)
 S VALOBJI=$$^%QCAZG("VAL(1)")
 S EXISTEI=$S(VALOBJI'="":1,1:0)
 I EXISTEI S OBJET=VALOBJI Q
 I EXISTEL S OBJET=VALOBJL Q
 I ECRAN=0 S SUIV="OBJET.TOTEM" D METTREL^TORQSIDF
 Q
AFF 
 D CLFEN^%VVIDEO(3,6,1,74),CLFEN^%VVIDEO(33,8,1,11),CLFEN^%VVIDEO(3,10,12,74),POCLEPA^%VVIDEO
 S DY=6,LIB=$$^%QZCHW("Individu traite : ")_^TRAITES($J,"CARD")_$$^%QZCHW("/")_NBTOT_$$^%QZCHW(" "),DX=38-($L(LIB)\2) D BLD^%VVIDEO,REV^%VVIDEO X XY W LIB K LIB D NORM^%VVIDEO
AFF0 D CUROF^%VVIDEO S MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBP,DX=34,DY=8 X XY W MSG S DY=-1 F %U=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  D AFF1^TORQSID2
 D CURON^%VVIDEO
FIN Q
EFF D CUROF^%VVIDEO S DX=3 F DY=10:1:21 X XY W $J("",73)
 S DX=33,DY=8 X XY W $J("",12) D CURON^%VVIDEO Q
AFF1 S LI=^POSENR($I,PAGE,DY),NEXT=$P(LI,"^",1),UN=$P(LI,"^",2),DX=4 D:$D(^PAREP($J,NEXT)) BLD^%VVIDEO X XY W NEXT S DX=$X D NORM^%VVIDEO X XY W $S(UN'="":" ("_UN_")",1:"") S LI=$TR($J("",45-$X),$$^%QZCHW(" "),".") W LI,?46,^VALPAR($I,NEXT)
 Q
QUT S ^POSENR($I,PAGE,LI)=$$^%QZCHW("OBJET.TOTEM")
 S ^VALPAR($I,$$^%QZCHW("OBJET.TOTEM"))=$S(EXISTEI:OBJET,EXISTEL:OBJET,1:"")
 S ^POSFUL($I,PAGE,LI)=$$^%QZCHW("OBJET.TOTEM"),LI=LI+1
 S ^POSENR($I,PAGE,LI)=$$^%QZCHW("QUANTITE")
 S ^VALPAR($I,$$^%QZCHW("QUANTITE"))=$S($$^%QSCALVA(BASEL,INDIVIDU,"QUANTITE.A.FABRIQUER")'="":$$^%QSCALVA(BASEL,INDIVIDU,"QUANTITE.A.FABRIQUER"),$$^%QSCALVA(BASEL,INDIVIDU,"QUANTITE")'="":$$^%QSCALVA(BASEL,INDIVIDU,"QUANTITE"),1:1)
 S ^POSFUL($I,PAGE,LI)=$$^%QZCHW("QUANTITE"),LI=LI+1 Q
CREERL S NOML=$$GEN^%QSPOP("IDT"),ADRESSE="^[QUI]ZLIGTOID("""_NOML_""",""OBJET"")"
 D PA^%QSGESTI("L0",L,"LISTE.ERREURS",NOML,1)
 D PA^%QSGESTI("L0",NOML,"ADRESSE",ADRESSE,1),PA^%QSGESTI("L0",NOML,"AUTEUR",WHOIS,1),PA^%QSGESTI("L0",NOML,"BASE",BASEL,1),PA^%QSGESTI("L0",NOML,"CREATION",$H,1),ZD^%QMDATE4,PA^%QSGESTI("L0",NOML,"DATE.CREATION",%DAT,1)
 D ^%QMDAK0,PA^%QSGESTI("L0",NOML,"HEURE.CREATION",HEURE,1),PA^%QSGESTI("L0",NOML,"LOCALISATION",$I,1),PA^%QSGESTI("L0",NOML,"NOM",NOML,1),PA^%QSGESTI("L0",NOML,"OBJET",$$NOMLOG^%QSF(BASEL),1)
 D PA^%QSGESTI("L0",NOML,"SOURCE","IDENTIFIANT TOTEM",1) S CARD=0 Q
FINL S ^[QUI]ZLIGTOID(NOML,"BASE")=BASEL,^[QUI]ZLIGTOID(NOML,"CARD")=CARD D PA^%QSGESTI("L0",NOML,"CARD",CARD,1) Q
DESSIN N LINK S LINK=$S($D(^KLNTOT($J)):1,1:0)
 S TBFIG($P($ZPOS,"^",2),1)="CADRE" D ^%VZCFIG
 D CLEPAG^%VVIDEO S LILIM=21,DEV="ECR",%ABAND=0,DX=0,DY=7 X XY D ^%AB3STAR
 S DXG=0,DXD=10,DYH=0,DYB=4,GRAPH=1,MSG="" D 4^%VZCD
 D BLD^%VVIDEO,CAG^%VVIDEO S DX=3,DY=2 X XY W $$^%QZCHW($S(LINK:" LINK ",1:"TOTEM")) D NORM^%VVIDEO
 S DXG=12,DXD=40,GRAPH=1,MSG="" D 4^%VZCD
 D BLD^%VVIDEO S DX=14,DY=1 X XY W $$^%QZCHW("LISTE    : ") S DX=14,DY=2 X XY W "INDIVIDU : " D NORM^%VVIDEO
 D BLD^%VVIDEO S DX=25,DY=1 X XY W $$^%QZCHW(L) D NORM^%VVIDEO
 S %FIG="CADRE" D DES^%VZCFIG
 Q
CADRE ;;~L~H~74~3~5/~L~H~74~3~7/~L~H~74~3~9/~L~H~74~3~22/~L~V~1~2~6/~L~V~12~2~10/~L~V~1~32~8/~L~V~1~45~8/~L~V~1~77~6/
 ;;~L~V~12~77~10/~KS~l~2~5/~KS~m~2~7/~KS~l~2~9/~KS~m~2~22/~KS~w~32~7/~KS~v~32~9/~KS~w~45~7/~KS~v~45~9/~KS~k~77~5/~KS~j~77~7/~KS~k~77~9/~KS~j~77~22/
 ;;
 
OKIDT(BASE,IND) 
 N IDTEX,OBJEX,%IEXP,IEXP
 S IDTEX=$$^%QSCALIN(BASE,IND,"IDENTIFIANT.TOTEM",1)
 S OBJEX=$$^%QSCALIN(BASE,IND,"OBJET.TOTEM",1)
 I ((IDTEX="")!(OBJEX=""))!($P(IDTEX,"/")'=OBJEX) Q 0
 S IEXP="" F %IEXP=1:1 S IEXP=$O(^[QUI]EXPLICI(OBJEX,IEXP)) Q:IEXP=""
 Q $L(IDTEX,"/")=%IEXP
 Q

