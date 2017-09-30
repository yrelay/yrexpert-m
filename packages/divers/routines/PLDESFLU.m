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

;PLDESFLU^INT^1^59547,74868^0
PLDESFLU ;
 
 
 
 
 
 
 
 
 
 
 S:'($D(MESSAGE)) MESSAGE=""
 K LFLUX S DX=-1 F %DX=0:0 S DX=$N(^[QUI]PLPOINTS(%FLU,DX)) Q:DX=-1  S DY=-1 F %DY=0:0 S DY=$N(^[QUI]PLPOINTS(%FLU,DX,DY)) Q:DY=-1  S M=-1 F %M=0:0 S M=$N(^[QUI]PLPOINTS(%FLU,DX,DY,M)) Q:M=-1  D TM
L1 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,CLEPAG^%VVIDEO
 S %T="134" D ^PLCHTERM G:%C="" FIN D CLEPAG^%VVIDEO G @%C
1 D ^PLDESALF G L1
2 S %TERM=^TABIDENT(WHOIS,"TYPECR")
 S %PORT=^TABIDENT(WHOIS,"ECRGRA") D ^PLDESGRA G L1
3 S %TERM=^TABIDENT(WHOIS,"TYPTAB")
 S %PORT=^TABIDENT(WHOIS,"TABTRA") D ^PLDESGRA G L1
FIN K %C,DDX,DDY,DX,%DX,DY,%DY,LFLUX,M,%M,MM,NOF,%NOF,%PORT,PX,%T,%TERM Q
TM S NOF=-1 F %NOF=0:0 S NOF=$N(^[QUI]PLFLUX(%FLU,NOF)) Q:NOF=-1  D:$D(^[QUI]PLFLUX(%FLU,NOF,1,DX,DY)) TNOF
 Q
TNOF S PX=$ZP(^[QUI]PLFLUX(%FLU,NOF,"")),DDX=$ZP(^[QUI]PLFLUX(%FLU,NOF,PX,"")),DDY=$ZP(^[QUI]PLFLUX(%FLU,NOF,PX,DDX,""))
 S MM=-1 F %MM=0:0 S MM=$N(^[QUI]PLPOINTS(%FLU,DDX,DDY,MM)) Q:MM=-1  S:'($D(LFLUX(NOF))) LFLUX(NOF)=0 S LFLUX(NOF)=LFLUX(NOF)+$S($D(@LISFLUX@(M,MM)):@LISFLUX@(M,MM),1:0) K @LISFLUX@(M,MM)
 Q
T X XY D CAR^PLFLUX(^[QUI]PLFLUX(%FLU,NF,P,DX,DY)) Q

