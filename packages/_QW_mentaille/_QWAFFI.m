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

;%QWAFFI^INT^1^59547,73886^0
QWAFFI ;
 
INIT 
 N IAF
 F IAF=0:1:28 S @WWAFF@(IAF)="",@WWAFF@(IAF,"VIS")=0
 
 S @WWAFF@(0)=$$REV^%VVIDEO1_$$^%QZCHW("Etude")_$$NORM^%VVIDEO1
 S @WWAFF@(0,"X")=2,@WWAFF@(0,"Y")=1,@WWAFF@(0,"L")=6
 
 S @WWAFF@(1,"X")=2,@WWAFF@(1,"Y")=2,@WWAFF@(1,"L")=11
 
 S @WWAFF@(2)=$$BLD^%VVIDEO1_$$^%QZCHW("horloge")_$$NORM^%VVIDEO1,@WWAFF@(2,"X")=15,@WWAFF@(2,"Y")=19,@WWAFF@(2,"L")=8
 
 S @WWAFF@(3,"X")=25,@WWAFF@(3,"Y")=19,@WWAFF@(3,"L")=5
 
 S @WWAFF@(4)=$$BLD^%VVIDEO1_$$^%QZCHW("profondeur")_$$NORM^%VVIDEO1,@WWAFF@(4,"X")=35,@WWAFF@(4,"Y")=19,@WWAFF@(4,"L")=12
 
 S @WWAFF@(5,"X")=50,@WWAFF@(5,"Y")=19,@WWAFF@(5,"L")=12
 
 S @WWAFF@(6,"X")=4,@WWAFF@(6,"Y")=5,@WWAFF@(6,"L")=15
 
 S @WWAFF@(7)=$$BLD^%VVIDEO1_$$^%QZCHW("de")_$$NORM^%VVIDEO1,@WWAFF@(7,"X")=20,@WWAFF@(7,"Y")=5,@WWAFF@(7,"L")=3
 
 S @WWAFF@(8,"X")=30,@WWAFF@(8,"Y")=5,@WWAFF@(8,"L")=15
 
 S @WWAFF@(9)=$$BLD^%VVIDEO1_$$^%QZCHW("sur")_$$NORM^%VVIDEO1,@WWAFF@(9,"X")=50,@WWAFF@(9,"Y")=5,@WWAFF@(9,"L")=4
 
 S @WWAFF@(10,"X")=55,@WWAFF@(10,"Y")=5,@WWAFF@(10,"L")=24
 
 S @WWAFF@(11)=$$BLD^%VVIDEO1_$$^%QZCHW("repertoire")_$$NORM^%VVIDEO1,@WWAFF@(11,"X")=3,@WWAFF@(11,"Y")=8,@WWAFF@(11,"L")=15
 
 S @WWAFF@(12,"X")=20,@WWAFF@(12,"Y")=8,@WWAFF@(12,"L")=30
 
 S @WWAFF@(13)=$$BLD^%VVIDEO1_$$^%QZCHW("individu")_$$NORM^%VVIDEO1,@WWAFF@(13,"X")=3,@WWAFF@(13,"Y")=10,@WWAFF@(13,"L")=15
 
 S @WWAFF@(14,"X")=20,@WWAFF@(14,"Y")=10,@WWAFF@(14,"L")=30
 
 S @WWAFF@(15)=$$BLD^%VVIDEO1_$$^%QZCHW("attribut")_$$NORM^%VVIDEO1,@WWAFF@(15,"X")=3,@WWAFF@(15,"Y")=12,@WWAFF@(15,"L")=15
 
 S @WWAFF@(16,"X")=20,@WWAFF@(16,"Y")=12,@WWAFF@(16,"L")=30
 
 S @WWAFF@(17)=$$BLD^%VVIDEO1_$$^%QZCHW("ordre")_$$NORM^%VVIDEO1,@WWAFF@(17,"X")=3,@WWAFF@(17,"Y")=14,@WWAFF@(17,"L")=15
 
 S @WWAFF@(18,"X")=20,@WWAFF@(18,"Y")=14,@WWAFF@(18,"L")=30
 
 S @WWAFF@(19)=$$BLD^%VVIDEO1_$$^%QZCHW("valeur")_$$NORM^%VVIDEO1,@WWAFF@(19,"X")=3,@WWAFF@(19,"Y")=16,@WWAFF@(19,"L")=15
 
 S @WWAFF@(20,"X")=20,@WWAFF@(20,"Y")=16,@WWAFF@(20,"L")=30
 
 S @WWAFF@(21,"X")=25,@WWAFF@(21,"Y")=6,@WWAFF@(21,"L")=15
 
 S @WWAFF@(22)=$$REV^%VVIDEO1_$$^%QZCHW("Domaine.execution")_$$NORM^%VVIDEO1
 S @WWAFF@(22,"X")=20,@WWAFF@(22,"Y")=1,@WWAFF@(22,"L")=18
 
 S @WWAFF@(23,"X")=20,@WWAFF@(23,"Y")=2,@WWAFF@(23,"L")=30
 
 S @WWAFF@(24)=$$REV^%VVIDEO1_$$^%QZCHW("Execution")_$$NORM^%VVIDEO1
 S @WWAFF@(24,"X")=50,@WWAFF@(24,"Y")=1,@WWAFF@(24,"L")=10
 
 S @WWAFF@(25,"X")=50,@WWAFF@(25,"Y")=2,@WWAFF@(25,"L")=12
 
 S @WWAFF@(26)=$$REV^%VVIDEO1_$$^%QZCHW("Mode")_$$NORM^%VVIDEO1
 S @WWAFF@(26,"X")=70,@WWAFF@(26,"Y")=1,@WWAFF@(26,"L")=6
 
 S @WWAFF@(27,"X")=70,@WWAFF@(27,"Y")=2,@WWAFF@(27,"L")=8
 S @WWAFF@(28)=$TR($J("",78)," ","-")
 S @WWAFF@(28,"X")=0,@WWAFF@(28,"Y")=3,@WWAFF@(28,"L")=78
 Q
 
