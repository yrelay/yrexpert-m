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

;%SCOACT3^INT^1^59547,73888^0
SCOACT3 ;
 
 
 
 
 
INIT 
 D INITAF($$CONCAS^%QZCHAD(TEMP,"FEN1"),$$CONCAS^%QZCHAD(TEMP,"FEN2"))
 Q
 
FIN D CLOSE^%QUAPAGM("SUCCES"),CLOSE^%QUAPAGM("ECHEC")
 K @TEMP@("FEN1"),@TEMP@("FEN2")
 Q
 
SUC 
 I NOML="" D ^%VZEAVT($$^%QZCHW("aucun individu comparable")) Q
 D USE^%QUAPAGM("SUCCES"),TITSUC
 D GO^%QUAPAGM
 Q
 
ECH 
 I NOML2="" D ^%VZEAVT($$^%QZCHW("aucun individu non comparable")) Q
 D USE^%QUAPAGM("ECHEC"),TITECH
 D GO^%QUAPAGM
 Q
 
INITAF(FEN1,FEN2) 
 I NOML'="" D FSUC(FEN1),OPEN^%QUAPAGM(FEN1,"SUCCES")
 I NOML2'="" D FECH(FEN2),OPEN^%QUAPAGM(FEN2,"ECHEC")
 D REAFF
 Q
FSUC(FEN) 
 S @FEN@("X")=1,@FEN@("Y")=6,@FEN@("L")=78,@FEN@("H")=8
 S @FEN@("AFF")="AFD^%SCOACT3"
 S @FEN@("A")=$$ADRLIS^%QSGEST7(NOML)
 S @FEN@("LR")=30
 S @FEN@("ATT")=1,@FEN@("B")=$$NOMINT^%QSF(REPCIB)
 D COM
 Q
 
FECH(FEN) 
 S @FEN@("X")=1,@FEN@("Y")=14,@FEN@("L")=78,@FEN@("H")=8
 S @FEN@("AFF")="AFO^%SCOACT3"
 S @FEN@("A")=$$ADRLIS^%QSGEST7(NOML2)
 S @FEN@("LR")=30
 S @FEN@("ATT")=1,@FEN@("B")=$$NOMINT^%QSF(REPCIB)
 D COM
 Q
COM 
 S @FEN@("C",1,"T")="taux atteint"
 S @FEN@("C",1,"C")="TAUX.ACCORD"
 S @FEN@("C",1,"L")=20
 Q
 
 
REAFF 
 I NOML'="" D USE^%QUAPAGM("SUCCES"),AFFICH^%QUAPAGM,TITSUC
 I NOML2'="" D USE^%QUAPAGM("ECHEC"),AFFICH^%QUAPAGM,TITECH
 Q
AFO 
 D ENTETE^%SCOACT
 D USE^%QUAPAGM("SUCCES"),AFFICH^%QUAPAGM,TITSUC
 D USE^%QUAPAGM("ECHEC")
 Q
AFD 
 D ENTETE^%SCOACT
 D USE^%QUAPAGM("ECHEC"),AFFICH^%QUAPAGM,TITECH
 D USE^%QUAPAGM("SUCCES")
 Q
TITSUC 
 D REV^%VVIDEO S DX=4,DY=6 X XY W " "_$$^%QZCHW("comparables")_" "
 D NORM^%VVIDEO Q
 
TITECH 
 D REV^%VVIDEO S DX=4,DY=14 X XY W " "_$$^%QZCHW("non comparables")_" "
 D NORM^%VVIDEO Q

