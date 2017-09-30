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

;TO3GABRI^INT^1^59547,74870^0
TO3GABRI ;
 
L S %DOM="IMPLICI",WB2=-1,NTABI=NTAB
 F UI=0:0 S WB2=$N(^[QUI]FLIMPLI(ARTI,WB2)) G:WB2=-1 FIN S WB3=-1 F UJ=0:0 S WB3=$N(^[QUI]FLIMPLI(ARTI,WB2,WB3)) Q:WB3=-1  S NTAB=NTAB_"WB2,WB3,",(YART,WB1)=ARTI K BES,DEF D:WB3'=$$^%QZCHW("DEDUIT") RECON D ^TOSENSFI S NTAB=NTABI
FIN K NTABI,UI,UJ,%RL,CB,CD,CL,CONDI,CONTAB,EX,FFF,ISNUM,LDP,NTAB,RZZ,TACT,TCOND,WB3,WC,WPR,WUU,WVP,XDP,XLAX Q
RECON S TOFOR="^TO39FORB" D ^TOREPFIC I WB2["~" S CONCUR=1,%RL=0,XLAX=0 D ^TOFICTIL
 S CL=$L(NTAB),NTABP=$E(NTAB,1,CL-1)_")",KTAB="("_$P(NTABP,"(",2),FTABP=FLTAB_KTAB,%L=$L("^[QUI]X"),TCOND="^[QUI]C"_$E(NTABP,%L,CL),TACT="^[QUI]A"_$E(NTABP,%L,CL),CONTAB=@FTABP,CD=PNUM,CONDI="",DEF("IMPLICI",WB2)=1
LOOP S PCH=$P(CONTAB,"^",CD) G:PCH="" SUIT S XDP="("_PCH_")" D ^%ABFINAR S PCHC0=EXT
39 D ^TO39COND
INCR S CD=CD+4 G:CD>(PNUM+12) SUIT G LOOP
SUIT W "*"
 S @TCOND=CONDI I CONDI="" S @TCOND=1
 S %LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180) I $L(CONDI)>%LCH S XDP=CONDI,%NU="""C""" D ^TOCHEXPR
 I $D(^[QUI]BLOCIMPL(WB1,WB2,WB3)) D ^TO3EBLIM G DEP0
 S CB=1,(XDP,%XDP1)="("_$P(CONTAB,"^",F1)_")" D ^TO3EXIFO,^%ABFINAR S:EXT="()" EXT="" S @TACT=EXT,%LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180) I $L(EXT)>%LCH S XDP=EXT,%NU="""A""" D ^TOCHEXPR
 I (WB2["$ARG")&(XDP["$TOVALIAB") D DEP
 I (%XDP1["$EXISTE")!((XDP["$COUT")!((XDP["$DUREE")!(XDP["$MACHINE"))) S ^[QUI]RANG(ARTI,WB2)=1
 I EXT["$SIGMA1" S ^[QUI]RANG(ARTI,WB2)=1
DEP0 Q
DEP S %UCI=^TABIDENT($I,"%UCI") D ^%ABLIEU S NUGROU=$P(XDP,"/",2),SSGR=$P(XDP,"/",3),TYP=$P(XDP,"/",4),QUW=$S(TYP=1:QUI,1:%UCI),NBP=-1
 F UU1=1:1 S NBP=$N(^[QUW]DEFGROUP(NUGROU,$$^%QZCHW("P"),NBP)) Q:NBP=-1  S REFGR=^[QUW]DEFGROUP(NUGROU,$$^%QZCHW("P"),NBP) F UU2=1:1 S PCHCOMP=$P(REFGR,"/",UU2) Q:PCHCOMP=""  S CONCUR=1,BES("IMPLICI",PCHCOMP)=1 D DEB^TO39KEMP
 
 S NGRI=-1 F UU2=0:0 S NGRI=$N(^[QUW]SSGRGRI(NUGROU,SSGR,NGRI)) Q:NGRI=-1  I $D(^[QUW]GRILRESU(NGRI)) S PP=-1 F UU2=0:0 S PP=$N(^[QUW]GRILRESU(NGRI,PP)) Q:PP=-1  S DEF(%DOM,PP)=1
FDEP K SSGR,PP,NGRI,NUGROU,TYP,QUW,UU1,NBP,REFGR,UU2 Q

