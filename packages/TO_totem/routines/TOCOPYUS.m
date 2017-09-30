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

;TOCOPYUS^INT^1^59547,74871^0
TOCOPYUS ;
 
 K ^GLO($J) S $ZT="ERR",%T=-1 F %U=0:0 S T=$N(^TOLISGLO(%T)) Q:%T=-1  S %GLO=-1 F %UU=1:1 S %GLO=$N(^TOLISGLO(%T,%GLO)) Q:%GLO=-1  S ^GLO($J,$E(%GLO,1,8))=1
 S %GLO=-1 F %UU=1:1 S %GLO=$N(^GLO($J,%GLO)) Q:%GLO=-1  W !,$$^%QZCHW("Copie de "),%GLO S NOMTREE="^[QUI]"_%GLO D COPY
FIN K %GLO,%GL,%K1,%UU,%VV Q
COPY S %TAD="TRAIT^TOCOPYUS" D ^%QCAGTW Q
TRAIT S %RS=@%T,T="^[TO]"_$P(%T,"]",2,999),@T=%RS Q
ERR S %ERR=1
 I '(DTM),$ZE'["PROT" G END
 I DTM,$$^%SYSBUG($ZERR)'["PROT" G END
 D ^%VSQUEAK W !,$$^%QZCHW("Acces interdit [RETURN] ") R *RET G FIN
END W $$^%QZCHW("Erreur ! [RETURN] ") R *RET G FIN

