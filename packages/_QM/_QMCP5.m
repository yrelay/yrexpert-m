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

;%QMCP5^INT^1^59547,73876^0
QMCP5 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
COOR(STRUCT,COOR,LISTE,ERR,XMODE) 
 N TEMP,I,ATT,QUI1,BASE1,IND1,WHOIS1,WHOIS2,QUI2,TYPE,ADRLIS,BASE1L,INTERD,LTETE,OK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COOR") K @(TEMP)
 S INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 S LTETE=$$CONCAS^%QZCHAD(TEMP,"LTETE")
 S OK=1
 S QUI1=$O(@STRUCT@("QUI",""))
 S QUI2=@STRUCT@("QUI",QUI1)
 S WHOIS1=@STRUCT@("WHOIS1")
 S WHOIS2=@STRUCT@("WHOIS2")
 S ADRLIS=$$ADRLIS^%QMCPZ(WHOIS1,QUI1,LISTE)
 I (ADRLIS=0)!(ADRLIS="") D ADD^%VPRIN1(ERR,$$^%QZCHW("impossible de retrouver les individus de la liste")_" "_LISTE) S OK=0 Q OK
 S BASE1L=$$BASE^%QMCPZ(WHOIS1,QUI1,LISTE)
 I BASE1L="" D ADD^%VPRIN1(ERR,$$^%QZCHW("impossible de retrouver le repertoire des individus de la liste")_" "_LISTE) S OK=0 Q OK
 I BASE1L'=@STRUCT@("BS") D ADD^%VPRIN1(ERR,$$^%QZCHW("les individus de la liste")_" "_LISTE_" "_$$^%QZCHW("ne sont pas des")_" "_$$NOMLOG^%QMCPZ(WHOIS1,QUI1,@STRUCT@("BS"))) S OK=0 Q OK
 
 
 
 D ^%QMCP1(WHOIS1,QUI1,ADRLIS,BASE1L,STRUCT,COOR,WHOIS2,QUI2,INTERD,0,1)
 
 S BASE1=$O(@STRUCT@("S",""))
 F I=0:0 Q:BASE1=""  D COOR1 S BASE1=$O(@STRUCT@("S",BASE1))
 
 
 S BASE1=$O(@LTETE@(""))
 F I=0:0 Q:BASE1=""  D COOR2 S BASE1=$O(@LTETE@(BASE1))
 Q OK
COOR1 N RPERE
 S RPERE=$$RPERE(STRUCT,QUI1,BASE1)
 I RPERE="" S @LTETE@(BASE1)="" Q
 Q
RPERE(STRUCT,QUI1,BASE1) 
 N RPERE
 
 I $$RANG^%QMCPZ(WHOIS1,QUI1,BASE1)=1 Q ""
 
 S RPERE=$$RPERE^%QMCPZ(WHOIS1,QUI1,BASE1)
 I '($D(@STRUCT@("S",RPERE))) Q ""
 Q RPERE
COOR2 
 S IND1=$O(@INTERD@(BASE1,""))
 F I=0:0 Q:IND1=""  S OK=OK&$$FILS(COOR,STRUCT,INTERD,QUI1,BASE1,IND1,QUI2,ERR,XMODE),IND1=$O(@INTERD@(BASE1,IND1))
 Q
 
FILS(COOR,STRUCT,INTERD,QUI1,BASE1,IND1,QUI2,ERR,XMODE) 
 N TEMP,PILE,REPVU,OK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FILS")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S REPVU=$$CONCAS^%QZCHAD(TEMP,"REPVU")
 K @(TEMP)
 S OK=1
 D INITFI^%QCASTA(PILE)
 D PUSH^%QCASTA(PILE,IND1_"^"_BASE1)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S IND1=$$POP^%QCASTA(PILE),BASE1=$P(IND1,"^",2),IND1=$P(IND1,"^",1) I $D(@REPVU@(BASE1,IND1))=0 S OK=OK&$$FILS1(PILE,COOR,STRUCT,QUI1,BASE1,IND1,QUI2,ERR,XMODE) D INCR S @REPVU@(BASE1,IND1)=""
 Q OK
INCR W "." Q
FILS1(PILE,COOR,STRUCT,QUI1,BASE1,IND1,QUI2,ERR,XMODE) 
 N IND1P,BASE1P,VIDE,IND2P,BASE2,ABORT,OK
 S ABORT=0
 S BASE2=@STRUCT@("S",BASE1,"BDI")
 S BASE1P=$$RPERE(STRUCT,QUI1,BASE1)
 I BASE1P="" S IND1P=""
 
 I BASE1P="" D VIDE
 
 I BASE1P'="" D NONVIDE
 
 I ABORT S OK=0 Q OK
 
 D STOF(STRUCT,PILE,QUI1,BASE1,IND1)
 S OK=1
 Q OK
