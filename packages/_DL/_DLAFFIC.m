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

;%DLAFFIC^INT^1^59547,73867^0
DLAFFIC(MAC,JOURD,JOURF) 
 
 
 
 
 
 
 
 
 
DEB 
 N ADRES,MENU,REGIM,TD
 S ADRES="^[QUI]MACAP"
 I '($D(@ADRES@(MAC))) D ^%VZEAVT($$^%QZCHW("Aucun cumul n'est defini pour la machine")_" "_MAC) Q
 S ADRES=$$CONCAS^%QZCHAD(ADRES,MAC)
 
 S REGIM=$$REGIME^%DLREGIM(MAC)
 I REGIM="" S REGIM=$$REGSTAND^%QMDRUTI
 S REGIM=$$CONCAS^%QZCHAD("^[QUI]PLPLACAL",REGIM)
 S TD=0
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU@(1)=$$^%QZCHW("Entree")_"^"_"ACCES^%DLAFFI1",@MENU@(1,"COM")=$$^%QZCHW("Acces a une colonne de la fenetre")
 S @MENU@(2)=$$^%QZCHW("Pas.de.temps")_"^"_"JOUR^%DLAFFIC",@MENU@(2,"COM")=$$^%QZCHW("Passage de jour en semaine ou de semaine en jour")
 D ^%HXYPARA(0,2,80,19,"INIT^%DLAFFIC(TD)","AFF^%DLAFFIC","IMP^%DLAFFIC","FCOL",MENU)
 K @(MENU) Q
 
INIT(TD) 
 
 N %J,CHMA,CHJO,CAPA,CPT,CUM,MAX,MIN,JMI,JMA,JO,JF,FI,SEM,TAB
 K @(HISTO)
 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEMPO") K @(TAB)
 
 S CHMA=$$^%QSCALIN($$MACH^%DLCON2,MAC,$$CAPACITE^%DLCON2,1)+0
 K @(HISTO)
 
 S JO="",MAX=0,MIN=10E10
 F %J=0:0 S JO=$O(@ADRES@(JO)) Q:JO=""  S FI=$$20^%QMDATE1(JO) S:FI>MAX MAX=FI S:FI<MIN MIN=FI
 I JOURD'="" S JO=JOURD
 I JOURD="" S JO=$$02^%QMDATE1(MIN)
 I JOURF'="" S JF=$$20^%QMDATE1(JOURF)
 I JOURF="" S JF=MAX
 S (CPT,MAX)=0
 I JO'="" F %J=1:1 D INS Q:JO=""
 S @HISTO=$ZP(@HISTO@("")),@HISTO@("MAX")=MAX,@HISTO@("TEXTE")=3
 
 S LARG=$S(TD=0:6,1:4)
 K @(TAB)
 Q
 
INS 
 I '($D(@ADRES@(JO))) S CUM=0,CAPA=CHMA G IN2
 S CUM=$P(@ADRES@(JO),"^",2)+0
 
 S CHJO=$$^%QSCALIN($$MACH^%DLCON2,MAC,$$CAPACITE^%DLCON2,JO)
 
 
 S CAPA=$S(CHJO="":CHMA,1:CHJO)+0
IN2 
 I TD=0 S CPT=CPT+1,@HISTO@(CPT,"TEXT")=JO G IN3
 
 S SEM=$$25^%QMDATE1(JO)
 I $D(@TAB@(SEM)) S CPT=@TAB@(SEM) G SOM
 
 S CPT=$ZP(@HISTO@(""))+1
 S @HISTO@(CPT,"TEXT")=SEM,@HISTO@(CPT)=0,@HISTO@(CPT,"FCOL")=0
 S @TAB@(SEM)=CPT
SOM S CUM=@HISTO@(CPT)+CUM,CAPA=@HISTO@(CPT,"FCOL")+CAPA
 
 S @HISTO@(CPT,"JOUR",JO)=""
 
IN3 
 S @HISTO@(CPT)=CUM
 S @HISTO@(CPT,"FCOL")=CAPA,@HISTO@(CPT,"TOTAL")=CAPA
 S:CUM>MAX MAX=CUM
 S:CAPA>MAX MAX=CAPA
 
 S JO=$O(@REGIM@($$20^%QMDATE1(JO)))
 I JO>JF S JO="" Q
 S JO=$$02^%QMDATE1(JO)
 Q
 
AFF 
 D ^%VZCDB($$^%QZCHW("Charge de la machine")_" "_MAC,0)
 S DX=XG,DY=(YH+DV)-2 X XY D BLD^%VVIDEO X XY W $$^%QZCHW($S(TD=0:"Jour",1:"Semaine"))
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Charge")
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Capacite")
 D NORM^%VVIDEO Q
 
IMP(T) 
 I T="G" G IMPG
 
 S DX=20-$L(MAC),DY=YH-1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Charge de la machine")_" "_MAC
 S DX=0,DY=(DV+YH)-2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(TD=0:"Jour",1:"Semaine"))
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Charge")
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Capacite")
 Q
IMPG 
 S @TXT@(YH+1,(XC+LMARG)+10)=$$^%QZCHW("Charge de la machine")_" "_MAC
 S DY=(HFHA+HHIST)+3,@TXT@(DY,XC)=$$^%QZCHW($S(TD=0:"Jour",1:"Semaine"))
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Charge")
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Capacite")
 Q
 
JOUR 
 S TD='(TD)
 D ^%VZEATT,INIT^%HXYPARA,MKCOL^%HXYIST2,MKGRA^%HXYIST2,MKTEX^%HXYPARA
 D REAFF^%HXYPARA
 Q
 
 
EXT 
 N MAC,CTR,JOURD,JOURF
 D TIT
MAC S DX=0,DY=8 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("Nom de la machine")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.MAC)
 Q:MAC=""
 I CTR'="" Q
 I MAC="?" S MAC=$$SELECT^%QSGEST6("^[QUI]DESMACH") D TIT G:MAC="" MAC
 I '($$IR^%QSGEST5($$MACH^%DLCON2,MAC)) D ^%VZEAVT($$^%QZCHW("Machine inconnue")) G MAC
 D DAT^%DLAFFI2(MAC,.JOURD,.JOURF,.CTR)
 I CTR'="" G MAC
 G DEB
 
TIT D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Charge sur une machine"))
 Q

