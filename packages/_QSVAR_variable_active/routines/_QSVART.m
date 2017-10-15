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

;%QSVART^INT^1^59547,73883^0
QSVART ;
 
 
 
TES(IO) O IO
 D PSV^%QSGESTI("P0","A1","TEST")
 D PSV^%QSGESTI("P0","A1","TEST.AVANT")
 D PSV^%QSGESTI("P0","A1","TEST.APRES")
 D PA^%QSGESTI("P0","A1","NOM","A1",1)
 
 D PA^%QSGESTI("P0","A1","TEST",1,1)
 
 D WRITE(IO,"")
 D WRITE(IO,"ajout test(1)=1")
 D VERIF(IO,"pa test.avant=1+""""  ",1,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"pa test.apres=10+1  ",11,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 D WRITE(IO,"")
 D WRITE(IO,"Suppression test(1)=2")
 D PA^%QSGESTI("P0","A1","TEST",2,1)
 D PS^%QSGESTI("P0","A1","TEST",2,1)
 
 D VERIF(IO,"ps test.avant=2+1  ",3,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"ps test.apres=""""+10  ",10,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 D WRITE(IO,"")
 D WRITE(IO,"Suppression test(1)=3 test(2)=4")
 D PA^%QSGESTI("P0","A1","TEST",3,1)
 D PA^%QSGESTI("P0","A1","TEST",4,2)
 D PSV^%QSGESTI("P0","A1","TEST")
 
 D VERIF(IO,"psv test.avant=""""+1  ",4,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"psv test.apres=10+""""  ",10,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 D WRITE(IO,"")
 D WRITE(IO,"Suppression test(1)=3 ")
 D PA^%QSGESTI("P0","A1","TEST",3,1)
 D PSV^%QSGESTI("P0","A1","TEST")
 
 D VERIF(IO,"psv test.avant=3+1  ",4,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"psv test.apres=10+""""  ",10,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 
 
 D WRITE(IO,"")
 D WRITE(IO,"CALVA consultation test(1)=1")
 D PA^%QSGESTI("P0","A1","TEST",1,1)
 W !,"test=1 ",$$^%QSCALVA("P0","A1","TEST")
 
 D VERIF(IO,"calva test.avant=1+1",2,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"calva test.apres=1+10",11,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 D WRITE(IO,"")
 D WRITE(IO,"CALIN consultation test(1)=1")
 D PA^%QSGESTI("P0","A1","TEST",1,1)
 W !,"test=1 ",$$^%QSCALIN("P0","A1","TEST",1)
 
 D VERIF(IO,"calin test.avant=1+1 ",2,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"calin test.apres=10+1 ",11,$$^%QSCALVA("P0","A1","TEST.APRES"))
 
 D WRITE(IO,"")
 D WRITE(IO,"CALIN consultation test(1)=2 CALIN SUR AUTRE INDICE")
 D PA^%QSGESTI("P0","A1","TEST",2,3)
 D WRITE(IO,"test(3)=2 "_$$^%QSCALIN("P0","A1","TEST",2))
 
 D VERIF(IO,"calin test.avant=1+1",2,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"calin test.apres=10+1",11,$$^%QSCALVA("P0","A1","TEST.APRES"))
 D WRITE(IO,"")
 D WRITE(IO,"qscalva consultation test(1)=2 test(2)=3")
 D PSV^%QSGESTI("P0","A1","TEST")
 D PSV^%QSGESTI("P0","A1","TEST.AVANT")
 D PSV^%QSGESTI("P0","A1","TEST.APRES")
 D PA^%QSGESTI("P0","A1","TEST",2,1)
 D PA^%QSGESTI("P0","A1","TEST",3,2)
 N VAL,TYPE
 D MV^%QSCALVA("P0","A1","TEST",.VAL,.TYPE)
 D VERIF(IO,"mv test.avant=2+1 ",3,$$^%QSCALVA("P0","A1","TEST.AVANT"))
 D VERIF(IO,"mv test.apres=2+10 ",10,$$^%QSCALVA("P0","A1","TEST.APRES"))
 C IO
 Q
TEST D TES(0) Q
TESTP D TES("TXB7:") Q
TEST2 N ADR,IND,I
 S ADR=$$ADRLIS^%QSGEST7("RQS88020063")
 D CLEPAG^%VVIDEO
 S IND=$O(@ADR@(""))
 F I=1:1 Q:IND=""  D PSV^%QSGESTI("P0",IND,"TOTO"),PSV^%QSGESTI("P0",IND,"TEST"),PSV^%QSGESTI("P0",IND,"TITI"),VISU(IND,I) S IND=$O(@ADR@(IND))
 W !,"TEST DE DUREE"
 D DEB^VTEMPS($P($ZPOS,"^",2))
 S IND=$O(@ADR@(""))
 F I=1:1 Q:IND=""  D PA^%QSGESTI("P0",IND,"TOTO","FG",1),VISU(IND,I) S IND=$O(@ADR@(IND))
 D VIS($$FIN^VTEMPS($P($ZPOS,"^",2)),1)
 D DEB^VTEMPS($P($ZPOS,"^",2))
 S IND=$O(@ADR@(""))
 F I=1:1 Q:IND=""  D PA^%QSGESTI("P0",IND,"TITI","FG",1),VISU(IND,I) S IND=$O(@ADR@(IND))
 D VIS($$FIN^VTEMPS($P($ZPOS,"^",2)),2)
 D DEB^VTEMPS($P($ZPOS,"^",2))
 S IND=$O(@ADR@(""))
 F I=1:1 Q:IND=""  D PA^%QSGESTI("P0",IND,"TEST","FG",1),VISU(IND,I) S IND=$O(@ADR@(IND))
 D VIS($$FIN^VTEMPS($P($ZPOS,"^",2)),3)
 Q
VISU(MSG,I) 
 S DX=0,DY=23 X XY W I_$J(MSG,10) Q
VIS(MSG,I) 
 S DX=0,DY=10+I X XY W $J(MSG,10) Q
VERIF(IO,MSG,VAL1,VAL2) 
 U IO W !,MSG,"  ",VAL1," = ",VAL2 Q:VAL1=VAL2
 U 0 D ^%VSQUEAK U IO W " erreur !!!"
 Q
WRITE(IO,MSG) 
 U IO W !,MSG Q
TESTF D PA^%QSGESTI("P0","TEST.3",1,1)
 Q

