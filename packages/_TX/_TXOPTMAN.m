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

;%TXOPTMAN^INT^1^59547,74032^0
%TXOPTMAN ;
 
 
 D recharge G hyp
recharge 
 S PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)",dmd="^[QUI]demande"
 S QMINC="^[QUI]qminc(PB,ATELIER,ARTICLE)"
 S QMAXC="^[QUI]qmaxc(PB,ATELIER,ARTICLE)"
 S RMINC="^[QUI]rminc(PB,ATELIER,ARTICLE)"
 S RMAXC="^[QUI]rmaxc(PB,ATELIER,ARTICLE)"
 S QMINP="^[QUI]qminpb(PB,ATELIER,ARTICLE)"
 S QMAXP="^[QUI]qmaxpb(PB,ATELIER,ARTICLE)"
 S RMINP="^[QUI]rminpb(PB,ATELIER,ARTICLE)"
 S RMAXP="^[QUI]rmaxpb(PB,ATELIER,ARTICLE)"
 S qmax1="^[QUI]qmax1(ATELIER,ARTICLE)"
 S qmax2="^[QUI]qmax2(ATELIER,ARTICLE)"
 S stp="^[QUI]stp(ATELIER,ARTICLE)"
 ;;
 
 S PB=$ZP(@dmd@("")),ATELIER=$ZP(@dmd@(PB,"")),ARTICLE=$ZP(@dmd@(PB,ATELIER,""))
 
 W !,!," article : ",ARTICLE
 W !,!," atelier : ",ATELIER S:ATELIER="" ATELIER="MECANIQUE"
 W !,!," taille d'un lot (conteneur) : ",^[QUI]taillelot(ATELIER,ARTICLE) S lot=^[QUI]taillelot(ATELIER,ARTICLE)
 W !,!," taille d 'un lot de lancement : ",^[QUI]taillelan(ATELIER,ARTICLE)
 W !,!," quantite produite par heure : ",^[QUI]qmh(ATELIER,ARTICLE)
 S qmh=^[QUI]qmh(ATELIER,ARTICLE)
 S dmd="^[QUI]demande(PB,ATELIER,ARTICLE)"
 
 S PMAX=23
 
 ;; demande dans ^[QUI]DEMANDE
 ;; stock---
 S TAB="^[QUI]RMINC(ATELIER,ARTICLE)"
 ;;--- production---
 
 W !,!," cout de lancement : ",^[QUI]stp(ATELIER,ARTICLE)
 W !,!," cout de stockage(% valeur) : ",^[QUI]cst(ATELIER,ARTICLE)
 Q
 
 
hyp 
 W !,!,!,!," hypothese de simulation : " R hyp
 I (hyp=1)!(hyp="") G HYP1
 I hyp=2 G HYP2
 
 
 Q
HYP1 ;;
 
 F t=1:1:PMAX S @dmd@(t)=^[QUI]DEMANDE(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S c=(@dmd@(t)#lot)=0,@dmd@(t)=((@dmd@(t)\lot)*lot)+((1-c)*lot)
 F t=1:1:PMAX S @QMINC@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMINP@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMAXC@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMAXP@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMINC@(t)=^[QUI]RMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMINP@(t)=^[QUI]RMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMAXC@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMAXP@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 D ACTIV G hyp
HYP2 ;;
 
 F t=1:1:PMAX S @dmd@(t)=^[QUI]DEMANDE(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S c=(@dmd@(t)#lot)=0,@dmd@(t)=((@dmd@(t)\lot)*lot)+((1-c)*lot)
 F t=1:1:PMAX S @QMINC@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMINP@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMAXC@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @QMAXP@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMINC@(t)=^[QUI]RMINC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMINP@(t)=@dmd@(t) W !,t," ",@RMINP@(t)
 F t=1:1:PMAX S @RMAXC@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 F t=1:1:PMAX S @RMAXP@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 D ACTIV G hyp
 
ACTIV 
 
 D ^%TXOPT1(PB,ATELIER,ARTICLE,PMAX)
 D ^%TXOPT11(PB,ATELIER,ARTICLE,0)
 Q
 
 
DEFAUT(TAB,t,q) 
 
 I q="" S q=@TAB@(t-1)
 S @TAB@(t)=q
 Q
SAISIE(TAB,message) 
 ;; saisie de  valeurs sur une periode
 W #
 W "*** ",ATELIER,"  ",ARTICLE,"***","    ",message,!,!,!
 F t=1:1:PMAX W !,message_" en semaine "_t_" : " R q D DEFAUT(TAB,t,q)
 Q
 ;

