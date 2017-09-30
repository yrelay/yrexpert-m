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

;TOSTRLAC^INT^1^59547,74875^0
TOSTRLAC ;
 
INIT S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI D CLEPAG^%VVIDEO
DEL S Y1="GAMLAC" K ^[QUI]SCRC(Y1),^[QUI]STRUCT(Y1),^[QUI]OCGRIL(Y1),^[QUI]SAISIGAM(Y1)
PERCOM S REP=$A("P")
 S REP=$C(REP) G:(REP'="C")&(REP'="P") PERCOM S QU=$S(REP="C":QUCOM,1:QUI)
DEB D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO S (NOMG,Y1)="GAMLAC"
 
 G:'($D(^[QU]SCRC(NOMG))) NEWG D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Grille deja existante ! La modifie-t-on (O/N) ? ") R *REP S REP=$C(REP) G:REP'=$$^%QZCHW("O") DEB
 D ^%ABMODGR G FIN
NEWG S MOD=0,JX=1,^[QU]SCRC(NOMG)=NOMG,^[QU]STRUCT(NOMG)=NOMG
 S NOST=1,DX=10,DY=0,PLA(1)=10,PLA(2)=50,PLA(3)=46,PLA(4)=59
 F IT=$$^%QZCHW("ALLIAGE : "),$$^%QZCHW("ETAT : ") X XY W IT S ^[QU]SCRC(NOMG,NOST)="INDEX",^[QU]SCRC(NOMG,NOST,1)=IT,^[QU]SCRC(NOMG,NOST,2)=PLA(NOST),^[QU]SCRC(NOMG,NOST,3)=DY,NOST=NOST+1,DX=PLA(NOST)
 S ^[QU]SCRC(NOMG,NOST,1)=$$^%QZCHW("LARGEUR : "),^[QU]SCRC(NOMG,NOST)="INDEX",^[QU]SCRC(NOMG,NOST,2)=10,DY=DY+1,^[QU]SCRC(NOMG,NOST,3)=DY,DX=10 X XY W $$^%QZCHW("LARGEUR : ")
 
 S NOST=NOST+1,DYP=DY,DX=10
 
 S DX=10,DY=5 X XY W $$^%QZCHW("Nota : - ") S XX=1 F IT=$$^%QZCHW("Nota : - "),DX,DY,"VIDE^%ABUCGRI" S ^[QU]SCRC(NOMG,NOST,XX)=IT,XX=XX+1
 S DX=17 F DY=6:1:16 X XY W "- " S XX=1,NOST=NOST+1 F IT="- ",DX,DY,"VIDE^%ABUCGRI" S ^[QU]SCRC(NOMG,NOST,XX)=IT,XX=XX+1
 S NOST=NOST+1,DX=5,DY=22 X XY W $$^%QZCHW("Date : ") S XX=1 F IT=$$^%QZCHW("Date : "),DX,DY S ^[QU]SCRC(NOMG,NOST,XX)=IT,XX=XX+1
 S ^[QU]SCRC(NOMG,NOST,4)="^%ABCTDAT"
NBC D POCLEPA^%VVIDEO
 S NBC=1 D ^%ABCOLON S DX=9 F DY=2:1:20 X XY W LIMC
 S ^[QU]STRUCT(NOMG,1,5)=NBC,^[QU]STRUCT(NOMG,1,5,2)=LIMC,^[QU]STRUCT(NOMG,1,5,1)=LCHP,^[QU]STRUCT(NOMG,1,5,3)=LIMS,LIG3=LIMC,LIG2=LIMS
HORIZ 
MOV 
 S X1=0,PPY=0,^[QU]STRUCT(NOMG,1,6)=PPY,DX=9,DDY=$S(PPY=0:3,1:PPY) F DY=3,DDY,21 X XY W LIMS
DPLA S NOST=1
 S VPMIN=1E-1,^[QU]STRUCT(NOMG,NOST,1)=VPMIN
UNIT D POCLEPA^%VVIDEO
 S ^[QU]STRUCT(NOMG,NOST,4)="NH"
FREQ S PVAR=1E-1
 S ^[QU]STRUCT(NOMG,NOST,2)=PVAR,YY=1,VAL=VPMIN,DY=4 I VPMIN'="?" D ^%ABSCIS
VCOL 
 S NVC=49,^[QU]STRUCT(NOMG,NOST,3)=$C(NVC),^[QU]STRUCT(NOMG,1,3,1)=$S($C(NVC)=2:VC2,1:LCHP) S:($C(NVC)=2)&(PPY=0) ^[QU]STRUCT(NOMG,1,6)=21
PVERT S PSEP=PPY,LCHP=8,ESPC=8,MPASX=0,MPASY=1,NXI=-1,NXS=80,NYI=3,NYS=21,DX=0,(DY,PY)=4 X XY
GPVERT S PY=8,C=$$^%QZCHW("Schema") G ALORS
 G:$D(^[QU]STRUCT(NOMG,2,PY,2))!$D(^[QU]STRUCT(NOMG,2,PY,3)) VALPAR S DY=DY+1 G TESTINCR
 S DY=DY+1 G TESTINCR
ALORS I $E(C,1,4)="----" S C="---------"_LIMS,DX=0,DY=PY X XY W C S DY=DY+1,^[QU]STRUCT(NOMG,2,PY)=C G TESTINCR
 
 S ^[QU]STRUCT(NOMG,2,PY)=C,DY=PY+1,LLC=$L(C),LDIF=8-LLC,CCN="" F VV=1:1:LDIF S CCN=CCN_" "
 S DX=0,DY=PY X XY W C G:C=$$^%QZCHW("EP.VISEE") CONCLU
 S C=$$^%QZCHW("EP.VISEE"),PY=2 G ALORS,CONCLU
 
 
VALPAR I PY<PPY S ODY=DY,ODX=DX D POCLEPA^%VVIDEO W $$^%QZCHW("Cette variable est elle continue (O/N) ? ") R *REP S REP=$C(REP),DX=ODX,DY=ODY G:(REP'=$$^%QZCHW("O"))&(REP'="N") VALPAR S ^[QU]STRUCT(NOMG,2,PY,4)=REP G:REP=$$^%QZCHW("O") TESTINCR
 D ^%ABVALDE,^%ABVALEG S DY=PY+1
TESTINCR I DY=PPY S DY=DY+1
 I DY>20 S DY=20
 G GPVERT
JEU D ^%ABGTPAR
JEUP 
JEUT 
CONCLU S ^[QU]SCRC(NOMG)=16 Q:MOD=1  S ^[QU]SCRC(NOMG,"TITRE")=NOMG Q
FIN Q
LISJEU 

