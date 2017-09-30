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

;%UTSTCB^INT^1^59547,74033^0
%UTSTCB ;;12:13 PM  10 Nov 1993; ; 10 Nov 93  2:23 PM
 
 
 
NEW N R,%R,I,%I,A,%A,O,%O,V,%V
 K ^[QUI]QUERYV
 S R=""
NEW1 S R=$O(^[QUI]QUERY1(R)) Q:R=""  S I="",%I=0
NEW2 S I=$O(^[QUI]QUERY1(R,I)) I I="" K ^[QUI]QUERY1(R) S ^[QUI]QUERYV(R)=%I G NEW1
 S %I=%I+1,A=""
 F %A=0:0 S A=$O(^[QUI]QUERY1(R,I,A)) Q:A=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY1(R,I,A,V)) Q:V=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY1(R,I,A,V,O)) Q:O=""  S ^[QUI]QUERYV(R,I,A,O)=V
 G NEW2
 
 
DEUX N R,%R,I,%I,A,%A,O,%O,V,%V
 D CLEPAG^%VVIDEO
 S R=""
DEUX1 S R=$O(^[QUI]QUERY2(R)) Q:R=""  S DX=1,DY=5 X XY W $J("",75) X XY W "repertoire "_R
 S A="",^[QUI]QUERYV(R)=0
DEUX2 S A=$O(^[QUI]QUERY2(R,A)) G:A="" DEUX1
 S DX=1,DY=7 X XY W $J("",78) X XY W " attribut "_A
 S V=""
 F %V=0:0 S V=$O(^[QUI]QUERY2(R,A,V)) Q:V=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY2(R,A,V,O)) Q:O=""  S I="" F %I=0:0 S I=$O(^[QUI]QUERY2(R,A,V,O,I)) Q:I=""  S:'($D(^[QUI]QUERYV(R,I))) ^[QUI]QUERYV(R)=^[QUI]QUERYV(R)+1 S ^[QUI]QUERYV(R,I,A,O)=V
 G DEUX2
 ;

