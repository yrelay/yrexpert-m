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

;TOXIMPEX^INT^1^59547,74877^0
TOXIMPEX ;
 
 D CLEPAG^%VVIDEO K ^POSENR($I) S DX=30,DY=2,MSG=$$^%QZCHW("EDITIONS D'EXEMPLES") X XY D REV^%VVIDEO W MSG D NORM^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Article : ") R OART
NE W !,$$^%QZCHW("No d'etude : ") R ONUFA I ONUFA'="",'($D(^[QUI]TREEWORK(ONUFA))) D ^%VSQUEAK G NE
 W !,$$^%QZCHW("Nbre d'exemplaire : ") R NBEX S NBEX=$J(NBEX,1,0)
 S IMPR=^TABIDENT(WHOIS,"PRINTER")
 O IMPR U IMPR F EX=1:1:NBEX D EDIT
FIN C IMPR I '(DTM) K (%PROGEX,WHOIS,QUI,SUB) D VARSYS^%QCSAP Q
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","SUB","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125 D VARSYS^%QCSAP Q
EDIT S ART=OART,NUFA=ONUFA,ARTGLO=$T(GLOART),ARTGLO=$P(ARTGLO,";;",2)
GRILLE F AG=1:1 S GS=$P(ARTGLO,";",AG) Q:GS=""  S SCR=$P(GS,"/",2),NOMTAB="^[QUI]"_$P(GS,"/",1),VALCLE(1)=ART D RES K RESUL
 S GLO=$T(GLOB),GLO=$P(GLO,";;",2) F AG=1:1 S GS=$P(GLO,";",AG) Q:GS=""  S SCR=$P(GS,"/",2),NOMTAB="^[QUI]"_$P(GS,"/",1) D RES K RESUL
ABAQ I $D(^[QUI]PRONUM) S NOMG=$N(^[QUI]PRONUM(-1)) I NOMG'="z" S %NORM=$N(^[QUI]PRONUM(NOMG,-1)),%IDENT=$N(^[QUI]PRONUM(NOMG,%NORM,-1)),(QUW,QU)=QUI,PGE=1 D RESABA,^%ABGTPAR,^%ABIMPGR K RESUL O IMPR U IMPR
SCHELA U IMPR W # G:'($D(^[QUI]SAISIGAM)) ETUD S NOMG=-1
SCHEL1 S NOMG=$N(^[QUI]SAISIGAM(NOMG)) G:NOMG'="z" ETUD S %ALL=$N(^[QUI]SAISIGAM(NOMG,-1)),%ETAT=$N(^[QUI]SAISIGAM(NOMG,%ALL,-1)),%LARG=$N(^[QUI]SAISIGAM(NOMG,%ALL,%ETAT,-1))
 G:'($D(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG))) SCHEL1 S QUW=QUI D ^TOWIMPR
ETUD I '(DTM) K (IMPR,%DAT,OART,ONUFA,NUFA,QUI,DEV,WHOIS,ART,NBEX,EX,SUB,%PROGEX) G ETUD0
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="IMPR","%DAT","OART","ONUFA","NUFA","QUI","DEV","WHOIS","ART","NBEX","EX","SUB","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
ETUD0 D VARSYS^%QCSAP,^%AB3STAR O IMPR U IMPR G:'($D(^[QUI]ANTETUDE)) ETCOMP G:NUFA'="" EDETU
 S ART1=ART I ART1'="" S:'($D(^[QUI]ANTETUDE(ART1))) ART1=""
 D ZD^%QMDATE4 S AN=$P(%DAT,"/",3),MOIS=$P(%DAT,"/",2),NOMTAB="^[QUI]ANTETUDE",VALCLE(1)=ART1,ADR="NUMET^TOXIMPEX",STOP=0 F MA=1:1 Q:STOP=1  S VALCLE(2)="TOT"_AN_MOIS D NUMETU
EDETU S DEV="IMPR",LILIM=42,%DIM=1 D EDITION^TO3EDIRE
EXPLIQ O IMPR U IMPR D WOR1^TO3VIMPS
ETCOMP C IMPR K ^TACOMPIL($I) S ^TACOMPIL($I,1)=NUFA D ^TOGTBRES,^TOTAVACO I $D(^POSENR($I)) O IMPR U IMPR D 73^TOITABCO
LEXIQ O IMPR U IMPR S TEMP=15,TPAG=5,TERM=-1,PAGE=1 F UU=1:1:10 S TERM=$N(^[QUI]TOLEX(TERM)) Q:TERM=-1  I TERM'="z" S DEV="IMPR" D TRAIT^%LXUSITE S PAGE=PAGE+1
 I '(DTM) K (%PROGEX,IMPR,%DAT,OART,QUI,ONUFA,WHOIS,DEV,ART,NUFA,NBEX,EX,SUB) G LEXIQ0
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%PROGEX","IMPR","%DAT","OART","QUI","ONUFA","WHOIS","DEV","ART","NUFA","NBEX","EX","SUB","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
LEXIQ0 D VARSYS^%QCSAP Q
RES Q:'($D(@NOMTAB))  S ADR="RES1^TOXIMPEX" D ^%VKMULG D:$D(RESUL) ^%VIMPSCR K %RS Q
RES1 S IC=1 F BB=1:1 Q:'($D(@($$^%QZCHW("B")_BB)))  S RESUL(IC)=@($$^%QZCHW("B")_BB),IC=IC+1
 F SR=1:1 Q:'($D(%RS(SR)))  S RESUL(IC)=%RS(SR),IC=IC+1
 S IC=IC-1,STOP=1 Q
RESABA S IC=4 F PLC=1:1:20 S RESUL(IC)=$P(^[QUI]PRONUM(NOMG,%NORM,%IDENT),"^",PLC),IC=IC+1
 S IC=IC-1 Q
NUMETU D ^%VKMULG I STOP=0 S MOIS=MOIS-1 S:MOIS=0 MOIS=12,AN=AN-1
 Q
NUMET I (B1="z")!('($D(B2))) S B2=$$^%QZCHW(" "),STOP=0 Q
 S NUFA=B2,STOP=1 Q
 
GLOART ;;EXPLICI/EXPLICI;IMPLICI/IMPLICI;NOMENC/NOMENC;PHASE/PHASE;FORMULE/FORMULE;OUTCONS/OUTCONS;DIMOUT/DIMOUT;SELMAT/SELMAT;MACSEL/MACSEL;MATIERE/MATIERE
GLOB ;;MATSTOCK/MATSTOCK;EXGIMP/EXGIMP
 Q
POCLEPA W *
 Q
LISJEU 

