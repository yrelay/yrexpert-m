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

;%QSANAL2^INT^1^59547,73880^0
RQSANAL2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT S PC=0,OK=1,L=$L(T) D LEC Q
LEC S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 G:C=" " LEC Q
LECB S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 Q
FONC() N F,NEG S NEG=$$NEG Q:'(OK) 0
 I C'="$" D M("Toute fonction doit commencer par un ""$""") G KNEG
 I $E(T,PC,PC+6)="$EXISTE" S F=$$EXI G FSUIT
 I $E(T,PC,PC+3)'="$NOM" D M("Fonction inconnue ...") G KNEG
 I NEG'=0 D M("Negation interdite avec cette fonction ...") G KNEG
 Q $$EXS^%QSANALY
KNEG D KILL^%ANA(NEG) S OK=0 Q 0
FSUIT I NEG'=0 D SET^%ANA(NEG,1,F) Q NEG
 Q F
EXI() N A,I,N F I=1:1:7 D LEC
 I C'="(" D M("Syntaxe --> $EXISTE(attribut) ...") S OK=0 Q 0
 D LEC S A=$$ATTR^%TLANALX Q:'(OK) 0
 I C'=")" D M("Syntaxe --> $EXISTE(attribut) ...") S OK=0 D KILL^%ANA(A) Q 0
 D LEC S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","FONCTION"),SET^%ANA(N,"TEXTE","$EXISTE"),SET^%ANA(N,1,A) Q N
NEG() Q:C'="'" 0 D LEC N N S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","NEGATION") Q N
M(T) N SX,SY S SX=DX,SY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(T) H 3 D POCLEPA^%VVIDEO S DX=SX,DY=SY Q

