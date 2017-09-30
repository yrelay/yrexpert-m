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

;TO3CPTIE^INT^1^59547,74870^0
TO3CPTIE ;
 
 K ^AUTREFO($J),^GETABAC2($I),^NUNOM($I) S YA=ARTI K ^[QUI]TIMCOMP(ARTI),^DEDUIT($I) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]TIMCOMP(ARTI,%DAT)=HEURE D ^TO3DELIM
 S TABIMP="^[QUI]IMPLICI"
 D ^%ABPARAR,^TO3TABAC,^TO3FOFON,^TO3GPAR,^TO3DLIGI,RECABR
 K ^[QUI]PAR(ARTI) D INT^%QMDAK0 S ^[QUI]TIMCOMP(ARTI,%DAT)=^[QUI]TIMCOMP(ARTI,%DAT)_"^"_HEURE D ^%VSQUEAK Q
RECABR D ^TOVERIEX
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]IMPLICI" D GETNAMFU S %DOM=$P(NOMTAB,"]",2)
 S ETUD="IMPL",NTAB="^[QUI]IMPLICI(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABRI,^TO39GRAN,^TO39GBIS,^TO4TRIFI K ^NIVPAR($I,ARTI),^REFTREE($I,ARTI),^ORDNIV($I,ARTI),^NFISIMP($I,ARTI),^ESTFONCT,^NOFONCT D KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]NOMENC" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),NOMBIS=0,ETUD="NOME",NTAB="^[QUI]NOMENC(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]PHASE" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="PHAS",NTAB="^[QUI]PHASE(ARTI,",IPREM=2,NCLE=4,PNUM=1,NFOR=8,NU=17 F %U=1:1:8 S @("F"_%U)=NU,NU=NU+1
 K NU,%U D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]OUTCONS" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="CONS",NTAB="^[QUI]OUTCONS(ARTI,",IPREM=2,NCLE=5,PNUM=1,NFOR=1,F1=17 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]DIMOUT" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="DIM",NTAB="^[QUI]DIMOUT(ARTI,",IPREM=2,NCLE=6,PNUM=1,NFOR=1,F1=17 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]FORMULE" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="FORM",NTAB="^[QUI]FORMULE(ARTI,",IPREM=2,NCLE=5,PNUM=1,F1=17,F2=19,NFOR=2 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]AUTREFO" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="AUTREFO",NTAB="^[QUI]AUTREFO(ARTI,",IPREM=2,NCLE=6,PNUM=4,F1=2,NFOR=1 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]TPCTGAM" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="TPCTGAM",NTAB="^[QUI]TPCTGAM(ARTI,",IPREM=2,NCLE=2,PNUM=3,F1=1,F2=2,NFOR=2 D PREPA,L^TO3GABR,KILL
 S ETUD="MATIERE" K FLTAB S (NOMTAB,TABNAM)="^[QUI]MATIERE" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),NTAB="^[QUI]MATIERE(ARTI,",IPREM=2,NCLE=2,PNUM=1,NFOR=6,F1=17,F2=18,F3=19,F4=20,F5=21,F6=22 D PREPA,L^TO3GABR,KILL
 S ETUD="SELMAT" K FLTAB S (NOMTAB,TABNAM)="^[QUI]SELMAT" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),NTAB="^[QUI]SELMAT(ARTI,",IPREM=2,NCLE=4,PNUM=1,NFOR=1,F1=17 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]MACSEL" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="SELMAC",NTAB="^[QUI]MACSEL(ARTI,",IPREM=2,NCLE=4,PNUM=1,NFOR=0 D PREPA,L^TO3GABR,KILL
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]TOCTREV" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="CTREV",NTAB="^[QUI]TOCTREV(ARTI,",IPREM=2,NCLE=2,PNUM=2,NFOR=3,F1=18,F2=19,F3=20 D PREPA,L^TO3GABR,KILL,^TOCTREVO
 K FLTAB S (NOMTAB,TABNAM)="^[QUI]COMPARAT" D GETNAMFU S %DOM=$P(NOMTAB,"]",2),ETUD="COMPAR",NTAB="^[QUI]COMPARAT(ARTI,",IPREM=2,NCLE=5,PNUM=1,NFOR=0 D PREPA,L^TO3GABR,KILL
FIN D:$D(^[QUI]COMPARAT(ARTI)) NETCP Q
PREPA S LT=$L(NTAB),%L=$L("^[QUI]F"),FONTAB="^[QUI]F"_$E(NTAB,%L,LT-1),ADEL=$E(NTAB,%L,LT-1)_")",WDEB=2,WAB="WAB",(WB1,WAB1)=ARTI F SS=2:1:NCLE S @("WAB"_SS)=-1
 Q
NETCP K ^[QUI]REFLATER(ARTI,"REALISATION") S %U="" F %V=1:1 S %U=$O(^[QUI]UNKN(ARTI,%U)) Q:%U=""  I %U["'REALISATION" K ^[QUI]UNKN(ARTI,%U)
 Q
KILL F %UU=1:1:NCLE K @("WB"_%UU)
 F %UU=1:1:NFOR K @("F"_%UU)
 K %UU Q
GETNAMFU 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB
 S FLTAB=%NFU K %NF1,%NFU Q

