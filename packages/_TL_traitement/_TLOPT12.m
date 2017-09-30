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

;%TLOPT12^INT^1^59547,74030^0
%TLOPT12 ;;05:57 PM  2 Jun 1992;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERP(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,COND,SYNT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO,POP,VAL,NUM
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3)
 S P5=V(IDEB+7),P6=V(IDEB+8),P7=$S(V(IDEB+9)=$C(0):"",1:V(IDEB+9))
 S P8=$S(V(IDEB+10)=$C(0):"",1:V(IDEB+10))
 S COND=$S(V(IDEB+11)=$C(0):"",1:V(IDEB+11))
 S SYNT="POINT ; "_P4_" ; "_P5_" ; "_P6_" ; ( "_P7_" ; "_P8_" )"
 S SYNT=SYNT_COND
 G ANAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERT(IDEB,NBREG) 
 N P1,P2,P3,P4,P5,P6,P7,P8,P9,COND,SYNT
 N GLOTYP,TEMPREF,GLOBJ,GLCOMP,GLTEXT,TEMPO,POP,VAL,NUM
 S P1=V(IDEB),P2=V(IDEB+1),P3=V(IDEB+2),P4=V(IDEB+3)
 S P6=V(IDEB+9),P7=V(IDEB+10),P8=$S(V(IDEB+11)=$C(0):"",1:V(IDEB+11))
 S COND=$S(V(IDEB+12)=$C(0):"",1:V(IDEB+12))
 
 S SYNT="TEXTE ; "_P4_" ; "_$S(P6=$C(0):V(IDEB+4),1:"("_V(IDEB+8)_" ; "_P6_")")_" ; "_P7_$S(P8="":"",1:" ; "_P8)
 I COND="" G ANAT1
 I P8="" S SYNT=SYNT_" ; "
 S SYNT=SYNT_COND
ANAT1 G ANAL
SUBST(P7) 
 I ((P7'["$SYMBOLE")&(P7'["$BAS"))&(P7'["$HAUT") Q
 S P7=$$ZSUBST^%QZCHSUB(P7,"""""","""")
 Q
 
 
 
ANAL 
 D ISESS^%SDEANTI(P1,P2,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 S POP=0
 
 I (P3="")!(P3=$C(0)) S P3=$ZP(@GLTEXT@("z"))+1,@GLTEXT@(P3)="",POP=1
 S SYNT=P3_" ; "_SYNT
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
 ;

