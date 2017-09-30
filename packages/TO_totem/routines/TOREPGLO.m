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

;TOREPGLO^INT^1^59547,74875^0
TOREPGLO ;
 
 D ^ZZMAJROU K ^TBROUT($I),^GLOROUT($I) S XX="ZR  ZL @ROU F LIG=1:1 S LIGN=$T(+LIG) Q:LIGN=""""  F QUI=""^[QUI]"",""^[QU]"",""^[QUW]"",""^[QUS]"",""^[QUCOM]"" S POS=0 F UU=0:0 S POS=$F(LIGN,QUI,POS) Q:POS=0  X EXAM "
 S EXAM="S LR=$E(LIGN,POS,299),EXP="""" F VV=1:1 S CC=$E(LR,VV) X:(CC="" ""!(CC="","")!($L(CC)=0)!(CC="")"")!(CC=""("")!(CC="""""""")!(CC=""/"")) ECR Q:(CC="" ""!(CC="","")!($L(CC)=0)!(CC="")"")!(CC=""("")!(CC="""""""")!(CC=""/""))  S EXP=EXP_CC"
 S ECR="S:(CC=""""""""&($E(LR,VV+1)=""_"")) EXP="""" Q:EXP=""""  X AFF"
 S AFF="W !,?10,EXP S ^TOLISGLO(EXP)=1,^GLOROUT($I,ROU,EXP)=1"
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$L23^%QSLIB2("RETURN Fin de liste, CTRLF toutes") S DX=0,DY=0 X XY W "References aux globals sur les routines : ",!,!,! S DY=$Y,DX=10
QUES S DY=DY+1 X XY W "- " S DX=$X D ^%VLEC G FIN:CTRLA,TOUTES:CTRLF,TRAIT:Y1="" S ^TBROUT($I,Y1)=1,DX=10,DY=DY+1 G QUES
TRAIT S RO=-1 F %SS=0:0 S RO=$N(^TBROUT($I,RO)) Q:RO=-1  K VALCLE S NOMTAB="^UTILITY",ADR="TRAIT1^TOREPGLO",VALCLE(1)="ROU",VALCLE(2)=RO D ^%VKMULG
 D MAJSCR K ^GLOROUT($I) Q
TRAIT1 S ROU=B2 K ^GLOROUT($I,ROU) W !,ROU X XX
 Q
TOUTES K ^TOLISGLO D ^%QMDAK0 S ^TOLISGLO=HEURE,ROU=0 F TT=0:0 S ROU=$N(^UTILITY("ROU",ROU)) Q:ROU=-1  W !,ROU S ^TBROUT($I,ROU)=1 X XX
 D MAJSCR K ^GLOROUT($I)
 S ^TOLISGLO("SCRC")=1,^TOLISGLO("STRUCT")=1,^TOLISGLO("OCGRIL")=1,^TOLISGLO("PRONUM")=1,^TOLISGLO("RESUGRIL")=1,^TOLISGLO("REFABAC")=1,^TOLISGLO("PARAGRIL")=1,^TOLISGLO("EVALGRIL")=1,^TOLISGLO("GRUPLET")=1,^TOLISGLO("INTERGRI")=1
 S ^TOLISGLO("SAISIGAM")=1,^TOLISGLO("GROUGRIL")=1,^TOLISGLO("DEFGROUP")=1 D ^%QMDAK0 S ^TOLISGLO=^TOLISGLO_"/"_HEURE Q
MAJSCR W !,"Un instant..." S ROUT=-1 F UU=0:0 S ROUT=$N(^TBROUT($I,ROUT)) Q:ROUT=-1  S:'($D(^EXISROUT(ROUT))) ^EXISROUT(ROUT)="" D MAJGLO
 G FIN
MAJGLO K ^REFERGLO(ROUT) S NUM=1,GLO=-1 F NN=1:1 S GLO=$N(^GLOROUT($I,ROUT,GLO)) Q:GLO=-1  S $P(^REFERGLO(ROUT,NUM),"^",NN#20)=GLO I (NN#20)=0 S NUM=NUM+1
FIN Q

