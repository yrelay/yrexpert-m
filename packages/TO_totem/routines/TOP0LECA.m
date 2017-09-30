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

;TOP0LECA^INT^1^59547,74874^0
TOP0LECB ;
 
 S LG=0,NUCLI=0,FIN=0,$ZT="",DX=3,DY=6 X XY D CLEBAS^%VVIDEO,ZD^%QMDATE4,^%QMDAK0 S DX=19,DY=3 X XY D BLK^%VVIDEO W "Recuperation" D NORM^%VVIDEO S DATE=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),HOUR=$P(HEURE,"H",1)_"."_$P(HEURE,"H",2)
 S DX=3,DY=6,$ZT="" X XY
TR S DEBUT=0,CONCAT=0 F LOP=1:1 U 47 R X:%TEMPBD S DOLART=$T G:DOLART=0 RATE S DZA=$ZA U 0 D ERROR Q:FIN=1  S PARA=$E(X,1,20) D ^%QZCHBT U 0 D STOENR
FIN I FIN=1 D ^%VSQUEAK W !,"IL Y A UN PROBLEME AVEC LE LECTEUR DE BANDE [RETURN]" R *RET G QUIT
 S CLI=^[QUI]CLICHE(DATE,HOUR,NUCLI,LG),CLI=$E(CLI,1,18)_" "_$E(CLI,20,132),^[QUI]CLICHE(DATE,HOUR,NUCLI,LG)=CLI,DAAT=%DAT,HEUR=HEURE
QUIT S:(FIN=1)&(NUCLI'>1) %ARRET=1 U 0 K LG,NUCLI,%DAT,HEURE,LOP,PB,FIN,ENR,X,ERR,EL,RL,BGL,PCRC,EOT,TM,CLI,ONL,TNR,RET Q
RATE S FIN=1 G FIN
ERROR S PB=0 D ^TOP0ERRL U 0 S:((((EL=1)!(RL=1))!(BGL=1))!(PCRC=1))!TC PB=1
 I EOT=1 S FIN=1 D ^%VSQUEAK W !,"FIN DE BANDE"
 I (TM=1)&(NUCLI'=0) S FIN=1 D ^%VSQUEAK W !,"TAPE MARK DETECTEE"
 I ONL=0 S FIN=1 D ^%VSQUEAK W !,"LE LECTEUR DE BANDE N'EST PLUS ON LINE"
 I TNR=1 S FIN=1 D ^%VSQUEAK W !,"LE LECTEUR DE BANDE N'EST PAS PRET"
 I PB!FIN S ^ERRBAND($I,LOP)=DZA_"^"_X
 Q
ERREUR U 47 S DZA=$ZA,^ERRBAND($I,LOP)=DZA_"^"_X_"^"_$ZE
 I $ZE["TAP" G:NUCLI=0 TR K ^[QUI]CLICHE(DATE,HOUR,NUCLI),^[QUI]ERLECBD(DATE,HOUR,NUCLI) S ^[QUI]ERLECBD(DATE,HOUR,"STOP")=NUCLI-1 G QUIT
 U 0 S $ZT="" W !,$ZE D ^%VSQUEAK W "  [RETURN]" R *RET S $ZT="",FIN=1 G FIN
STOENR I PARA="1.I" S DEBUT=1,NUCLI=NUCLI+1,LG=-1 W "." S OX=$X,OY=$Y D POCLEPA^%VVIDEO W "Cliche No : ",NUCLI S DX=OX,DY=OY X XY
 Q:(DEBUT=0)&(CONCAT=0)  S %OCH=X D ^%QZCHNET
 I PARA="I" S DEBUT=0
SUIT I CONCAT=0 S ENR=$E(%NCH,2,19)_" "_$E(%NCH,21,80),CONCAT=1,LG=LG+1 G PB
 S CONCAT=0 S:LG'=0 ^[QUI]CLICHE(DATE,HOUR,NUCLI,LG)=ENR_$E(%NCH,1,53) G PB
PB I PB&(NUCLI'=0) S ^[QUI]ERLECBD(DATE,HOUR,NUCLI,LG)=1
 Q

