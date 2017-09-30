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

;TOP01ARI^INT^1^59547,74873^0
TOP01ARI ;
 
 
 
 
 
 
 
 S ARC=-1
LARC S ARC=$N(^IDEMARC($I,ARC)) G:ARC=-1 FIN
 S ARCF=^IDEMARC($I,ARC),QTARC=$S($D(^[QUI]QUERY3("P0",ARC,1,$$^%QZCHW("QUANTITE"))):$N(^[QUI]QUERY3("P0",ARC,1,$$^%QZCHW("QUANTITE"),-1)),1:"???"),NUF=$ZP(^[QUI]PSRLRTES(ARCF,"")) G:NUF="" LARC K ETUF D INT^%QMDAK0,ZD^%QMDATE4 S %DATD=%DAT,%DEB=HEURE
 S NUFA=$E(NUF,1,$L(NUF)-1)_$C($A($E(NUF,$L(NUF)))-1)_"z" F %U=0:1 S NUFA=$N(^[QUI]TREEWORK(NUFA)) Q:NUFA=-1  Q:$E(NUFA,1,$L(NUF))'=NUF  S ETUF(NUFA)=$S(NUFA[".":".",1:"")_$P(NUFA,".",2)
 G:'($D(ETUF)) LARC S ETUF=%U,NUFA="" D ^TOTCADRE,^TOTPOP S NUFX=NUFA,NUFB=NUFA,NUFA=-1
LNUF S NUFA=$N(ETUF(NUFA)) G:NUFA=-1 FNUF S NUFAC=NUFB_ETUF(NUFA),NUFC=NUFA,NUFA=NUFAC,%LIEU=ARC D ^TO3WNUFA,^TO3WLIEU S NUFA=NUFC D COPY
 S RS=^[QUI]TREEWORK(NUFA,0),(R1,REFID)=$P(RS,"^",4),(A1,ARTET)=$P(RS,"^",1),(A2,ARTCT)=$P(RS,"^",2),POSTREE=0,NUFC=NUFA,NUFA=NUFAC D INT^%QMDAK0,ZD^%QMDATE4,AFF^TO3RETUD S NUFA=NUFC,$P(^[QUI]TREEWORK(NUFAC,0),"^",10)=ARC,ARTET=A1,ARTCT=A2,REFID=R1
 S $P(^[QUI]TREEWORK(NUFAC,0),"^",3)=QTARC,^[QUI]TVPAR(NUFAC,0,$$^%QZCHW("QUANTITE"))=QTARC G:'($D(^[QUI]ANTETUDE(ARTCT,NUFA,0))) LNUF S RS=^[QUI]ANTETUDE(ARTCT,NUFA,0),$P(RS,"^",3)=%DAT,$P(RS,"^",4)=HEURE,^[QUI]ANTETUDE(ARTCT,NUFAC,0)=RS G LNUF
FNUF D INT^%QMDAK0,ZD^%QMDATE4 S %FIN=HEURE,RS=^[QUI]PSRLRTES(ARCF,NUF),$P(RS,"^",2)=%DAT
 S $P(RS,"^",7)=%DEB,$P(RS,"^",8)=%FIN,^[QUI]PSRLRTES(ARC,NUFX)=RS,RS="",$P(RS,"^",20)="",$P(RS,"^",1)=REFID,$P(RS,"^",2)=NUFX,$P(RS,"^",3)=ETUF,$P(RS,"^",4)=%FIN,$P(RS,"^",5)="cf "_NUF
 S %DATE=$P(%DATD,"/",3)_"/"_$P(%DATD,"/",2)_"/"_$P(%DATD,"/",1),^[QUI]RESTEST(ARTET,%DATE,ARTET,$I,%DEB)=RS D BAT
 
 
 S INDIV=$P(^[QUI]TREEWORK(NUFA,0),"^",10)
 D CRE(NUFA,"P2",INDIV,"")
 D AJ(NUFA,ARTET,%DEB,%FIN,%DATD,NUF)
 G LARC
CRE(ET,REP,IND,LIS) 
 
 D CRE^TORQXIN(ET,REP,IND,LIS)
 S $ZT=""
 Q
AJ(ET,ART,HDEF,HFIN,DATE,STATUS) 
 
 D AJ^TORQXIN(ET,ART,HDEF,HFIN,DATE,STATUS)
 S $ZT=""
 Q
ERR Q
COPY D DUPTR^TODUPTAB,DUPRA^TODUPTAB,DUPOA^TODUPTAB,DUPTV^TODUPTAB,DUPRL^TODUPTAB,DUPPM^TODUPTAB,DUPFA^TODUPTAB,DUPMAC^TODUPTAB G FIN
BAT G:'($D(^BATCHCOU($I))) FIN S DEBUT=%DEB,IDTOT=REFID,PGE=^BATCHCOU($I,"PGE"),IDBAT=^BATCHCOU($I),LI=^BATCHCOU($I,"LI"),IDT=$P(IDTOT,"/",1),RS=IDTOT,%CAR="/" D ^%QZCHNBC S %NBCAR=%NBCAR+1
 S IDI="" F %U=2:1:%NBCAR S IDI="/"_$P(IDTOT,"/",%U) D TIDI
 D TIDIS S ^BATCHCOU($I,"PGE")=PGE,^BATCHCOU($I,"LI")=LI D ZD^%QMDATE4,^%QMDAK0 S ^[QUI]RESBATCH(^BATCHCOU($I))=^BATCHCOU($I,"DEBUT")_%DAT_"|"_HEURE G FIN
TIDI S LM=$L(IDT)+$L(IDI) I LM'>37 S IDT=IDT_IDI G END
TIDIS S ^[QUI]RESBATCH(IDBAT,PGE,LI)=NUFX_"|"_IDT_"|"_DEBUT_"|",(NUFX,DEBUT,ERRR)="",IDT=IDI,LI=LI+1 I LI>21 S PGE=PGE+1,LI=8
FIN Q
END Q

