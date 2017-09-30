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

;%QMCOU3^INT^1^59547,73876^0
QMCOU3 ;
 
 
 
 
 
 
 
MEN S MENU1=$$CONCAS^%QZCHAD(TEMP,"MENU1") K @(MENU1)
 S @MENU1@(1)=$$^%QZCHW("Entrer")_"^ENT",@MENU1@(1,"COM")=$$^%QZCHW("Acces a une colonne")
 S @MENU1@(2)=$$^%QZCHW("Gauche")_"^GAU",@MENU1@(2,"COM")=$$^%QZCHW("Deplacement a gauche")
 S @MENU1@(3)=$$^%QZCHW("Droite")_"^DRT",@MENU1@(3,"COM")=$$^%QZCHW("Deplacement a droite")
 S @MENU1@(4)=$$^%QZCHW("Largeur")_"^LARGE",@MENU1@(4,"COM")=$$^%QZCHW("Modification de la largeur des colonnes")
SEL D CLFEN^%VVIDEO(10,22,2,50),^%VQUIKMN(LMARG,DH-LMARD,(YH+DV)-1,MENU1,.ADR,.CTR) G:ADR'="" @ADR
 Q:"AF"[CTR
 G:CTR="J" IMPR I CTR="R" D REAFF^%QMCOU2 G SEL
 D ^%VSQUEAK G SEL
ENT D POCLEPA^%VVIDEO S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO") K @(GLO)
 S COLN="" F HX=1:1 S COLN=$O(@TEXT@(COLN)) Q:COLN=""  S @GLO@(COLN,1)=@TEXT@(COLN,1)_" "_$P(^[QUI]RQSGLO("QMCO",ATT,BASE,IND,ON,@TEXT@(COLN,1)),"^",1)_" "_$P(^[QUI]RQSGLO("QMCO",ATT,BASE,IND,ON,@TEXT@(COLN,1)),"^",2)
 S RES=$$^%VZEMOV(10,21,NBCOL,2,LARG+1,1,GLO,.NC,.NL)
 S MENU2=$$CONCAS^%QZCHAD(TEMP,"MENU2") K @(MENU2)
 S @MENU2@(1)=$$^%QZCHW("Ajout")_"^AJ",@MENU2@(1,"COM")=$$^%QZCHW("Ajout de colonnes")
 S @MENU2@(2)=$$^%QZCHW("Modifier")_"^MOD",@MENU2@(2,"COM")=$$^%QZCHW("Modification de colonnes")
 S @MENU2@(3)=$$^%QZCHW("Suppression")_"^SUP",@MENU2@(3,"COM")=$$^%QZCHW("Suppression de colonnes")
SEL2 D CLFEN^%VVIDEO(10,22,2,50),^%VQUIKMN(LMARG,DH-LMARD,(YH+DV)-1,MENU2,.ADR,.CTR) G:ADR'="" @ADR
 G:"AF"[CTR SEL
 D ^%VSQUEAK G SEL2
GAU I $D(@HISTO@(NOCOL-NBCOL)),(NOCOL-NBCOL)'=0 G GOK
 I NOCOL=1 D ^%VSQUEAK G SEL
 S NOCOL=NBCOL+1
GOK S NOCOL=NOCOL-NBCOL D MKCOL^%HXYIST2(COL),MKTEX^%QMCOU2,REAFF^%QMCOU2 G SEL
DRT I '($D(@HISTO@(NOCOL+NBCOL))) D ^%VSQUEAK G SEL
 S NOCOL=NOCOL+NBCOL D MKCOL^%HXYIST2(COL),MKTEX^%QMCOU2,REAFF^%QMCOU2 G SEL
 G SEL
LARGE D POCLEPA^%VVIDEO W $$^%QZCHW("Largeur des colonnes ["),LARG,"] : "
 S DX=$X,DY=$Y D ^%VLEC,POCLEPA^%VVIDEO
 G:CTRLA!(Y1="") SEL
 I (Y1'?.N)!(Y1'>0) D ^%VSQUEAK G LARGE
 S LARG=Y1,NBCOL=LHIST\(LARG+ECART)
 S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 D MKCOL^%HXYIST2(COL),MKTEX^%QMCOU2,REAFF^%QMCOU2 G SEL
COM 
 D DCOL^%QMCOU2(.ABSC) G:ABSC="" SEL
 S COM=$P(@NOMTAB@("QMCO",ATT,BASE,IND,ON,ABSC),"^",2)
 D BLD^%VVIDEO,^%VZEAVT($$^%QZCHW(COM)),NORM^%VVIDEO G SEL
AJ 
 D EFF^%QMCOU2,DETP^%QMCOUR(BASE,IND,ON,ATT),INIT^%QMCOU2,REAFF^%QMCOU2
 G SEL2
SUP 
 G MOD
MOD 
 ;;D ^%QCAMEMS K (QUI,WHOIS,XY,DX,DY,XG,YH,DH,DV,SUB,HISTO,BASE,IND,ON) 
 S ABSC=$P(@GLO@(NC,1)," ",1) G:ABSC="" SEL2
 
 
 S RESUL(1)="QMCO",RESUL(2)=ATT,RESUL(3)=BASE,RESUL(4)=IND,RESUL(5)=ON,RESUL(6)=ABSC
 D EFF^%QMCOU2,POINT^%VCMS("QMCOUR","RESUL"),INIT^%QMCOU2,REAFF^%QMCOU2
 ;;D ^%QCAMEMS K (QUI,WHOIS,XY,DX,DY,XG,YH,DH,DV,SUB,HISTO,BASE,IND,ON,LMARD,LMARG) 
 G SEL2
IMPR 
 D POCLEPA^%VVIDEO
QUOI S REPON=$$^%VZECH2("Voulez-vous imprimer ?","l'ecran","la totalite de l'histogramme") D POCLEPA^%VVIDEO G:(REPON=1)!(REPON=6) SEL
 G:(REPON'="l'ecran")&(REPON'="la totalite de l'histogramme") QUOI
 D MSG^%VZEATT($$^%QZCHW("     Impression en cours"))
 D IMP
FIN G:REPON'="la totalite de l'histogramme" END
 
 S SNOCOL=NOCOL
 F %C=0:0 Q:'($D(@HISTO@(NOCOL+NBCOL)))  S NOCOL=NOCOL+NBCOL D MKCOL^%HXYISTO(COL),MKTEX^%QMCOU2,IMP
 S NOCOL=SNOCOL D MKCOL^%HXYISTO(COL),MKTEX^%QMCOU2
END D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 K ^IMP($J) G SEL
IMP K ^IMP($J)
 S DX=LMARG-10,DY=10 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Histogramme : ")_ON
 D ^%HXYIMP2(LMARG-10,HFHA,HHIST+1,8,8,0,TEXT2)
 D CARSP^%HXYIMP(LMARG-1,HFHA-1,HHIST+2,LHIST+2),^%HXYIMP1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COL)
 D ^%HXYIMP2(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 D IMPR^%HXYIMP Q

