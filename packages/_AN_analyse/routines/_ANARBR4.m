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

;%ANARBR4^INT^1^59547,73866^0
%ANARBR4 ;
 
 
 
 
 
 
FON S TYP=$$RED(A,"TEXTE")
 G:TYP]"$LONGUEUR" MOITIE
 G:TYP="$ABAQUE" ABAQUE^%ANARBR7
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 G:TYP="$DERNIER.INDICE" DERNI^%ANARB17
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",TYP)) G FONCT^%TLBAVEF
 G ERR
MOITIE 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",TYP)) G FONCT^%TLBAVEF
ERR D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Fonction inconnue = ")_TYP)
 S POS=0,VAL="" G RET^%ANGEPIL
 
SOUTER 
 S POS=0,VAL="" G RET^%ANGEPIL
FOEQU 
 S VAL=$$^%ANEQUIV(A,.CARBR1,AFF,.POS) G RET^%ANGEPIL
 
FOHEU 
 S VAL=$$^%ANHEURE G RET^%ANGEPIL
 
FOPARAM 
 K @(TEMPO) S @TEMPO@(1)="PAR"
 S PAR=$$RED($$RED(A,1),"TEXTE")
 S VAR=$$S(@TEMPOPAR@(PAR)) G DEPIL^%ANGEPIL
 
 
S(E) Q:E="" """"""
 Q:$$PARA^%QZNBN1(E) E
 Q """"_$$ZSUBST^%QZCHSUB(E,"""","""""")_""""
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

