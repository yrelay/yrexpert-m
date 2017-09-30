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

;%QNEQU10^INT^1^59547,73879^0
QNEQU10(INCOMPL,CYCLE,CATT,LFUS,FUS,UTIL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,L,OL,UINCOMP,J,CARD,ADRFUS
 S UINCOMP=$$CONCAS^%QZCHAD(INCOMPL,FUS)
 S J=0
 S ADRFUS=$$ADRLIS^%QSGEST7(FUS)
 
 S OL=$O(@LFUS@(""))
 F I=0:0 Q:OL=""  D TRT1 S OL=$O(@LFUS@(OL))
 
 
 I $$INTER0^%QNEQUI1(UINCOMP,ADRFUS) Q $$^%QZCHW("ces groupes sont incompatibles entre eux")
 
 S C=$$STEMPS^%QNEQUI6(FUS,CATT,.J)
 D PA^%QSGESTI("L0",FUS,CATT,C,1)
 I (UTIL="C")!(UTIL="S") Q ""
 I C>CYCLE Q $$^%QZCHW("le cycle atteint")_" "_C_" "_$$^%QZCHW("est superieur au cycle")_" "_CYCLE
 Q ""
TRT1 S L=OL
 D RECOP1^%QCALIST($$CONCAT^%QZCHAD(INCOMPL,$$S1^%QZCHAD(L)),UINCOMP,.J)
 D UNION^%QCALIST($$ADRLIS^%QSGEST7(OL),ADRFUS,ADRFUS,.CARD)
 Q
 
 
 
 
 
 
FUS(OK,LLISTEN,LFUS,FUS) 
 I OK=0 G NOFUS
 N OL,L,I
 D STOCK^%QSGES11(LLISTEN,FUS)
 S OL=$O(@LFUS@(""))
 F I=0:0 Q:OL=""  S L=OL D SUL(LLISTEN,L) S OL=$O(@LFUS@(OL))
 Q
NOFUS D SUL(LLISTEN,FUS)
 Q
 
TETE(LLISTEN,INCOMPL,CYCLE,CATT,BASE,NUFA,UC,LFUS,UTIL) 
 N MSG,OK,FUS
 S OK=1
 S FUS=$$POPL^%QNEQETU
 D AJL(LLISTEN,BASE,FUS)
 S MSG=$$^%QNEQU10(INCOMPL,CYCLE,CATT,LFUS,FUS,UTIL)
 I MSG'="" S OK=0 D ^%VZEAVT(MSG)
 D FUS(OK,LLISTEN,LFUS,FUS)
 Q:OK FUS
 Q ""
TETE1(LFUS,FUS) 
 Q $$^%QNEQU10(@VT@("INCOML"),@VT@("CYCLE"),@VT@("TEMPS"),LFUS,FUS)
TETE2(LFUS,FUS,UTIL) 
 Q $$^%QNEQU10(@VT@("INCOMPL"),@VT@("CYCLE"),@VT@("TEMPS"),LFUS,FUS,UTIL)
 
AJL(LLISTEN,BASEL,LMN) 
 
 
 
 
 
 D CREER^%QSGES11(BASEL,LMN,"EQL",0,"EQUILIBRAGE","","")
 D STOCK^%QSGES11(LLISTEN,LMN)
 
 D PA^%QSGESTI("L0",LMN,"CAPACITE.DE.LA.LISTE",0,1)
 D PA^%QSGESTI("L0",LMN,"CONCESSION.DE.LA.LISTE",0,1)
 Q
 
SUL(LLISTEN,LMN) 
 
 D ELIMI^%QSGES11(LLISTEN,LMN)
 D DEL^%QSGES11(LMN)
 Q

