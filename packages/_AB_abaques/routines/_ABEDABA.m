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

;%ABEDABA^INT^1^59547,73864^0
ABEDABA ;
 
 S DY=3 D CLEBAS^%VVIDEO S %ZPGE=-1,LI=-1
 F UU=0:1 S %ZPGE=$N(^TACOMPIL($I,%ZPGE)) Q:%ZPGE=-1  S LI=-1 F VV=0:0 S LI=$N(^TACOMPIL($I,%ZPGE,LI)) Q:LI=-1  D COMPR
 I UU'=0 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W # C IMPR
 G END
COMPR S PPGG=%ZPGE,LLII=LI
COMPR2 S RGR=^TACOMPIL($I,PPGG,LLII),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR,!,?10,$$^%QZCHW("Patientez un instant ! Impression en cours....")
 S QUW=$S(TYPGR="(P)":QUI,1:%UCI),QU=QUW D ^%ABGTPAR S %NBPAR=%CP
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR D ^%ABTEP H 5 C IMPR
 S NOMTAB="^[QUW]PRONUM(NOMG,NORM",ADR="GETRES^%ABEDABA" D ^%VTENR
 S DP=-1,%NORM=NORM,%IDENT=IDENT F EW=1:1 S DP=$N(^[QUW]OCGRIL(NOMG,NORM,DP)) Q:DP=-1  I DP'="zzNEXPOSI" D ^%QMDAK0,PGE^%ABGRPAG,^%ABIMPGR H 5
FIN G END
GETRES S RESUL(1)=NOMG,RESUL(2)=NORM,RESUL(3)=IDENT
 F EW=1:1:15 S RESUL(EW+3)=$S($D(%RS(EW)):%RS(EW),1:"")
 G END
END Q

