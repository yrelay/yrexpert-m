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

;TOP0lecb^INT^1^59547,74874^0
TOP0lecb ;
 
 S %ARCIN=1,LG=0,NUCLI=0,FIN=0,DX=0,DY=6,$ZT="G ERREUR"
 D CLEBAS^%VVIDEO,ZD^%QMDATE4,^%QMDAK0 S DX=19,DY=3 X XY D BLK^%VVIDEO W "Recuperation" D NORM^%VVIDEO S DATE=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),HOUR=$P(HEURE,"H",1)_"."_$P(HEURE,"H",2)
 S DX=3,DY=6 X XY
TR D LOOP
FIN I FIN=1 D ^%VSQUEAK W !,"IL Y A UN PROBLEME AVEC LE LECTEUR DE BANDE [RETURN]" R *RET G QUIT
 K ^STOENR($J) G:'($D(^[QUI]CLICHE(%ARC,LG))) QUIT S CLI=^[QUI]CLICHE(%ARC,LG),CLI=$E(CLI,1,18)_" "_$E(CLI,20,132),^[QUI]CLICHE(%ARC,LG)=CLI
QUIT S DAAT=%DAT,HEUR=HEURE S:(FIN=1)&(NUCLI'>1) %ARRET=1 U 0 K DZA,LG,NUCLI,%DAT,HEURE,LOP,PB,FIN,ENR,X,ERR,EL,RL,BGL,PCRC,EOT,TM,CLI,ONL,TNR,RET Q
ERROR S PB=0 D ^TOP0ERRL S:((((EL=1)!(RL=1))!(BGL=1))!(PCRC=1))!TC PB=1 S:(((EOT=1)!((TM=1)&(NUCLI'=0)))!(ONL=0))!(TNR=1) FIN=1 Q
ERREUR I '(DTM),$ZE["TAP" G:NUCLI=0 TR S ^[QUI]ERLECBD(DATE,HOUR,"STOP")=NUCLI G FIN
 I DTM,$$^%SYSBUG($ZERR)["TAP" G:NUCLI=0 TR S ^[QUI]ERLECBD(DATE,HOUR,"STOP")=NUCLI G FIN
 
 U 0 S $ZT="" W !,$ZE D ^%VSQUEAK W "  [RETURN]" R *RET S $ZT="",FIN=1 G QUIT
LOOP F LOP=1:1 U 47 R X S DZA=$ZA U 0 W !,X D ERROR Q:FIN=1  S %OCH=$E(X,1,40) D ^%QZCHNET S PARA=$$GETLBLAN^%VTLBLAN(%NCH),%OCH=$E(X,41,400) D ^%QZCHNET S VAL=$$GETLBLAN^%VTLBLAN(%NCH) D STOENR
 Q
STOCK G:'($D(^STOENR($J))) FSTOK S %ARC=$S($D(^STOENR($J,"NUMERO.COMMANDE"))&$D(^STOENR($J,"NUMERO.POSTE")):^STOENR($J,"NUMERO.COMMANDE")_"."_^STOENR($J,"NUMERO.POSTE"),1:"INCONU."_%ARCIN) S:%ARC["INCONNU." %ARCIN=%ARCIN+1
 I '($D(^STOENR($J,"ATELIER"))) S ^P0PBPSRL(DATE,HOUR,%ARC)="ATELIER manquant" G FSTOK
 S ATL=^STOENR($J,"ATELIER") I '($D(^TABIDENT(ATL,"MACHINE"))) S ^P0PBPSRL(DATE,HOUR,%ARC)="Utilisateur "_ATL_" non defini" G FSTOK
 S %QUI=QUI,QUI=^TABIDENT(ATL,"MACHINE")
 S LG=-1 F %U=1:1 S LG=$N(^STOENR($J,LG)) Q:LG=-1  S ^[QUI]CLICHE(%ARC,%U)=^STOENR($J,LG)
 S ^[QUI]CLICHE(%ARC,%U)="ARC="_%ARC,^[QUI]P0GETARC(DATE,HOUR,%ARC)=1,^[QUI]COMMEXI(%ARC)=DATE_"^"_HOUR U 0 D POCLEPA^%VVIDEO W "Arc : ",%ARC," sur ",ATL
 S QUI=%QUI
FSTOK K ^STOENR($J) S LG=1 Q
STOENR G STOS:NUCLI=1 Q:PARA'="ATELIER"
STOS I PARA="ATELIER" S NUCLI=1 D STOCK Q
STOAFF S ^STOENR($J,LG)=PARA_"="_VAL,LG=LG+1 S:PARA="COMMANDE" ^STOENR($J)=VAL
PB I PB&(NUCLI'=0) S ^[QUI]ERLECBD(DATE,HOUR,NUCLI,LG)=1
 Q
ARC D @WHOIS S %PENR=0,%LIB=ENR_$E(%NCH,1,53),%ARC=$$GETLBLAN^%VTLBLAN($E(%LIB,PED,RRA))
 I $D(^[QUI]COMMEXI(%ARC)) S DDA=^[QUI]COMMEXI(%ARC),HH=$P(DDA,"^",2),DDA=$P(DDA,"^",1) G:(DDA="")!(HH="") SARC K ^[QUI]P0GETARC(DDA,HH,%ARC),^[QUI]CLICHE(%ARC)
SARC S ^[QUI]COMMEXI(%ARC)=DATE_"^"_HOUR,^[QUI]P0GETARC(DATE,HOUR,%ARC)=1
 K DDA,HH,%LIB Q
TOT G ATF
BTF G ATF
ATF S PED=78,RRA=95 Q
TLR S PED=81,RRA=100 Q
STL G TLR
BTL G TLR

