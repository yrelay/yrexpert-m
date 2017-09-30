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

;TO3CPMAT^INT^1^59547,74870^0
TO3CPMAT ;
 
 S YA=ARTI
 K ^[QUI]TIMCOMP(ARTI),^DEDUIT($I) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]TIMCOMP(ARTI,%DAT)=HEURE D ^TO3DELIM
 S TABIMP="^[QUI]IMPMAT",%DTC=$$^%QZCHW("T") K ^[QUI]FIMPMAT(ARTI) D ^TOPARAMA,^TO3TABAC,^TO3FOMAT,^TO3PIMAT,RECABR
 D INT^%QMDAK0 S ^[QUI]TIMCOMP(ARTI,%DAT)=^[QUI]TIMCOMP(ARTI,%DAT)_"^"_HEURE
 Q
RECABR D GETNAMFU(TABIMP,.FLTAB)
 S (NOMTAB,TABNAM)="^[QUI]IMPLICI",ETUD="IMPL",NTAB="^[QUI]IMPMAT(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABRI,^TO39GRAN,^TO39GBIS,^TO3GETRI K ^NIVPAR($I,ARTI),^REFTREE($I,ARTI),^ORDNIV($I,ARTI),^NFISIMP($I,ARTI),^ESTFONCT,^NOFONCT D KILL
 G FIN
REC D KILL S ETUD="IMPL",NTAB="^[QUI]IMPMAT(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABR S PMIBAT="^[QUI]IMPMAT" D ^TO3TRIFE K NIVPAR,REFTREE,ORDNIV,NFISIMP,^ESTFONCT,^NOFONCT
FIN Q
PREPA S LT=$L(NTAB),%L=$L("^[QUI]F"),FONTAB="^[QUI]F"_$E(NTAB,%L,LT-1),ADEL=$E(NTAB,%L,LT-1)_")",WDEB=2,WAB="WAB",(WB1,WAB1)=ARTI F SS=2:1:NCLE S @("WAB"_SS)=-1
 Q
KILL I '(DTM) K (%PROGEX,TO3CPMAX,%AA,%NARTI,TACOMPIL,ARTI,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS)
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%PROGEX","TO3CPMAX","%AA","%NARTI","TACOMPIL","ARTI","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
GETNAMFU(NOMTAB,%NFU) 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB Q

