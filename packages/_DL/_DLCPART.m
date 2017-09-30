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

;%DLCPART^INT^1^59547,73867^0
DLCPART ;
 
RECUP(COMPOSANT,IBNI,VISU,REP,LAN,ATMAC,ATCHARG,ATDAT,OP,OPVU,ATUER,OPGARD) 
 N JOUR,I,NUMOP,NOMOP,MAC,CHARG,GO,GLO,M,IIN
 I VISU S MES=$$^%QZCHW("Recherche des elements a rejalonner") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 D MVG^%QSCALVA(REP,LAN,ATDAT,GLO,.TYP)
 S IIN=IBNI
 S:IBNI'="" IBNI=$ZP(@GLO@(IBNI))
 S I=0,GO=$$GO^%DLCON2
 K @(OPVU)
BNOPR S IBNI=$O(@GLO@(IBNI))
 G:IBNI="" RECUPFIN
 S @ATUER@(IBNI)=""
 I VISU X XY W IBNI
 S JOUR=@GLO@(IBNI)
 S NUMOP=$$^%QSCALIN(REP,LAN,"NUMERO.OPERATION",IBNI)
 I NUMOP="" S ERR=25 G RECUPERR
 S @OPGARD@("OP",IBNI,"NUMERO.OPERATION")=NUMOP
 S NOMOP=$$^%QSCALIN(REPGAM,COMPOSANT,GO,NUMOP)
 I NOMOP="" S ERR=19 G RECUPERR
 S MAC=$$^%QSCALIN(REP,LAN,ATMAC,IBNI)
 I MAC="" S ERR=17 G RECUPERR
 S @OPGARD@("OP",IBNI,ATMAC)=MAC
 S PREC=$$^%QSCALIN(REP,LAN,"PRECEDENT",IBNI)
 I (PREC'="")&(PREC>IIN) S @OPGARD@("OP",IBNI,"PRECEDENT")=PREC
 S CHARG=$$^%QSCALIN(REP,LAN,ATCHARG,IBNI)
 I CHARG="" S ERR=18 G RECUPERR
 S @OPGARD@("OP",IBNI,ATCHARG)=CHARG
 S @OPGARD@("OP",IBNI,ATDAT)=JOUR
 S JOUR=$$^%QMDAFFI(JOUR,3)
 S M=$O(^[QUI]MACOP(MAC,JOUR,LAN,IBNI,""))
 I M="" S M=$$^%QSCALIN(REP,LAN,"OPERATION",IBNI) S:M'="" ^(QUI,"MACOP",MAC,JOUR,LAN,IBNI,M)=CHARG_"^"
 S:M'="" @OPGARD@("MACOP",MAC,JOUR,LAN,IBNI,M)=^[QUI]MACOP(MAC,JOUR,LAN,IBNI,M)
 I MODEX'=1 K ^[QUI]MACOP(MAC,JOUR,LAN,IBNI) S ^RESSOUR($J,MAC,JOUR)=$$^%QCAZG("^RESSOUR($J,"""_MAC_""",JOUR)")+CHARG
 S @OPGARD@("CHARG",MAC,JOUR)=$S($D(@OPGARD@("CHARG",MAC,JOUR)):@OPGARD@("CHARG",MAC,JOUR)+CHARG,1:CHARG)
 I $D(@OPVU@(COMPOSANT_","_NOMOP)) S NOMOP=@OPVU@(COMPOSANT_","_NOMOP),@OP@(NOMOP,2)=@OP@(NOMOP,2)+CHARG G BNOPR
 S I=I+1
 S:'($D(@REGMAC@(MAC))) @REGMAC@(MAC)=$$REGIME^%DLREGIM(MAC) I @REGMAC@(MAC)="" S @REGMAC@(MAC)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_MAC,6,LRES)
 S @OPVU@(COMPOSANT_","_NOMOP)=I
 S @OP@(I)=NOMOP
 S @OP@(I,0)=MAC
 S @OP@(I,1)=NUMOP
 S @OP@(I,2)=CHARG
 S @OP@(I,3)=JOUR
 S @OP@(I,4)=IBNI
 G BNOPR
 
RECUPFIN Q 1
 
RECUPERR Q 0
 
RETRAIT(REP,LAN,VISU,DATJAL,ATUER,ATMAC,ATCHARG,DUJAL,OPGARD) 
 N I,DURJAL,NBDEC,OP,MAP
 I VISU S MES=$$^%QZCHW("Remise a niveau des charges des machines") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S MAP=MODEX=2
 S I=""
BORDR S I=$O(@ATUER@(I))
 Q:I=""
 I VISU X XY W I
 G:'(MAP) BORDR2
 D STATT^%TLBATT(REP,LAN,DATJAL,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,ATMAC,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,ATCHARG,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,DUJAL,I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,"NUMERO.OPERATION",I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,"OPERATION",I,"SUPPRESSION")
 D STATT^%TLBATT(REP,LAN,"NB.JOURS.DECALAGE",I,"SUPPRESSION")
BORDR2 D PSO^%QSGESTI(REP,LAN,DATJAL,I)
 D PSO^%QSGESTI(REP,LAN,ATMAC,I)
 D PSO^%QSGESTI(REP,LAN,ATCHARG,I)
 S DURJAL=$$^%QSCALIN(REP,LAN,DUJAL,I)
 S:DURJAL'="" @OPGARD@("OP",I,DUJAL)=DURJAL
 D PSO^%QSGESTI(REP,LAN,DUJAL,I)
 D PSO^%QSGESTI(REP,LAN,"NUMERO.OPERATION",I)
 S OP=$$^%QSCALIN(REP,LAN,"OPERATION",I)
 S:OP'="" @OPGARD@("OP",I,"OPERATION")=OP
 D PSO^%QSGESTI(REP,LAN,"OPERATION",I)
 S NBDEC=$$^%QSCALIN(REP,LAN,"NB.JOURS.DECALAGE",I)
 S:NBDEC'="" @OPGARD@("OP",I,"NB.JOURS.DECALAGE")=NBDEC
 D PSO^%QSGESTI(REP,LAN,"NB.JOURS.DECALAGE",I)
 G BORDR
 
REMETTRE(REP,LAN,OPGARD) 
 N OP,I,AT,CH,CHARG,P1,P2,MAP
 I VISU S MES=$$^%QZCHW("Remise en place des anciens resultats") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S MAP=MODEX=2
 G:'(MAP) REM2
 S I=""
REM1 S I=$O(@OPGARD@("OP",I))
 G:I="" REM2
 S AT=""
REM10 S AT=$O(@OPGARD@("OP",I,AT))
 G:AT="" REM1
 D STATT^%TLBAATT(REP,LAN,AT,@OPGARD@("OP",I,AT),I,"AJOUT")
 G REM10
 
REM2 S I=""
REM20 S I=$O(@OPGARD@("OP",I))
 G:I="" REM3
 S AT=""
REM21 S AT=$O(@OPGARD@("OP",I,AT))
 G:AT="" REM20
 D PA^%QSGESTI(REP,LAN,AT,@OPGARD@("OP",I,AT),I)
 G REM21
 
REM3 S MAC=""
REM30 S MAC=$O(@OPGARD@("CHARG",MAC))
 G:MAC="" REM4
 S JOUR=""
REM31 S JOUR=$O(@OPGARD@("CHARG",MAC,JOUR))
 G:JOUR="" REM30
 S CH=$S($D(^[QUI]MACAP(MAC,JOUR)):^[QUI]MACAP(MAC,JOUR),1:"")
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
 S CHARG=$S(CH="":@OPGARD@("CHARG",MAC,JOUR),1:$P(CH,"^",2)+@OPGARD@("CHARG",MAC,JOUR))
 S ^[QUI]MACAP(MAC,JOUR)=P1_"^"_CHARG_"^"_P2
 G REM31
 
REM4 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(OPGARD,"MACOP"),"^[QUI]MACOP")
 D:VISU POCLEPA^%VVIDEO
 Q
 
