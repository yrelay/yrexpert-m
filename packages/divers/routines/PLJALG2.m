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

;PLJALG2^INT^1^59547,74868^0
PLJALG2 ;
 
 
 
 
 
DL 
 
 
 N LISTE,CTRLA,C10,C20,CHX,BASE,ART,MAJDEL,RETDEL,DYY
 N OUI,NON,REEL,SIMU,VIOL,FOCAP,DATE,DATLIM,SENS,C10,C20,C30,C40
 S BASE=$$RART^JALRPJ,DDY=8
 S OUI=$$^%QZCHW("OUI"),NON=$$^%QZCHW("NON")
 S REEL=$$^%QZCHW("REEL"),SIMU=$$^%QZCHW("SIMULATION")
 S C10=$$^%QZCHW("ISSUS D'UNE LISTE"),C20=$$^%QZCHW("CHOISIS PARMI CEUX EXISTANTS")
 S C30=$$^%QZCHW("AMONT"),C40=$$^%QZCHW("AVAL"),DYY=8
DLDEB D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("JALONNEMENT D'UNE LISTE D'")_BASE_"s")
SEN D POCLEPA^%VVIDEO
 S SEN=$$^%VZECH2($$^%QZCHW("Jalonnement")_" ",C30,C40) Q:(SEN'=C30)&(SEN'=C40)
 G @SEN
AMONT D POCLEPA^%VVIDEO
 S SENS=1
 
DDAV S DX=8,DY=DDY D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Date debut jalonnement")_" : ",$$DATE^%QMDATE,7,RM-4,DY+1,DY-1,"","",.CTR,.DATE)
 I CTR'="" G SEN
 S DATE=$$CORRECT^%VYDAT(DATE) I DATE="" G DDAV
 
LIMAV S DX=8,DY=DDY+2 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Date limite de fin de jalonnement")_" : ","",7,RM-4,DY+1,DY-1,"","",.CTR,.DATLIM)
 I CTR'="" G DDAV
 I DATLIM="" S DATLIM=999999 G MODAV
 S DATLIM=$$CORRECT^%VYDAT(DATLIM) I DATLIM="" G LIMAV
 S DATLIM=$$10^%QMDATE1(DATLIM)
 
MODAV S DX=8,DY=DDY+4 D CLEBAS^%VVIDEO
 S MODEX=$$^%VZECH2($$^%QZCHW("Mode d'exucution ?")_" ",REEL,SIMU)
 S MODEX=$S(MODEX=REEL:0,MODEX=SIMU:1,1:"")
 G:MODEX="" LIMAV
 
FORCAV S DX=8,DY=DDY+6 D CLEBAS^%VVIDEO
 S FOCAP=$$^%VZECH2($$^%QZCHW("Forcer les capacites machines ?")_" ",OUI,NON)
 S FOCAP=$S(FOCAP=OUI:1,FOCAP=NON:0,1:"")
 G:FOCAP="" MODAV
 I FOCAP=1 S RETDEL="FORCAV",VIOL=1,RDEL=1 G MAJDEL
 
VIOLAV S DX=8,DY=DDY+8 D CLEBAS^%VVIDEO
 S MAJDEL=0
 S VIOL=$$^%VZECH2($$^%QZCHW("Viol des capacites machines ?")_" ",NON,OUI)
 S VIOL=$S(VIOL=OUI:1,VIOL=NON:0,1:"")
 G:VIOL="" FORCAV
 
RDELAV S DX=8,DY=DDY+10 D CLEBAS^%VVIDEO
 S RDEL=$$^%VZECH2($$^%QZCHW("Respect delais d'appareillage ?")_" ",OUI,NON)
 S RDEL=$S(RDEL=$$^%QZCHW("OUI"):1,RDEL=$$^%QZCHW("NON"):0,1:"")
 G:RDEL="" VIOLAV
 S RETDEL="RDELAV"
 G MAJDEL
 
AVAL D POCLEPA^%VVIDEO
 S SENS=-1
 
