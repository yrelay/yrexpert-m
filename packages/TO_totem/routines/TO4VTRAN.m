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

;TO4VTRAN^INT^1^59547,74871^0
TO4VTRAN ;
 
 S NSOL=-1 F VV=0:0 S NSOL=$N(^GLOSOL($I,NSOL)) Q:NSOL=-1  S REFSOL=^GLOSOL($I,NSOL) D TRAIT Q:%ACCEPAR=1
 K VV,UU,NSOL,REFSOL,POSF,NUCOND,WWA,ATEST Q
TRAIT S POSF=$L($I)+4,DOMINAN=$I_","_0
 F UU=0:0 S POSF=$F(REFSOL,",",POSF) Q:POSF=0  S DOMINE=$E(REFSOL,1,POSF-2) D VERIF Q:%ACCEPAR=0  S DOMINAN=DOMINE
 Q
VERIF S VDOMINAN=@("^TREEDOM("_DOMINAN_")"),VDOMINE=@("^TREEDOM("_DOMINE_")"),REFCOM="YA,NAPAR,VDOMINAN,VDOMINE",CTAB="^[QUI]COMPARAT("_REFCOM_")"
SUIT S NUCOND=-1,%ACCEPAR=0 F WWA=0:0 S NUCOND=$N(@CTAB@(NUCOND)) Q:NUCOND=-1  S ATEST="^[QUI]CCOMPARA("_REFCOM_","_NUCOND_")",@("%ACCEPAR="_@ATEST) G:%ACCEPAR=1 FIN
FIN Q

