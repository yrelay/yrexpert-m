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

;%QMCP9^INT^1^59547,73876^0
%QMCP9(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2) 
 N XMODE,PATH
 S XMODE=1,PATH="F"
 G GO
 
COPY(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2,XMODE,PATH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GO N TEMP,STRUCT,COOR,ADRLIS,INDI1,OK,DX,DY
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S STRUCT=$$CONCAS^%QZCHAD(TEMP,"STRUCT")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 S ADRLIS=$$CONCAS^%QZCHAD(TEMP,"ADRLIS")
 S INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 S OK=1
 
 D FAMILLE^%QMCP8(STRUCT,WHOIS1,QUI1,BASE1,PATH)
 
 D MORESTR^%QMCPZ1(WHOIS1,QUI1,STRUCT)
 
 S @ADRLIS@(IND1)=""
 S @COOR@(BASE1,IND1)=IND2
 
 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE1,STRUCT,COOR,WHOIS2,QUI2,INTERD,0,1)
 
 S INDI1=$O(@INTERD@(BASE1,""))
 F I=0:0 Q:INDI1=""  S OK=OK&$$FILS^%QMCP5(COOR,STRUCT,INTERD,QUI1,BASE1,INDI1,QUI2,ERR,1),INDI1=$O(@INTERD@(BASE1,INDI1))
 I '(OK) K @(TEMP) Q
 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE1,STRUCT,COOR,WHOIS2,QUI2,"",XMODE,2)
 
 
 
 I (1=$$RANG^%QMCPZ(WHOIS2,QUI2,BASE1))!(OR2="") K @(TEMP) Q
 I PATH'="F" K @(TEMP) Q
 N BASE2P,LIEN2PF,IND2P,NOM2
 S NOM2=$$NOMEX^%QMCPZ(WHOIS2,QUI2,BASE1,IND2)
 D PEREFILS^%QMCPZ(WHOIS2,QUI2,BASE1,.BASE2P,.LIEN2PF)
 S IND2P=$$NOMPERE^%QMCPZ(WHOIS2,QUI2,BASE1,IND2)
 D OSUP^%QMCPZ(WHOIS2,QUI2,BASE2P,IND2P,NOM2,LIEN2PF,BASE1,NOM2)
 D ADDO^%QMCPZ(WHOIS2,QUI2,BASE2P,IND2P,OR2,LIEN2PF,BASE1,NOM2)
 Q
 
 
DIA N WHOIS1,WHOIS2,QUI1,QUI2,REP1,BASE1,DY1,CTR,KILL,TEMP,LREP1,MSG,OR2,LOR2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIA") K @(TEMP)
 S LREP1=$$CONCAS^%QZCHAD(TEMP,"LREP1")
 S LOR2=$$CONCAS^%QZCHAD(TEMP,"LOR2")
 S WHOIS1=WHOIS,KILL=0
 D REAFF
 S DY1=5
 S WHOIS2=$$WHOIS2(WHOIS1,.QUI1,.QUI2,DY1)
 I WHOIS2="" G FDIA
 S DY1=DY1+2
 S REP1=""
DIA1 S MSG=$$^%QZCHW("repertoire de l'individu a copier")_" : "
 D LIRE2^%VREAD(MSG,REP1,0,RM-1,DY1+1,DY1-1,"","",.CTR,.REP1)
 I CTR="A" G FDIA
 I REP1="?" D REPA^%QMCPZ(WHOIS1,QUI1,LREP1) S REP1=$$ZSEL(LREP1) G DIA1
 S BASE1=$$NOMINT^%QMCPZ(WHOIS1,QUI1,REP1)
 I BASE1="" D ^%VZEAVT(REP1_" "_$$^%QZCHW("n'est pas un repertoire de")_" "_WHOIS1) G DIA1
 S DY1=DY1+2
 S IND1=""
