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

;%QSNHIS1^INT^1^59547,73882^0
QSNHIS1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COPY(QUI1,BASE1,IND1,ATT1,VAL1,OR1,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE) 
 I MODE'=3 D DUPL(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2) Q
 N A,N,O,TAB
 S TAB=$C(9)
 D STOLK^%QMCPOZ(QUI,"HISTO"_TAB_BASE2_TAB_IND2_TAB_ATT2_TAB_VAL2_TAB_OR2)
 S N=""
COP2 
 S N=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N)) I N="" G FCOP
 S A=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N,""))
 I A="" G COP2
 S O=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N,A,""))
 I O="" G COP2
 D STOLK^%QMCPOZ(QUI,"HISTOL"_TAB_N_TAB_A_TAB_O_TAB_^[QUI1]QUERYH(BASE1,IND1,OR1,N,A,O))
 G COP2
FCOP 
 D STOLK^%QMCPOZ(QUI,"HISTOF"_TAB_BASE2_TAB_IND2_TAB_ATT2_TAB_VAL2_TAB_OR2)
 Q
 
 
 
 
DUPL(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2) 
 N A,N,O
 S N=""
DU2 S N=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N)) Q:N=""
 S A=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N,""))
 I A'="" S O=$O(^[QUI1]QUERYH(BASE1,IND1,OR1,N,A,"")) I O'="" S ^[QUI2]QUERYH(BASE2,IND2,OR2,N,A,O)=^[QUI1]QUERYH(BASE1,IND1,OR1,N,A,O)
 G DU2
 
 
 
 
 
 
 
 
CREH(BASE,IND,ATR,VAL,DONN) 
 N OR
 S OR=$$ORDRE^%QSNHIST(WHOIS,BASE,IND)
 
 I '($$IR^%QSGEST5(BASE,IND)) D PA^%QSGESTI(BASE,IND,"NOM",$$NOMEX^%QSGES10(BASE,IND),1)
 
 D PA^%QSGESTI(BASE,IND,ATR,VAL,OR)
 
 D INSER(BASE,IND,OR,DONN)
 Q
 
INSER(BASE,IND,OR,DONN) 
 N A,N,O
 K ^[QUI]QUERYH(BASE,IND,OR)
 S N=""
INS S N=$O(@DONN@(N)) Q:N=""
 S A=$O(@DONN@(N,""))
 S O=$O(@DONN@(N,A,""))
 S ^[QUI]QUERYH(BASE,IND,OR,N,A,O)=@DONN@(N,A,O)
 G INS
 
 
 
 
 
SUPP(BASE,IND,ORD) 
 Q:((BASE="")!(IND=""))!(ORD="")
 K ^[QUI]QUERYH(BASE,IND,ORD)
 Q

