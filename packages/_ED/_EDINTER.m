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

;%EDINTER^INT^1^59547,73869^0
EDINTERP ;
 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("EDITION D'UN DOCUMENT"))
LECMOD S DX=0,DY=7 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("Modele de texte : ")
 S DX=$X D ^%VLEC
 I Y1="?" S Y1=$$SUP^%QUCHOIX("^[QUI]EDMOD",Y1,0,9,80,12),DX=18,DY=7 X XY W Y1 S DX=0,DY=8 D CLEBAS^%VVIDEO
 G ABORT:Y1="",VAR:$D(^[QUI]EDMOD(Y1)) D ^%VSQUEAK G LECMOD
ABORT Q
VAR D DEB^%VTIME
 S MODL=Y1
 G CONFIG:'($D(^[QUI]EDMOD(MODL,"VAR")))
 S NV=-1 F U=0:0 S NV=$N(^[QUI]EDMOD(MODL,"VAR",NV)) Q:NV=-1  S VAR=^[QUI]EDMOD(MODL,"VAR",NV),OK=$$GETVAR Q:'(OK)
 G EDINTERP:'(OK),CONFIG
GETVAR() S RESUL(1)=VAR,RESUL(2)="",RESUL(3)="",PATOUCH(1)=1,DEJALU(1)=1 F IC=2,3 S PATOUCH(IC)="",DEJALU(IC)=""
 S SCR="EDGETVAR",CMS=0 D ^%VAFIGRI,^%VAFISCR,^%VMODISC Q:ABENDSCR 0
 S CONT(VAR,"BASE")=$$NOMINT^%QSF(RESUL(2)),CONT(VAR,"OBJET")=RESUL(3)
 Q 1
 
INTRB S REFUSE=1,CTRLF=0,RES=RESUL(IC) G LB:RES="?"
 Q:RES=""  Q:'($D(^RQSAUTOR(WHOIS,RES)))
 S REFUSE=0 Q
LB D INIT^%QUCHOIP("^RQSAUTOR(WHOIS)","",1,0,13,15,10),AFF^%QUCHOIP S RESUL(IC)=$$UN^%QUCHOIP I RESUL(IC)="" S REFUSE=1 Q
 S TAB(IC)=RESUL(IC) D ^%VAFFICH S REFUSE=0 Q
INTRO S REFUSE=1,CTRLF=0,RES=RESUL(IC) G LO:RES="?"
 I RES="" S REFUSE=1 Q
 I RESUL(2)="" S REFUSE=1 Q
 S BAINT=$$NOMINT^%QSF(RESUL(2))
 I '($D(^[QUI]QUERY1(BAINT,RES))) S REFUSE=1 Q
 S REFUSE=0 Q
LO S BAINT=$$NOMINT^%QSF(RESUL(2)) D INIT^%QUCHOIP("^[QUI]QUERYV(BAINT)","",1,15,13,65,10),AFF^%QUCHOIP S RESUL(IC)=$$UN^%QUCHOIP Q:RESUL(IC)=""
 S TAB(IC)=RESUL(IC) D ^%VAFFICH S REFUSE=0 Q
 
CONFIG 
 D ^%VZEATT
 S GLO="^[QUI]EDMOD(MODL,""LIGNE"")",LISTEMODL(MODL)=1
 S %PORT=$$^%QCAZG("^TABIDENT(WHOIS,""TABTRA"")"),%TERM=$$^%QCAZG("^TABIDENT(WHOIS,""TYPTAB"")") S:%PORT="" %PORT=0 S:%TERM="" %TERM=0
 
 
 
 I '($$^%EDPRLG) G EDINTERP
 S %FONC="PRENDRE" D ^%PBPZ
 D ^%EDMODIN("",GLO,"HORIZONTALE",.CONT,%PORT,%TERM)
 
 
 
 D ^%EDEPLG
 D AFF^%VTIME W "  [RETURN]" D ^%VSQUEAK F I=0:0 R *R Q:R=13
 G EDINTERP

