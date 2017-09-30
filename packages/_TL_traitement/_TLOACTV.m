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
;! HL002 ! HL     ! 05/07/12 ! PB d'affichage de la progression               !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLOACTV^INT^1^59568,73247^0
%TLOACTV ;;09:34 AM  20 May 1992; ; 15 Jul 92  6:18 PM
 
 
INIVISU(TOT)
 I '($$GET^%SGVAR("ECR")) S EXEVISU="" Q
 G:TOT INITRAC
 G:TADTM INITADTM
 G INIMODTM
 
INITRAC 
 
 S EXEVISU="D VISU3^%TLOACTV"
 S EXEVISU("TRT")="",EXEVISU("REG")="",EXEVISU("IND")=""
 Q
 
 
 
INIMODTM 
 ;HL002 S EXEVISU=$XECUTE("S EXEVISU(5)=EXEVISU(5)+1 I '(EXEVISU(5)#10) X EXEVISU(EXEVISU(4))")
 ;HL002 S EXEVISU(0)=$XECUTE("W /C(67,5),$C(32)_$C(32)_$C(32)_$C(179),/C(70,4),$C(179) S EXEVISU(4)=1")
 ;HL002 S EXEVISU(1)=$XECUTE("W /C(70,4),$C(32),/C(70,5),$C(196,196,196,196) S EXEVISU(4)=2")
 ;HL002 S EXEVISU(2)=$XECUTE("W /C(70,5),$C(179)_$C(32)_$C(32)_$C(32),/C(70,6),$C(179) S EXEVISU(4)=3")
 ;HL002 S EXEVISU(3)=$XECUTE("W /C(70,6),$C(32),/C(67,5),$C(196,196,196,196) s EXEVISU(4)=0")
 ;HL002 S EXEVISU(5)=-1,EXEVISU(4)=0
 
 S EXEVISU="S EXEVISU(5)=EXEVISU(5)+1 I '(EXEVISU(5)#10) X EXEVISU(EXEVISU(4))"
 S EXEVISU(0)="W /C(67,5),$C(32)_$C(32)_$C(32)_$C(179),/C(70,4),$C(179) S EXEVISU(4)=1"
 S EXEVISU(1)="W /C(70,4),$C(32),/C(70,5),$C(196,196,196,196) S EXEVISU(4)=2"
 S EXEVISU(2)="W /C(70,5),$C(179)_$C(32)_$C(32)_$C(32),/C(70,6),$C(179) S EXEVISU(4)=3"
 S EXEVISU(3)="W /C(70,6),$C(32),/C(67,5),$C(196,196,196,196) s EXEVISU(4)=0"
 S EXEVISU(5)=-1,EXEVISU(4)=0
 Q
 
TST 
 ;HL002 S EXEVISU=$XECUTE("S EXEVISU(5)=EXEVISU(5)+1 X ^XVISU($J,EXEVISU(5)#40)")
 ;HL002 S ^XVISU($J,0)=$XECUTE("W /C(67,5),$C(32)_$C(32)_$C(32)_$C(179),/C(70,4),$C(179)")
 ;HL002 S ^XVISU($J,10)=$XECUTE("W /C(70,4),$C(32),/C(70,5),$C(196,196,196,196)")
 ;HL002 S ^XVISU($J,20)=$XECUTE("W /C(70,5),$C(179)_$C(32)_$C(32)_$C(32),/C(70,6),$C(179)")
 ;HL002 S ^XVISU($J,30)=$XECUTE("W /C(70,6),$C(32),/C(67,5),$C(196,196,196,196)")
 ;HL002 F I=0:1:3 F J=1:1:9 S ^XVISU($J,(10*I)+J)=""
 ;HL002 S EXEVISU(5)=-1

 S EXEVISU="S EXEVISU(5)=EXEVISU(5)+1 X ^XVISU($J,EXEVISU(5)#40)"
 S ^XVISU($J,0)="W /CUP(5,67),$C(32)_$C(32)_$C(32)_$C(179),/CUP(4,70),$C(179)"
 S ^XVISU($J,10)="W /CUP(4,70),$C(32),/CUP(5,70),$C(196,196,196,196)"
 S ^XVISU($J,20)="W /CUP(5,70),$C(179)_$C(32)_$C(32)_$C(32),/CUP(6,70),$C(179)"
 S ^XVISU($J,30)="W /CUP(6,70),$C(32),/CUP(5,67),$C(196,196,196,196)"
 F I=0:1:3 F J=1:1:9 S ^XVISU($J,(10*I)+J)=""
 S EXEVISU(5)=-1
 Q
 
