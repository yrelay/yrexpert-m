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

;%MZGLO8^INT^1^59762,67588^0
MOZGLO8 ;; ; 07 Jun 93  4:47 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",9,1,121,1)=D DNW:A,DPW:'A
 ;;^MOZ("C",9,1,127,0)=DEL^delete previous char
 ;;^MOZ("C",9,1,127,1)=D DPC
 ;;^MOZ("C",9,1,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",9,1,128,1)=S %ALM=$P($H,",",2)+60 D T^%MZINSF,POS
 ;;^MOZ("C",9,2,0)=^90019.02^82^14
 ;;^MOZ("C",9,2,65,0)=REPLACE^replace
 ;;^MOZ("C",9,2,65,1)=D FRQ^%MZEDSF,FNS^%MZEDSF:'^MOZED($J) S %=0
 ;;^MOZ("C",9,2,66,0)=SECTION^section
 ;;^MOZ("C",9,2,66,1)=D NS^%MZEDSF:A,PS^%MZEDSF:'A
 ;;^MOZ("C",9,2,77,0)=SUBS^find and replace string
 ;;^MOZ("C",9,2,77,1)=S EDCLP=EDCL D RS^%MZEDSF,FNS^%MZEDSF S %=$S(EDRP:3,1:2)
 ;;^MOZ("C",9,2,82,0)=UND L^undelete line
 ;;^MOZ("C",9,2,82,1)=D PLL^%MZEDSF
 ;;^MOZ("C",9,2,110,0)=RESET^reset
 ;;^MOZ("C",9,2,110,1)=S A=1
 ;;^MOZ("C",9,2,112,0)=OPEN LINE^open line
 ;;^MOZ("C",9,2,112,1)=D CR,PC
 ;;^MOZ("C",9,2,114,0)=DEL EOL^delete to eol
 ;;^MOZ("C",9,2,114,1)=D DNL:A,DPL:'A
 ;;^MOZ("C",9,2,115,0)=PASTE^paste
 ;;^MOZ("C",9,2,115,1)=D WB^%MZEDSF
 ;;^MOZ("C",9,2,116,0)=BOTTOM^goto end of file
 ;;^MOZ("C",9,2,116,1)=S @%TT@($J,0,EDCL)=X F %0=0:0 S EDN=$O(^(EDCL)) S:EDN EDCL=EDN I 'EDN S X=@%TT@($J,0,EDCL),EDP=$L(X)+1 D MS^%MZEDSF Q
 ;;^MOZ("C",9,2,117,0)=TOP^goto beginning of file
 ;;^MOZ("C",9,2,117,1)=S (EDFL,EDN)=$O(@%TT@($J,0,0)),EDP=1 D X,RF
 ;;^MOZ("C",9,2,118,0)=UND C^undelete char
 ;;^MOZ("C",9,2,118,1)=D PLC^%MZEDSF
 ;;^MOZ("C",9,2,119,0)=COMMAND^command
 ;;^MOZ("C",9,2,119,1)=D C^%MZHLP
 ;;^MOZ("C",9,2,120,0)=FIND^find string
 ;

