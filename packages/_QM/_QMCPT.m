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

;%QMCPT^INT^1^59547,73877^0
QMCPT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DIACONT() N MSG,TEMP,LOR2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIA")
 S LOR2=$$CONCAS^%QZCHAD(TEMP,"LOR2")
 K @(TEMP)
 S WHOIS1=WHOIS
 S QUI1=$$TABIDI^%INCOIN(WHOIS1,"MACHINE")
 I QUI1="" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_WHOIS1_" "_$$^%QZCHW("n'est pas defini ou n'a pas de partition donnees")) D FIN Q 0
 S QUI2=$$TABIDI^%INCOIN(WHOIS2,"MACHINE")
 I QUI2="" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_WHOIS2_" "_$$^%QZCHW("n'est pas defini ou n'a pas de partition donnees")) D FIN Q 0
 S BASE1=$$NOMINT^%QMCPZ(WHOIS1,QUI1,REP1)
 I BASE1="" D:MODAF'=0 ADD^%TLIFEN("LOG",REP1_" "_$$^%QZCHW("n'est pas un repertoire de")_" "_WHOIS1) D FIN Q 0
 I '($$IR^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)) D:MODAF'=0 ADD^%TLIFEN("LOG",IND1_" "_$$^%QZCHW("n'est pas un individu du repertoire")_" "_REP1) D FIN Q 0
 S MSG=$$NOMOK^%QMCPZ(WHOIS2,QUI2,REP1,IND2)
 I MSG'="" D:MODAF'=0 ADD^%TLIFEN("LOG",MSG) D FIN Q 0
 I (QUI1=QUI2)&(IND1=IND2) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("vous ne pouvez copier un individu sur lui meme")) D FIN Q 0
 I $$IR^%QMCPZ(WHOIS2,QUI2,BASE1,IND2) D:MODAF'=0 ADD^%TLIFEN("LOG",IND2_" "_$$^%QZCHW("existe deja dans ")_" "_REP1) D FIN Q 0
 I 1<$$RANG^%QMCPZ(WHOIS2,QUI2,BASE1) S LERR=$$RANG I LERR'="" D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",LERR) Q 0
 D FIN Q 1
 
 
DIAREC(COPIE) 
 N OK,STRUCT,ERR,TEMP,CTR,LBASE1,DY,DY,ADRLIS,QUI1,QUI2,ECR
 N WHOIS1,WHOIS2,DY1,ERR1,MODE,LERR
 S MODE=$$^%QZCHW("activation")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ACT")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 S ERR1=$$CONCAS^%QZCHAD(TEMP,"ERR1")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 K @(TEMP)
 S DX=0,DY=5,DY1=5
 
 I '($$OKANA^%QMCPZ(COPIE)) D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",COPIE_" "_$$^%QZCHW("n'existe pas ou n'est pas valide")) Q 0
 S STRUCT=$$ADRSTR^%QMCPZ(COPIE)
 S QUI1=$O(@STRUCT@("QUI",""))
 S QUI2=@STRUCT@("QUI",QUI1)
 S WHOIS1=@STRUCT@("WHOIS1")
 S WHOIS2=@STRUCT@("WHOIS2")
 
 I DEFR="" S DEFI="",DEFB="" G ACT3
 S DEFB=$$NOMINT^%QMCPZ(WHOIS1,QUI1,DEFR)
 I DEFB="" D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",DEFR_" "_$$^%QZCHW("n'est pas un nom de repertoire")) Q 0
 
 I '($$IR^%QMCPZ(WHOIS1,QUI1,DEFB,DEFI)) D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",DEFI_" "_$$^%QZCHW("n'est pas un individu du repertoire")_" "_DEFR) Q 0
ACT3 
 
 S BASE=@STRUCT@("BS")
 S LBASE1(BASE)=""
 
 I LISTE="" D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("La liste n'est pas definie")) Q 0
 
 
 D RENOM^%QMCP5(STRUCT,WHOIS1,QUI1,QUI1,DEFB,DEFI,COOR)
 S OK=$$COOR^%QMCP5(STRUCT,COOR,LISTE,ERR,1)
 
 I (OK=0)!$D(@ERR) D AFFGL(ERR),FIN Q 0
 
 
 
 I @STRUCT@("VERIFICATION") S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"VERIFICATION",ERR1) I ECR&('($D(@STRUCT@("DESTRUCTION")))) D FIN D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu deja existant")) Q 0
 
 I @STRUCT@("DESTRUCTION")&(MODEX'=1) S ECR=$$^%QMCP22(STRUCT,COOR,QUI2,"DESTRUCTION",ERR1)
 
 S ADRLIS=$$ADRLIS^%QMCPZ(WHOIS1,QUI1,LISTE)
 D:MODEX'=1 ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE,STRUCT,COOR,WHOIS2,QUI2,"",1,2)
 D FIN
 Q 1
 
FIN K @(TEMP)
 Q
 
AFFGL(GLOB) 
 Q:MODAF'=0
 S %I=""
BAFFGL S %I=$O(@GLOB@(%I))
 Q:%I=""
 D ADD^%TLIFEN("LOG",@GLOB@(%I))
 G BAFFGL
 
RANG() N BASE2P,LIEN2PF,IND2P
 K @(LOR2)
 D PEREFILS^%QMCPZ(WHOIS2,QUI2,BASE1,.BASE2P,.LIEN2PF)
 S IND2P=$$NOMPERE^%QMCPZ(WHOIS2,QUI2,BASE1,IND2)
 D MVG^%QMCPZ(WHOIS2,QUI2,BASE2P,IND2P,LIEN2PF,LOR2)
 S:OR2="" OR2=$P(IND2,IND2P_",",2)
 
 I $D(@LOR2@(OR2)),('(KILL))!(IND2'=@LOR2@(OR2)) Q $$^%QZCHW("no d'ordre")_" "_OR2_" "_$$^%QZCHW("deja utilise pour l'individu ")_" "_@LOR2@(OR2)
 Q ""

