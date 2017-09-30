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

;%QSGES22^INT^1^59547,73881^0
%QSGES22 ;
 
 
 
 
 
 N NL,ORD1,OB1,OB2,L,%I,R,TABCPT,TLIEN,RS,RD,RSI,RDI
 S TLIEN=$$TLIEN^%QSGES21,R=$$LIENI^%QSGEL3
 
 S NL=""
 F %I=0:0 S NL=$O(^[QUI]QUERYV(R,NL)) Q:NL=""  D MAJ
 S L=""
 F %I=0:0 S L=$O(TABCPT(L)) Q:L=""  S @TLIEN@(L)=TABCPT(L)
 Q
MAJ 
 S L=$$^%QSCALVA(R,NL,"NOM.LIEN")
 S OB1=$$^%QSCALVA(R,NL,"SOURCE."_L)
 S OB2=$$^%QSCALVA(R,NL,"DESTINATION."_L)
 S ORD1=$$^%QSCALVA(R,NL,"NUMERO.ORDRE")
 S RS=$$^%QSCALVA(R,NL,"REP.SOURCE"),RSI=$$NOMINT^%QSF(RS)
 S RD=$$^%QSCALVA(R,NL,"REP.DESTINATION"),RDI=$$NOMINT^%QSF(RD)
 I '($$IR^%QSGE5(RSI,OB1)) Q
 I '($$IR^%QSGE5(RDI,OB2)) Q
 I '($$EXLIEN^%QSGEL2(RSI,RDI,L)) Q
 I ((((L="")!(OB1=""))!(OB2=""))!(ORD1=""))!(NL="") W !,"!!! ERREUR SUR : ",NL Q
 W !,L," * ",OB1," * ",OB2," * ",ORD1," ==>  ",NL
 S @TLIEN@(L,OB1,OB2,ORD1)=NL
 S CPT=$P(NL,"\",2)
 S:'($D(TABCPT(L))) TABCPT(L)=CPT
 I TABCPT(L)<CPT S TABCPT(L)=CPT
 Q

