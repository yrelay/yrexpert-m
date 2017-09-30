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

;TO3VSFSU^INT^1^59547,74870^0
TO3VSFSU ;
 
E S DX=5,DY=9 X XY W COM,VAL G:(TGRIL["MATI")!((TGRIL["OUTCON")!(TGRIL["ABAQUE")) FINB I TGRIL["IMPL" S DX=$X+5 X XY W:$D(^[QUI]UNITE(SFA,AVER)) $$^%QZCHW("Unite : "),^[QUI]UNITE(SFA,AVER)
 S DX=5,DY=11 X XY I TGRIL["MODIFI" W $$^%QZCHW("Valeur fournie par l'operateur.") G FINB
 I TGRIL["SYST" W $P(GRIL,"(",2) G FINB I CGRIL["?????" W $$^%QZCHW("S-F modifie !")
 I TGRIL["COPI" S NUCOP=$P(GRIL,"(",2) W $$^%QZCHW("Valeur duppliquee de l'etude "),NUCOP G FINB
 I TGRIL'["PH" W $$^%QZCHW("Determination de la "),COM,$P(CGRIL,"^",PFOR) S EXP=$P(CGRIL,"^",PFOR) D ^TOVAPFOR I TGRIL["FORM" S EXP=$P(CGRIL,"^",17) D ^TOVAPFOR
FINB S:'($D(SSET)) SSET="" I SSET'="" S SSET="",NUFA=SNUFA
 G END
L S NEX=-1 F EE=0:0 S NEX=$N(^[QUI]RAISON(NUFA,NSFA,AVER,NEX)) G:NEX=-1 L X XY W $P(@("^[QUI]TREEWORK(NUFA,"_NEX_")"),"^",4),$$^%QZCHW(" (O/N) ? ") R *REP S REP=$C(REP) I REP=$$^%QZCHW("O") S QTC=$P(@("^[QUI]TREEWORK(NUFA,"_NEX_")"),"^",3),DX=$X-3 X XY W "      " Q
 Q
2 I ITEM'["," S PCH=ITEM D TO^%QZNBN1 Q:ISNUM  D ^TO3DEFVA S ITEM=ITEMF_$S(VAPA["?":"",1:"("_VAPA_")") G FINB
 S PGA=$P(ITEM,",",1),PDR=$P(ITEM,",",2),PGT="" F ITEM=PGA,PDR S PCH=ITEM D TO^%QZNBN1 D:'(ISNUM) ^TO3DEFVA S PGT=PGT_$S(ISNUM:ITEM,1:ITEMF_"("_VAPA_")") S:ITEM=PGA PGT=PGT_$$^%QZCHW(" et ")
 S ITEM=PGT Q
1 D ^TO3DEFVA S ITEM=ITEMF_"("_VAPA_")" Q
END Q

