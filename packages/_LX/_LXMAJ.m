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

;%LXMAJ^INT^1^59547,73870^0
%LXMAJ ;
 
 S (IRLEX,RLEX)="" F UU=1:1 S PLEX=$P(ONLEX,".",UU) Q:PLEX=""  S RLEX=RLEX_","""_PLEX_"""",IRLEX=","""_PLEX_""""_IRLEX
 S UVW=UU K ^MAJLEX($I) S PRP=UVW,KK=PRP+1,NKK=1,NOMTREE="^[QUI]PLEXP(""TOLEX"""_RLEX,ADR="MAJX^%LXMAJ" D ^%QCAGTU1,SUIT
 K ^MAJLEX($I) S PRP=UVW,KK=PRP+1,NKK=1,NOMTREE="^[QUI]PLEXI(""TOLEX"""_IRLEX,ADR="MAJX^%LXMAJ" D ^%QCAGTU1,SUIT G T0
MAJX I %PR=PRP S NULEX=@NOM G FIN
 S NRKK="" F VV=KK:1:%PR S NRKK=NRKK_","""_B(VV)_""""
 S ^MAJLEX($I,@NOM)=NRKK G FIN
SUIT K ^[QUI]PLEX("TOLEX",NULEX) S TABLEX=NOMTREE_")" K @(TABLEX) S NU=-1 F UU=1:1 S NU=$N(^MAJLEX($I,NU)) Q:NU=-1  S RFP=^MAJLEX($I,NU),TBL=NOMTREE_RFP_")",@TBL=NU
 Q
T0 F UU="C","S","K" S TALEX="^[QUI]TOLEX"_UU_"("""_ONLEX_""")" I $D(@TALEX) D MAJ
 D NEW Q
MAJ I TLEX="S" D:UU="S" DELSYN K @(TALEX) G FIN
 I ($D(@TALEX)=10)!(UU="S") S NEX=-1 F VV=0:0 S NEX=$N(@TALEX@(NEX)) G:NEX=-1 FIN S @("^[QUI]TOLEX"_UU_"("""_RESUL(1)_""","""_NEX_""")")=@TALEX@(NEX) D:UU="S" INV K @TALEX@(NEX)
 S @("^[QUI]TOLEX"_UU_"("""_RESUL(1)_""")")=@TALEX K @(TALEX)
FIN Q
INV S ^[QUI]TOSYNONY(NEX,RESUL(1))=1 K ^[QUI]TOSYNONY(NEX,ONLEX) Q
DELSYN S NEX=-1 F SS=0:0 S NEX=$N(@TALEX@(NEX)) Q:NEX=-1  K ^[QUI]TOSYNONY(NEX,ONLEX)
 Q
NEW N VAL,ABENDSCR
 S ^[QUI]CPTEUR("TOLEX")=1 D CUROF^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Un instant, verification en cours ...")) S ADX=$X,EFF="" F UU=ADX:1:78 S EFF=EFF_" "
 K ^[QUI]PLEX("TOLEX"),^[QUI]PLEXP("TOLEX"),^[QUI]PLEXI("TOLEX")
 S NOM=-1
 F UU=1:1 S NOM=$N(^[QUI]TOLEX(NOM)) Q:(NOM=-1)!(NOM="z")  W "." S VAL=^[QUI]TOLEX(NOM),RESUL(1)=NOM D STO2^%LXAJMOD,STOR S ^[QUI]TOLEX(NOM)=VAL I $X'<78 S DX=ADX,DY=$Y X XY W EFF S DX=ADX X XY
 S ^[QUI]TOLEX=UU
 S NOM=-1 F UU=1:1 S NOM=$N(^[QUI]TOSYNONY(NOM)) Q:NOM=-1  D TSYN
 G USYN
 
STOR N PP
 
 G:'($D(^[QUI]TOLEXU(NOM))) STUR
 S PP=$O(^[QUI]TOLEXU(NOM,""))
 K ^[QUI]TOLEXU(NOM)
 K ^[QUI]TOUNIT(PP,NOM)
STUR S PP=$P(VAL,"^",6)
 G:PP="" STORF
 S ^[QUI]TOLEXU(NOM,PP)=$P(VAL,"^",7)_"^"
 S ^[QUI]TOUNIT(PP,NOM)=$P(VAL,"^",7)
STORF Q
 
TSYN W "." S SYN=$N(^[QUI]TOSYNONY(NOM,-1)) I '($D(^[QUI]TOLEX(SYN))) K ^[QUI]TOSYNONY(NOM,SYN) Q
 S RESUL(1)=NOM D STO2^%LXAJMOD I $X'<78 S DX=ADX,DY=$Y X XY W EFF Q
USYN D CURON^%VVIDEO,POCLEPA^%VVIDEO Q
NEW2 K ^[QUI]PLEX("TOLEX"),^[QUI]PLEXP("TOLEX") S NOM=-1 F UU=1:1 S NOM=$N(^[QUI]TOLEX(NOM)) Q:NOM=-1  W !,NOM S RESUL(1)=NOM D STO3^%LXAJMOD
 S NOM=-1 F UU=1:1 S NOM=$N(^[QUI]TOSYNONY(NOM)) Q:NOM=-1  W !,NOM S RESUL(1)=NOM D STO3^%LXAJMOD
 Q

