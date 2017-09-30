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

;%QS0LECR^INT^1^59547,73879^0
ZLIGLECR(NL,LISTA,ATTR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S MODE=0 G XV
 
SELECT(NL,MODE,RESULT,CTR,CHSOR) 
 
 
 
 
 
 
 N LISTA,ATTR,CONTR
 S:'($D(CHSOR)) CHSOR=2
 D POCLEPA^%VVIDEO,^%QMLILAN(.LISTA,.ATTR,.CONTR)
 
 D:CONTR'="" CHOIXIND(NL,"",0,MODE,RESULT,.CTR,CHSOR) D:CONTR="" CHOIXIND(NL,LISTA,ATTR,MODE,RESULT,.CTR,CHSOR)
 
 Q
CHOY(NL,LISTA,ATTR,MODE,RESULT,CTR,CHSOR,RVISU,ECRAN,PAD) 
 
 
 
 
 
 
CHOIXIND(NL,LISTA,ATTR,MODE,RESULT,CTR,CHSOR) 
 
 
 
 
 
 
 
 
 
 
 
XV N INI S INI=1
 S:'($D(CHSOR)) CHSOR=2
 I $D(CHSOR) G:CHSOR=0 0 G:CHSOR=1 1
 N SOR
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:(SOR'=1)&(SOR'=0)
 G @SOR
 
0 
 N COL,CCC,OOO
 S COL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COL")
 S CCC=$$CARD^%QSGEST7(NL),OOO=$$^%QSCALVA("L0",NL,"OBJET")
 I INI'=0,$$INIT(COL)=0 K @(COL) Q
 
 D CLEPAG^%VVIDEO,AFF2,AFFICH^%QUAPAGM
 
 D:MODE=0 GO^%QUAPAGM
 
 I MODE=1 S Y1=$$UN^%QUAPAGM S:Y1'="" @RESULT@(Y1)=""
 
 I MODE=2 D ENS2^%QUAPAGM(RESULT)
 
 D USE^%QS0(NL)
 I (INI=1)!(MODE=0) G FIN
 I MODE'=0,('($D(@RESULT)))&(INI'=1) G FIN
 Q
FIN D END^%QUAPAGM
 K @(COL) Q
 
AFF2 D ^%VZCD(0,39,0,2,1,0,NL_$S((CCC="")!(OOO=""):"",1:" ("_CCC_" "_OOO_$S(CCC>1:"s",1:"")_")"))
 Q
 
1 
 N REP S REP=""
 G ^%QS0LEC2
 
REAFFI(NL,LISTA,ATTR,MODE,RESULT,CTR) 
 N INI S INI=1
 G 0
 
INIT(COL) 
 N AT,I,J,TYP,GL
 K @(COL) D ^%VZEATT
 S TYP=$$TYP^%QSGEST7(NL)
 
 S @COL@("X")=0,@COL@("Y")=3,@COL@("L")=80,@COL@("H")=20
 S @COL@("T")=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 S @COL@("A")=$S(@COL@("T"):$$ADRLT^%QSGEST7(NL),1:$$ADRLIS^%QSGEST7(NL))
 S @COL@("ATT")=1,@COL@("AFF")="AFF2^%QS0LECR"
 S @COL@("LIS")=NL
 S @COL@("B")=$$BASE^%QSGEST7(NL)
 I @COL@("A")="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la liste")) Q 0
 G:TYP'="INDIVIDU" SUITE
 I (LISTA'="")&(@COL@("B")="") D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la base des individus")) Q 0
 G:LISTA="" SUITE
 I ATTR G:'($$AR^%QSGEST5(@COL@("B"),$$GETLBLAN^%VTLBLAN($P(LISTA,"(")))) SUITE S @COL@("C",1,"T")=LISTA,@COL@("C",1,"C")=$$GETLBLAN^%VTLBLAN($P(LISTA,"(")),@COL@("C",1,"I")=$$GETLBLAN^%VTLBLAN($P($P(LISTA,"(",2),")")),@COL@("C",1,"L")=40 G SUITE
 
 G:LISTA="*" ALL
 
 S I=0 F J=1:1 Q:'($D(^[QUI]ZLILA(LISTA,J)))  S AT=^[QUI]ZLILA(LISTA,J) I $$CONT&$$AR^%QSGEST5(@COL@("B"),AT) D ELLIS
 G SUITE
ALL 
 S GL=$$LISTATT2^%QSGEST6(@COL@("B")),AT="",I=0
 F J=1:1 S AT=$O(@GL@(AT)) Q:AT=""  I $$CONT S I=I+1,(@COL@("C",I,"T"),@COL@("C",I,"C"))=AT,@COL@("C",I,"L")=15,@COL@("C",I,"I")=""
 
SUITE 
 D INIT^%QUAPAGM(COL)
 Q 1
 
ELLIS S I=I+1,@COL@("C",I,"C")=AT
 S @COL@("C",I,"L")=$$LONG^%QMLILA(LISTA,J),@COL@("C",I,"I")=$$INDICE^%QMLILA(LISTA,J),@COL@("C",I,"T")=$$TITRE^%QMLILA(LISTA,J)
 Q
 
CONT() 
 N P1 S P1=$P(AT,".")
 Q:(P1="INVERSE")!(P1="LIEN") 0
 Q 1
 
SELREP(NL,MODE,RESULT,CTR,INI) 
 N LISTA,ATTR
 I INI'=0 D POCLEPA^%VVIDEO,^%QMLILAN(.LISTA,.ATTR,.CTR) Q:CTR'=""
 G 0

