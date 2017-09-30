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

;%TLKEAN2^INT^1^59547,74029^0
TLKEAN2 ;
 
 
 
 
FON K @(TEMPO) S @TEMPO@(1)="SA",@TEMPO@(2)="I" D EMPV^%ANGEPIL(TEMPO)
 S I=0,SA=A
BFON S I=I+1
 S A=$$RED^%ANA(SA,I) I (A=0)!(A="") G FFON
 D EMPIL^%ANGEPIL("FON1^%TLKEAN2") G INT^%TLKEAN1
FON1 I '(POS) G FFON
 G BFON
FFON G DEPIL^%ANGEPIL
 
 
ABAQ K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,I=0
BABAQ S I=I+1 I I=5 G ABAQ2
 S A=$$RED^%ANA(SA,I)
 D EMPIL^%ANGEPIL("ABAQ1^%TLKEAN2") G INT^%TLKEAN1
ABAQ1 I '(POS) G FABAQ
 G BABAQ
ABAQ2 S A=$$RED^%ANA(SA,I)
 D EMPIL^%ANGEPIL("FABAQ^%TLKEAN2") S MODE="affectation" G INT^%TLKEAN1
FABAQ G DEPIL^%ANGEPIL
 
 
ACTION K @(TEMPO) S @TEMPO@(1)="NOM" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("ACTIONF^%TLKEAN2")
 S NOM=$$RED^%ANA(A,"TEXTE")
 G:NOM="$FIN" RET^%ANGEPIL
 G:NOM="$ETIQUETTE" RET^%ANGEPIL
 G:NOM="$ARRET" RET^%ANGEPIL
 G:NOM="$ABANDON" RET^%ANGEPIL
 G:NOM="$DMD" DMD
 G:NOM="AFFECTATION" AFF^%TLKEAN1
 G:NOM="$REAFFICHER" RET^%ANGEPIL
 G FON
ACTIONF G DEPIL^%ANGEPIL
 
 
DMD K @(TEMPO) S @TEMPO@(1)="SA",@TEMPO@(2)="I" D EMPV^%ANGEPIL(TEMPO)
 S I=0,SA=A
BDMD S I=I+1
 S A=$$RED^%ANA(SA,I) I (SA=0)!(SA="") G FDMD
 D EMPIL^%ANGEPIL("DMD1^%TLKEAN2") S MODE="affectation" G INT^%TLKEAN1
DMD1 I '(POS) G FDMD
 G BDMD
FDMD G DEPIL^%ANGEPIL
 
 
FLOG K @(TEMPO) S @TEMPO@(1)="VAL" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("FLOG1^%TLKEAN2")
 S VAL=$$RED^%ANA(A,"TEXTE")
 G:VAL="$EXISTE" FON
 G:VAL="$APPARTIENT" FON
 D ^%VZEAVT($$^%QZCHW("TLKEAN2 : fonction logique inconnue = ")_VAL) S POS=0
 G RET^%ANGEPIL
FLOG1 G DEPIL^%ANGEPIL
 
 
FSPE K @(TEMPO) S @TEMPO@(1)="NF" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("FSPE1^%TLKEAN2")
 S NF=$$RED^%ANA(A,"TEXTE")
 G:NF="$ENUM" FON
 D ^%VZEAVT($$^%QZCHW("TLKEAN2 : fonction speciale inconnue = ")_NF) S POS=0
 G RET^%ANGEPIL
FSPE1 G DEPIL^%ANGEPIL

