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

;%HXYPARA^INT^1^59547,73870^0
HXYPARA(XG,YH,DH,DV,ROU,RAFF,RIMP,FCOL,MEN) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ADR,COLON,CTR,ECART,ECHEL,HFHA,HHIST,HTEXT,LARG,LHIST,LMARG,LMARD,MENU,NBCOL,NOCOL,OPTH,TEMP,TEXT,TEXT2,REPO,REPON
 I ROU="" D ^%VZEAVT($$^%QZCHW("La routine d'initialisation n'est pas definie")) Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S HISTO=$$CONCAS^%QZCHAD(TEMP,"HISTO")
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT")
 S TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2")
 S COLON=$$CONCAS^%QZCHAD(TEMP,"COLON")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 
 D INIT,MKGRA^%HXYIST2,MKCOL^%HXYIST2,MKTEX
 D REAFF
 D MENU(MENU)
SEL 
 D POCLEPA^%VVIDEO,^%VQUIKMN(LMARG+3,(DH-LMARD)+2,(YH+DV)+1,MENU,.ADR,.CTR)
 I ADR'="" D @ADR G SEL
 I "AF"[CTR K @(TEMP) Q
 G:CTR="J" IMPR
 I CTR="R" D REAFF G SEL
 D ^%VSQUEAK G SEL
GAU 
 I $D(@HISTO@(NOCOL-NBCOL)),(NOCOL-NBCOL)'=0 G GOK
 I NOCOL=1 D ^%VSQUEAK Q
 S NOCOL=NBCOL+1
GOK S NOCOL=NOCOL-NBCOL D MKCOL^%HXYIST2,MKTEX,REAFF
 Q
 
DRT 
 I '($D(@HISTO@(NOCOL+NBCOL))) D ^%VSQUEAK Q
 S NOCOL=NOCOL+NBCOL D MKCOL^%HXYIST2,MKTEX,REAFF
 Q
 
LARGE 
 D LARG^%HXPARAM(LHIST,ECART,.LARG,.NBCOL,.CTR)
 I CTR=0 Q
 D MKCOL^%HXYIST2,MKTEX,REAFF
 Q
 
ECHEL 
 D ECHEL^%HXPARAM(ECHEL,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=ECHEL) Q
 S ECHEL=I
 D MKCOL^%HXYIST2,MKGRA^%HXYIST2,REAFF
 Q
 
IMPR 
 D POCLEPA^%VVIDEO
QUOI S REPON=$$^%VZECH2("Voulez-vous imprimer ?","l'ecran","la totalite de l'histogramme") D POCLEPA^%VVIDEO G:(REPON=1)!(REPON=6) SEL
OU 
 S REPO=$$^%VZECH2("Impression ","standard","graphique") D POCLEPA^%VVIDEO G:(REPO=1)!(REPO=6) SEL
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 S SNOCOL=NOCOL
 I REPO'="standard" D ^%HXYPAIG(REPON,RIMP,10) G END
 D IMP
 G:REPON'="la totalite de l'histogramme" END
 
 F %C=0:0 Q:'($D(@HISTO@(NOCOL+NBCOL)))  S NOCOL=NOCOL+NBCOL D MKCOL^%HXYIST2,MKTEX,IMP
END D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 I NOCOL'=SNOCOL S NOCOL=SNOCOL D MKCOL^%HXYIST2,MKTEX,REAFF
 K ^IMP($J) G SEL
 
IMP K ^IMP($J)
 I RIMP'="" D @(RIMP_"(""S"")")
 D ^%HXIIMP2(LMARG-10,HFHA,HHIST+1,LMARG-2,LMARG-2,0,TEXT2)
 D CARSP^%HXYIMP(LMARG-1,HFHA-1,HHIST+2,LHIST+2),^%HXYIMP1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COLON)
 D ^%HXIIMP2(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 D IMPR^%HXYIMP Q
 
MKTEX N I,IND,LIMCOL
 K @(TEXT)
 S @TEXT=NBCOL_"^"_@HISTO@("TEXTE"),IND=0
 S LIMCOL=$S((NOCOL+NBCOL)>@HISTO:@HISTO,1:(NOCOL+NBCOL)-1)
 F I=NOCOL:1:LIMCOL S:$D(@HISTO@(I,"TEXT")) IND=IND+1,@TEXT@(IND,1)=@HISTO@(I,"TEXT"),@TEXT@(IND,2)=@HISTO@(I) S:$D(@HISTO@(I,"TOTAL")) @TEXT@(IND,3)=@HISTO@(I,"TOTAL")
 Q
 
REAFF 
 D CLFEN^%VVIDEO(XG,YH,DV+1,DH)
 I RAFF'="" D @RAFF
 D ^%VZECOL(LMARG-9,HFHA,HHIST+1,LMARG-2,LMARG-2,0,TEXT2)
 D CARSP^%VVIDEO(LMARG-1,HFHA-1,HHIST+2,LHIST+2,1)
 D ^%HXYIST1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COLON)
 D ^%VZECOL(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 D POCLEPA^%VVIDEO Q
 
INIT 
 D MSG^%VZEATT($$^%QZCHW("Construction de l'histogramme en cours"))
 K @(HISTO)
 S (ECART,NOCOL,OPTH)=1,LMARG=10,LMARD=2,LHIST=(DH-LMARG)-LMARD,HTEXT=4
 S HFHA=YH+1,HHIST=DV-4 S:'($D(LARG)) LARG=4
 
 D @ROU
 S ECHEL=@HISTO@("MAX"),ECHEL=$S(ECHEL:ECHEL,1:1)
 S NBCOL=LHIST\(LARG+ECART) S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 D POCLEPA^%VVIDEO Q
 
MENU(MENU) 
 N I,J
 S @MENU@(1)=$$^%QZCHW("Gauche")_"^GAU",@MENU@(1,"COM")=$$^%QZCHW("Deplacement a gauche")
 S @MENU@(2)=$$^%QZCHW("Droite")_"^DRT",@MENU@(2,"COM")=$$^%QZCHW("Deplacement a droite")
 S @MENU@(3)=$$^%QZCHW("Largeur")_"^LARGE",@MENU@(3,"COM")=$$^%QZCHW("Modification de la largeur des colonnes")
 S @MENU@(4)=$$^%QZCHW("Hauteur")_"^ECHEL",@MENU@(4,"COM")=$$^%QZCHW("Modification de l'echelle")
 Q:MEN=""
 
 S J=""
 F I=5:1 S J=$O(@MEN@(J)) Q:J=""  S @MENU@(I)=@MEN@(J),@MENU@(I,"COM")=@MEN@(J,"COM")
 Q

