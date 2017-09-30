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
;! Nomprog     : %QZCHAD                                                      !
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

%QZCHAD ;
ZAD ;
 
EX(C) Q $E(C,1,$L(C)-1)
 
NB(A) Q $$^%QCAZG(A)+0
 
CONCAS(ROOT,CLE) S CLE=""""_$$ZSUBST^%QZCHSUB(CLE,",",""",""")_"""" G CONCAT1
 
CONCAT(ROOT,CLE) 
CONCAT1 
 I CLE="" Q ROOT
 I ROOT["(" S ROOT=$E(ROOT,1,$L(ROOT)-1)_","_CLE_")" Q ROOT
 Q ROOT_"("_CLE_")"
 
S(S) Q """"_$$ZSUBST^%QZCHSUB(S,",",""",""")_""""
S1(S) Q """"_$$ZSUBST^%QZCHSUB(S,"""","""""")_""""
S2(S) Q $S($$ADR^%QZNBN1(S):S,1:""""_$$ZSUBST^%QZCHSUB(S,"""","""""")_"""")
 
TEMP(ZN,LABEL) 
 I LABEL="" Q "^TEMPORAI("_$J_","""_ZN_""")"
 I (LABEL+0)=LABEL Q "^TEMPORAI("_$J_","""_ZN_""","_LABEL_")"
 Q "^TEMPORAI("_$J_","""_ZN_""","""_LABEL_""")"
 
TEMPS(TYPE,P1,P2) 
 
 I TYPE="A" Q "^TEMPORAY(""A"","""_P1_""")"
 
 I TYPE="B" Q "^TEMPORAY(""B"","_$$S2($I)_","""_P1_""")"
 
 I TYPE="C" Q "^TEMPORAY(""C"","_$$S2(WHOIS)_","""_P1_""")"
 
 I TYPE="D" Q "^TEMPORAY(""D"","_$$S2(WHOIS)_","_$$S2($I)_","""_P2_""")"
 
 I TYPE="E" Q "^TEMPORAY(""E"","""_QUI_""","""_P1_""")"
 
 I TYPE="F" Q "^TEMPORAY(""F"","""_QUI_""","_$$S2($I)_","""_P1_""")"
 
 
 I TYPE="G" Q "^TEMPORAY(""G"","_$$S2($J)_","""_P1_""","_$S(P2="":")",(P2+0)=P2:","_P2_")",1:","""_P2_""")")
 
 Q ""


TEST F I=$A("A"):1:$A("G") S J=$C(I) W !,$$TEMPS(J,"P1","P2")
 Q

