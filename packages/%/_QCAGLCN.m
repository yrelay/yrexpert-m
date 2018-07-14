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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QCAGLCN^INT^1^59547,73875^0
ZGETKEY(%N,%TB) 
 
 
 
 
 
 
 
 
 
 Q:%N'["("
 N %G,%T,%KC,%U
 S $ZT="G ERR" K @(%TB)
 S %G=$P(%N,"(",2,999),%G="%G("_%G,@%G="",%T="%G",%K=0
LP S %KC=$O(@%T@("")) G:%KC="" FIN
 S %K=%K+1,@%TB@(%K)=%KC,%T="%G("
 S %KC=""
 F %U=1:1 S %KC=$O(@%TB@(%KC)) Q:%KC=""  S %T=%T_""""_$$ZSUBST^%QZCHSUB(@%TB@(%KC),"""","""""")_""","
 S %T=$E(%T,1,$L(%T)-1)_")"
 G LP
 
FIN S @%TB=$ZP(@%TB@(""))+0 Q
 
ERR K @(%TB) S @%TB=0 Q
 
NOEUD(N) 
 N NOEUD,N,%U
 D ZGETKEY(N,"NOEUD")
 S N=""
 F %U=1:1:NOEUD S N=N_$S(N="":"",1:",")_""""_NOEUD(%U)_""""
 Q N
 
TEST K TB W !,"A tester : " R REF Q:$A(REF)<32
 D ZGETKEY(REF,"TB"),ECR
 G TEST
ECR W !,!,@(TB)," cles de vues",!,! S %KC="" F %U=1:1 S %KC=$O(TB(%KC)) Q:%KC=""  W ?((%U-1)#8)*10,TB(%KC) W:(%U#8)=0 !
 Q