NONVIDE 
 S IND1P=$$NOMPERE^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)
 S IND2P=@COOR@(BASE1P,IND1P)
 
 I $D(@COOR@(BASE1,IND1)) D NONV1 Q
 
 N NOMEX
 S NOMEX=$$NOMEX^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)
 S @COOR@(BASE1,IND1)=IND2P_","_NOMEX
 Q
NONV1 N NP2,NF2
 S NF2=@COOR@(BASE1,IND1)
 S NP2=$$NOMPERE^%QMCPZ(WHOIS2,QUI2,BASE2,NF2)
 
 I NP2=IND2P Q
 S ABORT=1,OK=0
 D ADD^%VPRIN1(ERR,BASE1_" : "_IND1_" --> "_BASE1P_" : "_NF2_" "_NF2_" "_$$^%QZCHW("n'est pas le nom d'un fils de")_" "_IND2P)
 Q
VIDE N IND2
 
 I ($D(@COOR@(BASE1,IND1))#10)=0 S IND2=IND1
 
 I ($D(@COOR@(BASE1,IND1))#10)=1 S IND2=@COOR@(BASE1,IND1)
 
 I XMODE'=3,((IND1=IND2)&(QUI1=QUI2))&(BASE1=@STRUCT@("S",BASE1,"BDI")) D ADD^%VPRIN1(ERR,BASE1_" : "_IND1_" "_$$^%QZCHW("ne peut etre recopie sur lui meme")) S ABORT=1,OK=0 Q
 N R1,R2
 S R1=$$RANG^%QMCPZ(WHOIS1,QUI1,BASE1)
 S R2=$$RANG^%QMCPZ(WHOIS2,QUI2,BASE2)
 I R2=$L(IND2,",") S @COOR@(BASE1,IND1)=IND2 Q
 D ADD^%VPRIN1(ERR,BASE1_" : "_IND1_" -> "_BASE2_" : "_IND2_" "_$$^%QZCHW("le nombre de virgule de")_" "_IND2_" "_$$^%QZCHW("devrait etre")_" "_(R2-1))
 S ABORT=1,OK=0
 Q
STOF(STRUCT,PILE,QUI1,BASE1,IND1) 
 N TEMP,VAL,I,LIEN1,TYPE,OR,BASE1F
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STOF")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 S LIEN1=$O(@STRUCT@("S",BASE1,"R",""))
 F I=0:0 Q:LIEN1=""  D STOF1 S LIEN1=$O(@STRUCT@("S",BASE1,"R",LIEN1))
 K @(TEMP)
 Q
STOF1 I $$TYPEL^%QMCPZ(WHOIS1,QUI1,LIEN1)'=2 Q
 
 K @(VAL)
 S BASE1F=$$REPD^%QMCPZ(WHOIS1,QUI1,BASE1,LIEN1)
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,LIEN1,VAL,.TYPE)
 S OR=$O(@VAL@(""))
 F I=0:0 Q:OR=""  D PUSH^%QCASTA(PILE,IND1_","_@VAL@(OR)_"^"_BASE1F) S OR=$O(@VAL@(OR))
 Q
 
 
 
RENOM(STRUCT,WHOIS1,QUI1,DEFQ,DEFB,DEFI,COOR) 
 N I,BASE1,ATT,TYPE
 I DEFB'="" S BASE1=$O(@STRUCT@("S","")) F I=0:0 Q:BASE1=""  S ATT="COPIE."_$$NOMLOG^%QMCPZ(WHOIS1,QUI1,BASE1) D MVG^%QMCPZ(WHOIS1,DEFQ,DEFB,DEFI,ATT,$$CONCAS^%QZCHAD(COOR,BASE1),.TYPE) S BASE1=$O(@STRUCT@("S",BASE1))
 Q
 
STOWQ(STRUCT,WHOIS1,QUI1,BASE1,WHOIS2,QUI2,SUP,VERIF) 
 S @STRUCT@("QUI",QUI1)=QUI2
 S @STRUCT@("WHOIS1")=WHOIS2
 S @STRUCT@("WHOIS2")=WHOIS2
 S @STRUCT@("BS")=BASE1
 S @STRUCT@("DESTRUCTION")=SUP
 S @STRUCT@("VERIFICATION")=VERIF
 Q

