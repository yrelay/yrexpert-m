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

;%MZGLO12^INT^1^59762,67077^0
MOZGLO12 ;;05:53 PM  28 Jun 1990; 07 Feb 89  9:13 AM ; 07 Jun 93  4:48 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",12,1,5,0)=CTRLL E^forcer une ligne action^CTRE
 ;;^MOZ("C",12,1,5,1)=D ^%VSQUEAK ;S XOP=2,^U($J,0,EDCL)=XOP_"^"_X,%=1 D BLD^%VVIDEO
 ;;^MOZ("C",12,1,7,0)=CTRL G^delete line^CTRLG
 ;;^MOZ("C",12,1,7,1)=Q:^MOZMEM($J)=1  D DNL:A,DPL:'A D NORM^%VVIDEO,SUP^%MZLIEN2
 ;;^MOZ("C",12,1,8,0)=CTRL H^help^CTRLH
 ;;^MOZ("C",12,1,8,1)=D ^%MZHLP1
 ;;^MOZ("C",12,1,9,0)=CTRL I^tabulation^CTRLI
 ;;^MOZ("C",12,1,9,1)=Q  ;D TAB^%MZEDSF       
 ;;^MOZ("C",12,1,10,0)=CTRL J^impression^CTRLJ
 ;;^MOZ("C",12,1,10,1)=D ^%MZIMPGA(PGM)
 ;;^MOZ("C",12,1,14,0)=CTRL N^forcer une ligne commentaire^CTRLN
 ;;^MOZ("C",12,1,14,1)=D ^%VSQUEAK ;S XOP=0,^U($J,0,EDCL)=XOP_"^"_X,%=1 D NORM^%VVIDEO
 ;;^MOZ("C",12,1,18,0)=C-R^refresh screen^CTRLR
 ;;^MOZ("C",12,1,18,1)=D NORM^%VVIDEO,STAT1^%MZWORD,RF
 ;;^MOZ("C",12,1,12,0)=CTRL L^Creer une ligne^CTRLL
 ;;^MOZ("C",12,1,12,1)=D NORM^%VVIDEO,CR2
 ;;^MOZ("C",12,1,13,0)=CR^new line^RETURN
 ;;^MOZ("C",12,1,13,1)=D CR
 ;;^MOZ("C",12,1,17,0)=C-Q^repeat^CTRLQ
 ;;^MOZ("C",12,1,17,1)=S @%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X,$P(%ED,U,1)=%EDI,%Q="How many times ",X=EMP D SET^%MZINSF,^%MZIN W " " S EDRP=X,X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1),$P(%ED,U,1)=%EDE D SET^%MZINSF S %=$S(EDRP:"R",1:0)
 ;;^MOZ("C",12,1,11,0)=C-K^heure^CTRLK
 ;;^MOZ("C",12,1,11,1)=D NORM^%VVIDEO D T^%MZINSF ;D:XOP=1!(XOP=2) @("BLD^%VVIDEO"_$S(XOP=2:"",1:",REV^%VVIDEO"))
 ;;^MOZ("C",12,1,22,0)=C-V^overstrike mode on/off^CTRLV
 ;;^MOZ("C",12,1,22,1)=S EDOV='EDOV D STAT^%MZWORD
 ;;^MOZ("C",12,1,23,0)=CTRL W^forcer une ligne Operation^CTRLW
 ;;^MOZ("C",12,1,23,1)=D ^%VSQUEAK ;S XOP=1,^U($J,0,EDCL)=XOP_"^"_X,%=1 D REV^%VVIDEO,BLD^%VVIDEO
 ;;^MOZ("C",12,1,26,0)=C-Z^command mode^CTRLZ
 ;;^MOZ("C",12,1,26,1)=D C^%MZHLP
 ;;^MOZ("C",12,1,27,0)=ESC^(escape functions)
 ;;^MOZ("C",12,1,27,1)=Q:$L($ZB)<2  X $S($D(^MOZED($J,$E($ZB,2,999))):^MOZED($J,$E($ZB,2,999)),1:"D E")
 ;;^MOZ("C",12,1,65,0)=UP^line up^H
 ;;^MOZ("C",12,1,65,1)=D PL
 ;;^MOZ("C",12,1,66,0)=DOWN^line down^B
 ;;^MOZ("C",12,1,66,1)=D NL
 ;;^MOZ("C",12,1,67,0)=RIGHT^character right^D
 ;;^MOZ("C",12,1,67,1)=D NC
 ;;^MOZ("C",12,1,68,0)=LEFT^character left^G
 ;;^MOZ("C",12,1,68,1)=D PC
 ;;^MOZ("C",12,1,"ENTER",0)=ENTER^command mode^OM
 ;;^MOZ("C",12,1,"ENTER",1)=D C^%MZHLP
 ;;^MOZ("C",12,1,80,0)=GOLD^GOLD functions^PF1
 ;;^MOZ("C",12,1,80,1)=D GOLD,PF1^%MZIN  ; R *ED:^TOZE($I,"ATTENTE") Q:ED'=27  S ED=$D(^MOZ("C",+%ED,2,$A($E($ZB,$L($ZB))),1))#2 D:'ED ^%VSQUEAK X:ED ^(1)
 ;;^moz("C",12,1,80,1)=S DX=0,DY=EDSL+2 X XY W "GOLD " X XL R *ED:^TOZE($I,"ATTENTE") Q:ED'=27  S ED=$D(^MOZ("C",+%ED,2,$A($E($ZB,$L($ZB))),1))#2 D:'ED ^%VSQUEAK X:ED ^(1)
 ;;^MOZ("C",12,1,81,0)=HELP^help^PF2
 ;;^MOZ("C",12,1,81,1)=Q:^MOZMEM($J)=1  D VT100^%MZHLP
 ;;^MOZ("C",12,1,82,0)=FNDNXT^find next^PF3
 ;;^MOZ("C",12,1,82,1)=Q:^MOZMEM($J)=1  D FNS^%MZEDSF
 ;

