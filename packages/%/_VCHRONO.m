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

;%VCHRONO^INT^1^59547,74034^0
%VCHRONO ;
 
RETERR 
 N H,S,DUREE,M,%PAR1,%PAR2
 S %RESULTAT=0
 S %PAR1=$P(PAR,"/",2),%PAR2=$P(PAR,"/",3) G:%PAR2'="DEMARRAGE" AFF
 S:(0+%PAR1)'=%PAR1 %PAR1=1
DEB K ^GETIME($J,%PAR1) S ^GETIME($J,%PAR1,"DEB")=$P($H,",",2),%RESULTAT=^GETIME($J,%PAR1,"DEB") G END
FIN S ^GETIME($J,%PAR1,"FIN")=$P($H,",",2),DELTA=^GETIME($J,%PAR1,"FIN")-$S('($D(^GETIME($J,%PAR1,"DEB"))):0,1:^GETIME($J,%PAR1,"DEB")) D DELTA Q
DELTA S H=DELTA\3600,S=DELTA#3600,M=S\60,S=S#60,DUREE=$S(H=0:"",1:H_"h")_$S(M=0:"",1:$S(M<10:"0",1:"")_M_"'")_$S(S=0:"",1:$S(S<10:"0",1:"")_S_"''") G END
AFF D FIN S %RESULTAT=DELTA_" soit "_DUREE K DUREE Q
END Q

