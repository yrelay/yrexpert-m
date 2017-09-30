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

;TOWCMSGR^INT^1^59547,74876^0
TOWCMSGR ;
 S %AJCMS=$$^%QZCHW("Cons/Mod/Sup")
 S %AJCMS=$$^%QZCHW("Cons/Mod/Sup"),NOMTAB="^[QUW]SAISIGAM",SCR=NOMG,ROUTI="^%ABMULGT"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^TOWAJGRI"
 S X1=3,CMS=0 D CLEPAG^%VVIDEO,^%ABACTSC G FIN:ABENDSCR=1 D ^TOWCOR G TOWCMSGR:X1<2
FIN G:ABENDSCR=1 END S %ALL=RESUL(1),%ETAT=RESUL(2),%LARG=RESUL(3)
END K CMS U 0 Q
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
 W *
 S PSEP=PPY,LCHP=8,ESPC=8,MPASX=0,MPASY=1,NXI=-1,NXS=80,NYI=3,NYS=21,DX=0,(DY,PY)=4 X XY
 S PY=8,C=$$^%QZCHW("Schema") G ALORS
 G:$D(^[QU]STRUCT(NOMG,2,PY,2))!$D(^[QU]STRUCT(NOMG,2,PY,3)) VALPAR S DY=DY+1 G TESTINCR
 S DY=DY+1 G TESTINCR
 I $E(C,1,4)="----" S C="---------"_LIMS,DX=0,DY=PY X XY W C S DY=DY+1,^[QU]STRUCT(NOMG,2,PY)=C G TESTINCR
 
 S ^[QU]STRUCT(NOMG,2,PY)=C,DY=PY+1,LLC=$L(C),LDIF=8-LLC,CCN="" F VV=1:1:LDIF S CCN=CCN_" "
 S DX=0,DY=PY X XY W C G:C=$$^%QZCHW("EP.VISEE") CONCLU
 S C=$$^%QZCHW("EP.VISEE"),PY=2 G ALORS,CONCLU
 
 
 I PY<PPY S ODY=DY,ODX=DX D POCLEPA^%VVIDEO W $$^%QZCHW("Cette variable est elle continue (O/N) ? ") R *REP S REP=$C(REP),DX=ODX,DY=ODY G:(REP'=$$^%QZCHW("O"))&(REP'="N") VALPAR S ^[QU]STRUCT(NOMG,2,PY,4)=REP G:REP=$$^%QZCHW("O") TESTINCR
 D ^%ABVALDE,^%ABVALEG S DY=PY+1
 I DY=PPY S DY=DY+1
 I DY>20 S DY=20
 G GPVERT
 D ^%ABGTPAR
 
 
 S ^[QU]SCRC(NOMG)=16 Q:MOD=1  S ^[QU]SCRC(NOMG,"TITRE")=NOMG Q
 Q
 ;

