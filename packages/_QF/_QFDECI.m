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

;%QFDECI^INT^1^59547,73875^0
GRDECI ;; ; 07 Sep 88  8:40 AM
 
 N ADR,CTR
SLCOT S NUFA=$J,(CTRLA,CTRLF)=0 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,MEN1,.ADR,.CTR)
 
 
SLCOT1 S CTRLA=CTR="A",CTRLF=CTR="F" Q:CTRLF!CTRLA
 I CTR="R" D SCREESH^%QFECRAN G SLCOT
 G:ADR'="" @ADR
 G SLCOT
SLPAG D DGVID^%QFECRAN
SLPAG1 S DX1=2,DY1=6 S:$D(NDLG)=0 NDLG=5
SLPAG2 S MPASX=0,MPASY=1,NXI=1,NXS=4,NYI=5,NYSG=NDLG+1 D POCLEPA^%VVIDEO,2^%CGW("SYMB","FLECHE>",">") W " [RETURN]:Affectation  Rappel  Attribut  Prochain  Page,+,-  ?,!:?  CTRLH"
CURG S NYS=NYSG,DX=DX1,DY=DY1 X XY W *-1 D ^%QFMOVCU S DX1=$X,DY1=$Y S:%COTE="D" X1=62
 G:(X1=1)!(X1=6) SLCOT I X1=18 D SCREESH^%QFECRAN G SLPAG1
 S ADR=$S(X1=8:"^%QFHELP",(X1>48)&(X1<58):"NOPG^%QFPAGEC",(X1=61)!(X1=43):"PLUG^%QFPAGEC",X1=33:"SHORT^%QFINTOB",X1=45:"MOING^%QFPAGEC",X1=62:1,X1=13:"AFFOBJ^%QFOBJ",X1=82:"RAPPEL^%QFOBJ",(X1=63)!(X1=67):"^%QFINTOB",X1=80:"NEXT^%QFPAGEC",X1=65:"^%QFATAFI",1:0)
 I ADR=0 S ADR=$S(X1=18:"REAFF^%QFDECI",1:0)
 G:ADR=0 CURG G:ADR=1 SLPAD D @ADR
 S ADR=$S(RETOUR=0:"SLPAG",RETOUR=1:"SLPAG2",RETOUR=-1:"SLPAD",1:"CURG") G @ADR
SLPAD D GDVID^%QFECRAN
SLPAD1 S DX1=42,DY1=6 S:$D(NDLD)=0 NDLD=5
SLPAD2 S MPASX=0,MPASY=1,NXI=41,NXS=43,NYI=5,NYSD=NDLD+1 D POCLEPA^%VVIDEO,2^%CGW("SYMB","FLECHE<","<") W " [RETURN]:Selection Zoom Creation Fusion Suppress ?,! Attribut  CTRLH"
CURD S NYS=NYSD,DX=DX1,DY=DY1 X XY W *-1 D ^%QFMOVCU S DX1=$X,DY1=$Y S:%COTE="G" X1=60
 G:(X1=1)!(X1=6) SLCOT I X1=18 D SCREESH^%QFECRAN G SLPAD1
 S ADR=$S(X1=8:"^%QFHELP",(X1>48)&(X1<58):"NOPD^%QFPAGEC",(X1=61)!(X1=43):"PLUD^%QFPAGEC",X1=45:"MOIND^%QFPAGEC",X1=65:"^%QFATAFG",X1=60:1,X1=13:"^%QFSELGR",X1=83:"^%QFSUPGR",X1=90:"^%QFZOOM",X1=67:"^%QFCREGR",X1=70:"^%QFFUSGR",(X1=63)!(X1=47):"^%QFIMPGR",X1=33:"SHORT^%QFINTGR",1:0)
 I ADR=0 S ADR=$S(X1=18:"REAFF^%QFDECI",1:0)
 G:ADR=0 CURD G:ADR=1 SLPAG D @ADR
 S ADR=$S(RETOUR=0:"SLPAD",RETOUR=1:"SLPAD2",RETOUR=-1:"SLPAG",1:"CURD")
 G @ADR
FIN Q
CTRLA S CTRLA=1 Q
REAFF D SCREESH^%QFECRAN S RETOUR=0 Q

