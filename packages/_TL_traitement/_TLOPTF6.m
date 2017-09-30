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

;%TLOPTF6^INT^1^59547,74030^0
%TLOPTF6 ;;10:43 AM  13 Jul 1992; ; 13 Jul 92 10:41 AM
 
ANAL 
 D ISESS^%SDEANTI(P1,P2,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 S POP=0
 
 I (P3="")!(P3=$C(0)) S P3=$ZP(@GLTEXT@("z"))+1,@GLTEXT@(P3)="",POP=1
 S SYNT=P3_" ; "_SYNT
 S TYPTRAIT=$$GETLBLAN^%VTLBLAN($P(SYNT,";",4))
 S $P(SYNT,";",4)=" """_TYPTRAIT_""" "
 S OK=$$LIGNE^%SDEANT1(SYNT,0,23,"",0,1,.NUM,.RES,.MSG)
 I OK=0 K:POP=1 @GLTEXT@(P3)
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 
 I OK=0 G FIN0
 
 D MAJVAR^%SDEGES3(P1,P2)
 S VAL=NUM
 Q VAL
 
FIN0 S VAL=0 G ERC
ERR S VAL="" G ERC
ERC S ECHEC=1,POS=0
 Q 0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERD(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,SYNT,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO,POP,VAL,ECHEC,NUM,RES,MSG
 S P1=V(IDEB)
 S P2=V(IDEB+1)
 S P3=V(IDEB+2)
 S P4=V(IDEB+3)
 S P5=V(IDEB+4)
 S P6=V(IDEB+5)
 S P8=V(IDEB+11)
 S P10=V(IDEB+17)
 S P11=V(IDEB+18)
 S SYNT="DROITE ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8=$C(0):V(IDEB+10),1:"("_V(IDEB+10)_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10=$C(0):V(IDEB+16),1:"("_V(IDEB+16)_" ; "_P10_")")
 I P6=2 S SYNT=SYNT_V(IDEB+16)_" ; "_P10_" ; "_P11
 S COND=$S(V(IDEB+19)=$C(0):"",1:V(IDEB+19))
 S SYNT=SYNT_COND
 G ANAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERC(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,SYNT,COND,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO,POP,VAL,ECHEC,NUM,RES,MSG
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3)
 S P5=V(IDEB+4),P6=V(IDEB+5),P8=V(IDEB+11),P10=V(IDEB+17)
 S SYNT="CERCLE ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8=$C(0):V(IDEB+10),1:"("_V(IDEB+10)_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10=$C(0):V(IDEB+16),1:"("_V(IDEB+16)_" ; "_P10_")")
 I P6=2 S SYNT=SYNT_V(IDEB+16)
 S COND=$S(V(IDEB+18)=$C(0):"",1:V(IDEB+18))
 S SYNT=SYNT_COND
 G ANAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERARC(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,SYNT,COND,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO,POP,VAL,ECHEC,NUM,RES
 S (P12,P13)=""
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3),P5=V(IDEB+4)
 S P6=V(IDEB+5),P8=V(IDEB+11),P10=V(IDEB+17)
 S P12=V(IDEB+23),P13=V(IDEB+24)
 S COND=$S(V(IDEB+25)=$C(0):"",1:"")
 S SYNT="ARC ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8=$C(0):V(IDEB+10),1:"("_V(IDEB+10)_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10=$C(0):V(IDEB+16),1:"("_V(IDEB+16)_" ; "_P10_")")_" ; "_$S(P12=$C(0):V(IDEB+22),1:"("_V(IDEB+22)_" ; "_P12_")")_COND G ANAA1
 I P6=2 S SYNT=SYNT_V(IDEB+16)_" ; "_P10_" ; "_V(IDEB+22)_$S(P12=$C(0):"",1:" ; "_P12_" ; "_P13)
 I COND="" G ANAA1
 I P12=$C(0) S SYNT=SYNT_" ;  ; "
 S SYNT=SYNT_COND
ANAA1 G ANAL
 ;

