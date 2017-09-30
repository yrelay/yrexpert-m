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

;%MZGLO14^INT^1^59547,73871^0
MOZGLO14 ;;11:48 AM  29 Dec 1989; 03 Mar 89  9:04 AM ; 07 Jun 93  4:48 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",12,2,"PF1-PF2",0)=^132 colonnes
 ;;^MOZ("C",12,2,"PF1-PF2",1)=D ^%VSQUEAK,NORM^%VVIDEO  ;D ^%MZHLP2
 ;;^MOZ("C",12,2,"PF1-PF3",0)=FIND^find string
 ;;^MOZ("C",12,2,"PF1-PF3",1)=D FQ^%MZEDSF S %=0 Q:^MOZED($J)  D FNS^%MZEDSF
 ;;^MOZ("C",12,2,"PF1-PF4",0)=UND L^undelete line
 ;;^MOZ("C",12,2,"PF1-PF4",1)=Q:^MOZMEM($J)=1  Q:(XOP=1!(XOP=2))  D PLL^%MZEDSF
 ;;^MOZ("C",12,2,"PF1-'",0)=UND C^undelete character
 ;;^MOZ("C",12,2,"PF1-'",1)=Q:(XOP=1!(XOP=2))  D PLC^%MZEDSF
 ;;^MOZ("C",12,2,"PF1--",0)=UND W^undelete word
 ;;^MOZ("C",12,2,"PF1--",1)=Q:(XOP=1!(XOP=2))  D PLW^%MZEDSF
 ;;^MOZ("C",12,2,110,0)=RESET^reset
 ;;^MOZ("C",12,2,"PF1-0",0)=OPEN LINE^open line at cursor position
 ;;^MOZ("C",12,2,"PF1-0",1)=Q:^MOZMEM($J)=1  D CR^%MZED,PC^%MZED
 ;;^MOZ("C",12,2,"PF1-1",0)=PF1-1 Repertoire gamme^
 ;;^MOZ("C",12,2,"PF1-1",1)=Q:^MOZMEM($J)=1  D ^%MZLISGA,CLEPAG^%VVIDEO O 0 D STAT1^%MZWORD,RF^%MZED
 ;;^MOZ("C",12,2,"PF1-2",0)=DEL EOL PF1-2^delete end of line
 ;;^MOZ("C",12,2,"PF1-2",1)=Q:^MOZMEM($J)=1  D DNL^%MZED:A,DPL^%MZED:'A
 ;;^MOZ("C",12,2,"PF1-3",0)=PF1-3^Parametres saisie^
 ;;^MOZ("C",12,2,"PF1-3",1)=D ^%VSQUEAK ;D SEL^%MZREP ;Q:^MOZMEM($J)=1  ;D ^%MZPSAIS
 ;;^MOZ("C",12,2,"PF1-4",0)=BOTTOM^go to end of file
 ;;^MOZ("C",12,2,"PF1-4",1)=S @%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X F %0=0:0 S EDN=$O(^(EDCL)) S:EDN EDCL=EDN I 'EDN S X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1),EDP=$L(X)+1 D MS^%MZEDSF Q 
 ;;^MOZ("C",12,2,"PF1-5",0)=TOP^go to beginning of file
 ;;^MOZ("C",12,2,"PF1-5",1)=S (EDFL,EDN)=$O(@%TT@($J,0,0)),EDP=1 D X^%MZED,RF^%MZED I XOP=1!(XOP=2) D @("BLD^%VVIDEO"_$S(XOP=1:",REV^%VVIDEO",1:""))
 ;;^MOZ("C",12,2,"PF1-6",0)=INSERER UNE ACTION
 ;;^MOZ("C",12,2,"PF1-6",1)=Q:EDP'=1  D CR2^%MZED S XOP=2 D ^%MZEDOP(X,XOP,"I",.X,.%AB),AJ^%MZLIEN2 ;D:%AB'=1 CR2
 ;;^MOZ("C",12,2,"PF1-7",0)=COMMAND^command mode
 ;;^MOZ("C",12,2,"PF1-7",1)=D C^%MZHLP
 ;;^MOZ("C",12,2,"PF1-8",0)=^Page precedente
 ;;^MOZ("C",12,2,"PF1-8",1)=D PS^%MZEDSF
 ;;^MOZ("C",12,2,"PF1-9",0)=REPLACE^replace
 ;;^MOZ("C",12,2,"PF1-9",1)=Q:^MOZMEM($J)=1  D FRQ^%MZEDSF,FNS^%MZEDSF:'^MOZED($J) S %=0
 ;;^MOZ("C",12,3)=0^0^0^^60^31
 ;;^MOZ("C",12,4)=U 0 ;:(RM:"S":"")
 ;;^MOZWORD=S PGM="",%EDE=6,%EDI=8 D ^%MZWORD
 ;;^MOZ100=S %EDE=12,%EDI=11,%TT="^U" K ^MOZETAT($J),@%TT@($J),^SAVOP($J),^RESMEM($J),^MOZMEM($J) S ^MOZETAT($J,"NBCOL")=80,^MOZMEM($J)=0 D ^%MZINIT,^%MZWORD D 80^%VVIDEO,NORM^%VVIDEO K ^MOZETAT($J)
 ;;^MOZ52=S PGM="",%EDE=9,%EDI=10 D ^%MZWORD
 ;

