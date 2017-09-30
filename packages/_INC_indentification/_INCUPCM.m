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
;! Nomprog     : %INCUPCM                                                     !
;! Module      : Gestion des mots de passe                                    !
;! But         : Consulter/Modifier les mots de passe des partitions          !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!     Depuis la base DEMO > utiliser le mot de passe = DMO                   !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 18/07/12 ! Acces au menu MDP depuis DMO ou DEV            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%INCUPCM ;
ZCMSPASS ;
 
 D PASS Q:B["???"  D CLEPAG^%VVIDEO,^%VCMS("MODEPAS")
FIN K CMS U 0 Q
PASS D ECHOFF^%VVIDEO,ZD^%QMDATE4 S JJ=$P(%DAT,"/",1),MM=$P(%DAT,"/",2) K IT S %U=1 F IT=JJ,MM D T0
 S BS="PDM"_IT(1)_IT(2)_":",LBS=$L(BS)
 ;HL002 S B=$S($D(^TOLISGLO("MPTMDP")):^TOLISGLO("MPTMDP"),1:""),PS1=0
 S B=$S($D(^TOLISGLO("MPTMDP")):^TOLISGLO("MPTMDP"),QUI="DMO":"DMO",QUI="DEV":"DEV",1:""),PS1=0
PAS1 S PS1=PS1+1 G:PS1>3 QE D POCLEPA^%VVIDEO,^%VSQUEAK W "Mot de passe svp...  " R PS G:PS="" PAS1 G QI:PS=B,QE:PS="?" I $E(PS,1,LBS)=BS S IT=$P(PS,":",2) I IT'="" S ^TOLISGLO("MPTMDP")=IT G QI
 G PAS1
QE S B="???"
QI K PS1,PS D ECHON^%VVIDEO Q
T0 S BSC=IT K BS F BS=10,1 S BS(BS)=BSC\BS,BSC=BSC#BS
 S IT(%U)=$P(",X,XX,XXX",",",BS(10)+1)_$P(",I,II,III,IV,V,VI,VII,VIII,IX",",",BS(1)+1),%U=%U+1

