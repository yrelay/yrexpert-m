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

;%DLGAMG^INT^1^59547,73868^0
DLGAMG ;
 
 
 
 
 
PARTIEL(IBNI,LRES) 
 N ADRET,REPMACH,REPLAN,REPMACH,REPGAM,TEMP,GLO,ATMAC,ATCHARG,DATJAL,OPVU
 N COMPOSANT,PERE,MES,MAP,ATUER,DUJAL,OP,TIN,REGMAC,TOT
 S ADRET=""
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S OP=$$CONCAS^%QZCHAD(TEMP,"OP")
 S TIN=$$CONCAS^%QZCHAD(TEMP,"INTER")
 S REGMAC=$$CONCAS^%QZCHAD(TEMP,"REGIME")
 S TININV=$$CONCAS^%QZCHAD(TEMP,"INVERSE")
 S NTRAIT=$$CONCAS^%QZCHAD(TEMP,"NONTRT")
 K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"MVG")
 S FAMTEC=$$CONCAS^%QZCHAD(TEMP,"FAM.TEC")
 S ATMAC=$$MACHINE^%DLCON2,ATCHARG=$$CHARGAR^%DLCON2
 S DATJAL=$$DATEJAL^%DLCON2,COMPOSANT=ART_","_GAM
 
ENTR K ^RESSOUR($J)
 S MAP=MODEX=2
 S DUJAL=$$DUJAL^%DLCON2
 S PERE="DE.PERE.INCONNU"
 I VISU S MES=$$^%QZCHW("Recherche des elements a rejalonner") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S REPMACH=$$MACH^%DLCON2
 S REPLAN=$$LAN^%DLCON2
 S REPART=$$ART^%DLCON2
 S REPGAM=$$GAMME^%DLCON2
 D MVG^%QSCALVA(REP,LAN,DATJAL,GLO,.TYP)
 S:IBNI'="" IBNI=$ZP(@GLO@(IBNI))
 S I=0 K OPVU
BNOPR S IBNI=$O(@GLO@(IBNI))
 G:IBNI="" MOINSR
 S ATUER(IBNI)=""
 I VISU X XY W IBNI
 S NOJOUR=@GLO@(IBNI)
 S NUMOP=$$^%QSCALIN(REP,LAN,"NUMERO.OPERATION",IBNI)
 I NUMOP="" S ERR=25 G AFFER
 S NOMOP=$$^%QSCALIN(REPGAM,COMPOSANT,$$GO^%DLCON2,NUMOP)
 I NOMOP="" S ERR=19 G AFFER
 S MAC=$$^%QSCALIN(REP,LAN,ATMAC,IBNI)
 I MAC="" S ERR=17 G AFFER
 S CHARG=$$^%QSCALIN(REP,LAN,ATCHARG,IBNI)
 I CHARG="" S ERR=18 G AFFER
 S NOJOUR=$$^%QMDAFFI(NOJOUR,3)
 K ^[QUI]MACOP(MAC,NOJOUR,LAN,IBNI)
 S ^RESSOUR($J,MAC,NOJOUR)=$$^%QCAZG("^RESSOUR($J,"""_MAC_""",NOJOUR)")+CHARG
 I $D(OPVU(NOMOP)) S NOMOP=OPVU(NOMOP),OP(NOMOP,2)=OP(NOMOP,2)+CHARG G BNOPR
 S I=I+1
 S:'($D(@REGMAC@(MAC))) @REGMAC@(MAC)=$$REGIME^%DLCORCA(MAC) I @REGMAC@(MAC)="" S @REGMAC@(MAC)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_MAC,6,LRES)
 S OPVU(NOMOP)=I
 S @OP@(I)=NOMOP
 S @OP@(I,0)=MAC
 S @OP@(I,1)=NUMOP
 S @OP@(I,2)=CHARG
 S @OP@(I,3)=NOJOUR
 S @OP@(I,4)=IBNI
 G BNOPR
MOINSR I VISU S MES=$$^%QZCHW("Remise a niveau des charges des machines") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S I=""
BORDR S I=$O(ATUER(I))
 G:I="" CALC
 I VISU X XY W I
 G:'(MAP) BORDR2
 D STATT^%TLBATT(REP,LAN,DATJAL,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,ATMAC,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,ATCHARG,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,DUJAL,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,"NUMERO.OPERATION",I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,"OPERATION",I,"SUPPRESSION")
BORDR2 D PSO^%QSGESTI(REP,LAN,DATJAL,I)
 D PSO^%QSGESTI(REP,LAN,ATMAC,I)
 D PSO^%QSGESTI(REP,LAN,ATCHARG,I)
 D PSO^%QSGESTI(REP,LAN,DUJAL,I)
 D PSO^%QSGESTI(REP,LAN,"NUMERO.OPERATION",I)
 D PSO^%QSGESTI(REP,LAN,"OPERATION",I)
 G BORDR
 
CALC D RETSOU^%DLCAP2
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
 G:SENS=-1 ANTIV
 S DEL=$ZP(@OPM@(""))
 S DEL=@OPM@(DEL,2)
 D CONTAP(REPA,ART,DEL)
 G MAJ
 
ANTIV S DEL=$O(@OPM@(""))
 S DEL=@OPM@(DEL,2)
 D CONTAV(REPA,ART,DEL)
 
MAJ I VISU S MES=$$^%QZCHW("Stockage du resultat") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 
 K ^RESSOUR($J)
 D STOCK^%DLLANCT(REP,LAN,ART_","_GAM,OPM,DX)
 G FINPAR
 
AFFER D INSERR^%DLUTIL(REPA,ART,ERR,LRES)
 
FINPAR G:ADRET'="" @ADRET
 K @(TEMP)
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

