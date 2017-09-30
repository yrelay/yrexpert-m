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

;%LXUC9^INT^1^59547,73871^0
LEXUC9 ;
 
 
 
 
EXIOP 
 S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 I PARA="" S RESUL(IC)="" Q
 N C,OP,OPER,OP1,POS,LONG
 S POS=1,LONG=$L(PARA),OPER=""
 D LEC
 I C="'" S OPER="'" D LEC
 I "=<>"[C S OPER=OPER_C D LEC G UNAI
 I "[]"'[C S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un operateur =, <, >, [, ], [], ]], ][, [[ ou sa negation etait attendu")) Q
 S OPER=OPER_C D LEC
 I "[]"'[C G UNAI
 S OPER=OPER_C
 D LEC,OP
 Q:REFUSE
 S OP1=OP
 I C'="," S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Une "","" etait attendue entre les 2 parametres")) Q
 D LEC,OP
 Q:REFUSE
 I C'="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Caracteres en trop")) Q
 S RESUL(IC)=OPER_" "_OP1_" , "_OP
 
 Q
UNAI D OP
 Q:REFUSE
 I C'="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Caracteres en trop")) Q
 D NORMALIS^%QZNBN1(.OP)
 S RESUL(IC)=OPER_" "_OP
 
 Q
LEC S C=$E(PARA,POS)
 S POS=POS+1
 Q:C'=" "
 G LEC
OP N B,CH
 S OP=""
 G:(((C=".")!(C?1N))!(C="-"))!(C="+") OPNOMB
 I C'="""" S REFUSE=1 Q
OPCH 
 N OP2,POS2 S OP2="",POS2=2
 S OP=$$GETLBLAN^%VTLBLAN($P($E(PARA,POS-1,$L(PARA)),","))
 S OP2=OP2_C D LEC2 I C="""" S REFUSE=1 Q
 F B=0:0 Q:C=""  S OP2=OP2_C Q:C=""""  D LEC2
 I C="" S REFUSE=1 Q
 
 I OP2'=OP D ^%VZEAVT($$^%QZCHW("Syntaxe incorrecte")) S REFUSE=1 Q
 
 I C="""" S C=""
 S POS=$F(PARA,OP,POS-1)
 D LEC
 
 Q
LEC2 S C=$E(OP,POS2),POS2=POS2+1
 Q:C'=" "
 G LEC2
OPNOMB 
 I (C="-")!(C="+") S OP=C D LEC
 G:C="." OPN2
 I C'?1N S REFUSE=1 Q
 S OP=OP_C D LEC F B=0:0 Q:C'?1N  S OP=OP_C D LEC
 Q:C'="."
OPN2 S OP=OP_"." D LEC
 F B=0:0 Q:C'?1N  S OP=OP_C D LEC
 Q
CHBKPT 
 S PARA=RESUL(IC),ICC=IC,EFF="",LEFF=$L(RESUL(IC)) F RR=1:1:LEFF S EFF=EFF_$$^%QZCHW(" ")
 S TAB(ICC)=EFF D ^%VAFFICH S TAB(ICC)=PARA D ^%VAFFICH Q
 
 
NUM S REFUSE=0
 I '($$POS^%QZNBN(RESUL(IC))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un entier positif. Merci..."))
 Q
 
 
NUML S REFUSE=0
 I '($$POS^%QZNBN(RESUL(IC))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un entier compris entre 1 et 76. Merci..."))
 I (RESUL(IC)<1)!(RESUL(IC)>76) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un entier compris entre 1 et 76. Merci..."))
 Q
 
 
NUMCHAI S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 S REFUSE=0
 S RESUL(IC)=PARA Q
 
 I PARA="" S RESUL(IC)="" Q
 N POS,OP
 S POS=1 D LEC,OP
 Q:REFUSE
 I C'="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("trop de caracteres. Merci...")) Q
 S RESUL(IC)=OP
 Q
 
 
UNIT 
OPS S PARA=RESUL(IC),REFUSE=0 F IT=$$^%QZCHW("%MACHINE"),"%PHASE","%OPERATION" G END:PARA=IT
 I $P(PARA,"'",2)=$$^%QZCHW("%MACHINE") S PARA=$P(PARA,"'",1)
 I $E(PARA)="." S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un mot du lexique ne doit pas commencer par un point (= Separateur)")) G END
 I PARA["^" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Veuillez ne pas mettre")_" ^") G END
 I $$ADR^%QZNBN1(PARA) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Pas de numerique au lexique. Merci")) G END
 I $E(PARA)'?1A S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Le premier caractere doit etre alphabetique. Merci")) G END
END Q
 ;

