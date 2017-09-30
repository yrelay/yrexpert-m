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

;%MZGLO7^INT^1^59762,67564^0
MOZGLO7 ;; ; 07 Jun 93  4:47 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",9,1,68,0)=LEFT^character left^D
 ;;^MOZ("C",9,1,68,1)=D PC
 ;;^MOZ("C",9,1,77,0)=ENTER^command mode^M
 ;;^MOZ("C",9,1,77,1)=D C^%MZHLP
 ;;^MOZ("C",9,1,80,0)=GOLD^GOLD-functions^P
 ;;^MOZ("C",9,1,80,1)=S DX=0,DY=EDSL+2 X XY W "GOLD " X XL R *ED:^TOZE($I,"ATTENTE") Q:ED'=27  S ED=$D(^MOZ("C",+%ED,2,$A($E($ZB,$L($ZB))),1))#2 D:'ED ^%VSQUEAK X:ED ^(1)
 ;;^MOZ("C",9,1,81,0)=HELP^help^Q
 ;;^MOZ("C",9,1,81,1)=D VT52^%MZHLP
 ;;^MOZ("C",9,1,82,0)=DEL L^delete line^R
 ;;^MOZ("C",9,1,82,1)=D DNL:A,DPL:'A
 ;;^MOZ("C",9,1,110,0)=SELECT^mark paste buffer beginning^?n
 ;;^MOZ("C",9,1,110,1)=S EDBB=EDCL_U_EDP
 ;;^MOZ("C",9,1,112,0)=LINE^beg of line^?p
 ;;^MOZ("C",9,1,112,1)=D NL:A,PC:'A S EDP=1
 ;;^MOZ("C",9,1,113,0)=WORD^word move^?q
 ;;^MOZ("C",9,1,113,1)=D NW:A,PW:'A
 ;;^MOZ("C",9,1,114,0)=EOL^end of line^?r
 ;;^MOZ("C",9,1,114,1)=D NC:A,PL:'A S EDP=$L(X)+1
 ;;^MOZ("C",9,1,115,0)=CUT^cut indicated text to paste buffer^?s
 ;;^MOZ("C",9,1,115,1)=D RB^%MZEDSF
 ;;^MOZ("C",9,1,116,0)=ADVANCE^advance^?t
 ;;^MOZ("C",9,1,116,1)=S A=1
 ;;^MOZ("C",9,1,117,0)=BACKUP^backup^?u
 ;;^MOZ("C",9,1,117,1)=S A=0
 ;;^MOZ("C",9,1,118,0)=DEL C^delete char^?v
 ;;^MOZ("C",9,1,118,1)=D DNC:A,DPC:'A
 ;;^MOZ("C",9,1,119,0)=PAGE^page^?w
 ;;^MOZ("C",9,1,119,1)=D NS^%MZEDSF:A,PS^%MZEDSF:'A
 ;;^MOZ("C",9,1,120,0)=FNDNXT^find next^?x
 ;;^MOZ("C",9,1,120,1)=D FNS^%MZEDSF
 ;;^MOZ("C",9,1,121,0)=DEL W^delete word^?y
 ;

