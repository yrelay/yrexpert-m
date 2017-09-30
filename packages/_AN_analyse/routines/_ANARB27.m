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

;%ANARB27^INT^1^59547,73866^0
%ANARB27 ;;03:17 PM  24 Sep 1991;
 
 
 
 
 
MENT K @(TEMPO) S @TEMPO@(1)="ETUD",@TEMPO@(2)="SA",@TEMPO@(3)="A",@TEMPO@(4)="KEYC",@TEMPO@(5)="KEYB",@TEMPO@(6)="NOMLIS"
 
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(SA,1) D EMPIL^%ANGEPIL("MENT1^%ANARB27") G INT^%ANARBR2
MENT1 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le nom de l'etude")) S VAL="",POS=0 G ERR
 S ETUD=VAL
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("MENT2^%ANARB27") G INT^%ANARBR2
MENT2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le nom de la liste")) S VAL="",POS=0 G ERR
 S NOMLIS=VAL
 S A=$$RED(SA,3) D EMPIL^%ANGEPIL("MENT3^%ANARB27") G INT^%ANARBR2
MENT3 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier les buts")) S VAL="",POS=0 G ERR
 S KEYB=$S('($D(^[QUI]RQSDON("QW","BUT",ETUD))):1,1:$ZP(^[QUI]RQSDON("QW","BUT",ETUD,""))+1)
 F IPAR=1:1 S ATTB=$P(VAL,"/",IPAR) Q:ATTB=""  S ^[QUI]RQSDON("QW","BUT",ETUD,KEYB,IPAR,"E")="$$EXIRIA^%QWSTOL(REP,IND,"""_ATTB_""")"
 S A=$$RED(SA,4) D EMPIL^%ANGEPIL("MENT4^%ANARB27") G INT^%ANARBR2
MENT4 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier les buts")) S VAL="",POS=0 G ERR
 S KEYC=$S('($D(^[QUI]RQSDON("QW","CONTR",ETUD))):1,1:$ZP(^[QUI]RQSDON("QW","CONTR",ETUD,""))+1)
 F IPAR=1:1 S ATTB=$P(VAL,"/",IPAR) Q:ATTB=""  S ^[QUI]RQSDON("QW","CONTR",ETUD,KEYC,IPAR,"E")=$$CMPCONT(ATTB)
 D SAUVECR^%TLUTIL
 S VAL=$$AUTO^%QWACTI(ETUD,NOMLIS)
 K ^[QUI]RQSDON("QW","BUT",ETUD,KEYB)
 K ^[QUI]RQSDON("QW","CONTR",ETUD,KEYC)
 
FIN D CLEPAG^%VVIDEO,RESTECR^%TLUTIL
 D DEPV^%ANGEPIL
 G DEPIL^%ANGEPIL
 
ERR S VAL="",POS=0 D DEPV^%ANGEPIL G DEPIL^%ANGEPIL
 
 
 
CMPCONT(CH) N COMPA,RES
 S RES=""
 F COMPA="'>","'<","'=","<",">","=" I $F(CH,COMPA) S RES="$$A1B^%QWSTOL(REP,IND,"""_$P(CH,COMPA)_""")"_COMPA_$P(CH,COMPA,2,999) Q
 Q RES
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

