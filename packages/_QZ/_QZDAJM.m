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

;%QZDAJM^INT^1^59547,73887^0
QZDAJM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
JOUR(M,MC) 
 N %J,CONT,L,ST
 Q:M="" 0
 S L=$L(M),ST=0,CONT=$P($T(FUNJ),";;",2)
 F %J=1:1:7 S MC=$P(CONT,"/",%J) D TJ Q:(ST=1)!(ST=2)
 Q:ST=1 1 S MC="" Q 0
TJ 
 I M="M" S ST=2 Q
 I M=$E(MC,1,L) S ST=1
 Q
FUNJ ;;LUNDI/MARDI/MERCREDI/JEUDI/VENDREDI/SAMEDI/DIMANCHE
 
MOIS(M,MC) 
 N %J,CONTM,L,ST
 Q:M="" 0
 S L=$L(M),ST=0,CONTM=$P($T(FUNM),";;",2)
 F %J=1:1:12 S MC=$P(CONTM,"/",%J) D TM Q:(ST=1)!(ST=2)
 Q:ST=1 1 S MC="" Q 0
TM 
 I (((((M="J")!(M="M"))!(M="A"))!(M="JU"))!(M="MA"))!(M="JUI") S ST=2 Q
 I M=$E(MC,1,L) S ST=1
 Q
FUNM ;;JANVIER/FEVRIER/MARS/AVRIL/MAI/JUIN/JUILLET/AOUT/SEPTEMBRE/OCTOBRE/NOVEMBRE/DECEMBRE
 
LONGM(M) 
 S M=M*1 Q $S(M=1:31,M=2:28,M=3:31,M=4:30,M=5:31,M=6:30,M=7:31,M=8:31,M=9:30,M=10:31,M=11:30,1:31)
 
MOISDT(T) 
 S T=T*1 Q:T=1 "01"
 Q:T=2 "04" Q:T=3 "07" Q "10"
 
MOISFT(T) 
 S T=T*1 Q:T=1 "03"
 Q:T=2 "06" Q:T=3 "09" Q "12"
 
TRIM(M) 
 S M=M*1 Q:(M>0)&(M<4) "01"
 Q:(M>3)&(M<7) "02" Q:(M>6)&(M<10) "03" Q:(M>9)&(M<13) "04"
 Q ""
 
SEC(H) 
 N DP,DS,PP
 S PP=$P(H,"H",1),DP=$P(H,"H",2),DS=$P(DP,"'",2),DP=$P(DP,"'",1)
 Q ((PP*3600)+(DP*60))+DS