AFFI(VAL,INDICE) 
 N VALP,INA,Q
 G:'(ESPATT) SAFFI
 S Q=0 F INA=9:1:14 I INDICE=INA S Q=1 Q
 Q:Q
SAFFI S VALP=$E(VAL_"                                ",1,@WWAFF@(INDICE,"L"))
 Q:(@WWAFF@(INDICE)=VALP)&@WWAFF@(INDICE,"VIS")
 S DX=@WWAFF@(INDICE,"X"),DY=@WWAFF@(INDICE,"Y") X XY W VALP
 S @WWAFF@(INDICE)=VALP,@WWAFF@(INDICE,"VIS")=1
 Q
 
REAFF(INDICE) 
 Q:@WWAFF@(INDICE,"VIS")
 S DX=@WWAFF@(INDICE,"X"),DY=@WWAFF@(INDICE,"Y") X XY W @WWAFF@(INDICE)
 S @WWAFF@(INDICE,"VIS")=1
 Q
 
ETUDE 
 D REAFF(0),AFFI(NOMETUDE,1) Q
DOM 
 D REAFF(22),AFFI(DOMEX,23) Q
EXEC 
 D REAFF(24),AFFI($S(ORIEN="OUI":"ORIENTEE",1:"NON.ORIENTEE"),25) Q
MODE 
 D REAFF(26),AFFI($S(SWITCHAF:"VISIBLE",1:"INVISIBLE"),27)
 D REAFF(28) Q
 
FOND 
 N INDICE
 F INDICE=2,4,7,9,11,13,15,17,19 D REAFF(INDICE)
 Q
ALL 
 N INDICE
 F INDICE=0:1:28 D REAFF(INDICE)
 Q
CLR(INDICE) 
 N VALP,SX,SY
 S VALP=$E("                                                  ",1,@WWAFF@(INDICE,"L"))
 S DX=@WWAFF@(INDICE,"X"),DY=@WWAFF@(INDICE,"Y") X XY W VALP
 S @WWAFF@(INDICE)=VALP,@WWAFF@(INDICE,"VIS")=1
 Q
 
SIGNAL 
 N INDICE
 F INDICE=0:1:28 S @WWAFF@(INDICE,"VIS")=0
 Q

