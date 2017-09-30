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

;%ZGEDES^INT^1^59547,74037^0
%ZGEDES ;
 S ^U($J,0,EDCL)=X,%COL=80
BEG D CLEPAG O 0:(RM:0) W "Nom de la figure (Adresse de pg ) : " R FIG G:$A(FIG)<32 END
COL W !,"Nombre de colonnes (80/132) : " R %COL G:$A(%COL)<32 END G:(%COL'=132)&(%COL'=80) COL
 W *27,">" D CLEPAG,CAR:%COL=132,^%ZGETFIG G:'($D(^INTER($J))) BEG S DL=$ZP(^U($J,0,"")),PL=(DL\1)+1,CH=FIG_" ;;",ID=-1
LID S ID=$N(^INTER($J,ID)) G:ID=-1 FIN S KS=^INTER($J,ID),LO=($L(CH)+KS)+1 I LO>250 D STOC S CH=" ;;"
 S CH=CH_KS_"/" G LID
FIN D STOC I CH'=" ;;" S CH=" ;;" D STOC
END D CLEPAG,NORM:%COL=132,STAT^%ZGEWORD W *27,"=" S EDLL=EDSL,%="S" O 0:(RM:"S":"") Q
STOC S ^U($J,0,PL)=CH,^U($J,0,PL,0)=DL,DL=PL,PL=PL+1 Q
CLEPAG W *27,"[2J" S DX=0,DY=0 X XY Q
CAR S %A=$I,IOM=132 O %A:(132) W *27,"[?3h" Q
NORM S %A=$I,IOM=80 O %A:(80) W *27,"[?3l" Q

