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

;LKEXATT^INT^1^59547,74867^0
LKEXATT ;
 
 
 
 
 
 
 
 
ATT(MODE,X) 
 N R1,R2,I1,I2,OR,SIZE,V1,O1,A1
 S SIZE=40
 I MODE["LIEN" D STOLIEN
 I MODE["ATT" D STOATT
 Q 0
STOLIEN D EX5(SIZE,X,.R1,.I1,.R2,.I2,.OR)
 I OR="" D STOR Q
 D STOH
 Q
STOR I $$OVLIR^%QSGEST9(R1,I1,$$NOMLOG^%QSF(R2),I2,OR)=1 Q
 D ADDS^%QSGEST3(R1,I1,R2,I2)
 Q
STOH I $$OVLIR^%QSGEST9(R1,I1,$$NOMLOG^%QSF(R2),I2,OR)=1 Q
 D ADDO^%QSGEST3(R1,I1,R2,I2,OR)
 Q
STOATT D EX5(SIZE,X,.R1,.I1,.A1,.V1,.O1)
 I $$OVAIR^%QSGEST5(R1,I1,A1,V1,O1)=1 Q
 D PA^%QSGESTI(R1,I1,A1,V1,O1)
 Q
 
EX4(T,U,A,B,C,D) N I,J S A=$E(U,1,T),B=$E(U,T+1,2*T),C=$E(U,(2*T)+1,3*T),D=$E(U,(3*T)+1,4*T)
 F I="A","B","C","D" S J=$$ALPHA^LKEX(.@I)
 Q
EX5(T,U,A,B,C,D,E) N I,J S A=$E(U,1,T),B=$E(U,T+1,2*T),C=$E(U,(2*T)+1,3*T),D=$E(U,(3*T)+1,4*T),E=$E(U,(4*T)+1,5*T) F I="A","B","C","D","E" S J=$$ALPHA^LKEX(.@I)
 Q
 ;

