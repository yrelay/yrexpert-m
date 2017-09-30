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

;%QULELAM^INT^1^59547,73885^0
%QULELAM ;;10:01 AM  6 Oct 1992; ; 09 Oct 92 10:31 AM
 
 
 
MAKEGRA 
 
 
 
 
 
 
 
 
 
 
 N FILE,MARQUE,REPLIEN,BASE,ADR,I,%I,IND,IFIL
 N ATT,TYPATT,REPDEST,VAL,ORD,NOMIND2,REMATT
 
 S FILE=$$TEMP^%SGUTIL
 S MARQUE=$$TEMP^%SGUTIL
 S REMATT=$$TEMP^%SGUTIL
 S REPLIEN=$$LIENI^%QSGEL3
 
 K @(TRANSL),@(GRAP),@(GRAC)
 
 
 
 S BASE=REP,@FILE=0
 S I="" F %I=0:0 S I=$O(@LISTE@(I)) Q:I=""  S IND=@LISTE@(I),@FILE=@FILE+1,@FILE@(@FILE,"BASE")=BASE,@FILE@(@FILE,"IND")=IND,@MARQUE@(BASE,IND)=@FILE,@TRANSL@(@FILE)=BASE_$C(0)_IND,@GRAC@(@FILE)=""
 
 S ATTNOK=$S(LISTEATT="*":"0",'($$EX^%QMLILA(LISTEATT)):"ATT'=LISTEATT",1:"'$$EXA^%QMLILA(LISTEATT,ATT)")
 
 
 
 
 S IFIL=0
NXOBJ S IFIL=$O(@FILE@(IFIL)) G:IFIL="" FIN
 
ARCHREP S BASE=@FILE@(IFIL,"BASE"),IND=@FILE@(IFIL,"IND")
 
 S ATT=""
NXATT S ATT=$$NXTRIA^%QSTRUC8(BASE,IND,ATT) G:ATT="" NXOBJ
 I $D(@REMATT@(BASE,ATT)) G:@REMATT@(BASE,ATT)="" NXATT S REPDEST=@REMATT@(BASE,ATT) G ATTOK
 I @(ATTNOK)  G ATTNOK
 
 S TYPATT=$$TYPE2^%QSGEST9(BASE,ATT) I (TYPATT<1)!(TYPATT>5) G ATTNOK
 
 
 S REPDEST=$$REPD^%QSGEL2(BASE,ATT) G:REPDEST=REPLIEN ATTNOK
 S @REMATT@(BASE,ATT)=REPDEST G ATTOK
ATTNOK S @REMATT@(BASE,ATT)="" G NXATT
ATTOK S ORD=""
NXORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,IND,ATT,ORD) G:ORD="" NXATT
 S VAL=$$VALEUR^%QSTRUC8(BASE,IND,ATT,ORD)
 
 S NOMIND2=$S(TYPATT=2:IND_","_VAL,1:VAL)
 
 I $D(@MARQUE@(REPDEST,NOMIND2)) S @GRAP@(IFIL,@MARQUE@(REPDEST,NOMIND2))=ATT G NXORD
 
 
 S @FILE=@FILE+1,@FILE@(@FILE,"BASE")=REPDEST,@FILE@(@FILE,"IND")=NOMIND2,@MARQUE@(REPDEST,NOMIND2)=@FILE,@TRANSL@(@FILE)=REPDEST_$C(0)_NOMIND2
 S @GRAP@(IFIL,@FILE)=ATT
 G NXORD
 
 
FIN K @(FILE),@(MARQUE),@(REMATT)
 Q
 
 
AJGRA(REP1,IND1,LIEN,REP2,IND2) 
 N IFIL,%I
 S GET1=0,GET2=0
 S IFIL="" F %I=0:0 S IFIL=$O(@TRANSL@(IFIL)) Q:IFIL=""  D GET Q:GET1&GET2
 I '(GET2) S GET2=$ZP(@TRANSL@(""))+1,@TRANSL@(GET2)=REP2_$C(0)_IND2
 S @GRAP@(GET1,GET2)=LIEN
 Q
GET I '(GET1),$P(@TRANSL@(IFIL),$C(0))=REP1,$P(@TRANSL@(IFIL),$C(0),2)=IND1 S GET1=IFIL
 I '(GET2),$P(@TRANSL@(IFIL),$C(0))=REP2,$P(@TRANSL@(IFIL),$C(0),2)=IND2 S GET2=IFIL
 Q

