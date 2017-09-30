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

;%QMKARRO^INT^1^59547,73878^0
ARRONDI ;
 
 Q:('($D(%9VAR)))!('($D(%9NDEC)))
 Q:%9NDEC<0  S:'($D(%9BAS)) %9BAS=1 S:%9BAS["." %9BAS=%9BAS\1 S:%9BAS="" %9BAS=1 S:%9NDEC="" %9NDEC=1
 S %PCH=%9VAR D ^%QZNBN1 Q:ISNUM=0  S %PCH=%9NDEC D ^%QZNBN1 Q:ISNUM=0  S %PCH=%9BAS D ^%QZNBN1 Q:ISNUM=0
 S %9NDEC=%9NDEC\1 S:%9NDEC>10 %9NDEC=10
 S %9VAR=$J(%9VAR,1,%9NDEC)
 S %9INTER=%9VAR\1 F %9JJ=1:1 Q:(%9INTER#%9BAS)=0  S %9INTER=%9INTER-1
 I (%9VAR\1)'>(%9INTER+(%9BAS/2)) S %9VAR=%9INTER+(%9VAR-(%9VAR\1))
 I (%9VAR\1)>(%9INTER+(%9BAS/2)) S %9VAR=((%9INTER+%9BAS)+%9VAR)-(%9VAR\1)
FIN K %9JJ,%9INTER Q
TEST W !,!,"NOMBRE A ARRONDIR :" R %9VAR Q:%9VAR=""  W !,"NOMBRE DE DECIMAL :" R %9NDEC Q:%9NDEC=""  W !,"BASE :" R %9BAS K:%9BAS="" %9BAS D ARRONDI W !,"RESULTAT :",%9VAR G TEST

