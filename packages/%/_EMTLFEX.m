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

;%EMTLFEX^INT^1^59547,73869^0
EMTLFEX(VAR) 
 
 
 
 
 
 
 
 
 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Developpee d'emboutissage"))
 I $E(VAR)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable temporaire attendue")) S ECHEC=1 Q
 N EXP,TEMPO,TOL,TEMP,SAV
 K ^DEVELOPPE($I)
 S ^DEVELOPPE($I)=1,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S TEMP=$E(TEMPO,1,$L(TEMPO)-1),TOL="^TOLISRAM("_($I+0)
 K @(TEMPO)
 
 D ^%VZEATT,^%QCAMEMS,ADR^%QCAGLC(TOL,TEMP)
 
 S:DTM SAV=^TOLISRAM($I)
 K ^TOLISRAM($I)
 S:DTM ^TOLISRAM($I)=SAV
 
 D ^%EMMDRIV
 
 K ^TOLISRAM($I)
 
 D ^%VZEATT,^%QCAMEMR,ADR^%QCAGLC(TEMP,TOL)
 K @(TEMPO)
 
 D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 G:'($D(^DEVELOPPE($I,"RESULTAT"))) FIN
 
 S EXP=^DEVELOPPE($I,"RESULTAT")
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),VAR,EXP,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,EXP,1)
 D:MODAF'=0 ADD^%TLIFEN("ATT",VAR_"<--"_EXP)
 
FIN K ^DEVELOPPE($I)
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Developpee emboutissage terminee"))
 Q

