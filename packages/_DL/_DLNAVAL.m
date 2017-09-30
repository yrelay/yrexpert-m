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

;%DLNAVAL^INT^1^59547,73868^0
DLNOMTO(MAP,REP,LAN,ART,GAM,QU,DEL,DELIM,SENS,CAPLIM,MODEX,DECAL,COCONT,MAXITER) 
 
 N DUFAB,TEMPL,GLNOM,LLIST,REPLIEN,INVLIEN,LIEN,ERR,MACH,CHARG,QUANTI
 N LISREST,OPMODT,NTRT,RESST,EXART,LIENGA,ATCHARG,ATMACH,ARTI
 N OPMOD2,OPMODT2,RESST2,REGIME,STOMAC,STOCHARG,NIVE,PAR,BI
 N GREJAL1,GREJAL2,BNI,GREJ1,PERE,ARNONVU,PREC,PREC1,COMP,MSG
 N DEL1,DEL2,DEL3,DATDUJ,DESOPT,JALONT,DESOP,JALON
 N REGIMAC
 D INIT^%DLNOMG
 S PAR=0,O=ART
 G:ERR'=0 ERR
 
ENCAR ;; En carnet ou lance (reinitialisation)
 
 S ERR=$$CONSNOM^%DLCONOM(REPA,ART,QU,DUFAB,QUANTI,REPLIEN,LIEN,INVLIEN,PAR,GREJAL1,RES,GLNOM)
 G:ERR'=0 ERR
 
 I '($$AIR^%QSGE5(REP,LAN,DJ)) D:MODEX'=1 INIT^%DLNOMG2(REP,LAN) G NOMG
 D:MODEX'=1 RETRAIT^%DLLANC2(REP,LAN,"","")
NOMG 
 B "L+"
 K @(REGIMAC)
 K @(DESOPT)
 S NIV=""
BCONS1 S NIV=$O(@GLNOM@("NOM",NIV))
 G:NIV="" JALON
 S NIVF=""
BCONS2 S NIVF=$O(@GLNOM@("NOM",NIV,NIVF))
 G:NIVF="" BCONS1
 S O=@GLNOM@("NOM",NIV,NIVF)
 G:$D(@DESOPT@(O)) BCONS2
 G:@GLNOM@("OBJ",O,"DEL")="" BCONS3
 
BCONS20 
 D STOC^%DLLIRE(O,@GLNOM@("OBJ",O,"REGIME"),RES,$$CONCAS^%QZCHAD(DESOPT,O),1)
 G BCONS2
 
BCONS3 I $$VAIR^%QSGE5(REPA,O,LIENGA,GAM) S GA=GAM G BCONS4
 S GA=$$^%QSCALVA(REPA,O,LIENGA)
 I GA="" D INSERR2^%DLUTIL($$RART^%DLCON2_" "_O,26,RES) S DELO=0 G BCONS20
BCONS4 D LIRE^%DLLIRE(O_","_GA,"","",1,ATMACH,$$DUFAB^%DLCON2,REGIMAC,$$CONCAS^%QZCHAD(DESOPT,O),.ERR,RES)
 G BCONS2
 
JALON 
 Q
 
CHRONO S NIV=""
BCHR S NIV=$ZP(@ARNONVU@(NIV))
 G:NIV="" AFFECT
 S NIVO=""
BCHRO S NIVO=$ZP(@ARNONVU@(NIV,NIVO))
 G:NIVO="" BCHR
 G:'($$ORDRE^%DLCONOM("PREC")) BCHRO
 S NTRT=NTRT+1
 K @ARNONVU@(NIV,NIVO)
 S NIVE=NIV_","_NIVO
 S O=@RENOM@(NIV,NIVO)
 S NIVF=NIV+1
 S FI="",DELFI=$$MAXPREC^%DLCONOM(DEL)
BCHROF S FI=$O(@RENOM@(NIV,NIVO,"F",FI))
 G:FI="" BCHRO2
 S DELO=@RENOM@(NIVF,FI,"DAT")
 S DELF=@RENOM@(NIVF,FI,"DEL.TRANS")
 I DELF'=0 D APRES^%DLGAMG(REPA,O,DELO,DELF,@RENOM@(NIVF,FI,"REGIME"),.DELO,.ERR) G:ERR'=0 ERR
 I DELO>DELFI S DELFI=DELO
 G BCHROF
