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

;%MZGLO4^INT^1^59762,67473^0
MOZGLO4 ;; ; 07 Jun 93  4:46 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",6,3)=0^0^0^^60^31
 ;;^MOZ("C",6,4)=U 0:(RM:"IS":$C(27))
 ;;^MOZ("C",6,5,0)=^90019.03^21^14
 ;;^MOZ("C",6,5,2,0)=C-B^mark beginning of block
 ;;^MOZ("C",6,5,2,1)=S EDBB=EDCL_U_EDP
 ;;^MOZ("C",6,5,3,0)=C-C^copy block
 ;;^MOZ("C",6,5,3,1)=D WB^%MZEDSF
 ;;^MOZ("C",6,5,4,0)=C-D^save file and read new one
 ;;^MOZ("C",6,5,4,1)=S @%TT@($J,0,EDCL)=X D SAV^%MZWORD,FILE^%MZWORD,LOAD^%MZWORD S %="S"
 ;;^MOZ("C",6,5,5,0)=C-E^change file name
 ;;^MOZ("C",6,5,5,1)=D FILE^%MZWORD S %=0
 ;;^MOZ("C",6,5,10,0)=LF^C-K functions help
 ;;^MOZ("C",6,5,10,1)=D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",6,5,11,0)=C-K^mark end of block
 ;;^MOZ("C",6,5,11,1)=S EDBE=EDCL_U_EDP
 ;;^MOZ("C",6,5,17,0)=C-Q^exit without saving file
 ;;^MOZ("C",6,5,17,1)=S %="Q"
 ;;^MOZ("C",6,5,18,0)=C-R^read new file
 ;;^MOZ("C",6,5,18,1)=D FILE^%MZWORD,LOAD^%MZWORD S %="S"
 ;;^MOZ("C",6,5,19,0)=C-S^save file and continue
 ;;^MOZ("C",6,5,19,1)=S @%TT@($J,0,EDCL)=X D SAV^%MZWORD S X=@%TT@($J,0,EDCL),%=0
 ;;^MOZ("C",6,5,21,0)=C-U^abort
 ;;^MOZ("C",6,5,21,1)=Q
 ;;^MOZ("C",6,5,24,0)=C-X^save file and exit
 ;;^MOZ("C",6,5,24,1)=S @%TT@($J,0,EDCL)=X D SAV^%MZWORD S %="Q"
 ;;^MOZ("C",6,5,25,0)=C-Y^remove block
 ;;^MOZ("C",6,5,25,1)=D RB^%MZEDSF
 ;;^MOZ("C",6,5,32,0)=SPACE^cancel
 ;;^MOZ("C",6,5,32,1)=Q
 ;;^MOZ("C",6,5,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",6,5,128,1)=Q
 ;

