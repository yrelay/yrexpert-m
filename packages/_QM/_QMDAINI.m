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
;! HL002 ! HL     ! 01/02/07 ! Q:A="" -> Q:A=" "                              !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QMDAINI^INT^1^59547,73877^0
QMDAINI ;
 
 
 
 
 
 N A,CONT,F,I,LIB
 K ^RQSGLU("QMDA")
 ;HL002 F I=0:1 S A=$T(FUN+I) Q:A=""  D INSER
 F I=0:1 S A=$T(FUN+I) Q:A=" "  D INSER
 Q
INSER
 S CONT=$P(A,";;",2),F=$P(CONT,";",1),LIB=$P(CONT,";",2)
 S ^RQSGLU("QMDA","FORM",F)=LIB
 S ^RQSGLU("QMDA","LIB",LIB)=F
 Q
FUN ;;0;interne
 ;;1;aa/mm/jj
 ;;2;jj/mm/aa
 ;;3;aammjj
 ;;4;jjmmaa
 ;;5;jj mois aa
 ;;6;Sss/aa
 ;;61;aass
 ;;7;Dss/mm/aa
 ;;8;Mmm/aa
 ;;9;Tt/aa
 ;;10;Jjj/mm/aa
 ;;101;jour aa/mm/jj
 ;;102;jour jj/mm/aa
 ;;103;jour aammjj
 ;;104;jour jjmmaa
 ;;105;jour jj mois aa
 ;;1001;aaaa/mm/jj
 ;;1002;jj/mm/aaaa
 ;;1005;jj mois aaaa
 ;;1006;Sss/aaaa
 ;;1007;Dss/mm/aaaa
 ;;1008;Mmm/aaaa
 ;;1009;Tt/aaaa
 ;;1101;jour aaaa/mm/jj
 ;;1102;jour jj/mm/aaaa
 ;;1104;jour jjmmaaaa
 ;;1105;jour jj mois aaaa
 ;;10001;aa/mm/jj hhHmm
 ;;10002;jj/mm/aa hhHmm
 ;;10003;aammjj hhHmm
 ;;10004;jjmmaa hhHmm
 ;;10005;jj mois aa hhHmm
 ;;10101;jour aa/mm/jj hhHmm
 ;;10102;jour jj/mm/aa hhHmm
 ;;10103;jour aammjj hhHmm
 ;;10104;jour jjmmaa hhHmm
 ;;10105;jour jj mois aa hhHmm
 ;;11001;aaaa/mm/jj hhHmm
 ;;11002;jj/mm/aaaa hhHmm
 ;;11005;jj mois aaaa hhHmm
 ;;11101;jour aaaa/mm/jj hhHmm
 ;;11102;jour jj/mm/aaaa hhHmm
 ;;11104;jour jjmmaaaa hhHmm
 ;;11105;jour jj mois aaaa hhHmm
 ;;20001;aa/mm/jj hhHmm'ss
 ;;20002;jj/mm/aa hhHmm'ss
 ;;20003;aammjj hhHmm'ss
 ;;20004;jjmmaa hhHmm'ss
 ;;20005;jj mois aa hhHmm'ss
 ;;20101;jour aa/mm/jj hhHmm'ss
 ;;20102;jour jj/mm/aa hhHmm'ss
 ;;20103;jour aammjj hhHmm'ss
 ;;20104;jour jjmmaa hhHmm'ss
 ;;20105;jour jj mois aa hhHmm'ss
 ;;21001;aaaa/mm/jj hhHmm'ss
 ;;21002;jj/mm/aaaa hhHmm'ss
 ;;21005;jj mois aaaa hhHmm'ss
 ;;21101;jour aaaa/mm/jj hhHmm'ss
 ;;21102;jour jj/mm/aaaa hhHmm'ss
 ;;21104;jour jjmmaaaa hhHmm'ss
 ;;21105;jour jj mois aaaa hhHmm'ss
 ;;21106;aammjjhhmmss


