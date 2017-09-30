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

;%QMCP6^INT^1^59547,73876^0
%QMCP6 ;
 
 N CTR,COPIE,DX,DY,MODE,MSG,MODAF
 S MODE=$$^%QZCHW("activation")
 D REAFF^%QMCP4(MODE)
 D LIRE2^%VREAD($$^%QZCHW("Copie")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QMCP4("""_MODE_""")","$$UC1^%QMCP4",.CTR,.COPIE)
 I (CTR="A")!(COPIE="") Q
 I COPIE="?" S COPIE=$$^%QUCHOYO($$ADR^%QMCPZ,.R,1) I COPIE="" Q
 D REAFF^%QMCP4(MODE)
 S MSG=$$ACT(COPIE,MODE,1,"","")
 I MSG'="" D ^%VZEAVT(MSG)
 Q
 
ACT(COPIE,MODE,XMODE,TAPE,IO) 
 N DEFR,DEFB,DEFI,OK,STRUCT,ERR,TEMP,CTR,LBASE1,DY,DY,ADRLIS,QUI1,QUI2
 N WHOIS1,WHOIS2,DY1,ERR1,ECR,ABORT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ACT")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 S ERR1=$$CONCAS^%QZCHAD(TEMP,"ERR1")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 K @(TEMP)
 S DX=0,DY=5,DY1=5
 
 I '($$OKANA^%QMCPZ(COPIE)) D FIN Q COPIE_" "_$$^%QZCHW("n'existe pas ou n'est pas une definition de copie valide")
 S STRUCT=$$ADRSTR^%QMCPZ(COPIE)
 S QUI1=$O(@STRUCT@("QUI",""))
 S QUI2=@STRUCT@("QUI",QUI1)
 S WHOIS1=@STRUCT@("WHOIS1")
 S WHOIS2=@STRUCT@("WHOIS2")
 
 
 S DEFR=""
ACT1 D LIRE2^%VREAD($$^%QZCHW("repertoire de l'individu de definition")_" : ",DEFR,1,RM-1,DY1+1,DY1-1,"","",.CTR,.DEFR)
 I CTR="A" D FIN Q ""
 I DEFR="?" S DEFR=$$REP^%QSGES14 D REAFF^%QMCP4(MODE) G ACT1
 S DEFB=$$NOMINT^%QMCPZ(WHOIS1,QUI1,DEFR)
 I DEFR'="",DEFB="" D ^%VZEAVT(DEFR_" "_$$^%QZCHW("n'est pas un nom de repertoire")) G ACT1
 
 I DEFR="" G ACT3
 S DEFI=""
ACT2 I DEFR'="" D LIRE2^%VREAD($$^%QZCHW("individu de definition")_" : ",DEFI,1,RM-1,(DY1+1)+2,(DY1-1)+2,"","",.CTR,.DEFI)
 I CTR="A" D FIN Q ""
 I DEFI="?" S DEFI=$$^%QUCHOIS($$LISTIND^%QSGEST6(DEFB),$$^%QZCHW("individu de definition")) D REAFF^%QMCP4(MODE) G ACT2
 I '($$IR^%QMCPZ(WHOIS1,QUI1,DEFB,DEFI)) D ^%VZEAVT(DEFI_" "_$$^%QZCHW("n'est pas un individu du repertoire")_" "_DEFR) G ACT2
ACT3 I DEFR="" S DEFI=""
 
 
 S BASE=@STRUCT@("BS")
 S LBASE1(BASE)=""
 S LISTE=$$SEL^%QMCPZ(WHOIS1,QUI1,"LBASE1",$$^%QZCHW("quels individus a recopier"))
 I LISTE="" D FIN Q ""
 
 I XMODE=3 D KLK^%QMCPOZ(QUI)
 
 
 D RENOM^%QMCP5(STRUCT,WHOIS1,QUI1,QUI1,DEFB,DEFI,COOR)
 S OK=$$COOR^%QMCP5(STRUCT,COOR,LISTE,ERR,XMODE)
 
 I $D(@ERR) D AFFERR(ERR,MODE)
 
 I '(OK) D FIN Q ""
 S ECR=0
 
 I XMODE=3 S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"SAUVEGARDE",ERR1)
 
 I XMODE'=3,@STRUCT@("VERIFICATION") S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"VERIFICATION",ERR1) I ECR D AFFERR(ERR1,MODE),POCLEPA^%VVIDEO I '($$MES^%VZEOUI($$^%QZCHW("souhaitez vous effectuer la copie ?"),"N")) D FIN Q ""
 
 I XMODE=3 D PASSE1^%QMCPAD("")
 
 I XMODE'=3,@STRUCT@("DESTRUCTION") S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"DESTRUCTION",ERR1)
 I XMODE'=3,ECR,@STRUCT@("DESTRUCTION")=0 D SUP(STRUCT,ERR1,COOR)
 
 S ADRLIS=$$ADRLIS^%QMCPZ(WHOIS1,QUI1,LISTE)
 I XMODE'=3 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE,STRUCT,COOR,WHOIS2,QUI2,"",1,2)
 I XMODE=3 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE,STRUCT,COOR,WHOIS2,QUI2,"",3,2)
 I XMODE=3 D FLUSH^%QMCPOZ(TAPE,IO,.ABORT)
 D FIN
 Q ""
AFFERR(ERR,MODE) N P
 D REAFF^%QMCP4(MODE)
 S P=1
 D CARSA^%VVIDEO(0,2,80,20)
 D REAFF^%QULIMO3(1,1,ERR,0,2,80,20)
 D VISU^%QULIMO(0,2,80,20,ERR,.P)
 Q
SUP(STRUCT,ERR,COOR) 
 
 N %L,L,IND,CO,RD,RO,%R
 S L="" F %L=0:0 S L=$O(@ERR@(L)) Q:L=""  I @ERR@(L)["existe" D KIL
 Q
KIL S CO=$P(@ERR@(L)," existe",1)
 S IND=$P(CO," ",$L(CO," ")),RD=$P(CO," ",$L(CO," ")-1)
 S RD=$$NOMINT^%QMCPZ(WHOIS2,QUI2,RD)
 
 S RO="" F %R=0:0 S RO=$O(@STRUCT@("S",RO)) Q:RO=""  I @STRUCT@("S",RO,"BDI")=RD Q
 
 K @COOR@(RO,IND)
 Q
 
FIN K @(TEMP) Q
 
TEST X ^SMA
 W $$ACT("COPIE1")
 Q
TEST1 X ^SMA
 W $$ACT("COPIE2")
 Q

