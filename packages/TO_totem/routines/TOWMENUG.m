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

;TOWMENUG^INT^1^59547,74876^0
TOWMENUG ;
 
DEB K ^COLDUP($I),^PLUCOL($I) S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI,(QUW,QUS,QU)=QUI,%DOS=0,%SUIV=0,%OWN=1 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO S Y1="GAMLAC"
 S NOMG=Y1
 G:$D(^[QUCOM]STRUCT(NOMG)) UVW
 
UVW S CONT=1 D CONT^%ABSUISF I CONT=0 D ^TOSTRLAC G DEB
 D ^%ABGTPAR,CLEPAG^%VVIDEO
QUES S QUW=QUI D POCLEPA^%VVIDEO W $$^%QZCHW("(P)remiere saisie d'une grille,(C)ompleter une grille ") R *REP D TOUCHE^%INCCLAV(REP,.REP) G:(REP=1)!((REP=6)!(REP=13)) FIN G:(REP'=$A("C"))&(REP'=$A($$^%QZCHW("P"))) QUES G @$C(REP)
P S %KN=0 D POCLEPA^%VVIDEO,^TOWAJGRI G:%KN=1 C2 I ABENDSCR=1 D CLEPAG^%VVIDEO G:%SUIV=1 FIN G QUES
 S DE=3,FI=18 D ^%ABNETTO,^%ABGETDP,POCLEPA^%VVIDEO S DP=^[QUW]OCGRIL(NOMG),DPCH=DP D ^%ABDPFIR,FREQ^TOWAFGRI,^TOWLIGNU,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D PGE^TOWGRPAG,AFFICH^TOWGRPAG S DX=10,DY=4 X XY D ^TOWREMGR G:%SUIV=1 FIN G QUES
C D ^TOWCMSGR I ABENDSCR=1 D CLEPAG^%VVIDEO G QUES
C2 D KILL S DE=3,FI=18 D ^%ABNETTO S DP=^[QUW]OCGRIL(NOMG),DPCH=DP D ^%ABDPFIR,^TOWDERDP,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR,PGE^TOWGRPAG,AFFICH^TOWGRPAG
QUES2 
 
65 D LIGBA S DX=$S(DP=DERDP:OLDPX,1:10),DY=4 X XY F SS=0:0 D AJ^TOWREMGR S DY=DY+1 X XY G QUES
43 D MORE^%ABCALDP,^TOWAFGRI,^%ABEMPGR G QUES2
45 G:DP=^[QUW]OCGRIL(NOMG) QUES2 D LESS^%ABCALDP,^TOWAFGRI,^%ABEMPGR G QUES2
FIN Q
86 D ^CVALOGRI G QUES2
LIGBA D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire ") D AFFICH^TOWGRPAG G FIN
KILL K ^RESCRE($I),VALCLE S %U=-1 F %V=1:1 S %U=$N(RESUL(%U)) Q:%U=-1  S ^RESCRE($I,%U)=RESUL(%U)
 K %NOM,%U,%V,%NOM1,%NOM2,%NOM3,%NOM4,%NUM,%NUM2,%RS,B1,B2,B3,B4,RESUL Q
MG W *
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
 Q
LISJEU 

