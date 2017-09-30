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

;%ZGEGL7^INT^1^59547,74037^0
ZGEGLO7 ;;
 ;;^%ZGE("C",10,1,114,1)=S INP=$L(X)+1 D POS
 ;;^%ZGE("C",10,1,116,0)=ADVANCE^forwards^?t
 ;;^%ZGE("C",10,1,116,1)=S A=1
 ;;^%ZGE("C",10,1,117,0)=BACKUP^backup^?u
 ;;^%ZGE("C",10,1,117,1)=S A=0
 ;;^%ZGE("C",10,1,118,0)=DEL C^delete char^?v
 ;;^%ZGE("C",10,1,118,1)=D DNC:A,DPC:'A
 ;;^%ZGE("C",10,1,121,0)=DEL W^delete word^?y
 ;;^%ZGE("C",10,1,121,1)=D DNW:A,DPW:'A
 ;;^%ZGE("C",10,1,127,0)=DEL^delete previous char
 ;;^%ZGE("C",10,1,127,1)=D DPC
 ;;^%ZGE("C",10,1,128,0)=NUL^TIME-OUT
 ;;^%ZGE("C",10,1,128,1)=W *0
 ;;^%ZGE("C",10,3)=0^0^0^^60^31
 ;;^%ZGE("C",10,4)=U 0:(RM:"IS":"")
 ;;^%ZGE("C",10,6)=S BS="$C(8)",FF="#,*27,*72,*27,*74",RM=80,SL=24,XL="W *27,*75",XY="W *27,*89,*DY+32,*DX+32 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^%ZGE("C",11,0)=EDT INPUT
 ;;^%ZGE("C",11,1,0)=^90019.01^81^15
 ;;^%ZGE("C",11,1,13,0)=CR^next line
 ;;^%ZGE("C",11,1,13,1)=D CR
 ;;^%ZGE("C",11,1,27,0)=ESC^(escape functions)
 ;;^%ZGE("C",11,1,27,1)=Q:$L($ZB)<2  X $S($D(%C($E($ZB,2,999))):%C($E($ZB,2,999)),1:"D E")
 ;;^%ZGE("C",11,1,67,0)=RIGHT^character right^[C
 ;;^%ZGE("C",11,1,67,1)=D NC
 ;;^%ZGE("C",11,1,68,0)=LEFT^character left^[D
 ;;^%ZGE("C",11,1,68,1)=D PC
 ;;^%ZGE("C",11,1,81,0)=HELP^help^OQ
 ;;^%ZGE("C",11,1,81,1)=S ^U($J,0)=X,X=^U($J,0,EDCL) D H^%ZGEIN100 S X=^U($J,0)
 ;;^%ZGE("C",11,1,83,0)=DEL L^delete line^OS
 ;;^%ZGE("C",11,1,83,1)=D DNL:A,DPL:'A
 ;;^%ZGE("C",11,1,108,0)=DEL C^delete character^Ol
 ;;^%ZGE("C",11,1,108,1)=D DNC:A,DPC:'A
 ;;^%ZGE("C",11,1,109,0)=DEL W^delete word^Om
 ;;^%ZGE("C",11,1,109,1)=D DNW:A,DPW:'A
 ;;^%ZGE("C",11,1,112,0)=LINE^beg of line^Op
 ;;^%ZGE("C",11,1,112,1)=S INP=1 D POS
 ;;^%ZGE("C",11,1,113,0)=WORD^word move^Oq
 ;;^%ZGE("C",11,1,113,1)=D NW:A,PW:'A
 ;;^%ZGE("C",11,1,114,0)=EOL^end of line^Or
 ;;^%ZGE("C",11,1,114,1)=S INP=$L(X)+1 D POS
 ;;^%ZGE("C",11,1,116,0)=ADVANCE^forwards^Ot

