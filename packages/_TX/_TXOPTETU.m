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

;%TXOPTETu^INT^1^59547,74032^0
%TXOPTETu ;
 N TEMP,GPL,GPLA,MENG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E")
 S MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 S (ETUDE,ATELIER,VALEUR)=""
BCPL D CLEPAG^%VVIDEO
 D LINEUP
 S DX=10,DY=10 X XY W "PLAN NUMERO ? :" R PL Q:PL=""
 I $$GETLBLAN^%VTLBLAN(PL)="?" S PL=$$UN^%PKCHOIX(GPL,10,12,8)
 G:PL="" BCPL S @GPL@(PL)=""
 
 
 D LINEUP
 
 S @MENG="21^10^79",@MENG@(1)=$$^%QZCHW("modifier")_"^MODIFET",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("atelier")_"^ATELIER",@MENG@(2,"COM")=$$^%QZCHW("examiner les ateliers associes"),@MENG@(3)=$$^%QZCHW("activer")_"^ACTIV",@MENG@(3,"COM")=$$^%QZCHW("calculer la production optimale ")
 
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D LINEUP,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G ACTS
 
END 
 K @(TEMP)
 Q
LINEUP 
 N msg,i S msg="" F i=1:1:78 S msg=msg_""
 S $E(msg,3,24)=ETUDE,$E(msg,25,45)=":"_ATELIER,$E(msg,46,66)=":"_ARTICLE,$E(msg,67,77)=":V="_VALEUR D ^%VZCD(0,78,0,2,0,0,$E(msg,3,78))
 Q

