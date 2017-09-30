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

;%TXTUE^INT^1^59547,74033^0
%TXTUE ;
1 K ^[QUI]QUERY1("PATIENT")
 K ^[QUI]QUERY2("PATIENT")
 K ^[QUI]QUERY3("PATIENT")
 K ^[QUI]QUERY4("PATIENT")
 Q
2 K ^[QUI]QUERY1("RMGA")
 K ^[QUI]QUERY2("RMGA")
 K ^[QUI]QUERY3("RMGA")
 K ^[QUI]QUERY4("RMGA")
 Q
3 K ^[QUI]QUERY1("RMGC")
 K ^[QUI]QUERY2("RMGC")
 K ^[QUI]QUERY3("RMGC")
 K ^[QUI]QUERY4("RMGC")
 Q
4 K ^[QUI]QUERY1("RMGG")
 K ^[QUI]QUERY2("RMGG")
 K ^[QUI]QUERY3("RMGG")
 K ^[QUI]QUERY4("RMGG")
 Q
5 K ^[QUI]QUERY1("RMGO")
 K ^[QUI]QUERY2("RMGO")
 K ^[QUI]QUERY3("RMGO")
 K ^[QUI]QUERY4("RMGO")
 Q
TEST S NUM="" F I=1:1 S NUM=$O(^["BB"]REPRAG(NUM)) Q:NUM=""  D TRAIT
 Q
TRAIT S VAL=^["BB"]REPRAG(NUM)
 S VAL=$P($P(VAL,"(",2),")",1)
 S DOS=$P(VAL,",",4) I DOS["""" S DOS=$P(DOS,"""",2)
 W !,"           DOSSIER : ",DOS
 I (DOS=1873)!(DOS="265/AWA") W !,"Numero : ",NUM,"      Dossier : ",DOS
 Q

