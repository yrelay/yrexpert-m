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

;%MZGLO10^INT^1^59762,67004^0
MOZGLO10 ;; ; 07 Jun 93  4:47 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",10,1,81,1)=S @%TT@($J,0)=X,X=@%TT@($J,0,EDCL) D H^MOZIN52 S X=@%TT@($J,0)
 ;;^MOZ("C",10,1,82,0)=DEL L^delete line^R
 ;;^MOZ("C",10,1,82,1)=D DNL:A,DPL:'A
 ;;^MOZ("C",10,1,112,0)=LINE^beg of line^?p
 ;;^MOZ("C",10,1,112,1)=S INP=1 D POS
 ;;^MOZ("C",10,1,113,0)=WORD^move word^?q
 ;;^MOZ("C",10,1,113,1)=D NW:A,PW:'A
 ;;^MOZ("C",10,1,114,0)=EOL^goto eol^?r
 ;;^MOZ("C",10,1,114,1)=S INP=$L(X)+1 D POS
 ;;^MOZ("C",10,1,116,0)=ADVANCE^forwards^?t
 ;;^MOZ("C",10,1,116,1)=S A=1
 ;;^MOZ("C",10,1,117,0)=BACKUP^backup^?u
 ;;^MOZ("C",10,1,117,1)=S A=0
 ;;^MOZ("C",10,1,118,0)=DEL C^delete char^?v
 ;;^MOZ("C",10,1,118,1)=D DNC:A,DPC:'A
 ;;^MOZ("C",10,1,121,0)=DEL W^delete word^?y
 ;;^MOZ("C",10,1,121,1)=D DNW:A,DPW:'A
 ;;^MOZ("C",10,1,127,0)=DEL^delete previous char
 ;;^MOZ("C",10,1,127,1)=D DPC
 ;;^MOZ("C",10,1,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",10,1,128,1)=W *0
 ;;^MOZ("C",10,3)=0^0^0^^60^31
 ;;^MOZ("C",10,4)=U 0:(RM:"IS":"")
 ;;^MOZ("C",10,6)=S BS="$C(8)",FF="#,*27,*72,*27,*74",RM=80,SL=24,XL="W *27,*75",XY="W *27,*89,*DY+32,*DX+32 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^MOZ("C",11,0)=EDT INPUT
 ;;^MOZ("C",11,1,0)=^90019.01^81^15
 ;;^MOZ("C",11,1,13,0)=CR^next line
 ;;^MOZ("C",11,1,13,1)=D CR
 ;;^MOZ("C",11,1,27,0)=ESC^(escape functions)
 ;;^MOZ("C",11,1,27,1)=Q:$L($ZB)<2  X $S($D(^MOZED($J,$E($ZB,2,999))):^MOZED($J,$E($ZB,2,999)),1:"D E")
 ;;^MOZ("C",11,1,67,0)=RIGHT^character right^[C
 ;

