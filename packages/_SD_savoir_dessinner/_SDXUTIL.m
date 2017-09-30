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

;%SDXUTIL^INT^1^59547,73890^0
SDXUTIL ;
 
 
 
 
 
TAILLE() 
 N GLO,TC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,TC=$P(@GLO,$C(0),7) G FTA
 S TC=$P(@GLO@($I),$C(0),8)
FTA Q TC
 
EPAISSEUR() 
 N GLO,EC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,EC=$P(@GLO,$C(0),8) G FEP
 S EC=$P(@GLO@($I),$C(0),9)
FEP Q EC
 
LIBELLE() 
 N GLO,LC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,LC=$P(@GLO,$C(0),10) G FLI
 S LC=$P(@GLO@($I),$C(0),11)
FLI Q LC
 
TRAIT() 
 N GLO,TC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,TC=$P(@GLO,$C(0),9) G FTR
 S TC=$P(@GLO@($I),$C(0),10)
FTR Q TC
 
ECHELLE() 
 N GLO,EC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,EC=$P(@GLO,$C(0),5) G FEC
 S EC=$P(@GLO@($I),$C(0),6)
FEC Q EC
 
ORIENT() 
 N GLO,OC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,OC=$P(@GLO,$C(0),6) G FOR
 S OC=$P(@GLO@($I),$C(0),7)
FOR Q OC
 
COOR(TYP) 
 N GLO,CO,P
 S P=$S(TYP="X":1,1:2)
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,CO=$P(@GLO,$C(0),P) G FCO
 S CO=$P(@GLO@($I),$C(0),P+1)
FCO Q CO
 
SYNT() 
 N GLO,SC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,SC=$P(@GLO,$C(0),11) G FSY
 S SC=$P(@GLO@($I),$C(0),12)
FSY Q SC="O"
 
PAS() 
 N GLO,PC
 S GLO=$$ADR^%SDXSPE
 
 I '($D(@GLO@($I))) S GLO=$$ADR^%SDXGEN,PC=$P(@GLO,$C(0),12) G FPA
 S PC=$P(@GLO@($I),$C(0),13)
FPA Q PC

