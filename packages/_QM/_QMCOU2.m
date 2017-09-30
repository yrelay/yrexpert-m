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

;%QMCOU2^INT^1^59547,73876^0
QSNHIS2 ;
 
 
 
 
 
 
 
 
 
 
AFF(BASE,IND,ON,MOD,ATT,NOMTAB) 
 N NOCOL,ECART,LMARG,LMARD,LHIST,HTEXT,HFHA,HHIST,FCOL,LARG
 N ECHEL,NBCOL,LHIST,NOCOL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S HISTO=$$CONCAS^%QZCHAD(TEMP,"HISTO")
 D INIT,REAFF,MEN^%QMCOU3 K @(TEMP) Q
 
INIT 
 D ^%VZEATT K @(HISTO)
 S NOCOL=1,ECART=1,LMARG=10,LMARD=2,LHIST=(DH-LMARG)-LMARD,HTEXT=4,HFHA=DV,HHIST=DV-6,FCOL="" S:('($D(LARG)))&(ATT="HISTOGRAMME") LARG=3 S:('($D(LARG)))&(ATT="COURBE") LARG=1
 D CONS
 S ECHEL=@HISTO@("MAX"),ECHEL=$S(ECHEL:ECHEL,1:1)
 I ATT="COURBE" S MIN=@HISTO@("MIN") S:MIN<0 ECHEL=ECHEL-MIN
 S NBCOL=LHIST\(LARG+ECART) S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 S COL=$$CONCAS^%QZCHAD(TEMP,"COLONNE") K @(COL)
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT") K @(TEXT)
 S TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2") K @(TEXT2)
 D MKGRA^%HXYIST2(TEXT2),MKCOL^%HXYIST2(COL),MKTEX Q
CONS 
 N %A,%O,ABSC,CPT,GL,MAX,ORDO,ABS,MIN
 S GL=^%SCRE("QMCOUR","GLOSTOC"),(CPT,MAX,MIN)=0
 S ABS="" F %A=1:1 S ABS=$O(@GL@("QMCO",ATT,BASE,IND,ON,ABS)) Q:ABS=""  S ORDO=$P(@GL@("QMCO",ATT,BASE,IND,ON,ABS),"^",1) Q:ORDO=""  D INSG
 S @HISTO@("MAX")=MAX,@HISTO=CPT S:ATT="COURBE" @HISTO@("MIN")=MIN Q
INSG 
 S CPT=CPT+1,@HISTO@(%A)=ORDO,@HISTO@(%A,"IND")=1
 S @HISTO@(%A,"IND",ABS)=ORDO_"^"_ABS,@HISTO@(%A,"TEXT")=ABS
 S:ORDO>MAX MAX=ORDO S:ORDO<MIN MIN=ORDO Q
MKTEX N NLINTEX,I,IND,LIMCOL
 S NLINTEX=1,@TEXT=NBCOL_"^"_NLINTEX,IND=0
 S LIMCOL=$S((NOCOL+NBCOL)>@HISTO:@HISTO,1:NOCOL+NBCOL)
 F I=NOCOL:1:LIMCOL S:$D(@HISTO@(I,"TEXT")) IND=IND+1,@TEXT@(IND,1)=@HISTO@(I,"TEXT")
 Q
REAFF 
 S DX=XG,DY=YH D CLEBAS^%VVIDEO,CARSA^%VVIDEO(XG,YH,DH,DV)
 S DX=(XG+(((DH-2)-$L(ON))\2))-1,DY=YH X XY W " " S DX=DX+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W ON D NORM^%VVIDEO
 S DX=DX+$L(ON) X XY W " "
 D ^%VZECOL(LMARG-9,HFHA,HHIST+1,8,8,0,TEXT2)
 D CARSP^%VVIDEO(LMARG-1,HFHA-1,HHIST+2,LHIST+2,1)
 S MOD=$S(ATT="HISTOGRAMME":0,1:2)
 
 D ^%HXYIST1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COL,MOD)
 D ^%VZECOL(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT) Q
EFF 
 S DX=XG,DY=YH D CLEBAS^%VVIDEO Q
DCOL(C) 
 D POCLEPA^%VVIDEO
D S C=$$^%VZAME1($$^%QZCHW("Pour quelle colonne :"))
 D NORMALIS^%QZNBN1(.C)
 I C="" D POCLEPA^%VVIDEO Q
 I '($D(@NOMTAB@("QMCO",ATT,BASE,IND,ON,C))) D ^%VZEAVT($$^%QZCHW("Colonne inexistante")) G D
 Q

