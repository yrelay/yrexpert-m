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

;TOWALLGA^INT^1^59547,74876^0
TOWALLGA ;
 
 K ^COMPILVU($I),^POSENR($I),^POSFUL($I) S %NU=9,PAGE=1
 S B2=-1 F I=1:1 S B2=$N(^[QUI]OCGRIL("GAMLAC",B2)),B3=-1 Q:B2=-1  F J=1:1 S B3=$N(^[QUI]OCGRIL("GAMLAC",B2,B3)),B4=-1 Q:B3=-1  F K=1:1 S B4=$N(^[QUI]OCGRIL("GAMLAC",B2,B3,B4)),B5=-1 Q:B4=-1  D SUIT
FIN K %NU
END Q
SUIT F L=1:1 S B5=$N(^[QUI]OCGRIL("GAMLAC",B2,B3,B4,B5)) Q:(B5=-1)!(B5="zzNEXPOSI")  D TRAIT
 G END
TRAIT D:%NU=9 DEBPAG S ^POSENR($I,PAGE,%NU)=B2_"^"_B3_"^"_B4_"^"_B5,%NU=%NU+1 I %NU'<22 S %NU=9,PAGE=PAGE+1
 G END
DEBPAG S ^POSFUL($I,PAGE)=B2_"^"_B3_"^"_B4_"^"_B5 G END

