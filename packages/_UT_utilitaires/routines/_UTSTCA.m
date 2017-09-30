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

;%UTSTCA^INT^1^59547,74033^0
%UTSTCA ;PS;02:50 PM  4 Sep 1996;
 ; 
 	;
 	;
 	;
 	;
 	;
 	;
 	;
 	;
 	;
 	;
STOL(LGLO,PREF) 
 N TEMP,STOCK,ITM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TP") K @(TEMP)
 S STOCK=$$CONCAS^%QZCHAD(TEMP,"S")
 S ITM=1
 S GLO="" F %G=0:0 S GLO=$O(@LGLO@(GLO)) Q:GLO=""  D STOGL
 D WRITE
 Q
STOONE(GLO,PREF) 
 N TEMP,STOCK,ITM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TP") K @(TEMP)
 S STOCK=$$CONCAS^%QZCHAD(TEMP,"S")
 S ITM=1
 D STOGL
 D WRITE
 Q
 
 
STOGL I $D(@GLO)#10 S @STOCK@(ITM)=GLO,@STOCK@(ITM+1)=@GLO,ITM=ITM+2
 S D=$S($E(GLO,2)="[":$P(GLO,"]")_"]",1:"^")
 S R=$E(GLO,$L(D)+1,$S($E(GLO,$L(GLO))=")":$L(GLO)-1,1:$L(GLO)))
 S %L=$L(R)+1,%R="^"_R
 S G=GLO
 ;; cao debug ^%Q
 F %Z=0:0 S G=$$^%Q($Q(@G)) Q:G=""  Q:$E(G,1,%L)'=%R  S G=D_$E(G,2,$L(G)),@STOCK@(ITM)=G,@STOCK@(ITM+1)=@G,ITM=ITM+2
 Q
 
 
WRITE 
 N RUN,ITM,LMAX,LCOUR,X0,X1,X2,X3,X4,STOP
 S RUN=1,ITM=1,LMAX=3600,LCOUR=0
 S X0="F %ZZ=1:1 Q:'RUN  X X1"
 S X1="S ROUT=PREF_%ZZ ZR  X X2 ZS @ROUT"
 S X2="S STOP=0,LCOUR=0 ZI ROUT_$C(9)_"";;""_$$DATE^%QMDATE() ZI $C(9)_"";;*"" F L=0:0 X X3($D(@STOCK@(ITM))) Q:STOP"
 S X3(0)="S STOP=1,RUN=0"
 S X3(1)="X X4(($L(@STOCK@(ITM))+LCOUR)<LMAX)"
 S X4(0)="S STOP=1"
 S X4(1)="ZI $C(9)_"";;""_@STOCK@(ITM) S LCOUR=LCOUR+$L(@STOCK@(ITM)),ITM=ITM+1"
 X X0
 Q
 
READ(PREF) 
 N REF,X0,X2,X4,ADR,VAL
 S REF=1
 S X0="F %ZZ=1:1 S ROUT=PREF_%ZZ Q:'$$EXIROU^%SYSROUT($$PCONF^%INCASTS(""PROG""),ROUT)  w !,ROUT ZL @ROUT S FROU=0 X X2(0) X X2(1)"
 S X2(0)="F J=1:1 S VAL=$P($T(+J),"";;"",2,999) Q:VAL=""*""  "
 S X2(1)="F J=J+1:1 S VAL=$T(+J) Q:VAL=""""  S VAL=$P(VAL,"";;"",2,9999) X X4(REF)"
 S X4(1)="S ADR=VAL,REF=0"
 S X4(0)="S @ADR=VAL,REF=1"
 X X0
 Q
 
STD D STOONE("^RQSGLO(""VERBE"")","%SGRQ")
 Q

