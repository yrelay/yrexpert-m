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

;TOMACHAD^INT^1^59547,74873^0
TOMACHAD ;
 
 S PL=-1,CONTAB=$E(%NOM,1,$L(%NOM)-1) F UU=1:1 S PL=$N(@%NOM@(PL)) Q:PL=-1  S M1=@%NOM@(PL) I M1'="" D RETERR
FIN K PL,CONTAB,UU,M1,AFFECT,S1,TH,VU,MI,%U Q
RETERR Q:%ABEND=1  S AFFECT=CONTAB_","_PL_")",@("M1="_@AFFECT)
M1 I $D(^[QUI]DESMACH(M1)) S S1=$N(^[QUI]DESMACH(M1,-1)) G:S1=-1 FM1 S TH=$P(^[QUI]DESMACH(M1,S1),"^",2),@TB0@(M1)=S1_"|"_TH_"|M",@TBT@(M1,OP,PH)=S1,@TBPH@(PH,OP,M1)=S1 G FM1
 S VU=0,MI=M1,M1=$E(M1,1,$L(M1)-1)_$C($A($E(M1,$L(M1)))-1)_"z"
 F %U=1:1 S M1=$N(^[QUI]DESMACH(M1)) Q:M1=-1  Q:$E(M1,1,$L(MI))'=MI  S S1=$N(^[QUI]DESMACH(M1,-1)) I S1'=-1 S TH=$P(^[QUI]DESMACH(M1,S1),"^",2),@TB0@(M1)=S1_"|"_TH_"|M",VU=1,@TBT@(M1,OP,PH)=S1,@TBPH@(PH,OP,M1)=S1
 G:VU=1 FM1 I $D(^[QUI]SECTION(MI)) S S1=$N(^[QUI]SECTION(M1,-1)) I S1'=-1 S TH=$P(^[QUI]SECTION(MI,S1),"^",5),@TB0@(MI)=MI_"|"_TH_"|S",@TBT@(MI,OP,PH)=MI,@TBPH@(PH,OP,MI)=MI G FM1
 S @TB0@(MI)=MI_"|???|???",@TBT@(MI,OP,PH)=MI,@TBPH@(PH,OP,MI)=MI
FM1 Q

