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

;%TXOPTET1^INT^1^59547,74031^0
%TXOPTET1(ETUDE,ATELIER,ARTICLE) 
 
 S PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)",dmd="^[QUI]demande(ETUDE,ATELIER,ARTICLE)"
 S QMINC="^[QUI]qminc(PB,ATELIER,ARTICLE)"
 S QMAXC="^[QUI]qmaxc(PB,ATELIER,ARTICLE)"
 S RMINC="^[QUI]rminc(PB,ATELIER,ARTICLE)"
 S RMAXC="^[QUI]rmaxc(PB,ATELIER,ARTICLE)"
 S QMINP="^[QUI]qminpb(ETUDE,ATELIER,ARTICLE)"
 S QMAXP="^[QUI]qmaxpb(ETUDE,ATELIER,ARTICLE)"
 S RMINP="^[QUI]rminpb(ETUDE,ATELIER,ARTICLE)"
 S RMAXP="^[QUI]rmaxpb(ETUDE,ATELIER,ARTICLE)"
 S qmax1="^[QUI]qmax1(ATELIER,ARTICLE)"
 S qmax2="^[QUI]qmax2(ATELIER,ARTICLE)"
 S stp="^[QUI]stp(ATELIER,ARTICLE)"
 ;;
 W !,ARTICLE," taille d'un lot (conteneur) : " R lot S:lot="" lot=250 S ^[QUI]taillelot(ATELIER,ARTICLE)=lot
 W !,ARTICLE," taille d 'un lot de lancement : " R qlot S:qlot="" qlot=3000 S ^[QUI]taillelan(ATELIER,ARTICLE)=qlot
 
 W !,ARTICLE," quantite produite par heure : " R qmh S ^[QUI]qmh(ATELIER,ARTICLE)=qmh
 S PMAX=@etu@("PMAX")
 
 ;; demande dans ^[QUI]DEMANDE
 D SAISIE("^[QUI]DEMANDE(ATELIER,ARTICLE)"," demande ","")
 S @dmd@(t+1)=0
 ;; stock---
 S TAB="^[QUI]RMINC(ATELIER,ARTICLE)"
 D SAISIE("^[QUI]RMINC(ATELIER,ARTICLE)"," stock mini ","")
 D SAISIE("^[QUI]RMAXC(ATELIER,ARTICLE)"," stock maxi ","")
 ;;--- production---
 D SAISIE("^[QUI]QMINC(ATELIER,ARTICLE)"," production mini ","")
 D SAISIE("^[QUI]QMAXC(ATELIER,ARTICLE)"," production maxi ","")
 D SAISIE("^[QUI]qmax1(ATELIER,ARTICLE)"," niveau maxi de production a cout normal ","")
 F t=1:1:PMAX S ^[QUI]qmax2(ATELIER,ARTICLE,t)=10*^[QUI]qmax1(ATELIER,ARTICLE,t)
 
 S stp=@etu@("COUT.LANCEMENT") W !,!," cout de lancement : ",stp S ^[QUI]stp(ATELIER,ARTICLE)=stp
 S cst=@etu@("COUT.STOCKAGE") W !,!," cout de stockage(% valeur) : ",cst S ^[QUI]cst(ATELIER,ARTICLE)=cst
 S cpn=@etu@("COUT.PROD.NORMALE"),cpex=@etu@("COUT.PROD.EXCEP")
 D SAISIE("^[QUI]cp1(ATELIER,ARTICLE)"," cout de production normale ",cpn)
 D SAISIE("^[QUI]cp2(ATELIER,ARTICLE)"," cout de production exceptionnelle ",cpex)
 
 
hyp 
 S hyp=@etu@("HYP") W !,!,!,!," hypothese de simulation : ",hyp
 I (hyp=1)!(hyp="") G HYP1
 I hyp=2 G HYP2
 
 
 Q
HYP1 ;;
 
 F t=1:1:PMAX S @dmd@(t)=^[QUI]DEMANDE(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S c=(@dmd@(t)#lot)=0,@dmd@(t)=((@dmd@(t)\lot)*lot)+((1-c)*lot)
 
 F t=1:1:PMAX S @QMINP@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S @QMAXP@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S @RMINP@(t)=^[QUI]RMINC(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S @RMAXP@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 Q
HYP2 ;;
 
 F t=1:1:PMAX S @dmd@(t)=^[QUI]DEMANDE(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S c=(@dmd@(t)#lot)=0,@dmd@(t)=((@dmd@(t)\lot)*lot)+((1-c)*lot)
 
 
 F t=1:1:PMAX S @QMINP@(t)=^[QUI]QMINC(ATELIER,ARTICLE,t)*qmh
 
 F t=1:1:PMAX S @QMAXP@(t)=^[QUI]QMAXC(ATELIER,ARTICLE,t)*qmh
 
 
 
 F t=1:1:PMAX S @RMAXP@(t)=^[QUI]RMAXC(ATELIER,ARTICLE,t)*qmh
 Q
 
ACTIV 
 
 Q
 Q
 Q
 
 
DEFAUT(TAB,t,q) 
 
 I q="" S q=@TAB@(t-1)
 S @TAB@(t)=q
 Q
SAISIE(TAB,message,VAL) 
 ;; saisie de  valeurs sur une periode de simulation
 ;; si VAL n'est pas vide on prend val
 ;; en cours de lecture return => prendre la valeur precedente
 W #
 W "*** ",ATELIER,"  ",ARTICLE,"***","    ",message,!,!,!
 F t=1:1:PMAX W !,message_" en semaine "_t_" : " D read,DEFAUT(TAB,t,q)
 Q
read I VAL'="" S q=VAL W " ",VAL Q
 R q
 Q
 ;

