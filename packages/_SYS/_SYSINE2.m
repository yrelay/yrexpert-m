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

;%SYSINE2^INT^1^59547,73892^0
%ZNETROU ;
 
 G ALL
INIT K %NET,%R D ^%RSET Q:%R=0
BEG W !,%R," routines a nettoyer " S %ROUT=0
 S %NET(0)="F %WW=0:0 S %ROUT=$O(^UTILITY(%JO,%ROUT)) Q:%ROUT=""""  W !,%ROUT S ^NOMROU=%ROUT D ^%SYSINE1 X %NET(2) W "" Nettoyee "" S $ZT=""ERR1"" X X1 W "" Compilee. """
 S %NET(1)="R !,""Quelle routine ? "",%ROUT Q:%ROUT=""""  X %NET(2)"
 S %NET(2)="ZR  S %NU=0 F %UU=0:0 S %NU=$N(^ROUTINE(%ROUT,0,%NU)) X:%NU=-1 %NET(5) Q:%NU=-1  X %NET(3) S ^ROUTINE(%ROUT,0,%NU)=%EXP"
 S %NET(3)="S %EXP=^ROUTINE(%ROUT,0,%NU),%LEXP=$L(%EXP) S %DER=%LEXP F %VV=1:1:%LEXP S %DCAR=$E(%EXP,%DER),%AS=$A(%DCAR) Q:%AS>32  S %EXP=$E(%EXP,1,%DER-1),%DER=%DER-1"
 S %NET(4)="Q  ;ZI %EXP",%NET(5)="Q  ;ZS @%ROUT" Q
SELEC K %NET D BEG,ZCMPL X %NET(0) Q
ONE 
ALL K %ROUT D INIT,ZCMPL X %NET(0) Q
ZCMPL 
 S X1="W ?$X+9\10*10,%ROUT W:$X>70 ! S NL=^ROUTINE(%ROUT,0,0) ZR  X Y1 ZS @%ROUT"
 S Y1="F L=1:1:NL ZI ^(L)"
 
2 S Y2="ZR  S L=0 F Z=0:0 X Z2 ZS @%ROUT Q:L>NL"
 S Z2="F L=L+1:1:L+20 Q:L>NL  ZI ^UTILITY(%JO,%ROUT,L)"
 
NEXT Q
 
ERR1 S $ZT="ERR3" G:$ZE'?1"<STORE>".E ERR3
 W "!" F L=1:1:NL S ^UTILITY(%JO,%ROUT,L)=^ROUTINE(%ROUT,0,L)
 X Y2 G NEXT
ERR3 S $ZT="^%ET" W !,$ZE," loading routine ",%ROUT,".",! Q:$ZE?1"<INT".E  G NEXT

