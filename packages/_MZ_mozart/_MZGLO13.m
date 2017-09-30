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

;%MZGLO13^INT^1^59547,73871^0
MOZGLO13 ;;04:46 PM  29 Dec 1989; 03 Mar 89 11:38 AM ; 07 Jun 93  4:48 PM
 ;;COPYRIGHT Yrelay SYSTEME MOZART au 20/10/87 a 18H37 >> version MOZART 2.2
DATA 
 ;;^MOZ("C",12,1,83,0)=DEL L^delete line^PF4
 ;;^MOZ("C",12,1,83,1)=Q:^MOZMEM($J)=1  D DNL:A,DPL:'A D SUP^%MZLIEN2,NORM^%VVIDEO
 ;;^MOZ("C",12,1,108,0)=DEL C^delete character^'
 ;;^MOZ("C",12,1,108,1)=Q:(XOP=1!(XOP=2))  D DNC:A,DPC:'A D SUP^%MZLIEN2
 ;;^MOZ("C",12,1,109,0)=DEL W^delete word^-
 ;;^MOZ("C",12,1,109,1)=Q:(XOP=1!(XOP=2))  D DNW:A,DPW:'A D SUP^%MZLIEN2
 ;;^MOZ("C",12,1,110,0)=SELECT^mark beginning of paste buffer^On
 ;;^MOZ("C",12,1,110,1)=S EDBB=EDCL_U_EDP
 ;;^MOZ("C",12,1,112,0)=LINE^beg of line^0
 ;;^MOZ("C",12,1,112,1)=D NL:A,PC:'A S EDP=1
 ;;^MOZ("C",12,1,113,0)=WORD^word move^1
 ;;^MOZ("C",12,1,113,1)=Q:(XOP=1!(XOP=2))  D NW:A,PW:'A
 ;;^MOZ("C",12,1,114,0)=EOL^end of line^2
 ;;^MOZ("C",12,1,114,1)=S B=(XOP=1!(XOP=2)) X "D NL":B,"D NC:A,PL:'A S EDP=$L(X)+1":'B
 ;;^MOZ("C",12,1,115,0)=EOL^Renumerotation SF^3
 ;;^MOZ("C",12,1,115,1)=D ^%MZCHN  ;D SEL^%MZREP ;D ^%MZMEMOR
 ;;^MOZ("C",12,1,116,0)=ADVANCE^forwards^4
 ;;^MOZ("C",12,1,116,1)=S A=1
 ;;^MOZ("C",12,1,117,0)=BACKUP^backwards^5
 ;;^moz("C",12,1,117,1)=S A=0 ;S:'$D(%TAB) %TAB=0 D:%TAB'=0 ^%VSQUEAK Q:%TAB'=0  S A=0
 ;;^MOZ("C",12,1,118,0)=LIGNE TABULATION ;CUT^remove marked region to paste buffer^6
 ;;^MOZ("C",12,1,118,1)=Q:EDP'=1  D CR2 S XOP=1 D ^%MZEDOP(X,XOP,"I",.X,.%AB) D DNL:%AB=1 D AJ^%MZLIEN2  ;D:%AB'=1 CR2
 ;;^MOZ("C",12,1,119,0)=ATTRIBUT^next screen^7
 ;;^MOZ("C",12,1,119,1)=D ^%MZOPER(PGM)   ;D NS^%MZEDSF,X,RF ;:A,PS^%MZEDSF:'A
 ;;^MOZ("C",12,1,120,0)=SECTION^section^8
 ;;^MOZ("C",12,1,120,1)=D NS^%MZEDSF ;:A,PS^%MZEDSF:'A
 ;;^MOZ("C",12,1,121,0)=NOMENCLATURE^nomenclature^9
 ;;^MOZ("C",12,1,121,1)=D ^%MZLIEN(PGM) ;:A,PS^%MZEDSF:'A
 ;;^MOZ("C",12,1,122,0)=PAGE UP^page precedente^Oz
 ;;^MOZ("C",12,1,122,1)=PS^%MZEDSF
 ;;^MOZ("C",12,1,127,0)=DEL^delete preceding character^DEL
 ;;^MOZ("C",12,1,127,1)=Q:(XOP=1!(XOP=2))  D DPC
 ;;^MOZ("C",12,1,128,0)=NUL^TIME-OUT^-1
 ;;^MOZ("C",12,1,128,1)=S %ALM=$P($H,",",2)+60 D T^%MZINSF,POS
 ;;^MOZ("C",12,2,0)=^90019.02^82^14
 ;;^MOZ("C",12,2,"PF1-NUL",0)=SUBS^find and change string^NUL
 ;;^MOZ("C",12,2,"PF1-NUL",1)=Q:^MOZMEM($J)=1  S EDCLP=EDCL D RS^%MZEDSF,FNS^%MZEDSF S %=$S(EDRP:3,1:2)
 ;

