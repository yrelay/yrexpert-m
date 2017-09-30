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

;TONFORAF^INT^1^59547,74873^0
TO3FORAF ;
 
NORM S FOR("ZZ")=17
RETERR Q:%ABEND=1  S %TYBL=$S(FOR("ZZ")=17:"PREP",1:"USIN") D UNITE^TO3NFORM G:'($D(@("^[QUI]BLOCIMPL("_SOURCE_","""_%TYBL_""")"))) SUIT S TBB="^TPBLIMP($I,NUFA,TWREF,"_SOURCE_","""_%TYBL_""")" I $D(@TBB) S @TA@(OP)=@TBB G T1
 S RBL="("_SOURCE_","""_%TYBL_""")" D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM S FOR("AFF")=$S($D(@TBB):@TBB,1:"???"),@TA@(OP)=FOR("AFF") G T1
SUIT S AFFECT="^[QUI]AFORMULE(YA,PH(1),OP(1),FOR(""SEC""),FOR(""COND""),FOR(""ZW""))" S:@AFFECT="" @AFFECT=0 D ^TO3SIFON G:SIF SIF1
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"","""_FOR("ZZ")_""")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"","""_FOR("ZZ")_""")" D GET^TOCHEXPR G:%ERR YAERR
 S AFFECT="%RESUL",%RESUL="RES1"
SIF1 Q:%ABEND=1  S FOR("CAFFECT")=@AFFECT,@("@TA@(OP)="_FOR("CAFFECT"))
T1 S FOR("ZW")=FOR("ZW")+1
 I FOR("ZZ")=17 S FOR("ZZ")=19 G RETERR
FIN K %ERR,AFFECT Q
BLIMP S %ABEND=2,FOR("ET")=^PILETUD($I,0),^PILETUD($I,FOR("ET"))=NUFA_"^"_TWREF_"^"_(%N10+1)_"^FORM^^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^1^1" Q
YAERR S FOR("zzz")=FOR("xxx") Q

