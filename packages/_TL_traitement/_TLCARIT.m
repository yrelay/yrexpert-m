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

;%TLCARIT^INT^1^59547,74028^0
LOGARITM ;
 
 Q:'($D(%8VAL))  Q:%8VAL=""  S %PCH=%8VAL D ^%QZNBN1 Q:ISNUM=0
 I %8VAL'>0 S %8LN=-999999 Q
 D PREPA
 S %8PUI=%8VAL1-1,%8LN=%8PUI,%8SG=-1,%8OLO=%8LN
 F %8I=2:1 S %8PUI=%8PUI*(%8VAL1-1),%8INC=%8PUI/%8I,%8LN=%8LN+(%8INC*%8SG),%8SG=-(%8SG),%8DELT=%8LN-%8OLO S:%8DELT<0 %8DELT=-(%8DELT) Q:%8DELT<1E-5  S %8OLO=%8LN
FIN S:%8PREC=10 %8J=-(%8J) S %8LN=%8LN+(%8J*23025851E-7),%8LN=$J(%8LN,1,5)
 K %8VAL1,%8J,%8ECAR,%8PREC,%8DELT,%8OLO,%8PUI,%8I,%8SG,%8INC Q
TEST K  W !,"Log. neperien de :" R %8VAL Q:%8VAL=""  D LOGARITM
 W " ===> ",%8LN G TEST
PREPA S %8VAL1=%8VAL,%8ECAR=%8VAL-1 S:%8ECAR<0 %8ECAR=-(%8ECAR) S %8PREC=$S(%8VAL<1:10,1:1E-1)
 F %8J=0:1 Q:%8ECAR'>9E-1  D TRAIT
 Q
TRAIT S %8VAL1=%8VAL1*%8PREC,%8ECAR=%8VAL1-1 S:%8ECAR<0 %8ECAR=-(%8ECAR) Q

