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

;%DLFLDES^INT^1^59547,73867^0
DLFLDES(LISFLUX,OPEFLUX,%FLU,DAT1,DAT2,MESSAGE,DES) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %X,%M,%N,%PORT,%TERM,DDX,DDY,HEUR1,HEUR2,LFLUX,M,MM,NOF,PX,TABC,TYP
 S HEUR1="0H00",HEUR2="23H59"
 
 K LFLUX
 S DX=""
 F %X=0:0 S DX=$O(^[QUI]DLFLUX(%FLU,"POINTS",DX)) Q:DX=""  S DY="" F %X=0:0 S DY=$O(^[QUI]DLFLUX(%FLU,"POINTS",DX,DY)) Q:DY=""  S M="" F %M=0:0 S M=$O(^[QUI]DLFLUX(%FLU,"POINTS",DX,DY,M)) Q:M=""  D TM
 I DES=0 G L1
 
 I DES=1 D ^%DLFLALF(%FLU,1) Q
 
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 S %TERM=^TABIDENT(WHOIS,"TYPTAB")
 S %PORT=^TABIDENT(WHOIS,"TABTRA")
 D ^%DLFDESG(1,ETU)
 Q
 
L1 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF
 S TABC(1)="ECRAN.ALPHANUMERIQUE",TABC(2)="ECRAN.GRAPHIQUE",TABC(3)="IMPRIMANTE.GRAPHIQUE"
 D POCLEPA^%VVIDEO S TYP=$$^%VZECHO("TABC")
 Q:(TYP=1)!(TYP=6)
 S TYP=$E($P(TYP,".",1),1)_$E($P(TYP,".",2),1)
 D CLEPAG^%VVIDEO G @TYP
EA D ^%DLFLALF(%FLU,0)
 D OPER^%DLFLALF(OPEFLUX,%FLU,"AFF^%DLFLALF")
 G L1
EG S %TERM=^TABIDENT(WHOIS,"TYPECR")
 S %PORT=^TABIDENT(WHOIS,"ECRGRA")
 D ^%DLFDESG(0,"")
 G L1
IG S %TERM=^TABIDENT(WHOIS,"TYPTAB")
 S %PORT=^TABIDENT(WHOIS,"TABTRA")
 D ^%DLFDESG(0,"")
 G L1
 
TM S NOF=""
 F %N=0:0 S NOF=$O(^[QUI]DLFLUX(%FLU,"FLUX",NOF)) Q:NOF=""  I $D(^[QUI]DLFLUX(%FLU,"FLUX",NOF,1,DX,DY)) D TNOF
 Q
TNOF S PX=$ZP(^[QUI]DLFLUX(%FLU,"FLUX",NOF,""))
 S DDX=$ZP(^[QUI]DLFLUX(%FLU,"FLUX",NOF,PX,""))
 S DDY=$ZP(^[QUI]DLFLUX(%FLU,"FLUX",NOF,PX,DDX,""))
 S MM=""
 F %M=0:0 S MM=$O(^[QUI]DLFLUX(%FLU,"POINTS",DDX,DDY,MM)) Q:MM=""  S:'($D(LFLUX(NOF))) LFLUX(NOF)=0 S LFLUX(NOF)=LFLUX(NOF)+$S($D(@LISFLUX@(M,MM)):@LISFLUX@(M,MM),1:0) K @LISFLUX@(M,MM)
 Q
 
T X XY D CAR^%DLFLU2(^[QUI]DLFLUX(%FLU,"FLUX",NF,P,DX,DY)) Q

