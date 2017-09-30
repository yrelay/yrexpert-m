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

;%VCREASC^INT^1^59547,74034^0
GECREASC ;;09:44 AM  8 Jan 1996; 17 Jan 89  8:34 AM
 
ENT K SPMAHC S %POL=80 D CURRENT^%IS,CLEPAG^%VVIDEO S DX=0,DY=0 X XY
 D CAG^%VVIDEO S MSG=$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",DX=20-($L(MSG)\2) X XY W MSG S DYH=5,MSG="Creation de grilles",DXG=20-($L(MSG)\2) D BIG^%VVIDEO
GRI D POCLEPA^%VVIDEO W " Nom de l 'Image (ou xx? ou xx* ou a-j) " S DX=$X D ^%VLEC G FIN:Y1=""
 I Y1["?" W " Un instant..." D ^%VCREA01($P(Y1,"?",1)_"-zzzzz") G LIG:OK=1,ENT
 I Y1["-" W " Un instant..." D ^%VCREA01(Y1) G LIG:OK=1,ENT
 I Y1["*" W " Un instant..." D ^%VCREA01($P(Y1,"*",1)) G LIG:OK=1,ENT
 I $D(^%SCRE(Y1)) S SCR=Y1 K ^%SCREC(SCR) G LIG
 D VERI G GRI:'(OK)
SIOK D POCLEPA^%VVIDEO W "OK pour la creation de ",Y1 S OK=$$^%VZEOUI("N") I OK S SCR=Y1,^%SCRE(SCR)=0 G LIG
 G GRI
VERI S OK=1,%W=$L(Y1) F %U=1:1:%W S %V=$A($E(Y1,%U)),OK=$S(%V<48:0,(%V>57)&(%V<65):0,%V>90:0,1:1) Q:'(OK)
 S:$A($E(Y1,1))<65 OK=0 Q
LIG S M=SCR D ^%VCREA02
LIGNE S %POL=$S($D(^%SCRE(M,"POLICE")):^%SCRE(M,"POLICE"),1:80) S:%POL="" %POL=80 D:%POL=132 132^%VVIDEO
 I $D(^%SCRE(M,"POSITION")) S J=^%SCRE(M,"POSITION"),%LIXG=$P(J,",",1),%LIYH=$P(J,",",2),%LIXD=$P(J,",",3),%LIYB=$P(J,",",4) G LIGS
 S %LIXG=-1,%LIYH=-1,%LIYB=24,%LIXD=%POL
LIGS D CLEPAG^%VVIDEO
 F IT="%LIXG,%LIYH","%LIXD,%LIYH","%LIXG,%LIYB","%LIXD,%LIYB" S DX=@$P(IT,",",1),DY=@$P(IT,",",2) I (DX'<0)&(DY'<0) X XY W "+"
 S SCR=M I ($D(^%SCRE(SCR))#10)=1 D ^%VAFIGRI
LIGNE1 
 D POCLEPA^%VVIDEO W "No de Champ et Code : " S DX=$X D ^%VLEC G DIM:CTRLL,AUTR:CTRLE,RAFF:CTRLR,DEF:CTRLB,HELP:CTRLH I Y1="" D ZD^%QMDATE4,^%QMDAK0 S ^%SCRE(M,"DERNIER ACCES")=%DAT_" a "_HEURE G END
 I Y1="COMMENT" D ^%VCREA03 S (C,PX,PY)="" G LIGNE1
 D ^%VCREA06(Y1) G LIGNE1
END D CLEPAG^%VVIDEO D:%POL=132 80^%VVIDEO G GECREASC
AUTR D POCLEPA^%VVIDEO W "Grille " S DX=$X D ^%VLEC G LIGNE1:Y1="" D VERI G AUTR:'(OK),AUTR:'($D(^%SCRE(Y1))) S SCR=Y1 D ^%VAFIGRI S SCR=M G LIGNE1
RAFF G:($D(^%SCRE(SCR))#10)'=1 LIGNE1 D ^%VAFIGRI G LIGNE1
DIM D ^%VCREA04("NOLIB",.C,1) G LIGNE1
DEF D ^%VCREA02,^%VAFIGRI G LIGNE1
HELP K ^POS($J) S MEN=$P($S('(DTM):$T(MENH),MODTM:$T(MENHD),1:$T(MENHA)),";;",2) F %U=1:1 S %V=$P(MEN,"/",%U) Q:%V=""  S ^POS($J,%U)=%V
 D ^%VGENMEN(5,6,5,"^POS($J)"),CLEPAG^%VVIDEO
 S DYH=2,MSG="Fonctions disponiblees",DXG=20-($L(MSG)\2)
 D BIG^%VVIDEO,SEL^%VGENMEN(.ADR,.CTRL),CLEPAG^%VVIDEO,^%VAFIGRI G:ADR'="" @ADR G RAFF:CTRL="R",AUTR:CTRL="E",DIM:CTRL="L",DEF:CTRL="B",END:CTRL="A",LIGNE1
FIN D ECHON^%VVIDEO Q
MENH ;;CTRLA Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher une autre grille^AUTR/CTRLR Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1
MENHD ;;ESCP Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher une autre grille^AUTR/CTRLW Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1
MENHA ;;BREAK Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher une autre grille^AUTR/CTRLW Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1

