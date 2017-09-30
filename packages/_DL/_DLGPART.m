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

;%DLGPART^INT^1^59547,73868^0
DLGAMG ;
 
 
 
 
 
PARTIEL(MAP,IBNI,DECAL,COCONT,MAXITER,ERR,LRES) 
 N ADRET,REPMACH,REPLAN,REPMACH,REPGAM,TMP,GLO,ATMAC,ATCHARG,DATJAL,OPVU
 N COMPOSANT,PERE,MES,ATUER,DUJAL,OP,REGMAC,TOT,OPGARD
 S ADRET=""
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S OP=$$CONCAS^%QZCHAD(TMP,"OP")
 S REGMAC=$$CONCAS^%QZCHAD(TMP,"REGIME")
 K @(TMP)
 S GLO=$$CONCAS^%QZCHAD(TMP,"MVG")
 S FAMTEC=$$CONCAS^%QZCHAD(TMP,"FAM.TEC")
 S ATMAC=$$MACHINE^%DLCON2,ATCHARG=$$CHARGAR^%DLCON2
 S DATJAL=$$DATEJAL^%DLCON2,COMPOSANT=ART_","_GAM
 
ENTR K ^RESSOUR($J)
 S DUJAL=$$DUJAL^%DLCON2
 S OPVU=$$CONCAS^%QZCHAD(TMP,"OPVU")
 S OPGARD=$$CONCAS^%QZCHAD(TMP,"ANCIEN")
 S ATUER=$$CONCAS^%QZCHAD(TMP,"ATUER")
 S PERE="DE.PERE.INCONNU"
 S REPMACH=$$MACH^%DLCON2
 S REPLAN=$$LAN^%DLCON2
 S REPART=$$ART^%DLCON2
 S REPGAM=$$GAMME^%DLCON2
 D MAXITER^%DLGITE2(REP,LAN,IBNI,.MAXITER)
 
 G:'($$RECUP^%DLCPART(COMPOSANT,IBNI,VISU,REP,LAN,ATMAC,ATCHARG,DATJAL,OP,OPVU,ATUER,OPGARD)) AFFER2
 
 D:MODEX'=1 RETRAIT^%DLCPART(REP,LAN,VISU,DATJAL,ATUER,ATMAC,ATCHARG,DUJAL,OPGARD),RETSOU^%DLCAP2
 
 S @OPGARD@("OP",1,$$DELNEC^%DLCON2)=$$^%QSCALIN(REP,LAN,$$DELNEC^%DLCON2,1)
 D PSO^%QSGESTI(REP,LAN,$$DELNEC^%DLCON2,1)
 G:'($D(@OP@(1))) FINPAR
 I VISU S MES=LAN_" : "_$$^%QZCHW("jalonnement sur l'article")_" "_ART_" "_$$^%QZCHW("a partir de")_" "_@OP@(1) D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S I=$$^%QSCALVA(REPA,ART,$$FAMILLE^%DLCON2)
 S:I="" I="*"
 S @FAMTEC@(1,ART)=I
 S @FAMTEC@(2,I)=ART
 S TOT=0,ERR=0
 D COMMUN^%DLGAMME(LAN,OP,DEL,DELIM,REGMAC,OPM,LRES)
 G:ERR'=0 AFFER
 G MAJ
 
 G:SENS=-1 ANTIV
 S DEL=$ZP(@OPM@(""))
 S DEL=@OPM@(DEL,2)
 D CONTAP(REPA,ART,DEL)
 G MAJ
 
ANTIV S DEL=$O(@OPM@(""))
 S DEL=@OPM@(DEL,2)
 D CONTAV(REPA,ART,DEL)
 
MAJ G:MODEX=1 FINPAR
 I VISU S MES=$$^%QZCHW("Stockage du resultat") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 D STOCK^%DLLANCT(REP,LAN,ART_","_GAM,OPM,DX)
 G FINPAR
 
AFFER D:MODEX'=1 REMETTRE^%DLCPART(REP,LAN,OPGARD)
AFFER2 D INSERR^%DLUTIL(REPA,ART,ERR,LRES)
 
FINPAR K ^RESSOUR($J)
 G:ADRET'="" @ADRET
 K @(TMP)
 Q
 
 
APRES(REPA,O,DATIN,NBJ,REGIME,DATERES,ERR) 
 N %I
 S DATERES=DATIN
 F %I=1:1:NBJ S DATERES=$O(^[QUI]PLPLACAL(REGIME,DATERES)) Q:DATERES=""
 I DATERES="" S ERR=100 D INSERR2^%DLUTIL($$^%QZCHW("Regime")_" "_REGIME,7,RES) Q
 Q
 
CONTAP(REPA,O,DATERES) 
 I DATERES>DELIM D INSERR2^%DLUTIL($$NOMLOG^%QSF(REPA)_" "_O,29,RES)
 Q
 
AVANT(REPA,O,DATIN,NBJ,REGIME,DATERES,ERR) 
 N %I
 S DATERES=DATIN
 F %I=1:1:NBJ S DATERES=$ZP(^[QUI]PLPLACAL(REGIME,DATERES)) Q:DATERES=""
 I DATERES="" S ERR=100 D INSERR2^%DLUTIL($$^%QZCHW("Regime")_" "_REGIME,7,RES) Q
 S:DATERES<DATDUJ ERR=28
 D CLEPAG^%VVIDEO
 Q
 
CONTAV(REPA,O,DATERES) 
 I DATERES<DELIM D INSERR2^%DLUTIL($$NOMLOG^%QSF(REPA)_" "_O,29,RES)
 Q
 
REG(ART,MACHINE,CHARGE,REGIME) 
 
REG2 I $D(STOMAC(ART)) S MACHINE=STOMAC(ART),CHARGE=STOCHARG(ART),REGIME=REGIMAC(MACHINE) Q
 S MACHINE=$$^%QSCALVA(REPA,ART,ATMACH)
 S:MACHINE="" MACHINE="DEFAUT"
 S STOMAC(ART)=MACHINE
 S CHARGE=$$^%QSCALVA(REPA,ART,ATCHARG)+0
 S STOCHARG(ART)=CHARGE
 I '($D(REGIMAC(MACHINE))) S REGIMAC(MACHINE)=$$REGIME^%DLCORCA(MACHINE) I REGIMAC(MACHINE)="" S REGIMAC(MACHINE)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_MACHINE,6,RES)
 S REGIME=REGIMAC(MACHINE)
 Q
 ;
 ;
 ;

