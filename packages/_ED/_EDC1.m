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

;%EDC1^INT^1^59547,73868^0
%EDC1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EDIT N I,R,MODL,MODECR
 N CXT,TEMP,DIVIDE,BASE,OBJET,VAR,OK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR"),DIVIDE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIVIDE")
EDITL D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("EDITION D'UN DOCUMENT"))
 S MODL=$$GET^%EDDDIA(.MODECR) G:MODL="" ABORT
 D:MODECR ^%VZCD0($$^%QZCHW("EDITION D'UN DOCUMENT"))
 G VAR
 
ABORT Q
VAR S (BASE,OBJET)=""
 S VAR=$$^%QZCHW("OBJET DE BASE")
 S OK=$$GETVAR
 G:'(OK) EDIT
 S (CXT("@","BASE"),BASE)=CXT(VAR,"BASE"),(CXT("@","OBJET"),OBJET)=CXT(VAR,"OBJET") K CONT(VAR)
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 I (OK=1)&$D(^[QUI]EDMOD(MODL,"VAR")) D ^%VZEAVT($$^%QZCHW("Lorsque des individus symboliques sont definis, l'objet de base doit etre specifie")) G EDIT
 S:$D(CXT(VAR,"OBJET"))&$D(CXT(VAR,"BASE")) BASE=CXT(VAR,"BASE"),OBJET=CXT(VAR,"OBJET")
 S NV=-1 F U=0:0 S NV=$N(^[QUI]EDMOD(MODL,"VAR",NV)) Q:NV=-1  S VAR=^[QUI]EDMOD(MODL,"VAR",NV),OK=$$GETVAR Q:'(OK)
 G:'(OK) EDIT G CONFIG
 
GETVAR() N BASE,OBJET,RESUL,PATOUCH,DEJALU
 N CTRLL,CTRLP,CTRLP,CTRLR,CTRLZ D CLFEN^%VVIDEO(0,8,5,79)
 S RESUL(1)=VAR,RESUL(2)="",RESUL(3)="",PATOUCH(1)=1,DEJALU(1)=1 F IC=2,3 S PATOUCH(IC)="",DEJALU(IC)=""
 S SCR="EDGETVAR",CMS=0 D ^%VAFIGRI,^%VAFISCR,^%VMODISC Q:ABENDSCR 0
 S CXT(VAR,"BASE")=$$NOMINT^%QSF(RESUL(2)),CXT(VAR,"OBJET")=RESUL(3)
 I (CXT(VAR,"BASE")="")!(CXT(VAR,"OBJET")="") Q 1
 Q 2
 
INTRB S REFUSE=1,CTRLF=0,RES=RESUL(IC) G LB:RES="?"
 Q:RES=""  Q:'($D(^[QUI]RQSAUTOR(WHOIS,RES)))
 S REFUSE=0 Q
LB D INIT^%QUCHOIP("^[QUI]RQSAUTOR(WHOIS)","",1,0,13,15,10),AFF^%QUCHOIP S RESUL(IC)=$$UN^%QUCHOIP I RESUL(IC)="" S REFUSE=1 Q
 S TAB(IC)=RESUL(IC) D ^%VAFFICH S REFUSE=0 Q
INTRO S REFUSE=1,CTRLF=0,RES=RESUL(IC) G LO:RES="?"
 I RES="" S REFUSE=1 Q
 I RESUL(2)="" S REFUSE=1 Q
 S BAINT=$$NOMINT^%QSF(RESUL(2))
 I '($$IR^%QSGEST5(BAINT,RES)) S REFUSE=1 Q
 S REFUSE=0 Q
LO S BAINT=$$NOMINT^%QSF(RESUL(2)) D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BAINT),"",1,15,13,65,10),AFF^%QUCHOIP S RESUL(IC)=$$UN^%QUCHOIP Q:RESUL(IC)=""
 S TAB(IC)=RESUL(IC) D ^%VAFFICH S REFUSE=0 Q
 
