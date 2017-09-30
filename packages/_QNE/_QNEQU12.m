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

;%QNEQU12^INT^1^59547,73879^0
QNEQU12(LLISTEN,TOT,REG,NUM,PAS,VISU) 
 
 
 
 
 
 
 
 
 
 
 N GL1,HIS,REP,MES
 S GL1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GL1") K @(GL1)
 S HIS="FF"
 S MES=$$HSIM^%HXIHITR(GL1,HIS,1,LLISTEN,TOT,REG,NUM,0,1,PAS,VISU,"",.REP)
 I MES'="" K @(GL1) Q
 I '($D(@GL1)) K @(GL1) Q
 I '(VISU) D IMPR^%HXIHIT2(GL1,HIS,"G")
 K @(GL1)
 Q
 
HISTO D ^%QNEQU12(@VT@("LLISTEN"),"TEMPS.PAR.OPERATEUR","NOM",0,0,1)
 D REAFF^%QFGRECR
 Q
 
 
ETU 
 N MEN,ADR,CTR,ETU,TABL,I
 D CLEPAG^%VVIDEO
 D MAJ^%QNEQU11
 S ETU=$$REP^%QNEQETU
 
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S @MEN="22^5^79"
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MODI",@MEN@(1,"COM")=$$^%QZCHW("Modification du cycle, de l'effectif max par poste, du TAG et du TAL")
 S @MEN@(2)=$$^%QZCHW("Visualisation")_"^VISU",@MEN@(2,"COM")=$$^%QZCHW("Visualisation de tous les attributs de l'etude")
ACT 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,70,23,MEN,.ADR,.CTR)
 I (CTR="A")!(CTR="F") K @(MEN) D REAFF^%QFGRECR Q
 G:ADR="" ACT G @ADR
 
MODI 
 S TABL(1,"CYCLE")="",TABL(2,"TRAITEMENT.ACCEPTATION.LOCAL")=""
 S TABL(3,"TRAITEMENT.ACCEPTATION.GLOBAL")=""
 S TABL(4,"EFFECTIF.MAX.PAR.POSTE")=""
 D SELT^%QSATTRI(@VT@("ETUDE"),ETU,"TABL")
 
 S CYCLE=$$^%QSCALVA(ETU,@VT@("ETUDE"),"CYCLE")
 S TAL=$$^%QSCALVA(ETU,@VT@("ETUDE"),"TRAITEMENT.ACCEPTATION.LOCAL")
 S TAG=$$^%QSCALVA(ETU,@VT@("ETUDE"),"TRAITEMENT.ACCEPTATION.GLOBAL")
 S DMULT=$$^%QSCALVA(ETU,@VT@("ETUDE"),"EFFECTIF.MAX.PAR.POSTE")
 
 F I="CYCLE","DMULT","TAL","TAG" S @VT@(I)=@I
 
 I UTIL="E" S @VT@("TITRE")=$P(@VT@("TITRE"),"cycle",1)_"cycle = "_@VT@("CYCLE")_")"
 G ACT
 
VISU 
 D VISUM^%QSATTRI(@VT@("ETUDE"),ETU,1,1,78,20,0)
 G ACT

