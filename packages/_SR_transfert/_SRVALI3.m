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

;%SRVALI3^INT^1^59547,73892^0
SRVALI3 ;
 
 
 
 
LEC S C=$E(PARA,POS)
 S POS=POS+1
 Q:C'=" "
 G LEC
 
AN(PARA,NAT,COMPIL,OK) 
 N TYP,CH2,POS,OP,CPT,SIGN,XX
 S CH2="",OK=1,POS=1,CPT=0,SIGN=""
 D LEC
 I C="" S OK=1,COMPIL="S OK=1" Q
LOP 
 I "FCAED+-"'[C G ERSYNT
 S XX=$S(C="+":"PL",C="-":"MO",1:C)
 S CPT=CPT+1
 D @("NAT"_NAT)
 I C="" G FIN
 I C'="," G ERSYNT
 D LEC
 G LOP
NATX 
 D @XX
 Q
NATA 
 I XX'="A" D INS(ERR,$$M(P)_$$^%QZCHW("nature et format incompatibles")) Q
 D A
 Q
NATN 
 I XX="PL" D PL Q
 I XX="MO" D MO Q
 I "ED"'[XX D INS(ERR,$$M(P)_$$^%QZCHW("nature et format incompatibles")) Q
 D @XX
 Q
 
FIN 
 Q:'(OK)
 S COMPIL="S OK="_$S(SIGN="":"(VAL?",$D(COMP)=0:"("_SIGN,1:SIGN_"&(VAL?")
 F I=1:1:CPT S COMPIL=COMPIL_COMP(I)
 S COMPIL=COMPIL_")"
 Q
 
ERSYNT D INS(ERR,$$M(P)_$$^%QZCHW("erreur de syntaxe dans le format"))
 S OK=0 Q
 
F 
 D LEC I C'="(" G ERSYNT
 D LEC S REFUSE=0
 D CHAINE^%SRCOMPV I REFUSE!(OP="") G ERSYNT
 I C'=")" G ERSYNT
 S COMP(CPT)=1_OP
 D LEC
 Q
A 
 D LEC
 I C="" S COMP(CPT)=".A" G A2
 I C="," S COMP(CPT)=".A" Q
 I C'="(" G ERSYNT
 D LEC S REFUSE=0
 D NUM^%SRCOMPV I REFUSE!(OP="") G ERSYNT
 I C'=")" G ERSYNT
 S COMP(CPT)=OP_"A"
 D LEC
A2 Q
E 
 D LEC
 I C="" S COMP(CPT)=".N" G E2
 I C="," S COMP(CPT)=".N" Q
 I C'="(" G ERSYNT
 D LEC S REFUSE=0
 D NUM^%SRCOMPV I REFUSE!(OP="") G ERSYNT
 I C'=")" G ERSYNT
 S COMP(CPT)=OP_"N"
 D LEC
E2 Q
C 
 D LEC
 I C="" S COMP(CPT)=".E" G C2
 I C="," S POS=POS-1,COMP(CPT)=".E" G C2
 I C'="(" G ERSYNT
 D LEC S REFUSE=0
 D NUM^%SRCOMPV
 I REFUSE G ERSYNT
 I C'=")" G ERSYNT
C1 S COMP(CPT)=OP_"E"
 D LEC
C2 Q
D 
 D LEC
 I C="" S COMP(CPT)="1""."".N" G D1
 I C="," S POS=POS-1,COMP(CPT)="1""."".N" G D1
 I C'="(" G ERSYNT
 D LEC S REFUSE=0
 D NUM^%SRCOMPV
 I REFUSE G ERSYNT
 I C'=")" G ERSYNT
 S COMP(CPT)="1""."""_OP_"N"
 D LEC
D1 Q
PL 
 S SIGN="($$POS^%QZNBN(VAL))"
 D LEC
 Q
MO 
 S SIGN="($$NUM^%QZNBN(VAL))&($E(VAL)="-")"
 D LEC
 Q
 
 
M(P) 
 N M
 S M=$$^%QZCHW("champ")_" "_P_" : "
 Q M
 
INS(ERR,M) 
 S @ERR@($E(M,1,74))="" I $L(M)>LMAX S LMAX=$L(M)
 Q
 
TEST 
 N LIB,ERR,LMAX,COMPIL X ^DMO S ERR="TOTO",LMAX=0,COMPIL="" D CLEPAG^%VVIDEO
T K @(ERR) W " NATURE : " R NAT
 Q:NAT=""
 W !," FORMAT : " R LIB
 Q:LIB=""
 S P=1,COMPIL="" D AN(LIB,NAT,.COMPIL,.OK)
 W !,"<<",COMPIL,">>   ",OK,"  ",$O(@ERR@("")),!
 G T

