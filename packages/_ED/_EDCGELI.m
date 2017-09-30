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

;%EDCGELI^INT^1^59547,73868^0
EDCGELIG ;
 
 
 
 
 
 S:$D(@CP@("COMP",S)) @CP@("COMP",D)=@CP@("COMP",S) Q
INIT 
 S ETI=-1 F I=1:1 S ETI=$N(@CP@("ETI",ETI)) Q:ETI=-1  S K=@CP@("ETI",ETI) S:K'<P1C @CP@("ETI",ETI)=K+1
AJOUT 
 Q:($$^%QCAZG("MOD")="")&($$^%QCAZG("FORMAT")="")
 I '($D(@CP@("ETI"))) G AJ2
 N I,J,ETI,K S ETI=-1
 F I=1:1 S ETI=$N(@CP@("ETI",ETI)) Q:ETI=-1  S K=@CP@("ETI",ETI) S:K'<P1C @CP@("ETI",ETI)=K+1
AJ2 S ETI=-1
 F I=1:1 S ETI=$N(@CP@("ADR",ETI)) Q:ETI=-1  S K=@CP@("ADR",ETI) S:K'<P1C @CP@("ADR",ETI)=K+1
 Q
SUPP 
 Q:($$^%QCAZG("MOD")="")&($$^%QCAZG("FORMAT")="")
 I '($D(@CP@("ETI"))) G SUPP1
 N K,I,J,ETI S ETI=-1
 F I=1:1 S ETI=$N(@CP@("ETI",ETI)) Q:ETI=-1  D SUPP2("ETI")
SUPP1 S ETI=-1
 F I=1:1 S ETI=$N(@CP@("ADR",ETI)) Q:ETI=-1  D SUPP2("ADR")
 Q
SUPP2(TYP) S K=@CP@(TYP,ETI)
 I K=P1C K @CP@(TYP,ETI) Q
 S:K>P1C @CP@(TYP,ETI)=K-1 Q

