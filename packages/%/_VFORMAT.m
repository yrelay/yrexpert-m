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

;%VFORMAT^INT^1^59547,74034^0
VVFORMAT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
NBCOMPT(VAL,LPDECI) 
 N POS,PPOS,RES,%F,LPENT
 S LPENT=$L($P(VAL,"."))
 S:LPDECI="" LPDECI=$L($P(VAL,".",2))
 S VAL=$J(VAL,(LPENT+LPDECI)+1,LPDECI)
 S RES=",",PPOS=1
 S POS=$F(VAL,".")
 S POS=$S(POS=0:$L(VAL),1:POS-2)
 F %F=0:0 S CAR=$E(VAL,POS) Q:(CAR="")!(CAR=" ")  S RES=$S((PPOS#3)=0:"."_CAR_RES,1:CAR_RES),POS=POS-1,PPOS=PPOS+1
 S:$E(RES)="." RES=$E(RES,2,$L(RES))
 S POS=$F(VAL,".")
 S POS=$S(POS=0:POS,1:POS)
 S PPOS=1
 F %F=0:0 S CAR=$E(VAL,POS) Q:(CAR="")!(CAR=" ")  S RES=$S((PPOS#3)=0:RES_CAR_".",1:RES_CAR),POS=POS+1,PPOS=PPOS+1
 S:$E(RES,$L(RES))="." RES=$E(RES,1,$L(RES)-1)
 S:$E(RES,$L(RES))="," RES=$E(RES,1,$L(RES)-1)
 Q RES

