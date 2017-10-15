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

;%QSVAREA^INT^1^59547,73883^0
%QSVAREA ;
 
 
 
 
 
ALL N CTRLA,ABANDON,TYPE,VARAC,RES
 S ABANDON=0
 K ^[QUI]PBMANA("VARACTI")
 S TYPE=""
BALL1 S TYPE=$O(^[QUI]QSVARACT(TYPE))
 Q:TYPE=""
 S VARAC=""
BALL2 S VARAC=$O(^[QUI]QSVARACT(TYPE,VARAC))
 G:VARAC="" BALL1
 S RES=$$VARAC(TYPE,VARAC,1,0)
 Q:ABANDON
 R *CTRLA:0
 D TOUCHE^%INCCLAV(CTRLA,.CTRLA)
 I CTRLA=1 D ARRET Q:ABANDON
 G BALL2
 
VARAC(T,VA,VISU,INTERACT) 
 N SITL,SITC,ACT,OK,LP,OKTOT,LERS,LERA,ERS,ERA,I,J,LP,Y1
 S LP=$$^%QCAZG("^[QUI]PBMANA(""VARACTI"")")+1
 S OKTOT=1,OK=1
 S LERS=$$^%QZCHW("Erreur d'analyse dans la situation")
 S LERA=$$^%QZCHW("Erreur d'analyse dans l'action")
 S ERS=$$^%QZCHW("SITUATIONS")
 S ERA=$$^%QZCHW("ACTIONS")
 S SITL="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""LIGNE"")"
 S SITC="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"",""COMP"")"
 S ACT="^[QUI]QSVARACT("""_T_""","""_VA_""",""ACTIONS"")"
 I VISU W !,! D REV^%VVIDEO W T," : ",VA D NORM^%VVIDEO
 W:VISU !,!,ERS
 S I="",LER=LERS
 F %I=0:0 S I=$O(@SITL@(I)) Q:I=""  S Y1=@SITL@(I) W:VISU !,"  ",Y1 D SITU(Y1,I) I '(OK) D:'(INTERACT) ERREUR S OK=1,OKTOT=0 W:VISU !,"   ",LER
 R *CTRLA:0
 D TOUCHE^%INCCLAV(CTRLA,.CTRLA)
 I CTRLA=1 D ARRET G:ABANDON FVARAC
 W:VISU !,!,ERA
 S I="",LER=LERA
 F %I=0:0 S I=$O(@ACT@(I)) Q:I=""  S Y1=@ACT@(I) W:VISU !,"  ",Y1 D ACT(Y1,I) I '(OK) D:'(INTERACT) ERREUR S OK=1,OKTOT=0 W:VISU !,"   ",LER
 W:VISU !,"    ",$$^%QZCHW("ANALYSE")," ",$S(OKTOT=1:"OK",1:$$^%QZCHW("NON")_" OK")
FVARAC S ^[QUI]PBMANA("VARACTI")=LP-1
 Q OKTOT
 
SITU(Y1,P1C) 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,ATTD,APPD,APPEX,ERRMES,%PROVEN
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,CH,NORES,P,RESULT,TEMPO
 K ^SANAREQ($J) S ^NAVARACT($J)=1,NOCOMPIL=0
 S (ATTD,APPD,APPEX)=0,ERRMES=0,%PROVEN="TRT"
 S SAVY1=Y1,(POSIT,P)=1
 D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 
 I $E(CH)=":" S %COMPIL=";" G SUIT2
 
 S %COMPIL="I ("
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("SUIT0^%QSVAREA")
 G COND^%AN4
SUIT0 
 D END^%AN7,EPIL^%ANGEPIL
 K @(TEMPO),^NAVARACT($J)
 S %COMPIL=%COMPIL_") S EXP=1"
SUIT2 S OK=RESULT
 I '(OK) G FIN
 
SUIT1 S @SITC@(P1C)=%COMPIL
FIN 
 D KILL^%ANA(NORES)
 S Y1=SAVY1
 Q
 
 
ACT(Y1,P1C) 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,APPD,ATTD,APPEX,ERRMES,%PROVEN
 K ^SANAREQ($J)
 S (APPD,ATTD,APPEX)=0,ERRMES=0,%PROVEN="TRT"
 S SAVY1=Y1,POSIT=1,^NAVARACT($J)=1,NOCOMPIL=1
 I $D(@ACT@(P1C,"TETE")) D KILL^%ANA(@ACT@(P1C,"TETE"))
 S OK=$$LIGN^%AN15(Y1,.POSIT,.RA)
 G:'(OK) FINA
 S @ACT@(P1C,"TETE")=RA
FINA S Y1=SAVY1
 K ^NAVARACT($J)
 Q
 
ERREUR G:'(OKTOT) ERR2
 S ^[QUI]PBMANA("VARACTI",LP)=T_" : "_VA,LP=LP+1
 S ^[QUI]PBMANA("VARACTI",LP)=$TR($J(" ",$L(^[QUI]PBMANA("VARACTI",LP-1)))," ","-"),LP=LP+1
ERR2 S ^[QUI]PBMANA("VARACTI",LP)=LER_" n "_I_" : "_Y1
 S LP=LP+1
 Q
 
ARRET W !,!
 D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 Q
 
 
VISU N CHOIX
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Variables actives : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("VARACTI"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""VARACTI"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,"^[QUI]PBMANA(""VARACTI"")",1)
 Q
 ;
 ;

