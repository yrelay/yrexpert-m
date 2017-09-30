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

;%QSATTR4^INT^1^59547,73880^0
QSATTR4 ;
 
 
 
 
 
 
 
 
 
 
 
MODE(ETIQ) 
 G:'(PAQ) 282
 N MENU S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU") K @(MENU)
 S @MENU@(1)=$$^%QZCHW("Indice")_"^281",@MENU@(1,"COM")=$$^%QZCHW("Changer d'indice")
 S @MENU@(2)=$$^%QZCHW("Mode")_"^282",@MENU@(2,"COM")=$$^%QZCHW("Changer de mode")
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR G ACT
END S DX=0,DY=22 D CLEBAS^%VVIDEO S ETIQ="L0" Q
281 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S INDICE=$$^%VZAME1("Quel est l'indice pour l'ensemble des attributs : "),MODE=2 I INDICE="" S ETIQ="FIN" Q
 S ETIQ="DEB" Q
282 
 I '(SELECT) S MODE='(MODE),ETIQ="DEB" Q
 N MEN S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN") K @(MEN)
 S @MEN@(1)=$$^%QZCHW("Individu")_"^2821",@MEN@(1,"COM")=$$^%QZCHW("Attributs de l'individu")
 S @MEN@(2)=$$^%QZCHW("Repertoire")_"^2822",@MEN@(2,"COM")=$$^%QZCHW("Attributs du repertoire")
 S @MEN@(3)=$$^%QZCHW("Liste")_"^2823",@MEN@(3,"COM")=$$^%QZCHW("Attributs de la liste")
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MEN,.ADR,.CTR) G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR G ACT2
2823 S MODE=2 G SUIT
2821 S MODE=0 G SUIT
2822 S MODE=1
SUIT S DX=0,DY=22 D CLEBAS^%VVIDEO S ETIQ="DEB" Q
 
 
LIEN 
 S ATT=$P(^ATT($J,Z,LC)," (",1),ORD=$P($P(^ATT($J,Z,LC),"(",2),")",1),VAL=^VAL($J,Z,LC) S:ORD="" ORD=1
 S REXT=$$ROUTMAJ^%QSGESPE(BA,ATT)
 G:REXT="" LIENS
 I (VAL="")!(ORD="") S ETIQ="ERR" G RET2^%QSATTR1
 D EXE^%QSATTR2("M",ATT,VAL,ORD,REXT) S ETIQ="L0" G RET2^%QSATTR1
LIENS G:$D(^[QUI]RQSLIEN(BA,ATT)) SUIL
 I $$TYPE^%QSGESPE(ATT_"/"_BASE)'="DATE" S ETIQ="ERR" G RET2^%QSATTR1
 
 D DATE^%QSATTR2 G FL
SUIL S I=^[QUI]RQSLIEN(BA,ATT),A=$P(I,"^",1),%A=$P(I,"^",2),D=$S(A=1:$P(O,",",1,^[QUI]RQSNCLES(%A)),A=2:O_","_VAL,1:VAL)
 I '($$IR^%QSGEST5(%A,D)) D ^%VZEAVT($$^%QZCHW("Aucun objet correspondant ")) S ETIQ="L0" G RET2^%QSATTR1
 I VISU D VISUM^%QSATTRI(D,%A,XG,YH,LA,HA,MODE) G FL
 S NIV=$$^%QCAZG(TEM)+1,@TEM=NIV
 S @TEM@(NIV,"BA")=BA,@TEM@(NIV,"O")=O,@TEM@(NIV,"RETOUR")="RETL^%QSATTR4",@TEM@(NIV,"BASE")=BASE,@TEM@(NIV,"DL")=DL,@TEM@(NIV,"Z")=Z
 S @TEM@(NIV,"HA")=HA,@TEM@(NIV,"PAGE")=PAGE,@TEM@(NIV,"LC")=LC,@TEM@(NIV,"LDEP")=LDEP,@TEM@(NIV,"XC")=XC,@TEM@(NIV,"YC")=YC,@TEM@(NIV,"LFIN")=LFIN
 S O=D,BA=%A,LDEP=1 G GO2^%QSATTR1
RETL S NIV=@TEM
 S BA=@TEM@(NIV,"BA"),O=@TEM@(NIV,"O"),BASE=@TEM@(NIV,"BASE"),DL=@TEM@(NIV,"DL"),Z=@TEM@(NIV,"Z")
 S HA=@TEM@(NIV,"HA"),PAGE=@TEM@(NIV,"PAGE"),OPAGE=PAGE-1,LC=@TEM@(NIV,"LC"),LDEP=@TEM@(NIV,"LDEP"),XC=@TEM@(NIV,"XC"),YC=@TEM@(NIV,"YC"),LFIN=@TEM@(NIV,"LFIN")
 I NIV=1 K @(TEM) G FL
 K @TEM@(NIV) S NIV=NIV-1,@TEM=NIV
FL S ETIQ="DEB2" G RET2^%QSATTR1
 
 
INDIVLIEN 
 S ATT=$P(^ATT($J,Z,LC)," (",1),ORD=$P($P(^ATT($J,Z,LC),"(",2),")",1),VAL=^VAL($J,Z,LC) S:ORD="" ORD=1
 I '($D(^[QUI]RQSLIEN(BA,ATT))) S ETIQ="ERR" G RET2^%QSATTR1
 S I=^[QUI]RQSLIEN(BA,ATT),A=$P(I,"^",1),%A=$P(I,"^",2),D=$S(A=1:$P(O,",",1,^[QUI]RQSNCLES(%A)),A=2:O_","_VAL,1:VAL),D=$$NOML^%QSGES20(O,VAL,ATT,D)
 S %A=$$LIENI^%QSGEL3
 I '($$IR^%QSGEST5(%A,D)) D ^%VZEAVT($$^%QZCHW("Aucun objet correspondant ")) S ETIQ="L0" G RET2^%QSATTR1
 I VISU D VISUM^%QSATTRI(D,%A,XG,YH,LA,HA,MODE) G FINL
 S NIV=$$^%QCAZG(TEM)+1,@TEM=NIV
 S @TEM@(NIV,"BA")=BA,@TEM@(NIV,"O")=O,@TEM@(NIV,"RETOUR")="RETINL^%QSATTR4",@TEM@(NIV,"BASE")=BASE,@TEM@(NIV,"DL")=DL,@TEM@(NIV,"Z")=Z
 S @TEM@(NIV,"HA")=HA,@TEM@(NIV,"PAGE")=PAGE,@TEM@(NIV,"LC")=LC,@TEM@(NIV,"LDEP")=LDEP,@TEM@(NIV,"XC")=XC,@TEM@(NIV,"YC")=YC,@TEM@(NIV,"LFIN")=LFIN
 S O=D,BA=%A G GO2^%QSATTR1
RETINL S NIV=@TEM
 S BA=@TEM@(NIV,"BA"),O=@TEM@(NIV,"O"),BASE=@TEM@(NIV,"BASE"),DL=@TEM@(NIV,"DL"),Z=@TEM@(NIV,"Z")
 S HA=@TEM@(NIV,"HA"),PAGE=@TEM@(NIV,"PAGE"),OPAGE=PAGE-1,LC=@TEM@(NIV,"LC"),LDEP=@TEM@(NIV,"LDEP"),XC=@TEM@(NIV,"XC"),YC=@TEM@(NIV,"YC"),LFIN=@TEM@(NIV,"LFIN")
 I NIV=1 K @(TEM) G FINL
 K @TEM@(NIV)
 S NIV=NIV-1,@TEM=NIV
FINL S ETIQ="DEB2" G RET3^%QSATTR1

