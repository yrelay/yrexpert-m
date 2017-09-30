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

;%ZGEGL9^INT^1^59547,74037^0
ZGEGLO9 ;;
 ;;^%ZGE("C",12,1,81,1)=D VT100^%ZGEHLP
 ;;^%ZGE("C",12,1,82,0)=FNDNXT^find next^OR
 ;;^%ZGE("C",12,1,82,1)=Q:^ZGEMEM($J)=1  D FNS^%ZGEEDSF
 ;;^%ZGE("C",12,1,83,0)=DEL L^delete line^OS
 ;;^%ZGE("C",12,1,83,1)=Q:^ZGEMEM($J)=1  D DNL:A,DPL:'A
 ;;^%ZGE("C",12,1,108,0)=DEL C^delete character^Ol
 ;;^%ZGE("C",12,1,108,1)=Q:^ZGEMEM($J)=1  D DNC:A,DPC:'A
 ;;^%ZGE("C",12,1,109,0)=DEL W^delete word^Om
 ;;^%ZGE("C",12,1,109,1)=Q:^ZGEMEM($J)=1  D DNW:A,DPW:'A
 ;;^%ZGE("C",12,1,110,0)=SELECT^mark beginning of paste buffer^On
 ;;^%ZGE("C",12,1,110,1)=S EDBB=EDCL_U_EDP
 ;;^%ZGE("C",12,1,112,0)=LINE^beg of line^Op
 ;;^%ZGE("C",12,1,112,1)=D NL:A,PC:'A S EDP=1
 ;;^%ZGE("C",12,1,113,0)=WORD^word move^Oq
 ;;^%ZGE("C",12,1,113,1)=D NW:A,PW:'A
 ;;^%ZGE("C",12,1,114,0)=EOL^end of line^Or
 ;;^%ZGE("C",12,1,114,1)=D NC:A,PL:'A S EDP=$L(X)+1
 ;;^%ZGE("C",12,1,116,0)=ADVANCE^forwards^Ot
 ;;^%ZGE("C",12,1,116,1)=S A=1
 ;;^%ZGE("C",12,1,117,0)=BACKUP^backwards^Ou
 ;;^%ZGE("C",12,1,117,1)=S A=0
 ;;^%ZGE("C",12,1,118,0)=CUT^remove marked region to paste buffer^Ov
 ;;^%ZGE("C",12,1,118,1)=D RB^%ZGEEDSF
 ;;^%ZGE("C",12,1,119,0)=PAGE^next screen^Ow
 ;;^%ZGE("C",12,1,119,1)=D NS^%ZGEEDSF:A,PS^%ZGEEDSF:'A
 ;;^%ZGE("C",12,1,120,0)=SECTION^section^Ox
 ;;^%ZGE("C",12,1,120,1)=D NS^%ZGEEDSF:A,PS^%ZGEEDSF:'A
 ;;^%ZGE("C",12,1,127,0)=DEL^delete preceding character
 ;;^%ZGE("C",12,1,127,1)=Q:^ZGEMEM($J)=1  D DPC
 ;;^%ZGE("C",12,1,128,0)=NUL^TIME-OUT
 ;;^%ZGE("C",12,1,128,1)=S %ALM=$P($H,",",2)+60 D T^%ZGEINSF,POS
 ;;^%ZGE("C",12,2,0)=^90019.02^82^14
 ;;^%ZGE("C",12,2,77,0)=SUBS^find and change string
 ;;^%ZGE("C",12,2,77,1)=Q:^ZGEMEM($J)=1  S EDCLP=EDCL D RS^%ZGEEDSF,FNS^%ZGEEDSF S %=$S(EDRP:3,1:2)
 ;;^%ZGE("C",12,2,82,0)=FIND^find string
 ;;^%ZGE("C",12,2,82,1)=D FQ^%ZGEEDSF S %=0 Q:%C  D FNS^%ZGEEDSF
 ;;^%ZGE("C",12,2,83,0)=UND L^undelete line
 ;;^%ZGE("C",12,2,83,1)=Q:^ZGEMEM($J)=1  D PLL^%ZGEEDSF
 ;;^%ZGE("C",12,2,108,0)=UND C^undelete character
 ;;^%ZGE("C",12,2,108,1)=Q:^ZGEMEM($J)=1  D PLC^%ZGEEDSF
 ;;^%ZGE("C",12,2,109,0)=UND W^undelete word

