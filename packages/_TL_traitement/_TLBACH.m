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

;%TLBACH^INT^1^59547,74028^0
TLBACH ;
PROREG 
 N CTRLA
 
 I MODEX=3 Q:'($$REPRISE)  G MENUMAP
 
 
 I (MODAF=2)&(EXEC'=0) G TSTMOD
 D ^%VZATOU(.CTRLA,"",0,0) I CTRLA'=1 G TSTMOD
 
 I (MODAF=2)!(MODAF=3) S:EXEC'=4 EXEC=1 G TSTMOD
 
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("abandon immediat")_" ? : ","N")=0 G TSTMOD
 D POCLEPA^%VVIDEO S ABANDON=1 Q
TSTMOD 
 
 I (((ORIG="EVAL")&('(ABANDON)))&(MODAF'=2))&(MODAF'=3) D INCPAS^%TLBACH2
 
 I ((MODAF'=2)&(MODAF'=3))!ABANDON Q
 
 
 I (EXEC="")&(MODAF=3) S EXEC=0
 
 I $D(@GLOETD@("NOMBRE.PAS")) S CTRLA=@GLOETD@("NOMBRE.PAS")-1,@GLOETD@("NOMBRE.PAS")=CTRLA D EFFBAS^%TLBACH2 W $$^%QZCHW("nombre de pas")_" : "_CTRLA I CTRLA<1 S EXEC=1
 
 I (MODAF=3)&(EXEC=0) D INCPAS^%TLBACH2 Q
 
 I MODAF=2 D POINTER^%TLBAGF1("TRT",L)
 
 I $D(@GLOETD@("ABANDON.NIVEAU"))&('(ABANDON)) K @GLOETD@("ABANDON.NIVEAU") G MENUMAP
 
 
 I (EXEC'=0)&(EXEC<4) D DUREX^%TLBACH2
 
 D INCPAS^%TLBACH2
 
 I EXEC=0 Q
 
 
 I EXEC>4 S EXEC=EXEC-5 Q
MENUMAP 
 N CHOIX,I,ARCH,OLDP,MENMAP,CTR
 S MENMAP=$$CONCAS^%QZCHAD(GLOETD,"MENU.MAP") I $D(@MENMAP) G SUITMM
 S @MENMAP@(1)="JOURNAL^JOURN"
 S @MENMAP@(2)="INDIVIDUS^LISTE"
 S @MENMAP@(3)="CONTEXTE^CONT"
 S @MENMAP@(4)="TRAITEMENT^TRAIT"
 S @MENMAP@(5)="PAS.SUIVANT^PAS"
 S @MENMAP@(6)="EXECUTION.DIRIGEE^EXEDIR"
 S @MENMAP@(7)="LANCER.EXECUTION^LAN"
 S @MENMAP@(8)="NOMBRE.DE.PAS^NBPAS"
 S @MENMAP@(9)="ABANDON.NIVEAU^MNIV"
 S @MENMAP@(10)="MODE.AFFICHAGE^CHMODE"
SUITMM 
 S ARCH=0 K @GLOETD@("NOMBRE.PAS")
 
 I MODAF=3 D INIAF3^%TLBACH2
 
 I $O(@GLOETD@("EXECUTION.DIRIGEE",NIVEAU-1))'="" G EXEDIR
BCLCH 
 I ARCH'=0 Q
 D EFFBAS^%TLBACH2
 D ^%VQUIKMN(0,79,22,MENMAP,.CHOIX,.CTR)
 I (CTR="")&(CHOIX'="") G @CHOIX
REAFC 
 I CTR="R" D REAF^%TLBAIF(0) G BCLCH
CONTR 
 I (CTR'="A")&(CTR'="F") G AUTRES
 D EFFBAS^%TLBACH2
 I CTR="F",$$MES^%VZEOUI($$^%QZCHW("voulez-vous conserver l'etude")_" ? ","O")=1 S ABANDON=2,ARCH=1 D SAVCXT
 I (CTR="A")!((CTR="F")&('(ABANDON))) D EFFBAS^%TLBACH2 I $$MES^%VZEOUI($$^%QZCHW("voulez-vous vraiment abandonner")_" ? ","N")=1 S ABANDON=3,ARCH=1
 I ABANDON D EFFBAS^%TLBACH2
 G BCLCH
AUTRES 
 D ^%VSQUEAK
 G BCLCH
LAN 
 S ARCH=1
 I EXEC'=4 S EXEC=0
 I EXEC=4 S EXEC=5 D QSUPVL^%TLBACH2 K @GLOETD@("ATTRIBUT") S @GLOETD@("ATTRIBUT")=0
 S @GLOETD@("HEURE.DEBUT")=$H
 G BCLCH
PAS 
 S ARCH=1
 I EXEC'=4 S EXEC=1
 I EXEC=4 S EXEC=6 D QSUPVL^%TLBACH2 K @GLOETD@("ATTRIBUT") S @GLOETD@("ATTRIBUT")=0
 S @GLOETD@("HEURE.DEBUT")=$H
 G BCLCH
MNIV 
 D EFFBAS^%TLBACH2
 I EXEC=4 D ^%VSQUEAK G BCLCH
 I NIVEAU'=1 S @GLOETD@("ABANDON.NIVEAU")=NIVEAU-1
 S ABANDON=1,ARCH=1 G BCLCH
NBPAS 
 D EFFBAS^%TLBACH2
 D LIRE1^%VREAD($$^%QZCHW("nombre de pas")_" ? ","",$X,$Y,.I,.OLDP)
 I (I'="")!(OLDP="") G BCLCH
 I OLDP'>1 D ^%VSQUEAK G NBPAS
 S @GLOETD@("NOMBRE.PAS")=OLDP
 D EFFBAS^%TLBACH2 W $$^%QZCHW("nombre de pas")_" : "_OLDP
 S ARCH=1 I EXEC'=4 S EXEC=0
 I EXEC=4 S EXEC=5 D QSUPVL^%TLBACH2 K @GLOETD@("ATTRIBUT") S @GLOETD@("ATTRIBUT")=0
 S @GLOETD@("HEURE.DEBUT")=$H
 G BCLCH
CONT 
 D CONTXT^%TLBACH3 G BCLCH
EXEDIR 
 S ARCH=$$EXEDIR^%TLBACH3 G BCLCH
CHMODE 
 D CHMODE^%TLBACH2 G BCLCH
LISTE 
 D LISTE^%TLBACH3 G BCLCH
TRAIT 
 D TRAIT^%TLBACH2 G BCLCH
JOURN 
 S OLDP=$$CHOIX^%TLBAGF2("LOG",0,0) G BCLCH
 
EPIREG() 
 N GLO,NUMCOU
 I (((MODAF'=2)&(MODAF'=3))!(ABANDON=2))!(ABANDON=3) Q 0
 S GLO=$$CONCAS^%QZCHAD(GLOETD,"EXECUTION.DIRIGEE,"_NIVEAU)
 I '($D(@GLO)) G NONEXD
 I ABANDON D REAF^%TLBAIF(1) S ABANDON=0 Q 1
 I ((@GLO@("ANCIEN.EXEC")=4)!(@GLO@("MODEX")=1))!(ECHEC=1) Q 1
 S @("NUMCOU=$$REGCOU"_ROUTPL) I NUMRG=NUMCOU Q 0
 D @("TRTEXD"_ROUTPL)
 Q 1
NONEXD 
 I $D(@GLOETD@("ABANDON.NIVEAU")),NIVEAU=@GLOETD@("ABANDON.NIVEAU") S ABANDON=0,ECHEC=1 D REAF^%TLBAIF(1)
 Q 0
EPITRT() 
 I (((MODAF'=2)&(MODAF'=3))!(ABANDON=2))!(ABANDON=3) Q 0
 I MODEX=3 Q:'($$REPRISE) 2 G GOMEN
 I ABANDON S ABANDON=0 D REAF^%TLBAIF(1) I $D(@GLOETD@("ABANDON.NIVEAU")) K @GLOETD@("ABANDON.NIVEAU") G GOMEN
 D DUREX^%TLBACH2
GOMEN I $D(^BATCHMOD($J)),^BATCHMOD($J)=1 D EFFBAS^%TLBACH2 S ABANDON=2,ARCH=1 D SAVCXT Q 0
 S EXEC=4 D MENUMAP
 I ABANDON Q 0
 I EXEC>4 Q 1
 I (EXEC=2)!(EXEC=3) Q 2
 Q 0
REPRISE() 
 N I,GLO
 S GLO=$$CONCAS^%QZCHAD(GLOETD,"EXECUTION.DIRIGEE,"_NIVEAU)
 I $D(@GLO) S NUMRG=@GLO@("NUMRG")
 I NIVEAU'=@GLOETD@("NIVEAU") Q 0
 G:$D(L) REP2
 S GLO=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 I '($D(@GLO)) S L=1,NUMRG=@PLAN@(1) G REP2
 I '($D(@GLO@("POSITION.PLAN"))) S L=1,NUMRG=@PLAN@(1) G REP2
 S L=@GLO@("POSITION.PLAN"),NUMRG=@PLAN@(L)
REP2 S MODEX=2 I EXEC="" S EXEC=1
 D REAF^%TLBAIF(0),POINTER^%TLBAGF1("TRT",L)
 S I=NIVEAU
RCNVX3 
 I '($D(@GLOETD@(I,"INDIVIDU.COURANT"))) S I=I-1 G RCNVX3
 S I=$S($D(@GLOETD@(NIVEAU,"DERNIER.INDIVIDU.TRAITE")):@GLOETD@(NIVEAU,"DERNIER.INDIVIDU.TRAITE"),1:1)
 D POINTER^%TLBAGF1("LIS",I)
 Q 1
SAVCXT 
 N I,J
 K @GLOETD@("CONTEXTE")
 S I=""
BCLPC 
 S I=$O(CXT(I)) I I="" Q
 S J=""
BCLDP 
 S J=$O(CXT(I,J)) I J="" G BCLPC
 I ((I="@")!(I="%"))&((J="BASE")!(J="OBJET")) G BCLDP
 S @GLOETD@("CONTEXTE",I,J)=CXT(I,J)
 G BCLDP

