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

;%SDCEDI2^INT^1^59547,73888^0
SDCEDI2 ;
 
 
 
 
 
 
 
IMPPT 
 N I,J,NPT
 S J=$ZP(@LIGNE@(""))+1
 
 F I=J,J+1 S @LIGNE@(I)=" "
 S @LIGNE@(I+1)=$J("",30)_$$^%QZCHW("POINTS")
 S @LIGNE@(I+2)=$J("",30)_"------"
 S @LIGNE@(I+3)=" "
 S @LIGNE@(I+4)=$J("",15)_$$^%QZCHW("numero")_$J("",5)_$$^%QZCHW("abscisse")_$J("",5)_$$^%QZCHW("coordonnee")
 S @LIGNE@(I+5)=" "
 S J=I+6
 S NPT=""
 F I=J:1 S NPT=$O(@STO@("PT",NPT)) Q:NPT=""  S @LIGNE@(I)=$J("",15)_$$JUST(NPT,12)_$$JUST(@STO@("PT",NPT,"X"),12)_$$JUST(@STO@("PT",NPT,"Y"),12)
 Q
 
JUST(CH,N) 
 Q $E(CH,1,N)_$J("",N-$L(CH))
 
IMPPTO 
 N I,J,NOBJ,NPT,OBJ,TIT,TAB,VO
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 
 S NOBJ=""
 F I=0:0 S NOBJ=$O(@STO@("OBJ",NOBJ)) Q:NOBJ=""  S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,"")),@TAB@(OBJ,VO)=""
 S J=$ZP(@LIGNE@(""))+1
 
 F I=J,J+1 S @LIGNE@(I)=" "
 S @LIGNE@(I+1)=$J("",30)_$$^%QZCHW("POINTS")
 S @LIGNE@(I+2)=$J("",30)_"------"
 S TIT(1)=$TR($J("",6)," ","*")_" "_$$^%QZCHW("Point")_" "
 S TIT(2)=$J("",12)_$$^%QZCHW("abscisse")_" = "
 S TIT(3)=$J("",12)_$$^%QZCHW("ordonnee")_" = "
 S I=I+3
 S NPT=""
BCLO S NPT=$O(@STO@("PT",NPT)) I NPT="" S @LIGNE@(I)=" " K @(TAB) Q
 S @LIGNE@(I)=" ",@LIGNE@(I+1)=TIT(1)_NPT_" "_$TR($J("",6)," ","*")
 S @LIGNE@(I+2)=" ",@LIGNE@(I+3)=TIT(2)_@STO@("PT",NPT,"X")
 S @LIGNE@(I+4)=TIT(3)_@STO@("PT",NPT,"Y")
 S I=I+5,@LIGNE@(I)=" "
 S @LIGNE@(I+1)=$TR($J("",5)," ","-")_$$^%QZCHW("objets")
 S @LIGNE@(I+2)=" ",I=I+2
 S OBJ=""
BCO S OBJ=$O(@TAB@(OBJ)) I OBJ="" G FBCL
 S VO=""
BCV S VO=$O(@TAB@(OBJ,VO)) I VO="" G BCO
 
 S ADR=$$DEF^%SDOCMS(OBJ,VO)
 I $D(@ADR@("PTR",NPT)) S I=I+1,@LIGNE@(I)=$J("",10)_OBJ_$J("",30-$L(OBJ))_" "_VO
 G BCV
FBCL S @LIGNE@(I+1)=" "
 S @LIGNE@(I+2)=$TR($J("",10)," ","*")
 S I=I+3
 G BCLO
 
 
AFFIC 
 N ARRET
 D OPEN^%SYSUTI1(IMP,"","")
 D ENTETE
 S ARRET=0,DY=4,DX=0
 F NUM=1:1 Q:'($D(@LIGNE@(NUM)))  D AFF
 I IMP'=0 U IMP W # C IMP
 U 0 D ^%VZEAVT("")
 Q
AFF 
 
 I @LIGNE@(NUM)=$C(0) Q:SOR=1  D ARRET G:ARRET=0 PAG Q
 X XY W $E(@LIGNE@(NUM),1,79),! S DY=DY+1
 I DY'>LIM Q
 D ARRET Q:ARRET=1
PAG 
 S DY=4
 I SOR=0 D CLEBAS^%VVIDEO Q
 W #
 D ENTETE
 Q
 
ARRET I IMP'=0 R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) I ARRET'=1 S ARRET=0 Q
 U 0 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("arret")_" ","N")=1 S ARRET=1 U IMP Q
 S ARRET=0 U IMP
 Q
 
ENTETE 
 N CH,X
 I SOR=0 D CLEPAG^%VVIDEO
 E  U IMP W #
 U IMP W "le ",$$TEMPS^%QMDATE,?75,"SDX",!
 S CH=$$^%QZCHW("Collection")_" "_COL,X=$$CENT(CH)
 U IMP W ?X,CH,!
 S CH=$$^%QZCHW("Version")_" "_VERS,X=$$CENT(CH)
 U IMP W ?X,CH,!
 I IMP=0 W $TR($J("",79)," ","-")
 U IMP W !
 Q
CENT(CH) 
 N C
 S C=(79-$L(CH))\2
 Q C

