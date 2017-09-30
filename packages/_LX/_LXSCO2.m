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

;%LXSCO2^INT^1^59547,73871^0
LEXSCO2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FIN(STOP) 
 S STOP=0 D POCLEPA^%VVIDEO S INT=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous interrompre l'evaluation"),"N") S:(INT=-1)!(INT=1) STOP=1 D:STOP=0 POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Evaluation de la qualite du lexique en cours ...")) Q
 
MALECR(RE,STOP,TEMP) 
 N MOT,M
 S MALECR=$$CONCAS^%QZCHAD(TEMP,"MALECR") K @(MALECR)
 S RE=0,MOT="" F M=1:1 S MOT=$O(^[QUI]TOLEX(MOT)) Q:MOT=""  Q:RN=-1  R *STOP:0 D:STOP=1 FIN(.STOP) Q:STOP=1  D VERIF(MOT,.RE,.STOP)
 Q
 
VERIF(MOT,RE,STOP) 
 Q:$$MOTRES(MOT)
 S %PCH=MOT D ^%QZNBN1 I ISNUM S RE=RE+1,@MALECR@(MOT)="" Q
 I $L(MOT)=1 S RE=RE+1,@MALECR@(MOT)="" Q
 I $E(MOT)'?1A S RE=RE+1,@MALECR@(MOT)="" Q
 S NBP=$L(MOT,".")
 F NB=1:1:NBP S P=$P(MOT,".",NB) I P="" S RE=RE+1,@MALECR@(MOT)="" Q
 Q
 
COMM(RC,STOP,TEMPC) 
 N MOT,M
 S RC=0,MOT=""
 F M=1:1 S MOT=$O(^[QUI]TOLEX(MOT)) Q:MOT=""  Q:RN=-1  R *STOP:0 D:STOP=1 FIN(.STOP) Q:STOP=1  I '($$MOTRES(MOT)),$$NOCOMM S RC=RC+1,@TEMPC@(MOT)=""
 Q
NOCOMM() 
 Q:$P(^[QUI]TOLEX(MOT),"^",1,5)="^^^^" 1 Q 0
 
AMBIG(RA,STOP,TEMP) 
 N MOT,M,NBP
 S AMBIG=$$CONCAS^%QZCHAD(TEMP,"AMBIG") K @(AMBIG)
 S RA=0,MOT=""
 F M=1:1 S MOT=$O(^[QUI]TOLEX(MOT)) Q:MOT=""  Q:RN=-1  R *STOP:0 D:STOP=1 FIN(.STOP) Q:STOP=1  D CONTROL(MOT,.RA)
 Q
 
CONTROL(MOT,RA) 
 N NB,NBP,P,CH
 Q:$$MOTRES(MOT)
 S NBP=$L(MOT,".")
 S CH="" F NB=1:1:NBP S P=$P(MOT,".",NB) I P'="" S ISNUM=$$ADR^%QZNBN1(P) S:'(ISNUM) CH=CH_","""_P_"""" S:ISNUM CH=CH_","_P
 S CH=$P(CH,",",2,99)
 S GL="^[QUI]PLEXP(""TOLEX"","_CH_")"
 Q:'($D(@GL))
 S:$O(@GL@(""))'="" RA=RA+1,@AMBIG@(MOT)="" Q
 
 
MOTRES(MOT) 
 Q:$D(^[QUI]ZSYSMORE(MOT)) 1
 Q 0

