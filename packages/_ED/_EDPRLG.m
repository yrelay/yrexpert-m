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

;%EDPRLG^INT^1^59547,73869^0
%EDPRLG() ;;08:33 AM  21 May 1996
 
 
 N T1,T2,LIMI
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 
 I '($D(^SEMAPHO(%PORT))) G NY
 
 
 I $P(^SEMAPHO(%PORT),"|")=$J G DEJAPRIS
 
 
NY L +^SEMAPHO(%PORT):1 E  U 0 D ^%VZEAVT($$^%QZCHW("imprimante indisponible")) Q 0
 
 
 C %PORT
 
 
 D OPENDEV^%SYSUTI1(%PORT)
EDPR2 
 U %PORT
 S ^SEMAPHO(%PORT)=$J_"|"_$P($H,",")_"."_$P($H,",",2)
 S %FONC="INIT" D ^%PBPZ
 D INIT^%EDENVL
 Q 1
 
DEJAPRIS 
 
 
 S T1=$P(^SEMAPHO(%PORT),"|",2),T2=$P($H,",")_"."_$P($H,",",2)
 S LIMI=$S($D(^ENVCONF("TIMEOUT",%PORT,"VAL")):^ENVCONF("TIMEOUT",%PORT,"VAL"),1:30E-5)
 I (T2-T1)>LIMI S %FONC="REINIT" D ^%PBPZ,TUERLOC^%EDCENVL
 S ^SEMAPHO(%PORT)=$J_"|"_T2
 S %FONC="INIT.VARIABLES" D ^%PBPZ
 D INIT^%EDENVL
 Q 1
 
 
REINIT 
 ;;S %PORT="" F P=0:0 S %PORT=$O(^SEMAPHO(%PORT)) Q:%PORT=""  I $P(^SEMAPHO(%PORT),"|")=$J C %PORT:(2) K ^SEMAPHO(%PORT)
        
 ; Modification flb
 
 S %PORT="" F P=0:0 S %PORT=$O(^SEMAPHO(%PORT)) Q:%PORT=""  I $P(^SEMAPHO(%PORT),"|")=$J C %PORT K ^SEMAPHO(%PORT)
 
 L -^SEMAPHO
 Q
 ;

