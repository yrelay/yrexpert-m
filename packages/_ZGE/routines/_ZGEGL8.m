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

;%ZGEGL8^INT^1^59547,74037^0
ZGEGLO8 ;;
 ;;^%ZGE("C",11,1,116,1)=S A=1
 ;;^%ZGE("C",11,1,117,0)=BACKUP^backwards^Ou
 ;;^%ZGE("C",11,1,117,1)=S A=0
 ;;^%ZGE("C",11,1,127,0)=DEL^delete preceding character
 ;;^%ZGE("C",11,1,127,1)=D DPC
 ;;^%ZGE("C",11,1,128,0)=NUL^TIME-OUT
 ;;^%ZGE("C",11,1,128,1)=W *0
 ;;^%ZGE("C",11,3)=0^0^0^^60^31
 ;;^%ZGE("C",11,4)=U 0:(RM:"S":"")
 ;;^%ZGE("C",11,6)=S BS="$C(8)",FF="#,*27,*91,*50,*74,*27,*91,*72",RM=80,SL=24,XL="W *27,*91,*75",XY="S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^%ZGE("C",12,0)=EDT Simulator
 ;;^%ZGE("C",12,1,0)=^90019.01^17^29
 ;;^%ZGE("C",12,1,9,0)=TAB^tabulation
 ;;^%ZGE("C",12,1,9,1)=D TAB^%ZGEEDSF
 ;;^%ZGE("C",12,1,13,0)=CR^new line
 ;;^%ZGE("C",12,1,13,1)=Q:^ZGEMEM($J)=1  D CR
 ;;^%ZGE("C",12,1,17,0)=C-Q^repeat
 ;;^%ZGE("C",12,1,17,1)=S ^U($J,0,EDCL)=X,$P(%ED,U,1)=%EDI,%Q="How many times ",X=EMP D SET^%ZGEINSF,^%ZGEIN W " " S EDRP=X,X=^U($J,0,EDCL),$P(%ED,U,1)=%EDE D SET^%ZGEINSF S %=$S(EDRP:"R",1:0)
 ;;^%ZGE("C",12,1,20,0)=C-T^time
 ;;^%ZGE("C",12,1,20,1)=D T^%ZGEINSF
 ;;^%ZGE("C",12,1,22,0)=C-V^overstrike mode on/off
 ;;^%ZGE("C",12,1,22,1)=S EDOV='EDOV D STAT^%ZGEWORD
 ;;^%ZGE("C",12,1,23,0)=C-W^refresh screen
 ;;^%ZGE("C",12,1,23,1)=Q:^ZGEMEM($J)=1  D RF
 ;;^%ZGE("C",12,1,26,0)=C-Z^command mode
 ;;^%ZGE("C",12,1,26,1)=D C^%ZGEHLP
 ;;^%ZGE("C",12,1,27,0)=ESC^(escape functions)
 ;;^%ZGE("C",12,1,27,1)=Q:$L($ZB)<2  X $S($D(%C($E($ZB,2,999))):%C($E($ZB,2,999)),1:"D E")
 ;;^%ZGE("C",12,1,65,0)=UP^line up^[A
 ;;^%ZGE("C",12,1,65,1)=D PL
 ;;^%ZGE("C",12,1,66,0)=DOWN^line down^[B
 ;;^%ZGE("C",12,1,66,1)=D NL
 ;;^%ZGE("C",12,1,67,0)=RIGHT^character right^[C
 ;;^%ZGE("C",12,1,67,1)=D NC
 ;;^%ZGE("C",12,1,68,0)=LEFT^character left^[D
 ;;^%ZGE("C",12,1,68,1)=D PC
 ;;^%ZGE("C",12,1,77,0)=ENTER^command mode^OM
 ;;^%ZGE("C",12,1,77,1)=D C^%ZGEHLP
 ;;^%ZGE("C",12,1,80,0)=GOLD^GOLD functions^OP
 ;;^%ZGE("C",12,1,80,1)=S DX=0,DY=EDSL+2 X XY W "GOLD " X XL R *ED:%BF(5) Q:ED'=27  S ED=$D(^%ZGE("C",+%ED,2,$A($E($ZB,$L($ZB))),1))#2 W:'ED *7 X:ED ^(1)
 ;;^%ZGE("C",12,1,81,0)=HELP^help^OQ

