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

;%MZCPTIE^INT^1^59547,73871^0
MOZCPTIE ;
 
 K ^GETABAC2($I),^NUNOM($I) S YA=ARTI K ^[QUI]MOZCOMP(ARTI),^DEDUIT($I) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]MOZCOMP(ARTI,%DAT)=HEURE
 S TABIMP="^[QUI]MOZREL"
 D ^%MZPARA Q:STOP=1  D KTAB,RECABR
 K ^[QUI]PAR(ARTI) D INT^%QMDAK0 S ^[QUI]MOZCOMP(ARTI,%DAT)=^[QUI]MOZCOMP(ARTI,%DAT)_"^"_HEURE D ^%VSQUEAK Q
RECABR K FLTAB S NOMTAB="^[QUI]MOZREL" D GETNAMFU
 S ETUD="MOZ",NTAB="^[QUI]MOZREL(ARTI,",IPREM=1,NCLE=4,PNUM=1,NFOR=0 D PREPA,^%MZGABR
FIN Q
PREPA S LT=$L(NTAB),%L=$L("^[QUI]F"),FONTAB="^[QUI]F"_$E(NTAB,%L,LT-1),ADEL=$E(NTAB,%L,LT-1)_")",WDEB=2,WAB="WAB",(WB1,WAB1)=ARTI F SS=2:1:NCLE S @("WAB"_SS)=-1
 Q
KILL F %UU=1:1:NCLE K @("WB"_%UU)
 F %UU=1:1:NFOR K @("F"_%UU)
 K %UU Q
GETNAMFU 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB
 S FLTAB=%NFU K %NF1,%NFU Q
KTAB F UU=0:1 S LTAB=$P($T(TAB+UU),";;",2) Q:LTAB=""  F VV=1:1 S TB=$P(LTAB,",",VV) Q:TB=""  S TB="^[QUI]"_TB_"(ARTI)" K @(TB)
 K UU,VV
TAB ;;CMOZREL

