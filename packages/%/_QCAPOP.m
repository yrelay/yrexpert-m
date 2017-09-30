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
;! HL002 ! HL     ! 31/08/12 ! Label 12GO transformé en L12GO                 !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QCAPOP^INT^1^59547,73875^0
%QCAPOP ;;11:03 AM  3 Jul 1996
 
 
 
 
 
 
 
 
GEN(RACINE) 
 N GLOB,NBMAX,NB,NUFA
 S GLOB="^[QUI]CPTEUR"
DEB S NBMAX=100,NB=0
LOOPAT i RACINE="" S RACINE="ZZZ"
 L +^[QUI]CPTEUR(RACINE):5 E  S NB=NB+1 G:NB<NBMAX LOOPAT U 0 W "** ",$$^%QZCHW("Attente trop longue sur semaphore de compteur")," ",RACINE G LOOPAT
 D GO
 ;; CAO
 I RACINE="" S RACINE="ZZZ"
 L -^[QUI]CPTEUR(RACINE)
 Q NUFA
 
GENI(GLOB,RACINE) 
 N NBMAX,NB,NUFA
 G DEB
 
 
GO N %H1,%H2,%H3,DN,NCT,PN
 D ZD^%QMDATE4 S DN=%DAT
 ;; CAO
 I RACINE="ZZZ" s RACINE=""
 S NCT=RACINE_$P(DN,"/",3)_$P(DN,"/",2) I '($D(@GLOB@(NCT))) S @GLOB@(NCT)=0
 S PN=@GLOB@(NCT)+1,@GLOB@(NCT)=PN
 S NUFA=$E(NCT,1,7)_$S(PN<10:"000"_PN,PN<100:"00"_PN,PN<1000:"0"_PN,1:PN)
FIN Q
 
GLO(GLOB) 
 N CLE
 S CLE=$ZP(@GLOB@(""))
 Q:CLE="" ""
 Q:'($$ENT^%QZNBN(CLE)) ""
 Q CLE+1
 
