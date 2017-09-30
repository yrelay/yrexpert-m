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

;%MZGLO9^INT^1^59547,73872^0
MOZGLO9 ;; ; 07 Jun 93  4:47 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",9,2,120,1)=D FQ^%MZEDSF S %=0 Q:^MOZED($J)  D FNS^%MZEDSF
 ;;^MOZ("C",9,2,121,0)=UND W^undelete word
 ;;^MOZ("C",9,2,121,1)=D PLW^%MZEDSF
 ;;^MOZ("C",9,3)=0^0^0^^60^31
 ;;^MOZ("C",9,4)=U 0:(RM:"IS":"")
 ;;^MOZ("C",9,5,0)=^90019.03^27^6
 ;;^MOZ("C",9,5,5,0)=EXIT^save file and exit
 ;;^MOZ("C",9,5,5,1)=W "EXIT" S @%TT@($J,0,EDCL)=X D SAV^%MZWORD S %="Q"
 ;;^MOZ("C",9,5,8,0)=HELP^help
 ;;^MOZ("C",9,5,8,1)=W "HELP" S SET=5 D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",9,5,17,0)=QUIT^quit without saving file
 ;;^MOZ("C",9,5,17,1)=W "QUIT" S %="Q"
 ;;^MOZ("C",9,5,18,0)=READ^read new file
 ;;^MOZ("C",9,5,18,1)=W "READ" D FILE^%MZWORD S %=0 Q:PGM=EMP  D LOAD^%MZWORD S %="S"
 ;;^MOZ("C",9,5,23,0)=WRITE^output text to new file
 ;;^MOZ("C",9,5,23,1)=W "WRITE" D FILE^%MZWORD S %=0 Q:PGM=EMP  S @%TT@($J,0,EDCL)=X D SAV^%MZWORD S X=@%TT@($J,0,EDCL),%=0
 ;;^MOZ("C",9,5,27,0)=ESC^help
 ;;^MOZ("C",9,5,27,1)=W "HELP" S SET=5 D H^%MZINSF S EDLL=EDSL,%=3
 ;;^MOZ("C",9,6)=S BS="$C(8)",FF="#,*27,*72,*27,*74",RM=80,SL=24,XL="W *27,*75",XY="W *27,*89,*DY+32,*DX+32 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^MOZ("C",9,7)=K A W *27,">"
 ;;^MOZ("C",10,0)=EDT INPUT
 ;;^MOZ("C",10,1,0)=^90019.01^81^15
 ;;^MOZ("C",10,1,13,0)=CR^next line
 ;;^MOZ("C",10,1,13,1)=D CR
 ;;^MOZ("C",10,1,27,0)=ESC^(escape functions)
 ;;^MOZ("C",10,1,27,1)=Q:$L($ZB)<2  X $S($D(^MOZED($J,$E($ZB,2,999))):^MOZED($J,$E($ZB,2,999)),1:"D E")
 ;;^MOZ("C",10,1,67,0)=RIGHT^char right^C
 ;;^MOZ("C",10,1,67,1)=D NC
 ;;^MOZ("C",10,1,68,0)=LEFT^char left^D
 ;;^MOZ("C",10,1,68,1)=D PC
 ;;^MOZ("C",10,1,81,0)=HELP^help^Q
 ;