CONFIG 
 K CTRLA,CTRLB,CTRLE,CTRLF,CTRLH,CTRLJ,ABENSCR,REFUSE,STOPUC,%9X,%9Y,%9EPA,%9T
 N GLO,ADRM,VALPLA S ADRM(MODL)=0,VALPLA=""
 S GLO="^[QUI]EDMOD(MODL)",LISTEMOD(MODL)=1
 S %PORT=$$^%QCAZG("^TABIDENT(WHOIS,""TABTRA"")"),%TERM=$$^%QCAZG("^TABIDENT(WHOIS,""TYPTAB"")") S:%PORT="" %PORT=0 S:%TERM="" %TERM=0
 K LISTEMOD,^V($J,MODL),^V($J,"%")
 
 I '($$^%EDPRLG) G EDIT
 D INIT^%EDCENVL
 D DEB^%VTIME,MSG^%VZEATT($$^%QZCHW("Edition en cours..."))
 N I,LIGNE,MOD,VALPLA,ARRET S MOD=MODL,VALPLA=" ",ARRET=0
 
 D ^%EDC2(MODL,BASE,OBJET)
 
 
 S %FONC="PRENDRE" D ^%PBPZ
 K @(TEMP),@(DIVIDE) S LIGNE="",@TEMP=0,@DIVIDE=0
BOUCL 
 S LIGNE=$O(@GLO@("COMP",LIGNE))
 G:ARRET FBOUCL
 G:LIGNE="" FBOUCL
 G:@GLO@("COMP",LIGNE)="" FBOUCL
 X @GLO@("COMP",LIGNE)
 G BOUCL
 
FBOUCL D ^%EDEPLG
 
 
 
 
 K LISTEMOD,^V($J,MODL),^V($J,"%"),^V($J,"GDX")
 
 D ^%VZEAVT($$^%QZCHW("Duree")_" : "_$$DUREE^%VTIME)
 D SX^%QSGESTK("%",$J)
 S $ZT=""
 I @TEMP'=0 D AFFERR(TEMP,1)
 D:@DIVIDE'=0 AFFERR(DIVIDE,0)
 K @(TEMP),@(DIVIDE)
 G EDITL
ERROR 
 S $ZT="",ERR=$P($ZE,">",1),ERR=$P(ERR,"<",2)
 G:ERR="DIVIDE" DIVIDE
 S @TEMP@($ZE_" "_LIGNE_" "_@GLO@("LIGNE",LIGNE))="",@TEMP=@TEMP+1
 G BOUCL
DIVIDE D POCLEPA^%VVIDEO,BLK^%VVIDEO S MES="Division par zero --> ligne "_LIGNE_" : "_$E(@GLO@("LIGNE",LIGNE),1,45)
 S @DIVIDE@(MES)="",@DIVIDE=@DIVIDE+1 X XY D NORM^%VVIDEO G BOUCL
 
AFFERR(G,TYP) 
 D CLEPAG^%VVIDEO,^%VZCDB("ERREURS "_$S(TYP=1:"SYSTEMES",1:"de DIVISION"),0) S DX=0,DY=2 X XY W "CTRLA ou CTRLF pour sortir" S DX=59 X XY W "CTRLJ pour imprimer"
 D INIT^%QUCHOIP(G,"",1,0,4,79,17),AFF^%QUCHOIP
 I TYP S DX=12,DY=22 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "Veuillez communiquer cette liste a Yrelay. Merci" X XY D NORM^%VVIDEO
AFFER1 S Y1=$$UN^%QUCHOIP G:Y1'="" AFFER1
 Q
TEST 
 D CLEPAG^%VVIDEO S TEMP="ERR",DIVIDE="DIV"
 F I=1:1:4 S @TEMP=1,@TEMP@("<UNDEFINED>LABEL+"_I_"^%EDC1")=""
 F I=5:1:9 S @TEMP=1,@TEMP@("<SYNTAX>LABEL+"_I_"^%EDC1")=""
 F I=1:1:9 S @DIVIDE=1,@DIVIDE@("Division par zero ligne "_I)=""
 D AFFERR(TEMP,1),AFFERR(DIVIDE,0) K @(TEMP),@(DIVIDE),TEMP,DIVIDE D CLEPAG^%VVIDEO Q

