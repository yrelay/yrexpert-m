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

;%QMEAANA^INT^1^59547,73877^0
%QMEAANA ;
 
 
 
 
 
 
 
 
ALL N BASE,J,OBJ,CTRLA,ABANDON,LIEN,LLIEN,ERTOT
 S ERTOT=1
 S LIEN="TRANSITION\"
 S LLIEN=$L(LIEN)
 S ABANDON=0
 S BASE=$$LIENI^%QSGEL3
 K ^[QUI]PBMANA("HEVEA")
 S OBJ=LIEN
BALL S OBJ=$$NXTRI^%QSTRUC8(BASE,OBJ)
 Q:OBJ=""
 Q:$E(OBJ,1,LLIEN)'=LIEN
 G:'($$AIR^%QSGE5(BASE,OBJ,"CONDITION.TRANSITION")) BALL
 S RES=$$ANAL(BASE,OBJ,"CONDITION.TRANSITION",1,1)
 R *CTRLA:0
 D TOUCHE^%INCCLAV(CTRLA,.CTRLA)
 I CTRLA=1 D ARRET Q:ABANDON
 G BALL
 
ANAL(BASE,INDI,ATT,VISU,INTERACT) 
 N GLOTET,TEMPL,TY,NL,J,I,OKTOT,LP,OK,REP,LERR
 S REP=$$NOMLOG^%QSF(BASE)
 S LERR=$$^%QZCHW("Analyse incorrecte pour ")_ATT_" no "
 S GLOTET=$$ADRESSE^%QMEBCDT
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(TEMPL)
 I VISU W !,! D REV^%VVIDEO W REP_" "_INDI D NORM^%VVIDEO
 D MVG^%QSCALVA(BASE,INDI,ATT,TEMPL,.TY)
 S OK=1,OKTOT=1
 S LP=$$^%QCAZG("^[QUI]PBMANA(""HEVEA"")")+1
 K @GLOTET@(INDI,ATT)
 S J=""
 F I=1:1 S J=$O(@TEMPL@(J)) Q:J=""  W:VISU !,"  ",@TEMPL@(J) D COND(@TEMPL@(J),INDI,ATT,J) I '(OK) D:INTERACT ERREUR S OK=1,OKTOT=0 I VISU W !,"   ",$$^%QZCHW("Erreur d'analyse...")
 K @(TEMPL)
 W:VISU !,"    ",$$^%QZCHW("ANALYSE")," ",$S(OKTOT:"OK",1:$$^%QZCHW("NON")_" OK")
 S ^[QUI]PBMANA("HEVEA")=LP-1
 Q OKTOT
 
COND(Y1,INDI,ATT,IND) 
 N POSIT,RA,SAVY1,SX,SY,CH,RESULT,NORES,TEMPO,P,ATTD,APPD,APPEX
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,NOCOMPIL,ERRMES,%PROVEN
 S ERRMES=0
 K ^SANAREQ($J),^NAVARACT($J)
 S SAVY1=Y1,(POSIT,P)=1,%COMPIL="",(APPEX,ATTD,APPD)=0,%PROVEN="HEV"
 S NOCOMPIL=1
 I $D(@GLOTET@(INDI,"CONDITION.TRANSITION",IND)) S RA=@GLOTET@(INDI,"CONDITION.TRANSITION",IND) D:RA'="" KILL^%ANA(RA)
 D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE")
 K @(TEMPO)
 D EMPIL^%ANGEPIL("COND2^%QMEAANA")
 G COND^%AN4
COND2 
 D END^%AN7
 D EPIL^%ANGEPIL
 K @(TEMPO)
 S OK=RESULT
 Q:'(OK)
 S @GLOTET@(INDI,ATT,IND)=NORES
 Q
 
 
ERREUR G:'(ERTOT) ERR2
 S ^[QUI]PBMANA("HEVEA",LP)=REP_" "_INDI
 S ^[QUI]PBMANA("HEVEA",LP+1)=$TR($J(" ",$L(^[QUI]PBMANA("HEVEA",LP)))," ","-")
 S LP=LP+2
ERR2 S ^[QUI]PBMANA("HEVEA",LP)="   "_LERR_J_" -> "_@TEMPL@(J)
 S LP=LP+1
 Q
 
ARRET W !,!
 D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 Q
 
 
VISU N CHOIX
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Conditions de transition : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("HEVEA"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""HEVEA"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,"^[QUI]PBMANA(""HEVEA"")",1)
 Q
 ;
 ;

