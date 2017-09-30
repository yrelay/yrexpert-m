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
;! Nomprog     : MOZGLO1                                                      !
;! Module      : MOZART                                                       !
;! But         : Contenu de la global ^MOZ, générer pas ^%MZGLO.              !
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

;%MZGLO1^INT^1^59762,66966^0
MOZGLO1 ;; ; 07 Jun 93  4:46 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",6,0)=Mozart
 ;;^MOZ("C",6,1,0)=^90019.01^28^27
 ;;^MOZ("C",6,1,1,0)=C-A^word left
 ;;^MOZ("C",6,1,1,1)=D PW
 ;;^MOZ("C",6,1,2,0)=C-B^refresh screen
 ;;^MOZ("C",6,1,2,1)=S %=3
 ;;^MOZ("C",6,1,3,0)=C-C^screen down
 ;;^MOZ("C",6,1,3,1)=D NS^%MZEDSF
 ;;^MOZ("C",6,1,4,0)=C-D^character right
 ;;^MOZ("C",6,1,4,1)=D NC
 ;;^MOZ("C",6,1,5,0)=C-E^line up
 ;;^MOZ("C",6,1,5,1)=D PL
 ;;^MOZ("C",6,1,6,0)=C-F^word right
 ;;^MOZ("C",6,1,6,1)=D NW
 ;;^MOZ("C",6,1,7,0)=C-G^delete next character
 ;;^MOZ("C",6,1,7,1)=D DNC
 ;;^MOZ("C",6,1,9,0)=TAB^tabulation
 ;;^MOZ("C",6,1,9,1)=D TAB^%MZEDSF
 ;;^MOZ("C",6,1,10,0)=LF^help
 ;;^MOZ("C",6,1,10,1)=D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",6,1,11,0)=C-K^exiting functions
 ;;^MOZ("C",6,1,11,1)=S SET=5,%Q="C-K" D CTR^%MZEDSF X ^MOZED($J,EDR) S SET=1
 ;;^MOZ("C",6,1,12,0)=C-L^find and change next string
 ;;^MOZ("C",6,1,12,1)=D RS^%MZEDSF:$P($E(X,1,EDP-1),EDST,$L($E(X,1,EDP-1),EDST))=EMP&(EDP>1) S EDCLP=EDCL D FNS^%MZEDSF S %=$S(EDRP:3,1:2)
 ;;^MOZ("C",6,1,13,0)=CR^next line
 ;;^MOZ("C",6,1,13,1)=D CR
 ;;^MOZ("C",6,1,14,0)=C-N^insert empty line
 ;;^MOZ("C",6,1,14,1)=D CR,PC
 ;;^MOZ("C",6,1,17,0)=C-Q^C-Q functions
 ;;^MOZ("C",6,1,17,1)=S SET=2,%Q="C-Q" D CTR^%MZEDSF X ^MOZED($J,EDR) S SET=1
 ;;^MOZ("C",6,1,18,0)=C-R^screen up
 ;

