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

;%MZGLO3^INT^1^59547,73871^0
MOZGLO3 ;; ; 07 Jun 93  4:46 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",6,2,3,1)=S @%TT@($J,0,EDCL)=X F %0=0:0 S EDN=$O(^(EDCL)) S:EDN EDCL=EDN I 'EDN S X=@%TT@($J,0,EDCL),EDP=$L(X)+1 D MS^%MZEDSF Q
 ;;^MOZ("C",6,2,4,0)=C-D^go to end of line
 ;;^MOZ("C",6,2,4,1)=S EDP=$L(X)+1
 ;;^MOZ("C",6,2,5,0)=C-E^go to beginning of screen
 ;;^MOZ("C",6,2,5,1)=S EDN=EDFL,EDP=1 D X
 ;;^MOZ("C",6,2,6,0)=C-F^find string
 ;;^MOZ("C",6,2,6,1)=D FQ^%MZEDSF S %=0 Q:^MOZED($J)  D FNS^%MZEDSF
 ;;^MOZ("C",6,2,9,0)=TAB^remove tabulation
 ;;^MOZ("C",6,2,9,1)=S ED=$E(X,EDP-1)=" " D:'ED E I ED F ED=0:0 S X=$E(X,1,EDP-2)_$E(X,EDP,999),EDP=EDP-1 I '(EDP#8)!($E(X,EDP-1)'=" ") S %=1 Q
 ;;^MOZ("C",6,2,10,0)=LF^C-Q functions help
 ;;^MOZ("C",6,2,10,1)=D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",6,2,11,0)=C-K^go to end of block
 ;;^MOZ("C",6,2,11,1)=S ED=$S($D(EDBE):EDBE,1:EMP) D FB^%MZEDSF
 ;;^MOZ("C",6,2,17,0)=C-Q^repeat next command
 ;;^MOZ("C",6,2,17,1)=S @%TT@($J,0,EDCL)=X,$P(%ED,U,1)=%EDI,%Q="Toistojen lukum{{r{ ",X=EMP D SET^%MZINSF,^%MZIN W " " S EDRP=X,X=@%TT@($J,0,EDCL),$P(%ED,U,1)=%EDE D SET^%MZINSF S %=$S(EDRP:"R",1:0)
 ;;^MOZ("C",6,2,18,0)=C-R^go to beginning of file
 ;;^MOZ("C",6,2,18,1)=S (EDFL,EDN)=$O(@%TT@($J,0,0)),EDP=1 D X,RF
 ;;^MOZ("C",6,2,19,0)=C-S^go to beginning of line
 ;;^MOZ("C",6,2,19,1)=S EDP=1
 ;;^MOZ("C",6,2,21,0)=C-U^abort
 ;;^MOZ("C",6,2,21,1)=Q
 ;;^MOZ("C",6,2,24,0)=C-X^go to end of screen
 ;;^MOZ("C",6,2,24,1)=S EDN=EDFL F ED=0:0 S ED=$O(ED(EDN)) S:ED EDN=ED I 'ED S EDP=1 D X Q
 ;;^MOZ("C",6,2,25,0)=C-Y^remove last line
 ;;^MOZ("C",6,2,25,1)=D DNL
 ;;^MOZ("C",6,2,32,0)=SPACE^cancel
 ;;^MOZ("C",6,2,32,1)=Q
 ;;^MOZ("C",6,2,127,0)=DEL^remove first line
 ;;^MOZ("C",6,2,127,1)=D DPL
 ;;^MOZ("C",6,2,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",6,2,128,1)=Q
 ;

