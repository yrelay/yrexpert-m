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

;%MZGLO11^INT^1^59762,67043^0
MOZGLO11 ;;05:21 PM  17 Apr 1989; 07 Feb 89  9:13 AM ; 07 Jun 93  4:48 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",11,1,67,1)=D NC
 ;;^MOZ("C",11,1,68,0)=LEFT^character left^[D
 ;;^MOZ("C",11,1,68,1)=D PC
 ;;^MOZ("C",11,1,81,0)=HELP^help^OQ
 ;;^MOZ("C",11,1,81,1)=S @%TT@($J,0)=X,X=@%TT@($J,0,EDCL) D H^MOZIN100 S X=@%TT@($J,0)
 ;;^MOZ("C",11,1,83,0)=DEL L^delete line^OS
 ;;^MOZ("C",11,1,83,1)=D DNL:A,DPL:'A
 ;;^MOZ("C",11,1,108,0)=DEL C^delete character^Ol
 ;;^MOZ("C",11,1,108,1)=D DNC:A,DPC:'A
 ;;^MOZ("C",11,1,109,0)=DEL W^delete word^Om
 ;;^MOZ("C",11,1,109,1)=D DNW:A,DPW:'A
 ;;^MOZ("C",11,1,112,0)=LINE^beg of line^Op
 ;;^MOZ("C",11,1,112,1)=S INP=1 D POS
 ;;^MOZ("C",11,1,113,0)=WORD^word move^Oq
 ;;^MOZ("C",11,1,113,1)=D NW:A,PW:'A
 ;;^MOZ("C",11,1,114,0)=EOL^end of line^Or
 ;;^MOZ("C",11,1,114,1)=S INP=$L(X)+1 D POS
 ;;^MOZ("C",11,1,116,0)=ADVANCE^forwards^Ot
 ;;^MOZ("C",11,1,116,1)=S A=1
 ;;^MOZ("C",11,1,117,0)=BACKUP^backwards^Ou
 ;;^MOZ("C",11,1,117,1)=S A=0
 ;;^MOZ("C",11,1,127,0)=DEL^delete preceding character
 ;;^MOZ("C",11,1,127,1)=D DPC
 ;;^MOZ("C",11,1,128,0)=NUL^TIME-OUT
 ;;^MOZ("C",11,1,128,1)=W *0
 ;;^MOZ("C",11,3)=0^0^0^^60^31
 ;;^MOZ("C",11,4)=U 0
 ;;^MOZ("C",11,6)=S BS="$C(8)",FF="#,*27,*91,*50,*74,*27,*91,*72",RM=80,SL=24,XL="W *27,*91,*75",XY="S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^MOZ("C",12,0)=Mozart
 ;;^MOZ("C",12,1,0)=^90019.01^17^29
 ;;^MOZ("C",12,1,1,0)=CTRLA^Abandon^CTRLA
 ;;^MOZ("C",12,1,1,1)=D NORM^%VVIDEO S DX=2,DY=21 X XY W "commande: ABANDON" D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Sortie immediate"),"N") D POCLEPA^%VVIDEO Q:(REP=0)!(REP=-1)  S %="Q"
 ;;^MOZ("C",12,1,6,0)=CTRLF^Sauvegarde et sort^CTRLF
 ;;^MOZ("C",12,1,6,1)=D NORM^%VVIDEO S DY=21,DX=2 X XY W "commande: FIN    " D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Confirmation "),"N") D POCLEPA^%VVIDEO Q:(REP=0)!(REP=-1)  S %SA=1,@%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X D SAV^%MZWORD S %="Q",%SA=0
 ;;^MOZ("C",12,1,9,0)=TAB^tabulation
 ;

