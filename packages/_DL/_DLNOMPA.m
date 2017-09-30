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

;%DLNOMPA^INT^1^59547,73868^0
DLNOMPA(REP,LAN,ART,GAM,QU,DEL,DELIM,SENS,CAPLIM,BNI) 
 
 
 
 
 N DUFAB,TEMPL,GLNOM,LLIST,REPLIEN,INVLIEN,LIEN,MACH,CHARG,QUANTI
 N LISREST,OPMODT,NTRT,RESST,EXART,LIENGA,ATCHARG,ATMACH,ARTI
 N OPMOD2,OPMODT2,RESST2,REGIME,STOMAC,STOCHARG,NIVE,PAR,BI
 N GREJAL1,GREJAL2,GREJ1,ADRET,REPMACH,REPART,REPLAN,REPGAM
 N OP,DEL10,DEL11,DEL12,TIN,MAXDEL,COMPOSANT,%I,I,ADRT,OPVU,PERE
 N PREC,PREC1,ARNONVU,DEL1,DEL2,DATDUJ
 S ADRET=""
 
 
 
ENTR D INIT^%DLNOMG
 S REPMACH=$$MACH^%DLCON2,REPART=$$ART^%DLCON2,REPLAN=$$LAN^%DLCON2
 S REPGAM=$$GAMME^%DLCON2,O=ART,TETE=ART
 S PAR=1
 
 
 D REJALON^%DLNOMG2(REP,LAN,BNI,GREJAL1,GREJAL2)
 G:ERR'=0 ERR
 
 
 S ERR=$$CONSNOM^%DLCONOM(REPA,ART,QU,DUFAB,QUANTI,REPLIEN,LIEN,INVLIEN,PAR,GREJAL1,RES,GLNOM)
 G:ERR'=0 ERR
 I '($$AIR^%QSGE5(REP,LAN,DJ)) D:MODEX'=1 INIT^%DLNOMG2(REP,LAN) G NOMG
 
 D:MODEX'=1 RETRAIT^%DLLANC2(REP,LAN,BNI,"")
NOMG S NTRT=0
 
 G:SENS=1 CHRONO
 
 
 S @RENOM@(1,1,"DAT")=DEL
ACHRONO S NIV=""
BACHRN S NIV=$O(@ARNONVU@(NIV))
 G:NIV="" AFFECT
 S NIVO=""
BACHRNO S NIVO=$O(@ARNONVU@(NIV,NIVO))
 G:NIVO="" BACHRN
 G:'(@GREJAL1@(NIV,NIVO)) BACHRNO
 G:'($$ORDRE^%DLCONOM("SUIV")) BACHRNO
 K @ARNONVU@(NIV,NIVO)
 S NIVE=NIV_","_NIVO
 S NTRT=NTRT+1
 S O=@RENOM@(NIV,NIVO)
 S DELO=@RENOM@(NIV,NIVO,"DAT"),DEL12=DELO
 S DELS=@RESOB@(O,"DEL.SUP"),DEL11=""
 I DELS'=0 D AVANT^%DLGAMG(REPA,O,DELO,DELS,@RESOB@(O,"REGIME"),.DELO,.ERR) S DEL11=DELO G:ERR'=0 ERR
 S DELF=@RESOB@(O,"DEL")
 K @(OPMOD),^RESSOUR($J)
 G:DELF="" ACHRJAL
