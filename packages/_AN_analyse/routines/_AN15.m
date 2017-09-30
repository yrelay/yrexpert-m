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

;%AN15^INT^1^59547,73865^0
AN15 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
LIGN(CH,P,A) N NSI,C,CD,L,N,NORES,RESULT,%COMPIL,TEMPO,NOCOMPIL,I
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 D INIT^%ANGEPIL S RESULT=1,NORES=0,%COMPIL="",NOCOMPIL=1
 K @(TEMPO) S @TEMPO@(1)="L",@TEMPO@(2)="N" D EMPV^%ANGEPIL(TEMPO)
 K ^DOC($J)
 I $E(CH,P,P)=" " D LEC
 S CD=0
 D CAR I C=":" D EMPIL^%ANGEPIL("FINCOM^%AN15") G COMMEN^%AN26
 S N=$$^%QZCHW("SI "),L=$L(N)
 I $E(CH,P,(P+L)-1)'=N G LIGN1
 D EMPIL^%ANGEPIL("LIGN0^%AN15") G CONDIT^%AN4
LIGN0 I RESULT=0 D EPIL^%ANGEPIL K @(TEMPO),^DOC($J) Q 0
 S %COMPIL=""
 S CD=NORES D CAR
LIGN1 D EMPIL^%ANGEPIL("LIGN2^%AN15") G ACT
LIGN2 I RESULT=0 D KILL^%ANA(CD),EPIL^%ANGEPIL K @(TEMPO),^DOC($J) Q 0
 D CAR G:C=":" LIGN3
 I C'="" D M("Caracteres en trop a la fin de la ligne ... "),KILL^%ANA(CD),KILL^%ANA(NORES),EPIL^%ANGEPIL K @(TEMPO),^DOC($J) Q 0
LIGN3 S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","INFERENCE"),SET^%ANA(A,1,CD)
 F C=1:1 S NSI=$$RED^%ANA(NORES,C) Q:NSI=0  D SET^%ANA(A,C+1,NSI)
 K ^[QUI]ANSA(NORES)
 D EPIL^%ANGEPIL K @(TEMPO),^DOC($J) Q 1
FINCOM S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","INFERENCE"),SET^%ANA(A,1,0),SET^%ANA(A,2,NORES)
 D EPIL^%ANGEPIL K @(TEMPO),^DOC($J) Q 1
 
ACT N NOF,NOACT,LIBET,LLIBET,II
 S NOF=0,LIBET=$$^%QZCHW("ET"),LLIBET=$L(LIBET)
 S NOACT=$$NEW^%ANA D SET^%ANA(NOACT,"TYPE","NOEUD.ACTIONS")
BOUCACT S NOF=NOF+1
 D EMPIL^%ANGEPIL("ACT2^%AN15")
 G:C'="$" AFF^%AN22
 G:$$^%QCAZG("^NAVARACT($J)")="" ACTION^%AN16
 
 G:'($$MOTRESERVE) ACTION^%AN16
 G AFF^%AN22
ACT2 S %COMPIL=""
 I RESULT=0 D KILL^%ANA(NOACT) G DEPIL^%ANGEPIL
 D SET^%ANA(NOACT,NOF,NORES),CAR
 G:$E(CH,P,(P+LLIBET)-1)'=LIBET ACTF
 F II=1:1:LLIBET D LEC
 G BOUCACT
ACTF S NORES=NOACT G DEPIL^%ANGEPIL
 
MOTRESERVE() 
 N N,L
 S N=$$^%QZCHW("$REPERTOIRE"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$INDIVIDU"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$ATTRIBUT"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$TYPE.MAJ"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$ANCIENNE.VALEUR"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$NOUVELLE.VALEUR"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$MAJ.BASE"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 S N=$$^%QZCHW("$UTILISATEUR"),L=$L(N) Q:$E(CH,P,(P+L)-1)=N 1
 Q 0
 
FONC G ACTION^%AN16
FEX G FEX^%AN28
BFEX G BFEX^%AN28
FFEX G FFEX^%AN28
EFEX G EFEX^%AN28
REA G REA^%AN28
DMD G DMD^%AN16
BDMD G BDMD^%AN16
FDMD G FDMD^%AN16
EDMD G EDMD^%AN16
SUPPR G SUPPR^%AN22
TOTAL G TOTAL^%AN16
MOYEN G MOYEN^%AN22
ELIM G ELIM^%AN22
SUBST G SUBST^%AN22
AFF G AFF^%AN22
LATT G LATT^%AN22
BLATT G BLATT^%AN22
FATT G FATT^%AN22
FTRT G TRAITER^%AN25
FMOD G MODELE^%AN25

