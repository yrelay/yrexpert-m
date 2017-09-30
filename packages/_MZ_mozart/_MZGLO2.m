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

;%MZGLO2^INT^1^59547,73871^0
MOZGLO2 ;; ; 07 Jun 93  4:46 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",6,1,18,1)=D PS^%MZEDSF
 ;;^MOZ("C",6,1,19,0)=C-S^character left
 ;;^MOZ("C",6,1,19,1)=D PC
 ;;^MOZ("C",6,1,20,0)=C-T^delete next word
 ;;^MOZ("C",6,1,20,1)=D DNW
 ;;^MOZ("C",6,1,21,0)=C-U^abort
 ;;^MOZ("C",6,1,21,1)=S ^MOZED($J)=1,%="Q"
 ;;^MOZ("C",6,1,22,0)=C-V^insert mode yes/no
 ;;^MOZ("C",6,1,22,1)=S EDOV='EDOV D STAT^%MZWORD
 ;;^MOZ("C",6,1,23,0)=C-W^screen line down
 ;;^MOZ("C",6,1,23,1)=S EDN=@%TT@($J,0,EDFL,0) D:'EDN E I EDN S EDFL=EDN,%=3
 ;;^MOZ("C",6,1,24,0)=C-X^line down
 ;;^MOZ("C",6,1,24,1)=D NL
 ;;^MOZ("C",6,1,25,0)=C-Y^delete line
 ;;^MOZ("C",6,1,25,1)=S EDP=1 D DNL
 ;;^MOZ("C",6,1,26,0)=C-Z^screen line up
 ;;^MOZ("C",6,1,26,1)=S EDN=$O(@%TT@($J,0,EDFL)) D E:'EDN I EDN S EDFL=EDN D RF
 ;;^MOZ("C",6,1,28,0)=C-\^time
 ;;^MOZ("C",6,1,28,1)=D T^%MZINSF
 ;;^MOZ("C",6,1,29,0)=C-]^test
 ;;^MOZ("C",6,1,29,1)=D ^MOZSTLV S %ED=2,%Q=">>" D SET^%MZINSF,CIP^%MZINSF,^MOZLDLV,SET^%MZINSF,RF S %=0
 ;;^MOZ("C",6,1,127,0)=DEL^delete character
 ;;^MOZ("C",6,1,127,1)=D DPC
 ;;^MOZ("C",6,1,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",6,1,128,1)=S %ALM=$P($H,",",2)+60 D T^%MZINSF,POS
 ;;^MOZ("C",6,2,0)=^90019.02^21^18
 ;;^MOZ("C",6,2,1,0)=C-A^find and change string
 ;;^MOZ("C",6,2,1,1)=D FRQ^%MZEDSF,FNS^%MZEDSF:'^MOZED($J) S %=0
 ;;^MOZ("C",6,2,2,0)=C-B^go to beginning of block
 ;;^MOZ("C",6,2,2,1)=S ED=$S($D(EDBB):EDBB,1:EMP) D FB^%MZEDSF
 ;;^MOZ("C",6,2,3,0)=C-C^go to end of file
 ;

