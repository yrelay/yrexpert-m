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

;%QS0LEC3^INT^1^59547,73879^0
ZLIGLEC3 ;
 
CHOY(NL,LISTA,ATTR,MODE,RESULT,CTR,CHSOR,RVISU,ECRAN,PAD) 
 S CTR=""
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
XV S:'($D(CHSOR)) CHSOR=2
 N TEMP S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I $D(CHSOR) G:CHSOR=0 0 G:CHSOR=1 1
 N SOR D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E")
 Q:(SOR'=1)&(SOR'=0)
 D @SOR
 K @(TEMP)
 Q
0 
 
 
 
 N ATR,CCC,COL,I,OOO
 I RVISU'="" S COL("C",0,"?")=RVISU
 I ECRAN'="" S COL("ECRAN")=ECRAN
 I PAD'="" S COL("PAD")=PAD
 S COL("X")=0,COL("Y")=3
 S COL("L")=80,COL("H")=20
 S COL("T")=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 S COL("A")=$S(COL("T"):$$^%QSCALVA("L0",NL,"TRIEE"),1:$$^%QSCALVA("L0",NL,"ADRESSE"))
 S:RVISU="" COL("ATT")=1
 S COL("AFF")="AFF2^%QS0LEC3"
 S COL("LIS")=NL
 S COL("B")=$$^%QSCALVA("L0",NL,"BASE")
 I COL("A")="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la liste")) Q
 I (LISTA'="")&(COL("B")="") D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la base des individus")) Q
 G:LISTA="" SUITE
 I ATTR G:'($$AR^%QSGEST5(COL("B"),LISTA)) SUITE S (COL("C",1,"T"),COL("C",1,"C"))=LISTA,COL("C",1,"L")=40 G SUITE
 
 
 I LISTA="*" G ALL
 S I=0 F %I=1:1 Q:'($D(^[QUI]ZLILA(LISTA,%I)))  S ATR=^[QUI]ZLILA(LISTA,%I) I $$CONT&$$AR^%QSGEST5(COL("B"),ATR) D ELLIS
 G SUITE
 
ALL 
 I LISTA="*" S GL=$$LISTATT2^%QSGEST6(COL("B")),I="" F %I=0:1 S I=$O(@GL@(I)) Q:I=""  S (COL("C",%I+1,"T"),COL("C",%I+1,"C"))=I,COL("C",%I+1,"L")=15
SUITE S CCC=$$^%QSCALVA("L0",NL,"CARD"),OOO=$$^%QSCALVA("L0",NL,"OBJET")
 
 D CLEPAG^%VVIDEO,AFF2
 D INIT^%QUAPAGM("COL"),AFFICH^%QUAPAGM
 D:MODE=0 GO^%QUAPAGM
 
 S:MODE=1 INDIVIDU=$$UN^%QUAPAGM,@RESULT=INDIVIDU
 
 I MODE=2 D ENS^%QUAPAGM(RESULT) S IN="" F %IN=1:1 S IN=$O(@RESULT@(IN)) Q:IN=""  S @TEMP@(IN)=""
 D END^%QUAPAGM
 D USE^%QS0(NL)
 K @(TEMP)
 Q
AFF2 D ^%VZCD(0,39,0,2,1,0,NL_$S((CCC="")!(OOO=""):"",1:" ("_CCC_" "_OOO_$S(CCC>1:"s",1:"")_")")) Q
 
1 
 D ^%QS0LEC2
 K @(TEMP)
 Q
 
REAFFI(NL,LISTA,ATTR,MODE,RESULT,CTR) 
 G 0
 
ELLIS S I=I+1,COL("C",I,"C")=ATR
 S COL("C",I,"L")=$$LONG^%QMLILA(LISTA,%I),COL("C",I,"I")=$$INDICE^%QMLILA(LISTA,%I),COL("C",I,"T")=$$TITRE^%QMLILA(LISTA,%I)
 Q
CONT() 
 N P1 S P1=$P(ATR,".")
 Q:(P1="INVERSE")!(P1="LIEN") 0
 Q 1

