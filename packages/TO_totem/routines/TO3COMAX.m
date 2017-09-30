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

;TO3COMAX^INT^1^59547,74870^0
TO3COMAX ;
 
 I $D(^TABIDENT(WHOIS,"INTERDIT","COMP",$I)) S INT=$$^%QZCHW(" C O M P R E H E N S I O N ") D ^TONOEXEC Q
 K ^TACOMPIL($I) S ^VERIF($I)=0
QUES S %NARTI=1 D CLEPAG^%VVIDEO,CUROF^%VVIDEO
 
 S DXG=0,DXD=38,DYH=0,DYB=4,TIT=$$^%QZCHW("Analyse du savoir-faire des ")_MAX D ^%AB3CADR
 
 S PPX=10,PPY=DY D POCLEPA^%VVIDEO W $$^%QZCHW("(RETURN) pour fin liste") S DX=10,DY=6 X XY
QUES2 X XY D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN G:Y1="" SUITE D LEX
 I CONCUR=1 W " ==> ",PCHCOMP S ^TACOMPIL($I,%NARTI)=PCHCOMP,%NARTI=%NARTI+1,DY=DY+1,DX=PPX G QUES2
 W " ??? " S DY=DY+1 G QUES2
SUITE G:'($D(^TACOMPIL($I))) FIN D CLEPAG^%VVIDEO S DX=10,DY=4 X XY S %NARTI=-1 F UU=1:1 S %NARTI=$N(^TACOMPIL($I,%NARTI)) Q:%NARTI=-1  S DY=DY+1 X XY W ^TACOMPIL($I,%NARTI)
QUES3 D POCLEPA^%VVIDEO W $$^%QZCHW(" OK pour la comprehension de ces "),MAX,$$^%QZCHW(" (O/N) ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) QUES3 G:REP=$$^%QZCHW("N") FIN
BEG S %NARTI=-1 F %AA=0:0 S %NARTI=$N(^TACOMPIL($I,%NARTI)) Q:%NARTI=-1  S ARTI=^TACOMPIL($I,%NARTI) D TRAIT
 D:^VERIF($I)'=1 QUES^TORESPAR G FIN
TRAIT W !,ARTI
 D @TO3CPMAX
FIN Q
LEX S PARA=Y1 D ^%QZCHBT S PCH=$S($E(PARA,$L(PARA))="*":$E(PARA,1,$L(PARA)-1),1:PARA) D ^%LXABR I CONCUR=1 S PCHCOMP=PCHCOMP_$S($E(PARA,$L(PARA))="*":"*",1:"")
 Q