DDAP S DX=8,DY=DDY D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Date fin jalonnement")_" : ","",7,RM-4,DY+1,DY-1,"","",.CTR,.DATE)
 I CTR'="" G SEN
 I ('($$CORRECT^%VYDAT(DATE)))="" G DDAP
 
LIMAP S DX=8,DY=DDY+2 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Date limite de debut de jalonnement")_" : ",$$DATE^%QMDATE,7,RM-4,DY+1,DY-1,"","",.CTR,.DATLIM)
 I CTR'="" G DDAP
 I DATLIM="" S DATLIM=0 G MODAP
 I $$CORRECT^%VYDAT(DATLIM)="" G LIMAP
 S DATLIM=$$10^%QMDATE1(DATLIM)
 
MODAP S DX=8,DY=DDY+4 D CLEBAS^%VVIDEO
 S MODEX=$$^%VZECH2($$^%QZCHW("Mode d'exucution ?")_" ",REEL,SIMU)
 S MODEX=$S(MODEX=REEL:0,MODEX=SIMU:1,1:"")
 G:MODEX="" LIMAP
 
FORCAP S DX=8,DY=DDY+6 D CLEBAS^%VVIDEO
 S FOCAP=$$^%VZECH2($$^%QZCHW("Forcer les capacites machines ?")_" ",OUI,NON)
 S FOCAP=$S(FOCAP=OUI:1,FOCAP=NON:0,1:"")
 G:FOCAP="" MODAP
 I FOCAP=1 S RETDEL="FORCAP",VIOL=1,RDEL=1 G MAJDEL
 
 
VIOLAP S DX=8,DY=DDY+8 D CLEBAS^%VVIDEO
 S MAJDEL=0
 S VIOL=$$^%VZECH2($$^%QZCHW("Viol des capacites machines ?")_" ",NON,OUI)
 S VIOL=$S(VIOL=OUI:1,VIOL=NON:0,1:"")
 G:VIOL="" FORCAP
 
RDELAP S DX=8,DY=DDY+10 D CLEBAS^%VVIDEO
 S RDEL=$$^%VZECH2($$^%QZCHW("Respect delais d'appareillage ?")_" ",OUI,NON)
 S RDEL=$S(RDEL=$$^%QZCHW("OUI"):1,RDEL=$$^%QZCHW("NON"):0,1:"")
 G:RDEL="" VIOLAP
 S RETDEL="RDELAP"
 
MAJDEL S DX=8,DY=DY+2 D CLEBAS^%VVIDEO
 S MAJDEL=$$^%VZECH2($$^%QZCHW("Mise a jour ")_$$DUFAB^JALRPJ_$$^%QZCHW(" de ")_BASE_" ? ",NON,OUI)
 S MAJDEL=$S(MAJDEL=OUI:1,MAJDEL=NON:0,1:"")
 G:MAJDEL="" @RETDEL
 
 
CH D POCLEPA^%VVIDEO
 S CHX=$$^%VZECH2(BASE_"s ? ",C10,C20) G:(CHX'=C10)&(CHX'=C20) SEN
 G LISD:CHX=C10
 
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ART")
 S DX=8,DY=10 X XY
 D ^%VZEATT,INIT^%QUCHOIP($$LISTIND^%QSGEST6($$NOMINT^%QSF(BASE)),1,1,2,5,75,17),AFF^%QUCHOIP,POCLEPA^%VVIDEO
 D ^%QUCHOYP(TEMP),END^%QUCHOIP
 G:'($D(@TEMP)) CH
 D CLEPAG^%VVIDEO,ADR^JALTO2(TEMP,RDEL,VIOL,FOCAP,DATE,DATLIM,SENS,MODEX,MAJDEL)
 K @(TEMP)
 G DLDEB
 
LISD S DX=8,DY=11 D CLEBAS^%VVIDEO X XY S LISTE=$$^%VZAME1($$^%QZCHW("Liste d'")_BASE_" "_$$^%QZCHW("a jalonner")_" : ")
 G CH:LISTE="" I LISTE="?" S LISTE=$$^%QS0SEL1
 D CLEPAG^%VVIDEO,^JALTO2(LISTE,RDEL,VIOL,FOCAP,DATE,DATLIM,SENS,MODEX,MAJDEL)
 G DLDEB

