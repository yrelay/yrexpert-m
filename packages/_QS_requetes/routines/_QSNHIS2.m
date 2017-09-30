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

;%QSNHIS2^INT^1^59547,73882^0
QSNHIS2 ;
 
 
 
 
 
 
 
 
 
AFF(BASE,IND,ON,MOD) 
 N NOCOL,ECART,LMARG,LMARD,LHIST,HTEXT,HFHA,HHIST,FCOL,LARG,ECHEL,NBCOL,LHIST,NOCOL,OPTH,COLON,TEXT,TEXT2,MEN,ADR,CTR,NC,GL
 S GL="^[QUI]QUERYH(BASE,IND,ON)"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S HISTO=$$CONCAS^%QZCHAD(TEMP,"HISTO")
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT")
 S TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2")
 S COLON=$$CONCAS^%QZCHAD(TEMP,"COLON")
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 
 D INIT^%QSNHIST(HISTO)
 D HIST,REAFF,MENU(MEN)
 
SEL 
 D ^%VQUIKMN(LMARG-5,(DH-LMARD)+2,(YH+DV)-1,MEN,.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR K @(TEMP) Q
 G:CTR="J" IMPR
 I CTR="R" D REAFF G SEL
 D ^%VSQUEAK G SEL
GAU 
 I $D(@HISTO@(NOCOL-NBCOL)),(NOCOL-NBCOL)'=0 G GOK
 I NOCOL=1 D ^%VSQUEAK G SEL
 S NOCOL=NBCOL+1
GOK S NOCOL=NOCOL-NBCOL D MKCOL^%HXYIST2,MKTEX,REAFF G SEL
 
DRT 
 I '($D(@HISTO@(NOCOL+NBCOL))) D ^%VSQUEAK G SEL
 S NOCOL=NOCOL+NBCOL D MKCOL^%HXYIST2,MKTEX,REAFF G SEL
 G SEL
 
LARGE 
 D LARG^%HXPARAM(LHIST,ECART,.LARG,.NBCOL,.CTR)
 G:CTR=0 SEL
 D MKCOL^%HXYIST2,MKTEX,REAFF
 G SEL
 
COM 
 D DCOL(.NC) G:NC="" SEL
 S ABS=$O(@GL@(NC,""))
 I ABS'="" D BLD^%VVIDEO,^%VZEAVT($$^%QZCHW($P(@GL@(NC,ABS,$O(@GL@(NC,ABS,""))),"^",1))),NORM^%VVIDEO
 G SEL
 
AJ 
 D EFF,DETP^%QSNHIST(BASE,IND,ON)
 D INIT^%QSNHIST(HISTO),HIST,REAFF G SEL
SUP 
 G MOD
 
MOD 
 ;;D ^%QCAMEMS K (QUI,WHOIS,XY,DX,DY,XG,YH,DH,DV,SUB,HISTO,BASE,IND,ON,LMARD,LMARG) 
 
 D DCOL(.NC) G:NC="" SEL
 D MODIF(NC)
 D INIT^%QSNHIST(HISTO),HIST,REAFF
 G SEL
 
IMPR 
 D POCLEPA^%VVIDEO
QUOI S REPON=$$^%VZECH2("Voulez-vous imprimer ?","l'ecran","la totalite de l'histogramme") D POCLEPA^%VVIDEO G:(REPON=1)!(REPON=6) SEL
 G:(REPON'="l'ecran")&(REPON'="la totalite de l'histogramme") QUOI
 D MSG^%VZEATT($$^%QZCHW("Impression en cours")),IMP
FIN G:REPON'="la totalite de l'histogramme" END
 
 S SNOCOL=NOCOL
 F %C=0:0 Q:'($D(@HISTO@(NOCOL+NBCOL)))  S NOCOL=NOCOL+NBCOL D MKCOL^%HXYISTO,MKTEX,IMP
 S NOCOL=SNOCOL D MKCOL^%HXYISTO,MKTEX
END D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 K ^IMP($J) G SEL
 
IMP K ^IMP($J)
 S DX=LMARG-10,DY=10 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Histogramme : ")_ON
 D ^%HXYIMP2(LMARG-10,HFHA,HHIST+1,8,8,0,TEXT2)
 D CARSP^%HXYIMP(LMARG-1,HFHA-1,HHIST+2,LHIST+2),^%HXYIMP1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COLON)
 D ^%HXYIMP2(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 D IMPR^%HXYIMP Q
 
HIST 
 D MKGRA^%HXYIST2,MKCOL^%HXYIST2,MKTEX
 Q
 
MKTEX N I,IND,LIMCOL
 K @(TEXT)
 S @TEXT=NBCOL_"^"_1,IND=0
 S LIMCOL=$S((NOCOL+NBCOL)>@HISTO:@HISTO,1:NOCOL+NBCOL)
 F I=NOCOL:1:LIMCOL S:$D(@HISTO@(I,"TEXT")) IND=IND+1,@TEXT@(IND,1)=@HISTO@(I,"TEXT")
 Q
 
REAFF 
 S DX=XG,DY=YH D CLEBAS^%VVIDEO,CARSA^%VVIDEO(XG,YH,DH,DV)
 S DX=(XG+(((DH-2)-$L(ON))\2))-1,DY=YH X XY W " " S DX=DX+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W ON D NORM^%VVIDEO
 S DX=DX+$L(ON) X XY W " "
 D ^%VZECOL(LMARG-9,HFHA,HHIST+1,8,8,0,TEXT2),CARSP^%VVIDEO(LMARG-1,HFHA-1,HHIST+2,LHIST+2,1)
 D ^%HXYIST1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COLON)
 D ^%VZECOL(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 Q
 
EFF 
 S DX=XG,DY=YH D CLEBAS^%VVIDEO Q
 
DCOL(C) 
 D POCLEPA^%VVIDEO
D S C=$$^%VZAME1($$^%QZCHW("Pour quelle colonne :"))
 D NORMALIS^%QZNBN1(.C)
 I C="" D POCLEPA^%VVIDEO Q
 I '($D(^[QUI]QUERYH(BASE,IND,ON,C))) D ^%VZEAVT($$^%QZCHW("Colonne inexistante")) G D
 Q
 
MODIF(NC) 
 N RESUL,PATOUCH,AFRESU,DEJALU,SCR,ABENDSCR,NOMTAB,CMS,ABENDSCR
 S RESUL(1)=BASE,RESUL(2)=IND,RESUL(3)=ON,RESUL(4)=NC
 D EFF,POINT^%VCMS("QSHISTO","RESUL")
 Q
 
MENU(MEN) 
 S @MEN@(1)=$$^%QZCHW("Gauche")_"^GAU",@MEN@(1,"COM")=$$^%QZCHW("Deplacement a gauche")
 S @MEN@(2)=$$^%QZCHW("Droite")_"^DRT",@MEN@(2,"COM")=$$^%QZCHW("Deplacement a droite")
 S @MEN@(3)=$$^%QZCHW("Largeur")_"^LARGE",@MEN@(3,"COM")=$$^%QZCHW("Modification de la largeur des colonnes")
 S @MEN@(4)=$$^%QZCHW("Commentaire")_"^COM",@MEN@(4,"COM")=$$^%QZCHW("Visualisation du commentaire d'une colonne")
 Q:MOD'=1
 S @MEN@(5)=$$^%QZCHW("Ajout")_"^AJ",@MEN@(5,"COM")=$$^%QZCHW("Ajout de colonnes")
 S @MEN@(6)=$$^%QZCHW("Modification")_"^MOD",@MEN@(6,"COM")=$$^%QZCHW("Modification de colonnes")
 S @MEN@(7)=$$^%QZCHW("Suppression")_"^SUP",@MEN@(7,"COM")=$$^%QZCHW("Suppression de colonnes")
 Q