GLOB(GLOB) 
 N CLE
 L @(GLOB)
 S CLE=$S($D(@GLOB)#10:@GLOB+1,1:1)
 S @GLOB=CLE
 L
 Q CLE
 
 
 
 
NFONC(PREF,VAR) 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Incrementation de compteur"))
 I $L(PREF)'=3 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Le prefixe doit comporter 3 caracteres")) G ERR
 I $E(VAR)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Une variable temporaire etait attendue")) G ERR
 N VAL
 S VAL=$$GEN(PREF)
 I (MODEX'=1)!((MODAF'=2)&(MODAF'=3)) D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),VAR,VAL,1,"AJOUT") D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,VAL,1)
 D:MODAF'=0 ADD^%TLIFEN("ATT",VAR_"<--"_VAL)
 Q
ERR 
 S ECHEC=1
 Q
 
 
 
 
 
 
MAJ(NOM) 
 N NOM2,AN,NO,NOM1
 S NOM2=$E(NOM,4,5)
 S NOM1=$E(NOM,1,5)
 
 I NOM2'?.N Q
 S AN=$$AN^%QMDATE1
 
 I AN>NOM2 Q
 S NO2=$E(NOM,6,99)+0
 S NO=$S(($D(^[QUI]CPTEUR(NOM1))#10)=1:^[QUI]CPTEUR(NOM1),1:0)
 
 I (AN=NOM2)&(NO>NO2) Q
 
 S ^[QUI]CPTEUR(NOM2)=NO2
 Q
 
 
 
FULNUM(RACINE,VLUE) 
 N %DAT,NTO,%NTO
 D ZD^%QMDATE4
 S %NTO=VLUE
 S NTO(1)=RACINE_$P(%DAT,"/",3)_$P(%DAT,"/",2)_"0000",NTO(2)=%NTO,NTO(3)=$P(%NTO,".",1),NTO(4)=$P(%NTO,".",2),NTO(5)=$L(NTO(1)),NTO(6)=$L(NTO(3)),NTO(7)=NTO(5)-NTO(6),%NTO=$E(NTO(1),1,NTO(7))_NTO(3)_$S(NTO(4)="":"",1:".")_NTO(4)
 Q %NTO
 
 
 N GLOB,NBMAX,NB,NUFA,NUF12
 S GLOB="^[QUI]CPTEUR"
D1 S NBMAX=100,NB=0,NUF12=""
D2 L +^[QUI]CPTEUR(RACINE):5 E  S NB=NB+1 G:NB<NBMAX D2 U 0 W "** attente trop longue sur semaphore de compteur",RACINE G D2
D3 
 S NUF12=""
 ;HL002 D 12GO(4) F %i=1:1:4 S NUFA=$P(@GLOB@(RACINE),"/",%i),NUFA=$S(NUFA<10:"00"_NUFA,NUFA<100:"0"_NUFA,1:NUFA),NUF12=NUF12_NUFA
 D L12GO(4) F %i=1:1:4 S NUFA=$P(@GLOB@(RACINE),"/",%i),NUFA=$S(NUFA<10:"00"_NUFA,NUFA<100:"0"_NUFA,1:NUFA),NUF12=NUF12_NUFA
 F %i=10:1:99 S %f=$F(NUF12,%i) I (%f>0)&($F(NUF12,%i,%f)>0) G D3
 L -^[QUI]CPTEUR(RACINE)
 Q NUF12
 
;HL002 12GO(I) N %H1,%H2,%H3,DN,NCT,PN
L12GO(I) N %H1,%H2,%H3,DN,NCT,PN
 S I=4
loop12 
 I '($D(@GLOB@(RACINE))) S @GLOB@(RACINE)="100/1/1/1"
 
 F %H1=1:1:4 S NUFA(%H1)=$P(@GLOB@(RACINE),"/",%H1)
 S NCT=$P(@GLOB@(RACINE),"/",I),PN=NCT+1
 I PN>999 S $P(@GLOB@(RACINE),"/",I)=1,I=I-1 G:I=0 FIN G loop12
 S $P(@GLOB@(RACINE),"/",I)=PN
 S NUFA=$S(PN<10:"00"_PN,PN<100:"0"_PN,1:PN)
 S NUFA(I)=NUFA
 
 I (I=1)&($E(NUFA,1,1)=0) G loop12
 F %H1=1:1:9 S %H2=%H1_%H1_%H1 I %H2[NUFA G loop12
 F %H1=2:1:4 I ((%H1>1)&(NUFA(%H1)<100))&((NUFA(%H1-1)#10)=0) G loop12
 Q
 Q
 
 
;HL002 12NC(RACINE) 
L12NC(RACINE) 
 N GLOB,NB,NBMAX,VAL,I,NUFA,J,K,K1,K2
 S GLOB="^[QUI]CPTEUR",NBMAX=5000
DZL L +^[QUI]CPTEUR(RACINE):5 E  S NB=NB+1 G:NB<NBMAX DZL U 0 W "** attente trop longue sur semaphore de compteur",RACINE G DZL
 S VAL=$S($D(@GLOB@(RACINE)):@GLOB@(RACINE),1:"100/112/130/202")
 F I=1:1:4 S NUFA(I)=$P(VAL,"/",I)
DZ1 S I=4
DZ2 S NUFA(I)=NUFA(I)+1
 I NUFA(I)>999 S NUFA(I)=1,I=I-1 G DZ2
 F K=111:111:999 F J=1:1:4 G:NUFA(J)=K DZ1
 F K=2:1:4 I (NUFA(K)<100)&((NUFA(K-1)#10)=0) G DZ1
 S NUFA="" F J=1:1:4 S NUFA=NUFA_$S(NUFA(J)<10:"00"_NUFA(J),NUFA(J)<100:"0"_NUFA(J),1:NUFA(J))
 F K1=10:1:99 S K2=$F(NUFA,K1) I K2,$F(NUFA,K1,K2) G DZ1
 S @GLOB@(RACINE)=NUFA(1)_"/"_NUFA(2)_"/"_NUFA(3)_"/"_NUFA(4)
 L -^[QUI]CPTEUR(RACINE)
 Q NUFA
 ;

