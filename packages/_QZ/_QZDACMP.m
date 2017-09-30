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

;%QZDACMP^INT^1^59547,73887^0
QZDACMP ;
 
 
 
 
 
 
 
 
 
 
 
INF(D1,D2) 
 N J1,J2,H1,H2,DJ,DH
 S J1=$P(D1,",",1),J2=$P(D2,",",1)
 S H1=$P(D1,",",2),H2=$P(D2,",",2)
 S DJ=J2-J1,DH=H2-H1
 Q:DJ>0 1
 Q:DJ<0 0
 Q:DH>0 1
 Q 0
 
SUP(D1,D2) 
 Q:D1=D2 0
 Q '($$INF(D1,D2))
 
INFEG(D1,D2) 
 Q '($$SUP(D1,D2))
 
SUPEG(D1,D2) 
 Q '($$INF(D1,D2))
 
TEST 
 N D1,D2,COMP
 W !,"DATE 1 = " R D1 Q:D1=""
 W !,"DATE 2 = " R D2
TEST2 W !,"COMPARATEUR : " R COMP I COMP="" G TEST
 I COMP="<" W !,"RESULTAT = ",$$INF(D1,D2)
 I COMP=">" W !,"RESULTAT = ",$$SUP(D1,D2)
 I COMP="<=" W !,"RESULTAT = ",$$INFEG(D1,D2)
 I COMP=">=" W !,"RESULTAT = ",$$SUPEG(D1,D2)
 G TEST2