SAUVCH(LANC,STAD,GLSAUV) 
 N STA,ATDAT,ATMAC,ATCHARG,REPLA,JOUR,CHAR,CH,P1,P2,MAC
 I VISU S MES=$$^%QZCHW("Simulation : retrait des charges machines") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S REPLA=$$LAN^%DLCON2
 S ATMAC=$$MACHINE^%DLCON2,ATCHARG=$$CHARGAR^%DLCON2
 S ATDAT=$$DATEJAL^%DLCON2
 K @(GLSAUV)
 
 S STA=$S(STAD="":"",1:$$PRVRIO^%QSTRUC8(REPLA,LANC,STAD))
BSAUCH 
 S STA=$$NXTRIO^%QSTRUC8(REPLA,LANC,STA)
 Q:STA=""
 
 
 
 G:'($$OAIR^%QSGE5(REPLA,LANC,STA,ATDAT)) BSAUCH
 S JOUR=$$^%QMDAFFI($$VALEUR^%QSTRUC8(REPLA,LANC,STA,ATDAT),3)
 G:JOUR="" BSAUCH
 
 
 I '($$OAIR^%QSGE5(REPLA,LANC,ATMAC,STA)) S MAC="" G BSAUCH
 S MAC=$$VALEUR^%QSTRUC8(REPLA,LANC,ATMAC,STA)
 
 
 I '($$OAIR^%QSGE5(REPLA,LANC,ATCHARG,STA)) S CHAR="" G BSAUCH
 S CHAR=$$VALEUR^%QSTRUC8(REPLA,LANC,ATCHARG,STA)
 G:'($D(^[QUI]MACAP(MAC,JOUR))) BSAUCH
 S @GLSAUV@(MAC,JOUR)=CHAR
 S CH=^[QUI]MACAP(MAC,JOUR)
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
 S CHAR=$P(CH,"^",2)-CHAR
 S:CHAR<0 CHAR=0
 S ^[QUI]MACAP(MAC,JOUR)=P1_"^"_CHAR_"^"_P2
 G BSAUCH
 
 
RESTCH(GLSAUV) 
 N CH,P1,P2,MAC,JOUR,CH,CHAR
 I VISU S MES=$$^%QZCHW("Simulation : remise en place des charges machines") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S MAC=""
BSAUVCH S MAC=$O(@GLSAUV@(MAC))
 Q:MAC=""
 S JOUR=""
BSAUV2 S JOUR=$O(@GLSAUV@(MAC,JOUR))
 G:JOUR="" BSAUVCH
 S CH=$S('($D(^[QUI]MACAP(MAC,JOUR))):"",1:^[QUI]MACAP(MAC,JOUR))
 I CH="" S ^[QUI]MACAP(MAC,JOUR)="^"_@GLSAUV@(MAC,JOUR)_"^^^^^^^" G BSAUV2
 S CHAR=$P(CH,"^",2)+@GLSAUV@(MAC,JOUR)
 S ^[QUI]MACAP(MAC,JOUR)=$P(CH,"^")_"^"_CHAR_"^"_$P(CH,"^",3,10)
 G BSAUV2

