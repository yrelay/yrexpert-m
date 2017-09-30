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

;%ANARB17^INT^1^59547,73866^0
%ANARB17 ;
 
 
 
 
 
 
INDLIE 
 K @(TEMPO)
 S @TEMPO@(1)="SOURCE",@TEMPO@(2)="LIEN",@TEMPO@(3)="DESTIN"
 S @TEMPO@(4)="SA",@TEMPO@(5)="REPSOU",@TEMPO@(6)="REPDES"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A
 
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("INDLI1^%ANARB17") G INT^%ANARBR2
INDLI1 
 I (VAL="")!(POS=0) S POS=0 G DEPIL^%ANGEPIL
 S SOURCE=VAL
 
 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("INDLI2^%ANARB17") G INT^%ANARBR2
INDLI2 
 I (VAL="")!(POS=0) S POS=0 G DEPIL^%ANGEPIL
 S LIEN=VAL
 
 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("INDLI3^%ANARB17") G INT^%ANARBR2
INDLI3 
 I (VAL="")!(POS=0) S POS=0 G DEPIL^%ANGEPIL
 S DESTIN=VAL,VAL=""
 
 D LIENR^%QSGEL2(LIEN,.REPSOU,.REPDES)
 I (REPSOU="")!(REPDES="") S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien")_" "_LIEN_" "_$$^%QZCHW("inconnu")) G DEPIL^%ANGEPIL
 I '($$QUAL^%QSGEL2(REPSOU,LIEN)) S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien")_" "_LIEN_" "_$$^%QZCHW("non qualifie")) G DEPIL^%ANGEPIL
 I '($$IR^%QSGEST5(REPSOU,SOURCE)) S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu")_" "_SOURCE_" "_$$^%QZCHW("inconnu dans repertoire")_" "_$$NOMLOG^%QSF(REPSOU)) G DEPIL^%ANGEPIL
 I '($$IR^%QSGEST5(REPDES,DESTIN)) S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu")_" "_DESTIN_" "_$$^%QZCHW("inconnu dans repertoire")_" "_$$NOMLOG^%QSF(REPDES)) G DEPIL^%ANGEPIL
 I '($$EXILIEN^%QSGES21(SOURCE,LIEN,DESTIN)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien")_" "_LIEN_" "_$$^%QZCHW("n'existe pas entre")_" "_SOURCE_" "_$$^%QZCHW("et")_" "_DESTIN) S POS=0 G DEPIL^%ANGEPIL
 S VAL=$$REFLIEN^%QSGES21(SOURCE,LIEN,DESTIN)
 G DEPIL^%ANGEPIL
 
 
DERNI 
 K @(TEMPO)
 S @TEMPO@(1)="ORDA",@TEMPO@(2)="ATTA",@TEMPO@(3)="OBA"
 S @TEMPO@(4)="REPA",@TEMPO@(5)="LISTVAL",@TEMPO@(6)="TYP"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$ATTR^%TLIACT4($$RED(A,1),.ATTA,.ORDA,.OBA,.REPA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Attribut inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S LISTVAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DERN.IND")
 K @(LISTVAL)
 D MVG^%QSCALVA(REPA,OBA,ATTA,LISTVAL,.TYP)
 S VAL=$ZP(@LISTVAL@(""))
 K @(LISTVAL)
 G DEPIL^%ANGEPIL
 
 
SYNO 
 K @(TEMPO)
 S @TEMPO@(1)="OB",@TEMPO@(2)="SYNO",@TEMPO@(3)="CODSYN",@TEMPO@(4)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A
 
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("SYNO1^%ANARB17") G INT^%ANARBR2
SYNO1 
 G:POS=0 DEPIL^%ANGEPIL
 I VAL="" S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("individu")_" "_$$^%QZCHW("inconnu")) G DEPIL^%ANGEPIL
 S OB=VAL
 
 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("SYNO2^%ANARB17") G INT^%ANARBR2
SYNO2 
 G:POS=0 DEPIL^%ANGEPIL
 I VAL="" S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Synonyme propose")_" "_$$^%QZCHW("inconnu")) G DEPIL^%ANGEPIL
 S SYNO=VAL
 
 S A=$$RED(SA,3)
 I A=0 S CODSYN="" G SYNO4
 D EMPIL^%ANGEPIL("SYNO3^%ANARB17") G INT^%ANARBR2
SYNO3 
 G:POS=0 DEPIL^%ANGEPIL
 S CODSYN=VAL
 
SYNO4 S VAL=$$ADD^%QAXMOD(OB,SYNO,CODSYN)
 I VAL'="" D:MODAF ADD^%TLIFEN("LOG","  "_VAL) S VAL=0 G DEPIL^%ANGEPIL
 S VAL=1
 G DEPIL^%ANGEPIL
 
 
SYN 
 K @(TEMPO)
 S @TEMPO@(1)="OB",@TEMPO@(2)="CODSYN",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A
 
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("SYN1^%ANARB17") G INT^%ANARBR2
SYN1 
 G:POS=0 DEPIL^%ANGEPIL
 I VAL="" S POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("objet")_" "_$$^%QZCHW("inconnu")) G DEPIL^%ANGEPIL
 S OB=VAL
 
 S A=$$RED(SA,2)
 I A=0 S CODSYN="" G SYNF
 D EMPIL^%ANGEPIL("SYN2^%ANARB17") G INT^%ANARBR2
SYN2 
 G:POS=0 DEPIL^%ANGEPIL
 S CODSYN=VAL
 
SYNF I CODSYN="" S VAL=$$S^%QAX(OB)
 I CODSYN'="" S VAL=$$SC^%QAX(OB,CODSYN)
 D:MODAF ADD^%TLIFEN("LOG","  "_VAL) G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

