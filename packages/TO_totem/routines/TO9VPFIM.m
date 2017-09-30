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

;TO9VPFIM^INT^1^59547,74871^0
TO9VPFIM ;
 
 G:(EXP="")!($L(EXP)>230) SUITE I (EXP'[":")!('($D(^[QUI]EXPLICI($P(EXP,":",1))))) G SUITE
 S EXPP=$P(EXP,":",2),RS=EXPP,%CAR="," D ^%QZCHNBC S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("Sous-etude de """)_$P(EXP,":",1)_"""" F UU=1:1:%NBCAR+1 S EXP=$P(EXPP,",",UU) I EXP'="" D SUITE S DDYY=$Y
 Q
SUITE S PCH=EXP,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="" D TO^%QZNBN1 Q:ISNUM
 S %EXDOL=$S(EXP["$":1,1:0),XDP="("_EXP_")" D ^%ABRECPO,^TOPARFOR S WI=-1
 F WJ=1:1 S WI=$N(VFOR(WI)) Q:WI=-1  S ITEM=VFOR(WI) G:(ITEM="?")&(TGRIL["NOM") PINT I ITEM'="?" D ^TO3DEFVA I '(ISNUM) S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="          "_ITEMF,%CH=" = ",%LGR=43-$L(^POSENR(DOLARI,NBLG)) D ^%QZCHBK S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_%CH_VAPA
 Q
PINT S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("           ? ==> Quantite fournie par l'operateur ") Q

