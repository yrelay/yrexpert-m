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

;TOWIMPR^INT^1^59547,74876^0
TOWIMPR ;
 
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR
 W #
 W !,?12,$$^%QZCHW("ALLIAGE : "),%ALL,?60,$$^%QZCHW("ETAT : "),%ETAT,!,?12,$$^%QZCHW("LARGEUR : "),%LARG
 W !,$$^%QZCHW("EP.VISEE"),?9,":",DP,?79,":"
 W !,?9,LIG2
 W !,?9,LIG3
 W !,?9,LIGNU
 W !,?9,":",?%LIMX+10,"^",?79,":"
 S DPCL=$S($E(DP,1)=".":"0",1:"")_DP W !,?9,":",?(%LIMX+10)-($L(DPCL)\2),DPCL,?79,":"
 W !,$$^%QZCHW("Schema"),?9,":",C,?79,":"
 F YY=9:1:21 D TRAIT
 W !,?9,LIG2
 W !,?12,$$^%QZCHW("Date : "),$S($D(^RESCRE($I,16)):^RESCRE($I,16),1:"")
FIN S DEV="IMPR" W !,!,!,!,?9,$$^%QZCHW("*** Interpretation automatique du schema de laminage ***"),!,! D ^TOWRESPI W # C IMPR Q
TRAIT I '($D(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YY))) W !,?9,LIG3 G END
 W !,?9,":" S XX=-1 F UU=0:0 S XX=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YY,XX)) Q:XX=-1  W ?XX,^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YY,XX)
 W ?79,":" G END
END Q

