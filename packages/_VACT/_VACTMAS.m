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

;%VACTMAS^INT^1^59547,74033^0
GEACTMAS(SCR,%TB) 
 I $D(@%TB@("ROUCHAR")) D:@%TB@("ROUCHAR")=1 @^MASQUE(SCR,"DESC","ROUCHAR")
 S:'($D(@%TB@("ACCES"))) @%TB@("ACCES")=1 D CHAR S %PI=1,%PG=1,%BP=1
AFFI D ^%VAFIMAS(SCR,%PG,%TB),CONT^%VAFIMAS(SCR,%PG,%BP,%TB)
GET D POCLEPA^%VVIDEO W $$^%QZCHW("Page")_" : ",%PG," "_$$^%QZCHW("Bas de page")_" : ",%BP S %PI=((%PG-1)#^MASQUEC(SCR))+1
 D:@%TB@("ACCES")=1 ^%VMODMAS(.DRAP)
SEL D POCLEPA^%VVIDEO,SEL^%VGENMEN(.ADR,.CTR) G FIN:CTR="A",STOC:CTR="F",SEL:ADR="",@ADR
PAG D POCLEPA^%VVIDEO W "Page ["_%PG_"/"_%BP_"] : " S DX=$X D ^%VLEC G SEL:Y1="" S PG=$P(Y1,"/",1)\1,BP=$P(Y1,"/",2)\1 S:PG="" PG=%PG S:BP="" BP=%BP G:'($$ADR^%QZNBN1(PG)) PAG G:'($$ADR^%QZNBN1(BP)) PAG G:(PG'>0)!(BP'>0) PAG
 I $D(@%TB@("NBPG")),PG>@%TB@("NBPG") G PAG
 S %PG=PG,%BP=BP G AFFI
HAUT S BP=%BP-1 G SEL:BP<1 S %BP=BP G AFFI
BAS S %BP=%BP+1 G AFFI
DROIT S BP=%PG+1 I '($D(@%TB@("NBPG"))) S %PG=BP G AFFI
 G:BP>@%TB@("NBPG") SEL S %PG=BP G AFFI
GAUCH S BP=%PG-1 G SEL:BP<1 S %PG=BP G AFFI
CHAR K ^CHAR($I) S CH="^CHAR($I,%U)"
 F %U=1:1 S OPT=$P($T(OPT+%U),";;",2) Q:OPT=""  S @CH=$P(OPT,",",1)_"^"_$P(OPT,",",2),@CH@("COM")=$P(OPT,",",3),@CH@("EQU")=%U_"^" I $P(OPT,",",4)'="" F %V=4:1 Q:$P(OPT,",",%V)=""  S @CH@("EQU")=@CH@("EQU")_$P(OPT,",",%V)_"^"
 S ^CHAR($I)=23_"^"_55_"^"_78 D ^%VGENMEN(1,54,23,"^CHAR($I)") Q
FIN Q
STOC G:'($D(^MASQUE(SCR,"DESC","ROUSTOC"))) FIN D @^MASQUE(SCR,"DESC","ROUSTOC") G FIN
OPT ;;
 ;;#H#aut,HAUT,Aller vers le haut
 ;;#B#as,BAS,Aller vers le bas
 ;;#+#,DROIT,Aller a droite,+,=
 ;;#-#,GAUCH,Aller a gauche,-
 ;;#P#age,PAG,Appeler une page
 ;;#A#bandon,FIN,Abandonner la saisie
 ;;#F#in,STOC,Fin de saisie

