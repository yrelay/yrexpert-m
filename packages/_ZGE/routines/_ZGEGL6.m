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

;%ZGEGL6^INT^1^59547,74037^0
ZGEGLO6 ;;
 ;;^%ZGE("C",9,2,119,1)=D C^%ZGEHLP
 ;;^%ZGE("C",9,2,120,0)=FIND^find string
 ;;^%ZGE("C",9,2,120,1)=D FQ^%ZGEEDSF S %=0 Q:%C  D FNS^%ZGEEDSF
 ;;^%ZGE("C",9,2,121,0)=UND W^undelete word
 ;;^%ZGE("C",9,2,121,1)=D PLW^%ZGEEDSF
 ;;^%ZGE("C",9,3)=0^0^0^^60^31
 ;;^%ZGE("C",9,4)=U 0:(RM:"IS":"")
 ;;^%ZGE("C",9,5,0)=^90019.03^27^6
 ;;^%ZGE("C",9,5,5,0)=EXIT^save file and exit
 ;;^%ZGE("C",9,5,5,1)=W "EXIT" S ^U($J,0,EDCL)=X D SAV^%ZGEWORD S %="Q"
 ;;^%ZGE("C",9,5,8,0)=HELP^help
 ;;^%ZGE("C",9,5,8,1)=W "HELP" S SET=5 D H^%ZGEINSF S EDLL=EDSL,%=3
 ;;^%ZGE("C",9,5,17,0)=QUIT^quit without saving file
 ;;^%ZGE("C",9,5,17,1)=W "QUIT" S %="Q"
 ;;^%ZGE("C",9,5,18,0)=READ^read new file
 ;;^%ZGE("C",9,5,18,1)=W "READ" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  D LOAD^%ZGEWORD S %="S"
 ;;^%ZGE("C",9,5,23,0)=WRITE^output text to new file
 ;;^%ZGE("C",9,5,23,1)=W "WRITE" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  S ^U($J,0,EDCL)=X D SAV^%ZGEWORD S X=^U($J,0,EDCL),%=0
 ;;^%ZGE("C",9,5,27,0)=ESC^help
 ;;^%ZGE("C",9,5,27,1)=W "HELP" S SET=5 D H^%ZGEINSF S EDLL=EDSL,%=3
 ;;^%ZGE("C",9,6)=S BS="$C(8)",FF="#,*27,*72,*27,*74",RM=80,SL=24,XL="W *27,*75",XY="W *27,*89,*DY+32,*DX+32 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^%ZGE("C",9,7)=K A W *27,">"
 ;;^%ZGE("C",10,0)=EDT INPUT
 ;;^%ZGE("C",10,1,0)=^90019.01^81^15
 ;;^%ZGE("C",10,1,13,0)=CR^next line
 ;;^%ZGE("C",10,1,13,1)=D CR
 ;;^%ZGE("C",10,1,27,0)=ESC^(escape functions)
 ;;^%ZGE("C",10,1,27,1)=Q:$L($ZB)<2  X $S($D(%C($E($ZB,2,999))):%C($E($ZB,2,999)),1:"D E")
 ;;^%ZGE("C",10,1,67,0)=RIGHT^char right^C
 ;;^%ZGE("C",10,1,67,1)=D NC
 ;;^%ZGE("C",10,1,68,0)=LEFT^char left^D
 ;;^%ZGE("C",10,1,68,1)=D PC
 ;;^%ZGE("C",10,1,81,0)=HELP^help^Q
 ;;^%ZGE("C",10,1,81,1)=S ^U($J,0)=X,X=^U($J,0,EDCL) D H^%ZGEIN52 S X=^U($J,0)
 ;;^%ZGE("C",10,1,82,0)=DEL L^delete line^R
 ;;^%ZGE("C",10,1,82,1)=D DNL:A,DPL:'A
 ;;^%ZGE("C",10,1,112,0)=LINE^beg of line^?p
 ;;^%ZGE("C",10,1,112,1)=S INP=1 D POS
 ;;^%ZGE("C",10,1,113,0)=WORD^move word^?q
 ;;^%ZGE("C",10,1,113,1)=D NW:A,PW:'A
 ;;^%ZGE("C",10,1,114,0)=EOL^goto eol^?r

