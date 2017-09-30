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

;LKTRANS^INT^1^59547,74867^0
LKTRANS ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRANS(TAB,CLE,DEST) Q $$TRANSP(TAB,CLE,DEST)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRANSP(TAB,CLE,DEST,NPAR) 
 N I,J,P,DATAS,PARAM,VAL,CH,ER,FLAG
 S DATAS="",ER=0,FLAG=0
 I $D(NPAR)=1 S FLAG=1 I $D(@NPAR)<9 S FLAG=0
 S DATAS=$$CONCAT^LKZ(TAB,CLE)
 Q:'($D(@DATAS)) 1 S CH=@DATAS
 I FLAG=0 F I=1:2:$L(CH,"^")-1 D T
 I FLAG=1 S I=$O(@NPAR@("")) F J=1:1 Q:I=""  D T1 S I=$O(@NPAR@(I))
 Q 0
T S ER=$$OUT^%QZCHGE(DATAS,I,.PARAM)
 S ER=ER+$$OUT^%QZCHGE(DATAS,I+1,.VAL)
 S:(ER=0)&(PARAM'="") @DEST@(PARAM,$ZP(@DEST@(PARAM,""))+1)=VAL
 Q
T1 S PARAM=@NPAR@(I)
 S ER=ER+$$OUT^%QZCHGE(DATAS,I,.VAL)
 S:(ER=0)&(PARAM'="") @DEST@(PARAM,$ZP(@DEST@(PARAM,""))+1)=VAL
 Q
 
TEST S A="^TOTO($J)",B="1,""W"",2",C="^TOTO($J,2)"
 S @A@(1,"W",2)="P1^1^P2^2^PARAM3^TROIS^"
 S ER=$$TRANS^LKTRANS(A,B,C) B
 S A="^TOTO($J)",B="3,""W"",2",C="^TOTO($J,4)"
 S @A@(3,"W",2)="1^2^TROIS^"
 S D(1)="P1",D(2)="P2",D(3)="PARAMETRE3",D1="D",B1="B"
 S ER=$$TRANSP^LKTRANS(A,B,C,D1) B
 Q

