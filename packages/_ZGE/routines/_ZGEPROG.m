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

;%ZGEPROG^INT^1^59547,74037^0
%ZPROGMO ;
 
 N T1,T2 D ZD^%QMDATE4 S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),^PROGMOD(DAT,PGM)=$S($D(^PROGMOD(DAT,PGM)):^PROGMOD(DAT,PGM)+1,1:1)
 S T1=$P($H,",",2),T2=$S($D(^%(5E-1,$I)):$P(^%(5E-1,$I),",",2),1:T1)
 S ^PROGMOD(DAT,PGM,"TPS")=($S($D(^PROGMOD(DAT,PGM,"TPS")):^PROGMOD(DAT,PGM,"TPS")+1,1:0)+T1)-T2
FIN Q
NET W !,!,"Nettoyage du global ^PROGMOD jusqu'au : " R DAT G:$A(DAT)<32 FIN
 F U=1:1:3 S %PCH=$P(DAT,"/",U) G:%PCH="" NET D ^%YZISNUM G:'(ISNUM) NET G:$L(%PCH)>2 NET S:$L(%PCH)<2 %PCH="0"_%PCH S @$P("J,M,A",",",U)=%PCH
 G:(J>31)!(M>12) NET
 S MS=" "_$P("Janvier,Fevrier,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Decembre",",",M)_" " W !,?10,"OK pour suppression jusqu'au ",J,MS,"19",A," (O/N) ? " R *REP S REP=$C(REP) G:REP'="O" NET
 S LIM=A_M_J,V=-1 F UU=1:1 S V=$N(^PROGMOD(V)) Q:V=-1  Q:V>LIM  K ^PROGMOD(V)
 W !,!,"Suppression effectuee."
 K LIM,UU,DAT,%PCH,U,V,REP,A,M,J,MS Q