INITADTM 
 ;HL002 S EXEVISU=$XECUTE("S EXEVISU(5)=EXEVISU(5)+1 I '(EXEVISU(5)#10) X EXEVISU(EXEVISU(4))")
 ;HL002 S EXEVISU(0)=$XECUTE("W /LN,/C(67,5),$C(32)_$C(32)_$C(32)_$C(120),/C(70,4),$C(120),/LF S EXEVISU(4)=1")
 ;HL002 S EXEVISU(1)=$XECUTE("W /LN,/C(70,4),$C(32),/C(70,5),$C(113,113,113,113),/LF S EXEVISU(4)=2")
 ;HL002 S EXEVISU(2)=$XECUTE("W /LN,/C(70,5),$C(120)_$C(32)_$C(32)_$C(32),/C(70,6),$C(120),/LF S EXEVISU(4)=3")
 ;HL002 S EXEVISU(3)=$XECUTE("W /LN,/C(70,6),$C(32),/C(67,5),$C(113,113,113,113),/LF S EXEVISU(4)=0")
 ;HL002 S EXEVISU(5)=-1,EXEVISU(4)=0

 S EXEVISU="S EXEVISU(5)=EXEVISU(5)+1 I '(EXEVISU(5)#10000) S DX=78,DY=24 X XY,EXEVISU(EXEVISU(4)) S ($X,$Y)=0"
 S EXEVISU(0)="W ""|"" S EXEVISU(4)=1"
 S EXEVISU(1)="W ""/"" S EXEVISU(4)=2"
 S EXEVISU(2)="W ""-"" S EXEVISU(4)=3"
 S EXEVISU(3)="W ""\"" S EXEVISU(4)=0"
 S EXEVISU(5)=-1,EXEVISU(4)=0
 Q
 
VISU2 N %I
 I PARCO("TRT")'=EXEVISU("TRT") D TRACTRT S EXEVISU("TRT")=PARCO("TRT")
 I PARCO("IND")'=EXEVISU("IND") D TRACIND S EXEVISU("IND")=PARCO("IND")
 
 Q
TRACTRT 
 N VAL
 S VAL=$E($$^%QZCHW("traitement")_"  "_PARCO("TRT")_"                                                                                   ",1,60)_"*"
 D PARAM^%PKPOP("8,8\RLW\1\\\"_VAL)
 Q
 
TRACIND 
 N VAL
 S VAL=$E($$^%QZCHW("individu")_"  "_PARCO("IND")_"                                                                                   ",1,60)_"*"
 D PARAM^%PKPOP("8,12\RLW\1\\\"_VAL)
 Q
 
 
 
VISU3 N %I
 F %I="TRT","REG","IND" I PARCO(%I)'=EXEVISU(%I) D @("TR3"_%I) S EXEVISU(%I)=PARCO(%I)
 Q
TR3TRT D CLFEN^%VVIDEO(3,5,1,75) S DX=3,DY=5 X XY W "traitement ",PARCO("TRT") Q
TR3IND D CLFEN^%VVIDEO(3,8,1,75) S DX=3,DY=8 X XY W "individu ",PARCO("IND") Q
TR3REG D CLFEN^%VVIDEO(3,12,4,75)
 S DX=3,DY=12 X XY W ^[QUI]TTL(PARCO("TRT"),2,PARCO("REG")) Q
 ;

