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

;%TXP212R^INT^1^59547,74032^0
%TXP212R ;;06:39 AM  27 Jan 1993; ; 11 Jan 93 10:23 AM
 
 
 i VISU#2
 u printer w !,?3,"ETUDE : ",?12,ETUDE,?24,"Atelier : ",?33,ATELIER
 f t=1:1:PMAX i VISU#2 u printer w !,!,"****"," periode :",t,!,?3,"Capa Maxi",?13,"Reste",?23,"Article",?33,"demande",?43,"heures",?53,"prod",?63,"heures p" d residu,titre,article
 u printer w #
 
 u 0 q
titre 
 w !,?3,CPMX,?13,resid
 q
article 
 n %t
 s ARTICLE=""
 f %t=1:1 s ARTICLE=$o(@etuatag@(ARTICLE)) q:ARTICLE=""  d SIMP s qmh=@etuata@("Quantite moyenne horaire"),q=$s($d(@SOL@("Periode "_t)):@SOL@("Periode "_t),1:"*"),q2=$s($d(@SOL@("Periode "_t)):@SOL@("Periode "_t)/qmh,1:"*"),d=@dmd@("Periode "_t),D=@dmd@("Periode "_t)*qmh d ligne
 q
ligne 
 w !,?23,ARTICLE,?33,D,?43,d,?53,$j(q," ",2),?63,$j(q2," ",2)
 q
SIMP 
 q
 
residu 
 s %capa=$o(@etuatcg@("")),CPMX="",resid="" q:%capa=""
 s CPMX=@etuatcg@(%capa,"Periode "_t),ARTICLE="",resid=CPMX
 n %t f %t=1:1 s ARTICLE=$o(@etuatag@(ARTICLE)) q:ARTICLE=""  s qmh=@etuata@("Quantite moyenne horaire"),resid=resid-$s($d(@SOL@("Periode "_t)):(@SOL@("Periode "_t)/qmh)\1,1:0)
 q