BCHRO2 S DELO=@RESOB@(O,"DEL")
 K @(OPMOD),^RESSOUR($J)
 S QU=@RENOM@(NIV,NIVO,"QU")
 G:DELO="" CHROJA
CSIMP D:VISU MSG^%VZEATT($$^%QZCHW("Jalonnement pour l'article")_" "_O)
 S DEL1=DELFI
 D APRES^%DLGAMG(REPA,O,DELFI,DELO*QU,@RESOB@(O,"REGIME"),.DELFI,.ERR)
 G:(ERR'=0)!(DELFI="") ERR
 S DEL2="",DEL3=DELFI
 S DELS=@RESOB@(O,"DEL.SUP")
 I DELS'=0 D APRES^%DLGAMG(REPA,O,DELFI,DELS,@RESOB@(O,"REGIME"),.DELFI,.ERR) G:ERR'=0 ERR S DEL2=DEL3,DEL3=DELFI
 D INSART^%DLNOMG(O,$S(O=TETE:"Disponibilite",1:"Integration"),DEL1,DEL2,DEL3)
 G BCHRO3
 
CHROJA I $$VAIR^%QSGE5(REPA,O,LIENGA,GAM) S GA=GAM G CHROJ2
 S GA=$$^%QSCALVA(REPA,O,LIENGA)
 I GA="" D INSERR2^%DLUTIL($$NOMLOG^%QSF(REPA)_" "_O,26,RES) S DELO=0 G CSIMP
CHROJ2 S PERE=$S($D(@RENOM@(NIV,NIVO,"P")):@RENOM@(NIV,NIVO,"P"),1:"DE.PERE.INCONNU")
 S COMP=O_","_GA
 D JALT^%DLJACT(REPA,LAN,COMP,PERE,QU,SENS,CAPLIM,$$MACH^%DLCON2,ATMACH,DUFAB,DELFI,DELIM,MODEX,FAMTEC,COJAL,COFAB,.ERR,OPMOD,RES)
 G:ERR'=0 ERR
 S I=""
 F %I=0:0 S I=$O(@OPMOD@(I)) Q:I=""  S @OPMOD@(I,5)=NIVE,@OPMOD@(I,7)=COMP
 S I=$ZP(@OPMOD@(""))
 G:I="" BCHRO3
 S DELFI=@OPMOD@(I,2),DEL3=DELFI,DEL2=""
 S DELS=@RESOB@(O,"DEL.SUP")
 I DELS'=0 D APRES^%DLGAMG(REPA,O,DELFI,DELS,@RESOB@(O,"REGIME"),.DELFI,.ERR) G:ERR'=0 ERR S DEL2=DEL3,DEL3=DELFI
 D INSAR2^%DLNOMG($S(O=TETE:"Disponibilite",1:"Integration"),DEL2,DEL3)
BCHRO3 D CONTAP^%DLGAMG(REPA,O,DEL3)
 D ADR^%QCAGLC(OPMOD2,OPMODT2_","_NTRT)
 S @OPMODT@(NTRT)=O
 D ADR^%QCAGLC("^RESSOUR("_$J,RESST2_","_NTRT)
 S @RENOM@(NIV,NIVO,"DAT")=DELFI
 G CHRONO
 
AFFECT 
 S DX=0
 I VISU S MSG=$$^%QZCHW("Stockage des resultats") D MSG^%VZEATT(MSG) S DX=$L(MSG)+2
 D:MODEX'=1 TRI^%DLNOMG(OPMODT,OPMOD),STOCK^%DLLANCT(REP,LAN,ART_","_GAM,OPM,DX)
 G FIN
 
ERR 
 D NOMENER^%DLNOMG(RESST)
 D INSERR^%DLUTIL(REPA,O,ERR,RES)
 
FIN 
 K ^RESSOUR($J)
 K @(TEMPL)
 Q
 
 
REG(ART,MACHINE,CHARGE,REGIME) 
 G REG2^%DLGAMG
 ;

