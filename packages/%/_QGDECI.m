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

;%QGDECI^INT^1^59547,73876^0
%QGDECI ;;groupage manuel/saisie des decisions de manipulation ; 08 Jun 93  8:35 AM
 
 N MEN,ADR,CTR,SAVT
 
 
 S MEN=$$TEMP^%SGUTIL
 S @MEN@(1)=$$^%QZCHW("Individus")_"^"_"SLPAG",@MEN@(1,"EQU")="<"
 S @MEN@(2)=$$^%QZCHW("Lots")_"^"_"SLPAD",@MEN@(2,"EQU")=">"
SLCOT S NUFA=$J,(CTRLA,CTRLF)=0 D POCLEPA^%VVIDEO
 I $D(TIMOUT),TIMOUT=0 S CTR="F" G SLCOT1
 I $D(TIMOUT) S SAVT=^TOZE($I,"ATTENTE"),^TOZE($I,"ATTENTE")=TIMOUT
 D ^%VQUIKMN(0,80,23,MEN,.ADR,.CTR)
 I $D(TIMOUT) S ^TOZE($I,"ATTENTE")=SAVT
SLCOT1 S CTRLA=CTR="A",CTRLF=CTR="F"
 I CTRLA!CTRLF K @(MEN) Q
 I CTR="H" D ^%QGHELP G SLCOT
 G:ADR'="" @ADR
 G SLCOT
 
SLPAG D DGVID^%QGECRAN
SLPAG1 S DX1=2,DY1=6 S:$D(NDLG)=0 NDLG=5
SLPAG2 
 S MPASX=0,MPASY=1,NXI=1,NXS=4,NYI=5,NYSG=NDLG+1 D POCLEPA^%VVIDEO W "->:Lots  [RETURN]:Affectation  R:Rappel  CTRLH:Aide"
CURG S NYS=NYSG,DX=DX1,DY=DY1 X XY D ^%QGMOVCU S DX1=$X,DY1=$Y S:%COTE="D" X1=62
 G:(X1=1)!(X1=6) SLCOT I X1=18 D SCREESH^%QGECRAN G SLPAG1
 S ADR=$S(X1=8:"^%QGHELP",(X1>48)&(X1<58):"NOPG^%QGPAGEC",(X1=61)!(X1=43):"PLUG^%QGPAGEC",X1=33:"SHORT^%QGINTOB",X1=45:"MOING^%QGPAGEC",X1=62:1,X1=13:"AFFOBJ^%QGOBJ",X1=82:"RAPPEL^%QGOBJ",(X1=63)!(X1=67):"^%QGINTOB",X1=80:"NEXT^%QGPAGEC",X1=65:"^%QGATAFI",1:0)
 
 I ADR=0 G CURG
 I ADR=1 D GDVID^%QGECRAN,APD^%QGPAG G SLPAD1
 D @ADR
 
 S ADR=$S(RETOUR=0:"SLPAG",RETOUR=1:"SLPAG2",RETOUR=-1:"SLPAD",1:"CURG") G @ADR
 
SLPAD D GDVID^%QGECRAN
SLPAD1 S DX1=42,DY1=6 S:$D(NDLD)=0 NDLD=5
SLPAD2 
 
 S MPASX=0,MPASY=1,NXI=41,NXS=43,NYI=5,NYSD=NDLD+1 D POCLEPA^%VVIDEO W "<-:Individus  [RETURN]:Selection  C:Creation  CTRLH:Aide"
 
CURD S NYS=NYSD,DX=DX1,DY=DY1 X XY D ^%QGMOVCU S DX1=$X,DY1=$Y S:%COTE="G" X1=60
 G:(X1=1)!(X1=6) SLCOT I X1=18 D SCREESH^%QGECRAN G SLPAD1
 S ADR=$S(X1=8:"^%QGHELP",(X1>48)&(X1<58):"NOPD^%QGPAGEC",(X1=61)!(X1=43):"PLUD^%QGPAGEC",X1=45:"MOIND^%QGPAGEC",X1=65:"^%QGATAFG",X1=60:1,X1=13:"^%QGSELGR",X1=83:"^%QGSUPGR",X1=90:"^%QGZOOM",X1=67:"^%QGCREGR",X1=70:"^%QGFUSGR",(X1=63)!(X1=47):"^%QGIMPGR",X1=33:"SHORT^%QGINTGR",1:0)
 G:ADR=0 CURD G:ADR=1 SLPAG D @ADR
 S ADR=$S(RETOUR=0:"SLPAD",RETOUR=1:"SLPAD2",RETOUR=-1:"SLPAG",1:"CURD") G @ADR
FIN Q
CTRLA S CTRLA=1 Q

