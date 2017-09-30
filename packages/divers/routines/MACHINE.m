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

;MACHINE^INT^1^59547,74868^0
MACHINE ;
RETERR S %RESULTAT="1???",$ZT=^TOZE($I,"A") Q:%ABEND=1  K ITEX S ITEX=$P(EXPFONC,"/",2,500) F IT=1:2 Q:$P(ITEX,"/",IT)=""  D TRAIT
 G:('($D(ITEX("PH"))))&('($D(ITEX("OP")))) FIN
 S %FTPH="^PHASADM($I,NUFA,TWREF,""PHAS"",""OK"")",%FTEN="^TENTATIV($I,NUFA,TWREF,""PHAS"")" G PH:'($D(ITEX("PH"))),OP:'($D(ITEX("OP"))),1:PARA
PH S %FOP=ITEX("OP"),%FPH=-1 F %U=0:0 S %FPH=$N(@%FTPH@(%FPH)) Q:%FPH=-1  S %ER=-1 F %U=0:0 S %ER=$N(@%FTPH@(%FPH,%ER)) Q:%ER=-1  G:%ER=%FOP OKPH
 S %FPH=-1 F %U=0:0 S %FPH=$N(@%FTEN@(%FPH)) Q:%FPH=-1  S %ER=-1 F %U=0:0 S %ER=$N(@%FTEN@(%FPH,%ER)) Q:%ER=-1  G:%ER=%FOP MAYBE
 G FIN
OKPH S %FOG=@%FTPH@(%FPH,%FOP) G:'($D(^[QUI]SECT(NUFA,TWREF,%FOP_"/"_%FOG))) MAYBE G PARA
OP S %FPH=ITEX("PH") G OKOP:$D(@%FTPH@(%FPH)),MAYBE:$D(@%FTEN@(%FPH)),FIN:1
OKOP S %FOP=$N(@%FTPH@(%FPH,-1)) G FIN:%FOP=-1,OKPH:1
PARA I '($D(ITEX("P"))) S %RESULTAT=^[QUI]SECT(NUFA,TWREF,%FOP_"/"_%FOG) G FIN
 S %FOPOG=%FOP_"/"_%FOG,%FPA=ITEX("P"),%RESULTAT=$S($D(^[QUI]PARMAC(NUFA,TWREF,%FOPOG,%FPA)):^[QUI]PARMAC(NUFA,TWREF,%FOPOG,%FPA),1:"1???") G FIN
FIN K ITEX,IT,OB,VOB,%FTPH,%FTEN,%U,%FOP,%FPH,%FOG,%FOPOG,%ER Q
MAYBE S %PAAAF=0 G FIN
TRAIT I $P(ITEX,"/",IT)["^V($I,YA" S @("OB="_$P(ITEX,"/",IT)),@("VOB="_$P(ITEX,"/",IT+1)),ITEX(OB)=VOB Q
 S ITEX($P($P(ITEX,"/",IT),"""",2))=$P($P(ITEX,"/",IT+1),"""",2) Q

