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

;%QMECEVA^INT^1^59547,73878^0
QMCEVA ;
 N NOEINI,ABANDON,INDFOC,REPFOC,REPNOE,LIENOE,ETUDE,TEMPO,JOURNAL
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE") K @(TEMPO)
 D INIT^%ANGEPIL
DEBUT 
 S ABANDON=0,ETUDE=1
 
 D INIAFF^%QMECAFF(.REPNOE,.NOEINI,.REPFOC,.INDFOC)
 I ABANDON G FINEVA
 D EMPIL^%ANGEPIL("RETEXE^%QMECEVA") G EVAINT
RETEXE 
 D ENDAF^%QMECAFF
 G DEBUT
FINEVA 
 D ENDAF^%QMECAFF
 D EPIL^%ANGEPIL
 K @(TEMPO)
 Q
 
EVAINT 
 K @(TEMPO) S @TEMPO@(1)="NOEUD",@TEMPO@(2)="RESULT",@TEMPO@(3)="CHOIX"
 S @TEMPO@(4)="LISFOC",@TEMPO@(5)="ORIG",@TEMPO@(6)="BA",@TEMPO@(7)="OBJ"
 S @TEMPO@(8)="I",@TEMPO@(9)="J",@TEMPO@(10)="K"
 S I=11,J=""
BCXTJ 
 S J=$O(CXT(J)) I J="" G SAVTAB
 S K=""
BCXTK 
 S K=$O(CXT(J,K)) I K="" G BCXTJ
 S @TEMPO@(I)=$$CONCAS^%QZCHAD("CXT",J_","_K),I=I+1
 G BCXTK
SAVTAB 
 S J=""
BTABC S J=$O(TABC(J)) I J'="" S @TEMPO@(I)="TABC("""_J_""")",I=I+1 G BTABC
 D EMPV^%ANGEPIL(TEMPO)
 
 D INIT^%QMECNOE(REPFOC,INDFOC,.LISFOC,.ETUDE)
 I ^TOZE(WHOIS,"HEVEA JOUR")=1 S JOURNAL=$$CONCAS^%QZCHAD($$ADRESSE^%QMEBCDT,LISFOC_","_"JOURNAL") K @JOURNAL@(ETUDE) D ENTETE
 D INIRES^%QMECTRA(NOEINI)
 S RESULT=0,NOEUD=NOEINI
BCLNOE 
 D EMPIL^%ANGEPIL("RETEXP^%QMECEVA") G EXPL^%QMECNOE
RETEXP 
 I ABANDON!RESULT G FINBNO
 D CDSVR^%QMECTRA(.NOEUD)
FINBNO 
 I ((NOEUD'="")&('(RESULT)))&('(ABANDON)) G BCLNOE
 
 K TABC
 S TABC(1)="INDIVIDU FOCUS",TABC(2)="ETUDE",TABC(3)="VISUALISATION DU RESEAU" I $D(JOURNAL) S TABC(4)="JOURNAL"
BCLACC 
 D POCLEPA^%VVIDEO
 S CHOIX=$$^%VZECHO("TABC")
 I (CHOIX=1)!(CHOIX=6) G FACC
 I (((CHOIX'["FOCUS")&(CHOIX'["ETUDE"))&(CHOIX'["RESEAU"))&(CHOIX'["JOURNAL") D ^%VSQUEAK G BCLACC
 I CHOIX="JOURNAL" G JOURNAL
 I CHOIX["RESEAU" D ^%QMNF5($$ADRVISU^%QMECTRA,REPNOE,NOEINI,LIENOE,9999),REAF^%QMECAFF G BCLACC
 I CHOIX["FOCUS" S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET")
 I CHOIX["ETUDE" S BA=CXT("%","BASE"),OBJ=CXT("%","OBJET")
 D MODE^%QSATTRI(OBJ,BA,0,11,80,12,0)
 G BCLACC
 
JOURNAL 
 I '($D(@JOURNAL)) D ^%VZEAVT($$^%QZCHW("Cette etude n'a jamais ete activee")) G BCLACC
 D AFFERR^%QULIMZ(JOURNAL,$$^%QZCHW("Resultats de l'etude"))
 D REAF^%QMECAFF
 G BCLACC
 
FACC 
 D POCLEPA^%VVIDEO
 I CHOIX=1 S CHOIX=0
 I CHOIX=6 S CHOIX=1
 D FIN^%QMECNOE(LISFOC,CHOIX)
 D STORES^%QMECTRA
 G DEPIL^%ANGEPIL
 
ENTETE 
 N COMPTE S COMPTE=1
 S @JOURNAL@(COMPTE)=$TR($J(" ",75)," ","-")
 D INCR
 S @JOURNAL@(COMPTE)=$J(" ",3)_"nom de l'etude"_" : "_LISFOC_$J(" ",11)_"date"_" : "_$$TEMPS^%QMDATE D INCR
 D SAUT
 S @JOURNAL@(COMPTE)="repertoire de noeuds logiques"_" : "_REPNOE D INCR
 S @JOURNAL@(COMPTE)="noeud initial"_" : "_NOEINI D INCR
 S @JOURNAL@(COMPTE)="repertoire focus"_" : "_REPFOC D INCR
 S @JOURNAL@(COMPTE)="individu focus"_" : "_INDFOC D INCR
 D SAUT
 S @JOURNAL@(COMPTE)=$TR($J(" ",75)," ","-") D INCR
 S @JOURNAL@(COMPTE)=$J(" ",28)_"parcours du reseau" D INCR
 S @JOURNAL@(COMPTE)=$J(" ",28)_"------------------" D INCR
 S @JOURNAL=COMPTE
 Q
 
SAUT 
 S @JOURNAL@(COMPTE)=" "
 D INCR
 Q
 
INCR S COMPTE=COMPTE+1 Q
 
ADDJOUR(PROFAR,NOESOU) 
 Q:'($D(JOURNAL))
 N COMPTE
 S COMPTE=@JOURNAL
 S @JOURNAL@(COMPTE)=$J(" ",PROFAR*2)_NOESOU D INCR
 D SAUT
 S @JOURNAL=COMPTE
 Q