ASIMP D:VISU MSG^%VZEATT($$^%QZCHW("Jalonnement pour l'article")_" "_O)
 S QU=@RENOM@(NIV,NIVO,"QU")
 D AVANT^%DLGAMG(REPA,O,DELO,DELF*QU,@RESOB@(O,"REGIME"),.DELO,.ERR)
 G:(ERR'=0)!(DELO="") ERR
 D INSART^%DLNOMG(O,$S(O=TETE:"Disponibilite",1:"Integration"),DELO,DEL11,DEL12)
 G ACHRFI
 
ACHRJAL S ADRT="ACHRJ3^%DLNOMPA",DEL1=DELO,DEL2=DELIM
 S PERE=$S($D(@RENOM@(NIV,NIVO,"P")):@RENOM@(NIV,NIVO,"P"),1:"DE.PERE.INCONNU")
 G PARTIEL^%DLNOMG2
ACHRJ3 I ERR=26 S ERR=0 D INSERR2^%DLUTIL($$NOMLOG^%QSF(REPA)_" "_O,26,RES) S DELF=0 G ASIMP
 G:ERR'=0 ERR
 S I=$O(@OPMOD@(""))
 G:I="" ACHRFI
 D INSAR2^%DLNOMG($S(O=TETE:"Disponibilite",1:"Integration"),DEL11,DEL12)
 S DELO=@OPMOD@(I,2)
ACHRFI D CONTAV^%DLGAMG(REPA,O,DELO)
 D ADR^%QCAGLC(OPMOD2,OPMODT2_","_NTRT)
 S @OPMODT@(NTRT)=O
 D ADR^%QCAGLC("^RESSOUR("_$J,RESST2_","_NTRT)
 S NIVF=NIV+1
 S FI=""
BACHRFI S FI=$O(@RENOM@(NIV,NIVO,"F",FI))
 G:FI="" APRECED
 S DEL12=@RENOM@(NIVF,FI,"DEL.TRANS"),DEL11=DELO
 I DEL12'=0 D AVANT^%DLGAMG(REPA,O,DELO,DEL12,@RENOM@(NIVF,FI,"REGIME"),.DEL11,.ERR) G:ERR'=0 ERR
 S @RENOM@(NIVF,FI,"DAT")=DEL11
 G BACHRFI
 
APRECED 
 D APRECED^%DLCONOM(DELO)
 G ACHRONO
 
 
CHRONO S NIV=""
BCHR S NIV=$ZP(@ARNONVU@(NIV))
 G:NIV="" AFFECT
 S NIVO=""
BCHRO S NIVO=$ZP(@ARNONVU@(NIV,NIVO))
 G:NIVO="" BCHR
 G:'(@GREJAL1@(NIV,NIVO)) BCHRO
 G:'($$ORDRE^%DLCONOM("PREC")) BCHRO
 S NTRT=NTRT+1
 S NIVE=NIV_","_NIVO
 K @ARNONVU@(NIV,NIVO)
 S O=@RENOM@(NIV,NIVO)
 S NIVF=NIV+1
 S FI="",DELFI=$$MAXPRE2^%DLCONOM(DEL)
BCHROF S FI=$O(@RENOM@(NIV,NIVO,"F",FI))
 G:FI="" BCHRO2
 S DELO=@GREJAL2@(NIVF,FI)
 S DELF=@RENOM@(NIVF,FI,"DEL.TRANS")
 I DELF'=0 D APRES^%DLGAMG(REPA,O,DELO,DELF,@RENOM@(NIVF,FI,"REGIME"),.DELO,.ERR) G:ERR'=0 ERR
 I DELO>DELFI S DELFI=DELO
 G BCHROF
BCHRO2 S DELO=@RESOB@(O,"DEL"),DEL10=DELFI,DEL11=""
 K @(OPMOD),^RESSOUR($J)
 G:DELO="" CHROJA
CSIMP D:VISU MSG^%VZEATT($$^%QZCHW("Jalonnement pour l'article")_" "_O)
 S QU=@RENOM@(NIV,NIVO,"QU")
 D APRES^%DLGAMG(REPA,O,DELFI,DELO*QU,@RESOB@(O,"REGIME"),.DELFI,.ERR)
 G:(ERR'=0)!(DELFI="") ERR
 S DELS=@RESOB@(O,"DEL.SUP"),DEL12=DELFI
 I DELS'=0 D APRES^%DLGAMG(REPA,O,DELFI,DELS,@RESOB@(O,"REGIME"),.DELFI,.ERR) S DEL11=DEL12,DEL12=DELFI G:ERR'=0 ERR
 D INSART^%DLNOMG(O,$S(O=TETE:"Disponibilite",1:"Integration"),DEL10,DEL11,DEL12)
 G:ERR'=0 ERR
 G BCHRO3
 
CHROJA S ADRT="CHROJ2^%DLNOMPA",DEL1=DELFI,DEL2=DELIM
 S PERE=$S($D(@RENOM@(NIV,NIVO,"P")):@RENOM@(NIV,NIVO,"P"),1:"DE.PERE.INCONNU")
 G PARTIEL^%DLNOMG2
CHROJ2 I ERR=26 S ERR=0 D INSERR2^%DLUTIL($$NOMLOG^%QSF(REPA)_" "_O,26,RES) S DELF=0 G CSIMP
 G:ERR'=0 ERR
 G:I="" BCHRO3
 S DELFI=@OPMOD@(I,2),DEL12=DELFI
 S DELS=@RESOB@(O,"DEL.SUP")
 I DELS'=0 D APRES^%DLGAMG(REPA,O,DELFI,DELS,@RESOB@(O,"REGIME"),.DELFI,.ERR) G:ERR'=0 ERR S DEL11=DEL12,DEL12=DELFI
 D INSAR2^%DLNOMG($S(O=TETE:"Disponibilite",1:"Integration"),DEL11,DEL12)
BCHRO3 D CONTAP^%DLGAMG(REPA,O,DEL12)
 D ADR^%QCAGLC(OPMOD2,OPMODT2_","_NTRT)
 S @OPMODT@(NTRT)=O
 D ADR^%QCAGLC("^RESSOUR("_$J,RESST2_","_NTRT)
 S @GREJAL2@(NIV,NIVO)=DELFI
 G CHRONO
 
AFFECT 
 S DX=0
 I VISU S MES=$$^%QZCHW("Stockage des resultats") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 D TRI^%DLNOMG(OPMODT,OPMOD)
 D:MODEX'=1 STOCK^%DLLANCT(REP,LAN,ART_","_GAM,OPM,DX)
 G FIN
 
ERR 
 D NOMENER^%DLNOMG(RESST)
 D INSERR^%DLUTIL(REPA,O,ERR,RES)
 
FIN 
 K ^RESSOUR($J)
 K @(TEMPL)
 G:ADRET'="" DEPIL^%ANGEPIL
 Q
 ;
 ;
 ;

