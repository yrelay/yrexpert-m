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

;%TLOPT15^INT^1^59547,74030^0
%TLOPT15 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERF(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,SYNT,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLGLTEXT,TEMPO,POP,COND,TEXTE
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3),P5=V(IDEB+4)
 S P6=V(IDEB+5),P7=V(IDEB+6),P8=V(IDEB+7),TEXTE=V(IDEB+21)
 S P10=V(IDEB+13),P12=V(IDEB+19),P13=V(IDEB+20)
 S COND=$S(V(IDEB+22)=$C(0):"",1:V(IDEB+22))
 
 S SYNT="FLECHE ; "_P4_" ; "_P5_" ; """_P6_""" ; """_P7_""" ; """_TEXTE_""" ; "_P8_" ; "_$S(P10=$C(0):V(IDEB+12),1:"("_V(IDEB+12)_" ; "_P10_")")_" ; "
 I P8=1 S SYNT=SYNT_$S(P12=$C(0):V(IDEB+18),1:"("_V(IDEB+18)_" ; "_P12_")")_COND G PARFT1
 I P8=2 S SYNT=SYNT_V(IDEB+18)_" ; "_P12_$S(P13=$C(0):"",1:" ; "_P13)
 I COND="" G PARFT1
 I P13=$C(0) S SYNT=SYNT_" ; "
 S SYNT=SYNT_COND
PARFT1 G ANAL^%TLOPTF6
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERE(IDEB,NBREG) 
 N TYPELL
 S TYPELL="ELLIPSE"
 G PARTCOM
 
CREERDE(IDEB,NBREG) 
 N TYPELL
 S TYPELL="DEMIE.ELLIPSE"
 
PARTCOM 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,SYNT,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLGLTEXT,TEMPO,POP,COND
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3)
 S P5=V(IDEB+4),P6=V(IDEB+5),P8=V(IDEB+11)
 S P10=V(IDEB+17),P12=V(IDEB+23),P13=V(IDEB+24)
 S COND=$S(V(IDEB+25)=$C(0):"",1:V(IDEB+25))
 
 S SYNT=TYPELL_" ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8=$C(0):V(IDEB+10),1:"("_V(IDEB+10)_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10=$C(0):V(IDEB+16),1:"("_V(IDEB+16)_" ; "_P10_")")_" ; "_$S(P12=$C(0):V(IDEB+22),1:"("_V(IDEB+22)_" ; "_P12_")")_COND G ANAE1
 I P6=2 S SYNT=SYNT_V(IDEB+16)_" ; "_P10_" ; "_V(IDEB+22)_$S(P12=$C(0):"",1:" ; "_P12_" ; "_P13)
 I COND="" G ANAE1
 I P12=$C(0) S SYNT=SYNT_" ; ; "
 S SYNT=SYNT_COND
ANAE1 G ANAL^%TLOPTF6
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERR(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,SYNT,TYPTRAIT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLGLTEXT,TEMPO,POP,COND
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3)
 S P5=V(IDEB+4),P6=V(IDEB+5),P7=V(IDEB+6),P8=V(IDEB+7),P9=V(IDEB+8)
 S COND=$S(V(IDEB+9)=$C(0):"",1:V(IDEB+9))
 
 S SYNT="RACCORDEMENT ; "_P4_" ; "_P5_" ; "_P6_" ; "_P7_" ; "_P8_" ; "_P9_COND
 G ANAL^%TLOPTF6
 ;

