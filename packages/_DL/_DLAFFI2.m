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

;%DLAFFI2^INT^1^59547,73867^0
%DLAFFI2 ;
 
 
 
 
 
 
 
 
CHARG(NL,MAC) 
 N MENU,REP,TEMP,REGIM,TD
 S REP=$$LAN^%DLCON2
 
 S REGIM=$$REGIME^%DLREGIM(MAC)
 I REGIM="" S REGIM=$$REGSTAND^%QMDRUTI
 S REGIM=$$CONCAS^%QZCHAD("^[QUI]PLPLACAL",REGIM)
 S TD=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MENU@(1)=$$^%QZCHW("Entree")_"^"_"ACCES^%DLAFFI1",@MENU@(1,"COM")=$$^%QZCHW("Acces a une colonne de la fenetre")
 S @MENU@(2)=$$^%QZCHW("Pas.de.temps")_"^"_"JOUR^%DLAFFIC",@MENU@(2,"COM")=$$^%QZCHW("Passage de jour en semaine ou de semaine en jour")
 D ^%HXYPARA(0,2,80,19,"INIT^%DLAFFI2(TD)","AFF^%DLAFFI2","IMP^%DLAFFI2","FCOL",MENU)
 K @(TEMP) Q
 
INIT(TD) 
 
 N %J,%L,ADR,ATCH,ATDJ,ATM,CAPA,CH,CHMA,CHJO,CPT,GL,GLS,JOUR,L,MAX,MIN,OR,JO
 
 S CHMA=$$^%QSCALIN($$MACH^%DLCON2,MAC,$$CAPACITE^%DLCON2,1)+0
 
 S ATCH=$$CHARGAR^%DLCON2,ATM=$$MACHINE^%DLCON2,ATDJ=$$DATEJAL^%DLCON2
 S ADR=$$ADRLIS^%QSGEST7(NL)
 K @(HISTO)
 S GLS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLS") K @(GLS)
 S L="",MIN=10E10
 F %L=1:1 S L=$O(@ADR@(L)) Q:L=""  I $$VAIR^%QSGE5(REP,L,ATM,MAC) D INS
 S (MAX,CPT)=0,JO=MIN
 F %L=0:0 D INSH Q:JO>$ZP(@GLS@(""))
 S @HISTO@("MAX")=MAX,@HISTO=CPT
 S @HISTO@("TEXTE")=3
 K @(GLS)
 
 S LARG=$S(TD=0:8,1:4)
 Q
 
INS 
 S OR=""
IN2 S OR=$$NXTRIAVO^%QSTRUC8(REP,L,ATM,MAC,OR) Q:OR=""
 S CH=$$^%QSCALIN(REP,L,ATCH,OR)
 S JO=$P($$^%QSCALIN(REP,L,ATDJ,OR),",")
 S JOUR=$$02^%QMDATE1(JO)
 
 S CHJO=$$^%QSCALIN($$MACH^%DLCON2,MAC,$$CAPACITE^%DLCON2,JOUR)
 I TD=1 S JO=$$05^%QMDATE1(JO)
 S CH=$S($D(@GLS@(JO)):@GLS@(JO),1:0)+CH,@GLS@(JO)=CH
 
 S CAPA=($S($D(@GLS@(JO,"FCOL")):@GLS@(JO,"FCOL"),1:0)+$S(CHJO="":CHMA,1:CHJO))+0
 S @GLS@(JO,"FCOL")=CAPA
 I TD=1 S @GLS@(JO,"JOUR",JOUR)=""
 S:JO<MIN MIN=JO
 G IN2
 
INSH 
 S CPT=CPT+1
 I '($D(@GLS@(JO))) S @GLS@(JO)=0,@GLS@(JO,"FCOL")=CHMA
 S CH=@GLS@(JO),@HISTO@(CPT)=CH
 S @HISTO@(CPT,"TEXT")=$S(TD=1:JO,1:$$02^%QMDATE1(JO))
 S CAPA=@GLS@(JO,"FCOL"),@HISTO@(CPT,"FCOL")=CAPA,@HISTO@(CPT,"TOTAL")=CAPA
 S:CH>MAX MAX=CH
 S:CAPA>MAX MAX=CAPA
 
 I TD=0 S JO=$O(@REGIM@(JO)) Q
 
 S JOUR=""
 F %J=0:0 S JOUR=$O(@GLS@(JO,"JOUR",JOUR)) Q:JOUR=""  S @HISTO@(CPT,"JOUR",JOUR)=""
 S JO=$$05^%QMDATE1($$50^%QMDATE1(JO)+7) Q
 Q
 
AFF 
 D ^%VZCDB($$^%QZCHW("Charge de la machine")_" "_MAC,0)
 S DX=XG,DY=(YH+DV)-2 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Jour")
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Charge")
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Capacite")
 D NORM^%VVIDEO Q
 
IMP(T) 
 I T="G" G IMPG
 
 S DX=20-$L(MAC),DY=YH-1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Charge de la machine")_" "_MAC
 S DX=0,DY=(DV+YH)-2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Jour")
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Charge")
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Capacite")
 Q
IMPG 
 S @TXT@(YH+1,(XC+LMARG)+10)=$$^%QZCHW("Charge de la machine")_" "_MAC
 S DY=(HFHA+HHIST)+3,@TXT@(DY,XC)=$$^%QZCHW("Jour")
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Charge")
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Capacite")
 Q
 
 
NOM(LAN) 
 N ART,GLO,LIEN,PROF,REPA,REPL
 S REPA=$$ART^%DLCON2,LIEN=$$LINV^%DLCON2,REPL=$$LAN^%DLCON2
 S ART=$$^%QSCALVA(REPL,LAN,$$LIEN1^%QSGEL2(REPL,REPA,3))
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ARBRE") K @(GLO)
 
 D ^%QMNF4(REPA,ART,LIEN,GLO,.PROF)
 I '($D(@GLO)) Q
 
 D ^%QMNF5(GLO,REPA,ART,LIEN,PROF)
 K @(GLO) Q
 
 
DAT(MAC,JOURD,JOURF,CTR) 
 N JOUR
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Charges de la machine")_" "_MAC,0)
 
DATD S DX=0,DY=10 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("premier jour a visualiser")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.JOURD)
 I CTR'="" Q
 I JOURD="" G DATF
 S JOUR=$$CORRECT^%VYDAT(JOURD)
 I JOUR="" G DATD
 S DX=37 X XY W JOURD
 S JOURD=$$12^%QMDATE1(JOUR)
 
DATF S DX=0,DY=14 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("dernier jour a visualiser")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.JOURF)
 I CTR'="" G DATD
 I JOURF="" Q
 S JOUR=$$CORRECT^%VYDAT(JOURF)
 I JOUR="" G DATF
 S DX=37 X XY W JOURF
 S JOURF=$$12^%QMDATE1(JOUR)
 I JOURF<JOURD D ^%VZEAVT($$^%QZCHW("Le dernier jour doit etre superieur au premier")) G DATF
 Q

