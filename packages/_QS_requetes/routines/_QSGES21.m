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

;%QSGES21^INT^1^59547,73881^0
%QSGES21 ;
 
 
 
 
 
 
 
 
 
 
EXILIEN(O1,L,O2) 
 N R1,R2,NO1,NO2,L2,A,V1,V2
 Q:'($$REFINT(O1,L,O2,.L2,.R1,.R2,.V1,.V2,.NO1,.NO2)) 0
 
 
 
 S A=$$OVAIR^%QSGE5(R1,O1,L,V1,NO1)&$$OVAIR^%QSGE5(R2,O2,L2,V2,NO2)
 Q A
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REFINT(O1,L,O2,L2,R1,R2,V1,V2,NO1,NO2) 
 N T1,OK
 D LIENR^%QSGEL2(L,.R1,.R2) Q:(R1="")!(R2="") 0
 S T1=$$TYPE^%QSGEST9(R1,L) Q:T1=0 0
 D CAL2^%QSGEST3(R1,O1,L,R2,O2,.V1,.V2,.NO1,.NO2,.OK) Q:OK=0 0
 S L2=$$LIENI^%QSGEL2(R1,R2,L,T1) Q:L2="" 0
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REFLIEN(O1,L,O2) 
 N R1,R2,NO1,NO2,L2,A,V1,V2
 Q:'($$REFINT(O1,L,O2,.L2,.R1,.R2,.V1,.V2,.NO1,.NO2)) ""
 Q $$NOML1^%QSGES20(O1,NO1,L,O2)
 
 
 
TLIEN() 
 Q "^["""_QUI_"""]RQSGLO(""QSGES20"","""_$$LIENI^%QSGEL3_""")"
 
TCOP N TLIEN,OTLIEN
 S OTLIEN="^[QUI]RQSGLO(""NOMLIEN"""
 S TLIEN=$$TLIEN^%QSGES21
 S TLIEN=$E(TLIEN,1,$L(TLIEN)-1)
 D ADR^%QCAGLC(OTLIEN,TLIEN)
 Q
 
 
 
 
 
 
 
 
DERNL(REP,OB,L) N LI,MAX,I,%I,NB,O
 Q:((REP="")!(OB=""))!(L="") ""
 S LI="LIEN."_L
 Q:'($D(^[QUI]QUERYV(REP,OB,LI))) ""
 S O="",MAX=0
 F %I=0:0 S O=$O(^[QUI]QUERYV(REP,OB,LI,O)) Q:O=""  S I=^[QUI]QUERYV(REP,OB,LI,O),NB=$P(I,"\",2) S:NB>MAX MAX=NB
 Q L_"\"_MAX

