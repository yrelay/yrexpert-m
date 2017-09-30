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

;%TLKEIM2^INT^1^59547,74029^0
TLKEIM2 ;
 
 
 
 
 
 
 
 N ADR,CTR,MENU,TEMP,TYP,ENS,MSG,RESUL,RESULA,RESULF,RESUL2,Y
 S RESUL="^[QUI]CROSREF(""DATA"")",RESUL2=$$CONCAS^%QZCHAD(RESUL,"ATTRIBUT")
 S RESULA=$$CONCAS^%QZCHAD(RESUL2,"ATTR"),RESULF=$$CONCAS^%QZCHAD(RESUL2,"FONC")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"ENSEMBLE")
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Attributs")_"^ATTRI"
 S @MENU@(1,"COM")=$$^%QZCHW("Selection des attributs ")
 S @MENU@(2)=$$^%QZCHW("Fonctions")_"^FONC"
 S @MENU@(2,"COM")=$$^%QZCHW("Selection des fonctions ")
 S @MENU@(3)=$$^%QZCHW("Totalite")_"^TOTAL"
 S @MENU@(3,"COM")=$$^%QZCHW("Tous les attributs et toutes les fonctions ")
 S @MENU@(4)=$$^%QZCHW("Fin selection")_"^FSELEC"
 S @MENU@(4,"COM")=$$^%QZCHW("Fin selection des elements a consulter")
 
ACTU D CLEPAG^%VVIDEO,^%VZCD(0,79,0,2,0,0,$$^%QZCHW("Resultat par attributs et fonctions"))
CHOIX S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTU
END K @(TEMP) Q
 
ATTRI 
 D POCLEPA^%VVIDEO
 S Y=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous le resultat pour tous les attributs ?"),"N")
 G:Y=-1 CHOIX
 I Y=1 G SATTRI
 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S MSG="Selectionner les attributs par des [RETURN]"
 D ^%VZCDB(MSG,22)
 D SEL^%TLKEGL2(RESULA,ENS) G CHOIX
SATTRI D COPIE(RESULA,ENS)
 G CHOIX
 
FONC 
 D POCLEPA^%VVIDEO
 S Y=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous le resultat pour toutes les fonctions ?"),"N")
 G:Y=-1 CHOIX
 I Y=1 G SFONC
 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S MSG="Selectionner les fonctions par des [RETURN]"
 D ^%VZCDB(MSG,22)
 D SEL^%TLKEGL2(RESULF,ENS) G CHOIX
SFONC D COPIE(RESULF,ENS)
 G CHOIX
 
TOTAL 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D IMPRA^%TLKEGL4(RESUL,"",0,0)
 G END
 
FSELEC 
CONSUL 
 
 I ($D(@ENS)'=10)&($D(@ENS)'=11) G END
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D IMPRA^%TLKEGL4(RESUL,ENS,0,0)
 G END
 
COPIE(GL1,GL2) 
 N I,EL
 S EL=""
 F I=1:1 S EL=$O(@GL1@(EL)) Q:EL=""  S @GL2@(EL)=""
 Q
 
IMP 
 N RESUL,P
 S RESUL="^[QUI]CROSREF(""DATA"")"
 S P=^TABIDENT(WHOIS,"PRINTER")
 D CLEPAG^%VVIDEO,^%VZCD(0,79,0,2,0,0,$$^%QZCHW("Impression resultat cas d'emploi"))
 D IMPRA^%TLKEGL4(RESUL,"",1,P)
 Q

