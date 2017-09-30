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

;TO3GABR^INT^1^59547,74870^0
TO3GABR ;
 
L F WPR=WDEB:1:NCLE S @("WV="_WAB_WPR),WVP="WV",WC=NTAB_WVP_")",@("WB"_WPR)=$N(@WC) G:@("WB"_WPR)=-1 S S @("NTAB"_WPR)=NTAB,NTAB=NTAB_("WB"_WPR)_","
 S YART=WB1 K BES,DEF D RECON,^TOSENSFI S NTAB=@("NTAB"_WPR),WDEB=NCLE,WAB="WB" G L
S I WPR=IPREM G FIN
 F WUU=WPR:1:NCLE S @("WB"_WUU)=@("WAB"_WUU)
 S:WPR'=1 WPR=WPR-1 S WAB="WB",WDEB=WPR,NTAB=@("NTAB"_WPR) G L
FIN K %RL,CB,CD,CL,CONDI,CONTAB,EX,FFF,ISNUM,LDP,NTAB,RZZ,TACT,TCOND,WB3,WC,WPR,WUU,WVP,XDP,XLAX Q
RECON S TOFOR="^TO3FORAC" D ^TOREPFIC
 S CL=$L(NTAB),NTABP=$E(NTAB,1,CL-1)_")",KTAB="("_$P(NTABP,"(",2),FTABP=FLTAB_KTAB,%L=$L("^[QUI]C"),TCOND="^[QUI]C"_$E(NTABP,%L,CL),TACT="^[QUI]A"_$E(NTABP,%L,CL) S:'($D(@FTABP)) CONTAB=@NTABP,@FTABP=CONTAB S CONTAB=@FTABP,CD=PNUM,CONDI=""
 D ^TOFICDEF,^TOFICTIL
LOOP S PCH=$P(CONTAB,"^",CD) G:PCH="" SUIT S XDP="("_PCH_")" D ^%ABFINAR S PCHC0=EXT
COND D ^TO39COND
INCR S CD=CD+4 G:CD>(PNUM+12) SUIT G LOOP
SUIT W "*"
 S @TCOND=CONDI I CONDI="" S @TCOND=1
 S %LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180) I $L(CONDI)>%LCH S %NU="""C""",XDP=CONDI D ^TOCHEXPR
 G:ETUD'="AUTREFO" AUTR G:'($D(^[QUI]BLOCIMPL(ARTI,WB2,WB3,WB4,WB5,WB6))) NFO D ^TOBLIMAU G ANFOS
AUTR G:ETUD'="FORM" NFO G:'($D(^[QUI]BLOCIMPL(ARTI,WB2,WB3,WB4,WB5))) NFO F %TYBL="PREP","USIN" S CB=$S(%TYBL="PREP":1,1:2) D ^TOBLIMTP:$D(^[QUI]BLOCIMPL(ARTI,WB2,WB3,WB4,WB5,%TYBL)),ANFO:1
 G ANFOS
NFO F CB=1:1:NFOR D ANFO
 G ANFOS
ANFO S XDP="("_$P(CONTAB,"^",@("F"_CB))_")" D ^TO3EXIFO,PINTER,^%ABFINAR S %LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180) G FINJ:AFF=0,PLF:NFOR>1 S:EXT="()" EXT="" S @TACT=EXT I $L(EX)>%LCH S XDP=EXT,%NU="""A""" D ^TOCHEXPR
 G FINJ
PLF G:'($D(EXT)) FINJ S:EXT="()" EXT="" S @TACT@(CB)=EXT I $L(EXT)>%LCH S XDP=EXT,%NU="""A"","_@("F"_CB) D ^TOCHEXPR
FINJ Q
ANFOS D ^TO3ETRAN,^TO3EBLOP,^TO3EBLPH,^TO3EXNOM Q
PINTER I $E(XDP,2)="?" S LDP=$L(XDP),XDP=$E(XDP,2,LDP)
 Q

