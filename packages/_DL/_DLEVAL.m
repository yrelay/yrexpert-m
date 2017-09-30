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

;%DLEVAL^INT^1^59547,73867^0
%DLEVAL ;
 
 
 
 
 
 
 
 
 
 N ADR,AFF,CAPLIM,CTR,DATLD,ERR,ETU,GL,GLMA,I,L,LAN,LISTE,MN,MN2,MODAF,MODEX,NL,REP,REPE,RES,SENS,DECAL,COCON,NBITER,TEMP,MAP,MS
 I $$CONFINS^%DLCON1=0 Q
 D TIT
DEB S DX=10,DY=5 X XY D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%DLEVAL","$$UC^%DLETUDE",.CTR,.ETU)
 I (CTR'="")!(ETU="") Q
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S MN2=$$CONCAS^%QZCHAD(TEMP,"MEN2")
 S RES=$$CONCAS^%QZCHAD(TEMP,"RES")
 S GLMA=$$CONCAS^%QZCHAD(TEMP,"MACHINE")
 D MENU^%DLEVAL2(MN)
 S REPE=$$REP^%DLETUDE
 S REP=$$LAN^%DLCON2
INIT D ^%VZEATT
 S MODEX=$$^%QSCALVA(REPE,ETU,"MODE.EVALUATION")
 S MODEX=$S(MODEX=$$^%QZCHW("REEL"):0,1:1)
 S SENS=$$^%QSCALVA(REPE,ETU,"SENS.JALONNEMENT")
 S DATLD=$P($$^%QSCALVA(REPE,ETU,"DATE.LIMITE.DEBUT"),",")
 S CAPLIM=$$^%QSCALVA(REPE,ETU,"RESPECT.CAPACITES.MACHINES")
 S CAPLIM=$S(CAPLIM=$$^%QZCHW("OUI"):1,CAPLIM=$$^%QZCHW("NON"):0,1:2)
 S NL=$$^%QSCALVA(REPE,ETU,"LISTE.LANCEMENTS")
 I '($$EX^%QSGEST7(NL)) D ^%VZEAVT($$^%QZCHW("La liste de lancement n'est plus definie")) G DEB
 S LAN=$$^%QSCALVA(REPE,ETU,"LANCEMENT")
 S I=$$^%QSCALVA(REPE,ETU,"DECALAGE")
 S (COCON,NBITER)=0
 I I="NON" S DECAL=0 G INI2
 S COCON=$$^%QSCALVA(REPE,ETU,"CONTRACTION")
 S NBITER=$$^%QSCALVA(REPE,ETU,"NOMBRE.ITERATIONS")
 S I=$$^%QSCALVA(REPE,ETU,"TYPE.DECALAGE")
 I I="C" S DECAL=1,NBITER=0 G INI2
 I I="R" S DECAL=3,COCON=0 G INI2
 S DECAL=2
INI2 D IMAC(NL,GLMA)
 S MODAF=0,AFF=1
 
AFF I AFF=1 D CLEPAG^%VVIDEO,^%DLLFLUX(ETU,0),TETE^%DLEVAL2(0) S AFF=0
ACT S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,79,22,MN,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FIN
 I CTR="J" D ^%DLLFLUX(ETU,1) G ACT
 I CTR="R" S AFF=1 G AFF
 G:ADR="" ACT G @ADR
 
FIN K @(TEMP)
 Q
 
ETU 
 D MOD^%DLEVAL2(ETU) G INIT
 
DEL 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous relancer le jalonnement")_" ? ("_$$^%QZCHW("Le precedent sera annule")_")","O")'=1 G ACT
 D EXT^%DLANCEX(0,ETU,NL,SENS,CAPLIM,DATLD,MODEX,1,DECAL,COCON,NBITER,RES,.ERR)
 D IMAC(NL,GLMA)
 S AFF=1 G RESU
 
MAP 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous relancer le jalonnement")_" ? ("_$$^%QZCHW("Le precedent sera annule")_")","O")'=1 G ACT
 D EXT^%DLANCEX(1,ETU,NL,SENS,CAPLIM,DATLD,MODEX,1,DECAL,COCON,NBITER,RES,.ERR)
 D IMAC(NL,GLMA)
 S AFF=1 G RESU
 
DEJAL 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Confirmez-vous le dejalonnement de l'etude ?"),"N")'=1 D POCLEPA^%VVIDEO G ACT
 D POCLEPA^%VVIDEO
 D RETCHARG^%DLETUD2(MODEX,1,REPE,ETU,.MS)
 D POCLEPA^%VVIDEO
 G ACT
 
RESU 
 D MENR^%DLEVAL2(MN2)
ACR S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(10,79,22,MN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") AFF
 G:ADR="" ACR G @ADR
CPT 
 S GL=$$CONCAS^%QZCHAD($$ADDETU^%DLANCEX,ETU)
 I '($D(@GL)) D ^%VZEAVT($$^%QZCHW("Cette etude n'a jamais ete activee")) G ACR
 D AFFERR^%QULIMZ(GL,$$^%QZCHW("Resultats de l'evaluation des delais"))
 S AFF=1 D CLEPAG^%VVIDEO G ACR
RES 
 S L=LAN
 D CHOIX(.L)
 I L'="" D ^%DLANCE2(L),CLEPAG^%VVIDEO S AFF=1
 G ACR
STA 
 D ^%DLAFSTA(ETU)
 S AFF=1 G ACR
 
DATFI 
 G DATEFIX^%DLEVAL3
 
VISU 
 S L=LAN
 D CHOIX(.L) I L'="" D NOM^%DLAFFI2(L) S AFF=1
 G AFF
 
MIX 
 D EXT^%DLAFMIX(ETU,NL)
 S AFF=1 G AFF
 
FLU 
 D MENF^%DLEVAL2(MN2)
ACF S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(10,79,22,MN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") AFF
 G:ADR="" ACI G @ADR
FLC 
 D ^%DLFLUX S AFF=1
 G ACF
FLE 
 D EXT^%DLLFLUX(ETU) S AFF=1
 G ACF
 
IRDM 
 D MENI^%DLEVAL2(MN2)
ACI S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(10,79,22,MN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") AFF
 G:ADR="" ACI G @ADR
IRD 
 D ^%DLAFIRD
 S AFF=1 G ACI
IRDC 
 D AFFI^%DLAFIRD(NL,$$CALO^%DLAFIRD(NL,ETU),$$CALC^%DLAFIRD(NL,ETU),ETU)
 S AFF=1 G ACI
 
CHAR 
 D MENC^%DLEVAL2(MN2)
ACC S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(10,79,22,MN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") AFF
 G:ADR="" ACC G @ADR
CHT 
 N DD,DF,M
CH2 D CHMAC(.M) I M="" G ACC
 D DAT^%DLAFFI2(M,.DD,.DF,.CTR) I CTR'="" G CH2
 D ^%DLAFFIC(M,DD,DF)
 D IMAC(NL,GLMA)
 S AFF=1 G CH2
CHC 
 D CHMAC(.M) I M="" G ACC
 D CHARG^%DLAFFI2(NL,M)
 S AFF=1 G CHC
TRF 
 S ADR=$$ADRLIS^%QSGEST7(NL)
 I (ADR="")!(ADR=0) K ADR G ACC
 S L=""
 F %L=0:0 S L=$O(@ADR@(L)) Q:L=""  D LANC^%DLMACH2(REP,L)
 D CLEPAG^%VVIDEO
 K ADR S AFF=1 G ACC
 
MACH 
 D MENM^%DLEVAL2(MN2)
ACM S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(10,79,22,MN2,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") AFF
 G:ADR="" ACM G @ADR
 
MAC D AFFM
 S AFF=1 G ACM
CAL D AFFC
 S AFF=1 G ACM
 
TIT D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Activation d'une etude"),0)
 Q
 
CHOIX(L) 
 I L="" S L=$$SELECT^%QSGEST6($$ADRLIS^%QSGEST7(NL),$$^%QZCHW("Choisissez un lancement"))
 Q
 
AFFM 
 N m,MAC,AFRESU,DEJALU,NOMTAB,RESUL,REFUSE,PATOUCH,OR,ABENDSCR,CMS
AF2 D CHMAC(.MAC) I MAC="" Q
 S RESUL(1)=MAC
 D POINT^%VCMS("DESMACH","RESUL")
 G AF2
 
AFFC 
 N m,MAC,AFRESU,DEJALU,NOMTAB,RESUL,REFUSE,PATOUCH,OR,ABENDSCR,CMS
AC2 D CHMAC(.MAC) I MAC="" Q
 S RESUL(1)=$$^%QSCALVA($$MACH^%DLCON2,MAC,$$REGIME^%DLCON2)
 I RESUL(1)="" D ^%VZEAVT($$^%QZCHW("Cette machine n'a pas de regime calendaire")) G AC2
 D POINT^%VCMS("QMDRREGI","RESUL")
 G AC2
 
IMAC(NL,GL) 
 N %L,A,GV,L,O,%O,V,MAC
 K @(GL)
 S L="",A=$$ADRLIS^%QSGEST7(NL)
 Q:(A="")!(A=0)
 S MAC=$$MACHINE^%DLCON2
 F %L=0:0 S L=$O(@A@(L)) Q:L=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REP,L,MAC,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REP,L,MAC,O),@GL@(V,O)=""
 Q
 
CHMAC(M) 
 S M=$$SELECT^%QSGEST6(GLMA,$$^%QZCHW("Choisissez une machine"))
 Q
 
AFFETU D CLEPAG^%VVIDEO
 D ^%DLLFLUX(ETU,0)
 D TETE^%DLEVAL2(0)
 Q

