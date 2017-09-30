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

;%QSGE9^INT^1^59547,73881^0
%QSGE9 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
OVLIR(R,I,L,V,O) N OKK,R1,L1,T1,T,V1,O1,U,U1,O0
 
 S R1=$$REPD^%QSGEL2(R,L),T=$$TYPE^%QSGEST9(R,L),L1=$$LIENI^%QSGEL2(R,R1,L,T),T1=$$TYPE^%QSGEST9(R1,L1) Q:(((((R="")!(L=""))!(I=""))!(T=0))!(T1=0))!(V="") 0
 Q:(R1="")!(L1="") -3
 I (T1=3)&(T=3) Q $$RELAT
 I ((T=4)&(T1=5))!((T=5)&(T1=4)) Q:$$INV -3 Q $$RELAT
 I ((((T1=3)&(T'=3))!((T1'=3)&(T=3)))!((T1=2)&(T'=1)))!((T=2)&(T1'=1)) Q -1
 I ((T=4)&(T1'=5))!((T=5)&(T1'=4)) Q -1
 I T=2 Q $$PF
 I T1=2 Q $$FP
 Q -3
 
 
PF() S V1=$$NOMFILS^%QSGES10(R,I,R1,V)
 
 S U=$$OVAIR^%QSGE5(R,I,L,V,O)
 
 S U1=$$OVAIR^%QSGE5(R1,V1,L1,I,1)
 
 I ($$NXTRIAVO^%QSTRUC8(R1,V1,L1,I,1)'="")!($$PRVRIAVO^%QSTRUC8(R1,V1,L1,I,1)'="") Q -2
 Q:$$NXOR^%QSGEST9(U,U1) U
 
 Q -1
FP() N I0
 
 S I0=$$NOMEX^%QSGES10(R,I)
 
 S V1=$$NOMPERE^%QSGES10(R,I)
 
 S U=$$OVAIR^%QSGE5(R,I,L,V,O)
 
 S U1=$$VAIR^%QSGE5(R1,V1,L1,I0)
 
 I ($$NXTRIAVO^%QSTRUC8(R,I,L,V,1)'="")!($$PRVRIAVO^%QSTRUC8(R,I,L,V,1)'="") Q -2
 
 Q:$$NXOR^%QSGEST9(U,U1) U
 
 Q -1
RELAT() 
 
 D CAL1^%QSGEST3(R,I,L,R1,V,.O0,.O1,.OKK)
 
 Q:'(OKK) -3
 
 I ($$NXTRIAVO^%QSTRUC8(R,I,L,V,O0)'="")!($$PRVRIAVO^%QSTRUC8(R,I,L,V,O0)'="") Q -2
 
 I ($$NXTRIAVO^%QSTRUC8(R1,V,L1,I,O1)'="")!($$PRVRIAVO^%QSTRUC8(R1,V,L1,I,O1)'="") Q -2
 
 
 S U=$$OVAIR^%QSGE5(R,I,L,V,O)
 
 S U1=$$OVAIR^%QSGE5(R1,V,L1,I,O1)
 
 Q:$$NXOR^%QSGEST9(U,U1) U
 
 Q -1
 
INV() Q R'=R1
 
NOM(R,I) Q:R="" 0 Q:I="" 1 Q '($L(I,",")=$$^%QCAZG("^[QUI]RQSNCLES(R)"))
 
LIENT(REP,GLOBAL) N L,I,TYPE S L=$O(^[QUI]RQSLIEN(REP,""))
 F I=0:1 Q:L=""  S TYPE=$P(^[QUI]RQSLIEN(REP,L),"^",1),@GLOBAL@(TYPE,L)="",@GLOBAL@(TYPE)=$S(($D(@GLOBAL@(TYPE))#10)=1:@GLOBAL@(TYPE),1:0)+1,L=$O(^[QUI]RQSLIEN(REP,L))
 S @GLOBAL=I Q
 ;

