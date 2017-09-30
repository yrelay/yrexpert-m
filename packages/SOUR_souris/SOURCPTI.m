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
;! Nomprog     : SOURCPTI                                                     !
;! Module      : Souris (SOUR)                                                !
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

SOURCPTI ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Comprehension du S-F sur la souris") D TO4^%VZCD S DX=0,DY=8 X XY
ADR K ^%VTABAC2($I) S ARTI=$$^%QZCHW("SOURIS"),YA=ARTI K ^[QUI]TIMCOMP(ARTI),^DEDUIT($I) D INT^%QMDAHEU,ZD^%QMDATE4 S ^[QUI]TIMCOMP(ARTI,%DAT)=HEURE D ^TO3DELIM
 S TABIMP="^[QUI]IMPLICI"
 D ^SOURPARA,BEG^%ABPARAR,^TO3FOFON,^TO3GPAR,^TO3DLIGI,RECABR
 ;HL2 K ^[QUI]PAR(ARTI) D INT^%QMDAHEU S ^[QUI]TIMCOMP(ARTI,%DAT)=^[QUI]TIMCOMP(ARTI,%DAT)_"^"_HEURE D ^%VSQUEAK Q
 K ^[QUI]PAR(ARTI) D INT^%QMDAHEU S ^[QUI]TIMCOMP(ARTI,%DAT)=^[QUI]TIMCOMP(ARTI,%DAT)_"^"_HEURE D ^%VSQUEAK R !,"[RETURN]",*TMP Q
RECABR D ^TOVERIEX
 K FLTAB S (TABNAM,NOMTAB)="^[QUI]IMPLICI" D GETNAMFU
 S ETUD="IMPL",NTAB="^[QUI]IMPLICI(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABRI,^TO39GRAN,^TO39GBIS,^TO4TRIFI K ^NIVPAR($I,ARTI),^REFTREE($I,ARTI),^ORDNIV($I,ARTI),^NFISIMP($I,ARTI),^ESTFONCT,^NOFONCT D KILL
FIN Q
PREPA S LT=$L(NTAB),%L=$L("^[QUI]F"),FONTAB="^[QUI]F"_$E(NTAB,%L,LT-1),ADEL=$E(NTAB,%L,LT-1)_")",WDEB=2,WAB="WAB",(WB1,WAB1)=ARTI F SS=2:1:NCLE S @("WAB"_SS)=-1
 Q
KILL F %UU=1:1:NCLE K @("WB"_%UU)
 F %UU=1:1:NFOR K @("F"_%UU)
 K %UU Q
GETNAMFU 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB
 S FLTAB=%NFU K %NF1,%NFU Q