DIAL2 D LIRE2^%VREAD($$^%QZCHW("individu a copier")_" : ",IND1,0,RM-1,DY1+1,DY1-1,"","",.CTR,.IND1)
 I CTR="A" G FDIA
 I IND1="?" S IND1=$$ZSEL($$LISTIND^%QSGEST6(BASE1)) G DIAL2
 I '($$IR^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)) D ^%VZEAVT(IND1_" "_$$^%QZCHW("n'est pas un individu du repertoire")_" "_REP1) G DIAL2
 S DY1=DY1+2,IND2=IND1
DIAL3 D LIRE2^%VREAD($$^%QZCHW("futur individu")_" : ",IND2,0,RM-1,DY1+1,DY1-1,"","",.CTR,.IND2)
 I CTR="A" G FDIA
 S MSG=$$NOMOK^%QMCPZ(WHOIS2,QUI2,REP1,IND2)
 I MSG'="" D ^%VZEAVT(MSG) G DIAL3
 I (QUI1=QUI2)&(IND1=IND2) D ^%VZEAVT($$^%QZCHW("vous ne pouvez copier un individu sur lui meme")) G DIAL3
 I $$IR^%QMCPZ(WHOIS2,QUI2,BASE1,IND2) D ^%VZEAVT(IND2_" "_$$^%QZCHW("existe deja")_" "_REP1) S DX=0,DY=DY1+2 X XY S KILL=$$CONFIRM^%VZEOUI($$^%QZCHW("Souhaitez vous le detruire ?")) I '(KILL) G DIAL2
 
 
 S OR2=""
 I 1<$$RANG^%QMCPZ(WHOIS2,QUI2,BASE1),$$RANG G FDIA
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("confirmez vous la copie ?"),"N")) G FDIA
 D:KILL SX^%QMCPZ(WHOIS2,QUI2,BASE1,IND2)
 D ^%QMCP9(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2)
FDIA K @(TEMP) Q
 
REAFF D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("copie hierarchique"),0) Q
WHOIS2(WHOIS1,QUI1,QUI2,DY1) 
 N CTR,WHOIS2
WHOIS1 D LIRE1^%VREAD(WHOIS_" "_$$^%QZCHW("quel service destination")_" : ","",0,DY1,.CTR,.WHOIS2)
 I CTR="A" Q ""
 I WHOIS2="" Q ""
 S QUI1=$$TABIDI^%INCOIN(WHOIS1,"MACHINE")
 S QUI2=$$TABIDI^%INCOIN(WHOIS2,"MACHINE")
 I QUI2="" D ^%VZEAVT(WHOIS2_" "_$$^%QZCHW("n'est pas defini ou n'a pas de partition donnees")) G WHOIS1
 Q WHOIS2
ZSEL(NOM) 
 N CHOIX
 D INIT^%QUCHOIP(NOM,1,"",1,15,75,7),AFF^%QUCHOIP
 S CHOIX=$$UN^%QUCHOIP D END^%QUCHOIP
 Q CHOIX
 
RANG() N BASE2P,LIEN2PF,IND2P
 S DY1=DY1+2,OR2=""
 K @(LOR2)
 D PEREFILS^%QMCPZ(WHOIS2,QUI2,BASE1,.BASE2P,.LIEN2PF)
 S IND2P=$$NOMPERE^%QMCPZ(WHOIS2,QUI2,BASE1,IND2)
 D MVG^%QMCPZ(WHOIS2,QUI2,BASE2P,IND2P,LIEN2PF,LOR2)
RANG1 D LIRE2^%VREAD($$^%QZCHW("numero d'ordre du lien depuis le pere")_" : ",OR2,0,RM-1,DY1+1,DY1-1,"","",.CTR,.OR2)
 I CTR="A" Q 1
 I OR2="" D ^%VZEAVT($$^%QZCHW("la chaine vide est interdite")) G RANG1
 I $D(@LOR2@(OR2)),('(KILL))!(IND2'=@LOR2@(OR2)) D ^%VZEAVT(OR2_" "_$$^%QZCHW("est deja utilise pour l'individu ")_" "_@LOR2@(OR2)) G RANG1
 Q 0

