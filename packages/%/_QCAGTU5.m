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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QCAGTU5^INT^1^59547,73875^0
TREEWAYR ;
 
 
 S STOP=0,^DEUXI($I)=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE) I ($D(@^DEUXI($I))#10)=1 S (%1C,%TREFC)="" D @%TAD Q:STOP'=0
 S ^DEUXI($I)=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE),%2V=0,%2P=1 F %2Z=0:0 S %2P=$F(^DEUXI($I),",",%2P) Q:%2P=0  S %2V=%2V+1
 S ^DEUXIPR($I)=%2V+1 K %2V,%2P,^DEUXI($I),%2Z S %1G=NOMTREE_$S(NOMTREE["(":")",1:""),%2G=NOMTREE_$S(%1G[")":",",1:"(")_"%2,",%2="" F %1=1:1 S (%PR,%2PR)=^DEUXIPR($I),%2=$O(@%1G@(%2)) Q:%2=""  D AFFR Q:STOP=1
 K %0,^DEUXIPR($I),%1C,%2G,%2,%1,%2P,%1G,%2S,%3S,%1Z,%2L Q
AFFR I $D(@%1G@(%2))#10 D TR S %TREFC=""""_%LIB1_"""",%1C=%2 D @%TAD G:STOP'=0 FRES G:'($D(@%1G@(%2))\10) FRES S (%PR,%2PR)=%PR+1 D ARRAY2 G FRES
 S (%PR,%2PR)=%PR+1 D ARRAY2
FRES S:STOP="F" STOP=0 Q
ARRAY2 S %2S="%3S)"
DESCEN2 Q:STOP=1  N %2L,%3S,%PR S %PR=%2PR,%2L=$L(%2S)-4,%3S="" F %1Z=0:0 S %3S=$O(@(%2G_%2S)) Q:%3S=""  D SUBS2 Q:STOP=1
 Q
SUBS2 I $D(@(%2G_%2S))#10 D TR S %TREFC=""""_%LIB1_""","_%2S,%21=%2,%2=%3S D TR S %2=%21,%TREFC=$P(%TREFC,"%3S",1)_""""_%LIB1_"""",%1C=%3S D @%TAD Q:STOP=1  I STOP="F" S STOP=0 Q
 I $D(@(%2G_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)",%2PR=%PR+1 D DESCEN2 Q:STOP'=0  S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
TR S %LIB1=$P(%2,"""",1) Q:%LIB1=%2  S %CAR="""",RS=%2 D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %U=2:1:%NBCAR S %LI=$P(%2,"""",%U),%LIB1=%LIB1_""""""_%LI
FIN K %LI,%LIB,RS,%NBCAR,%U Q
TEST S %98U=1 W !,"nom du global : " R NOMTREE Q:NOMTREE=""  S %TAD="ECR^%QCAGTU5" D DEB^%VTIME,^%QCAGTU5,AFF^%VTIME G TEST
ECR W !,%1C S %98U=%98U+1 Q
%ABGUPLE 
 
 K B S B(%PR)=%1C
BEG S %TREFC="" Q:%PR=1
 I $D(%NBDEF(%PR)) S %NBDEF=%NBDEF-1 K %NBDEF(%PR)
 I '($D(^[QUW]EVALGRIL(NUGR))) S STOP=1,ACCEPT=0 G END
 S PARA=^[QUW]EVALGRIL(NUGR,%PR-1),COK=0
 I ^VPAR($I,PARA)="" S ACCEPT=1 G SUIT
 I ^VPAR($I,PARA)="Indefini" S ACCEPT=1 G SUIT
 I B(%PR)="   " S ACCEPT=1,%NBDEF=%NBDEF+1,%NBDEF(%PR)=1 G SUIT
 I ^[QUW]PARAGRIL(NUGR,PARA)=1 G BRAQ
 I B(%PR)=^VPAR($I,PARA) S ACCEPT=1 G SUIT
REFUS S ACCEPT=0,STOP="F" G END
BRAQ S ATEST=^[QUW]INTERGRI(NUGR,B(%PR))
 I ^VPAR($I,PARA)["," D GUPLEB G COND
 S $ZT="G REFUS",%INT=^VPAR($I,PARA),@("%CONDIT="_ATEST)
COND I %CONDIT=1 S ACCEPT=1 G SUIT
 G REFUS
SUIT S ^GRIL($I,PARA)=B(%PR) I %PR'=(%NBPAR+1) G END
 I %NBDEF=0 S STOP=1,COK=1 G END
 S REFC=NUGR,AP=-1 F YY=1:1 S AP=$N(^[QUW]EVALGRIL(NUGR,AP)) Q:AP=-1  S REFC=REFC_","""_^GRIL($I,^[QUW]EVALGRIL(NUGR,AP))_""""
 S ^GRSOL($I,%NBDEF,%NBSOL)=REFC,%NBSOL=%NBSOL+1,STOP="F" K REFC,YY,AP
END Q
GUPLEB D T0 G:%SCPR="N" T1
 S %BI=%VMIN,%BS=%VMAX,@("%CONDIT="_ATEST) G FIN1
T1 S $ZT="G ERR" F %INT=%VMIN,%VMAX S @("%CONDIT="_ATEST) G:%CONDIT=0 FIN1
 G FIN1
T0 S %VCOMP=^VPAR($I,PARA) D INTE
 I %VMIN="" S %VMIN=-99999999
 I %VMIN["=>" S %VMIN=-99999999
 I %VMAX="" S %VMAX=99999999
 Q
FIN1 K %BI,%BS,%VMAX,%VMIN,%VCOMP,%FCO,%DCO,%CROC1,%CROC2 Q
ERR S %CONDIT=0 G FIN1
INTE S %VMIN=$P(%VCOMP,",",1),%VMAX=$P(%VCOMP,",",2)
 S %CROC1=$E(%VMIN,1),%CROC2=$E(%VMAX,$L(%VMAX)),%FCO="'>",%DCO="'<"
 I (%CROC1="[")!(%CROC1="]") S %VMIN=$E(%VMIN,2,299),%FCO=$S(%CROC1="[":"'<",1:">")
 I (%CROC2="[")!(%CROC2="]") S %VMAX=$E(%VMAX,1,$L(%VMAX)-1),%DCO=$S(%CROC2="]":"'>",1:"<")
 Q
NORM 
 S INDI=$N(^[QUI]STRUCT(NOMG,2,"R",INDI))
 G:INDI=-1 FINNORM
 S EXP=$P(@ADRRESUL@(RESU),"|")
 S ATTA=RESU
 D MAJVAL
 G BACQ
FINNORM I ERREUR=1 S VAL="",POS=0 G FIN
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectations terminees"))
 
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 G DEPIL^%ANGEPIL
 
MAJVAL 
 G:ATTA'=$$^%QZCHW("NOM") SAFF
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit de modifier attribut NOM")) S ERREUR=1 Q
SAFF G:$$TYPE^%QSGEST9(REPA,ATTA)=0 SAFF1
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit de modifier un lien")) S ERREUR=1 Q
SAFF1 
 
 
 S EXP2=EXP
 I $$TYPE^%QSGESPE(ATTA_"/"_$$NOMLOG^%QSF(REPA))="DATE" S EXP2=$$INTF^%QMDAUC(REPA,ATTA,EXP2)
 I EXP2="" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit utiliser chaine vide")) S ERREUR=1 G FIN
 D:MODEX'=1 PA^%QSGESTI(REPA,OB,ATTA,EXP2,1)
 D:MODAF'=0 ADD^%TLIFEN("ATT",ATTA_"<--"_EXP2)
 Q
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 G DEPIL^%ANGEPIL

