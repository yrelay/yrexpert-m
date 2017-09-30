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

;%MZGLO5^INT^1^59762,67501^0
MOZGLO5 ;; ; 07 Jun 93  4:46 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",6,6)=S XL="W *27,*91,*75" D CURRENT^%IS
 ;;^MOZ("C",8,0)=WORDSTAR INPUT
 ;;^MOZ("C",8,1,0)=^90019.01^21^15
 ;;^MOZ("C",8,1,1,0)=C-A^word left
 ;;^MOZ("C",8,1,1,1)=S INP=$L($P(X," ",1,$L($E(X,1,INP-1)," ")-1))+1 D POS
 ;;^MOZ("C",8,1,4,0)=C-D^character right
 ;;^MOZ("C",8,1,4,1)=S:INP'>$L(X) INP=INP+1 D POS
 ;;^MOZ("C",8,1,5,0)=C-E^line up
 ;;^MOZ("C",8,1,5,1)=S ^MOZED($J)=1,%="Q"
 ;;^MOZ("C",8,1,6,0)=C-F^word right
 ;;^MOZ("C",8,1,6,1)=S INP=INP+$L($P($E(X,INP+1,999)," ",1))+1 S INP=$S(INP>INL:INL,INP-1>$L(X):$L(X)+1,1:INP) D POS
 ;;^MOZ("C",8,1,7,0)=C-G^delete next character
 ;;^MOZ("C",8,1,7,1)=S X=$E(X,1,INP-1)_$E(X,INP+1,999) D POS W $E(X,INP,999)," " D POS
 ;;^MOZ("C",8,1,10,0)=LF^help
 ;;^MOZ("C",8,1,10,1)=S SET=1 D H^%MZINSF,POS
 ;;^MOZ("C",8,1,13,0)=CR^next line
 ;;^MOZ("C",8,1,13,1)=S:%B0'=X ^MOZED($J)=0 S %="X"
 ;;^MOZ("C",8,1,19,0)=C-S^character left
 ;;^MOZ("C",8,1,19,1)=S:INP>1 INP=INP-1 D POS
 ;;^MOZ("C",8,1,20,0)=C-T^delete next word
 ;;^MOZ("C",8,1,20,1)=S IN=$L($P(X," ",1,$L($E(X,1,INP-1)," ")-1))+1,X=$E(X,1,IN-1)_$E(X,INP,999),%1=INP-IN+1,INP=IN D POS W $E(X,INP,999),$J(EMP,%1) K %1 D POS
 ;;^MOZ("C",8,1,21,0)=C-U^abort
 ;;^MOZ("C",8,1,21,1)=S ^MOZED($J)=1,%="X"
 ;;^MOZ("C",8,1,24,0)=C-X^line down
 ;;^MOZ("C",8,1,24,1)=S %="Q"
 ;;^MOZ("C",8,1,25,0)=C-Y^delete rest of line
 ;;^MOZ("C",8,1,25,1)=W $J(EMP,$L(X)+1-INP) S X=$E(X,1,INP-1) D POS
 ;;^MOZ("C",8,1,29,0)=C-]^test
 ;;^MOZ("C",8,1,29,1)=S %SAVE="%Q;%B0;X" D ^MOZPUSH S %Q=">>" D CIP^%MZINSF,^%MZPOP,POS
 ;;^MOZ("C",8,1,127,0)=DEL^delete preceding character
 ;;^MOZ("C",8,1,127,1)=Q:INP<2  S X=$E(X,1,INP-2)_$E(X,INP,999),INP=INP-1 D POS W $E(X,INP,999)," " D POS
 ;

