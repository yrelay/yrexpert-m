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

;TO4GABR^INT^1^59547,74871^0
TO4GABR ;
 
 S IPREM=1,LT=$L(NTAB),ADEL=$E(NTAB,7,LT-1) K @($E("^A"_ADEL,1,8)),@($E("^C"_ADEL,1,8)) S WDEB=1,WAB="WAB" F SS=1:1:NCLE S @("WAB"_SS)=-1
L F WPR=WDEB:1:NCLE S @("WV="_WAB_WPR),WVP="WV",WC=NTAB_WVP_")",@("WB"_WPR)=$N(@WC) G:@("WB"_WPR)=-1 S S @("NTAB"_WPR)=NTAB,NTAB=NTAB_("WB"_WPR)_","
 S YART=WB1 D RECON S NTAB=@("NTAB"_WPR),WDEB=NCLE,WAB="WB" G L
S I WPR=IPREM G FIN
 F WUU=WPR:1:NCLE S @("WB"_WUU)=@("WAB"_WUU)
 S:WPR'=1 WPR=WPR-1 S WAB="WB",WDEB=WPR,NTAB=@("NTAB"_WPR) G L
FIN K %RL,CB,CD,CL,CONDI,CONTAB,EX,FFF,ISNUM,LDP,NTAB,RZZ,TACT,TCOND,WB2,WB3,WB4,WB5,WPR,WUU,WVP,XDP,XLAX Q
RECON D ^TOREPFIC S CL=$L(NTAB),NTABP=$E(NTAB,1,CL-1)_")",KTAB="("_$P(NTABP,"(",2),FTABP=FLTAB_KTAB,%L=$L("^[QUI]C"),TCOND="^[QUI]C"_$E(NTABP,%L,CL),TACT="^[QUI]A"_$E(NTABP,%L,CL) S:'($D(@FTABP)) CONTAB=@NTABP,@FTABP=CONTAB S CONTAB=@FTABP,CD=PNUM,CONDI=""
LOOP S PCH=$P(CONTAB,"^",CD) I (PCH["RAPPORT")!((PCH["SOMME")!(PCH["DIFFERENCE")) D ^TO4CONDI G INCR
 I PCH["'" D ^TO3LATER G INCR
 G:PCH="" SUIT D TO^%QZNBN1 G:ISNUM INCR
 I '($D(^[QUI]FULL(WB1,PCH))) D ^%ABLIEU S ^[QUI]UNKN(WB1,PCH,$E(PCH,1,2)_$R(10000))=ADEL_" "_FFF,PCHCOMP=PCH,CONCUR=0 D DEB^%AB3KEMP S %BIL=PCHCOMP,%PYT="U" D ^%ABLIBTY G CONDIT
 S PCHCOMP=PCH,%BIL=PCHCOMP,%PYT="P" D ^%ABLIBTY
CONDIT S %RL=0,XLAX=0 D:$D(^[QUI]RANG(WB1,PCHCOMP)) ^%AB3IMPI D ^TO3CONDI
INCR S CD=CD+4 G:CD>(PNUM+12) SUIT G LOOP
SUIT D ^TO4PVIDE W "*" S @TCOND=CONDI I CONDI="" S @TCOND=1
 Q

