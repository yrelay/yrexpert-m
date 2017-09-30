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

;%QSALLAN^INT^1^59547,73880^0
QSALLAN ;
 
 
 
 
 N VU,REQ,%Y,RES,I,CTRLA,ABAN,SOR,IMP,INTERAC
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO
 S INTERAC=1
 W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:(SOR'=1)&(SOR'=0)
 G @SOR
1 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... ")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP:(132)
0 D POCLEPA^%VVIDEO
01 S REQ="",ABAN=0
 K ^[QUI]PBMANA("REQUETE"),^[QUI]RQSDON("RQS","ATT")
 F %Y=0:0 S REQ=$O(^[QUI]RQS1(REQ)) Q:(REQ="")!(REQ="z")  W !,! D REV^%VVIDEO W REQ D NORM^%VVIDEO S RES=$$^%QSANAL(REQ,1) D:RES'=1 ERREUR R *CTRLA:0 D TOUCHE^%INCCLAV(CTRLA,.CTRLA) I CTRLA=1 D ARRET Q:ABAN
 Q:'(INTERAC)
 G:SOR=0 02
 U IMP W #
 U IMP W !,"PROBLEMES RENCONTRES"
 U IMP W !,"--------------------",!,!
 S I=""
 F %I=0:0 S I=$O(^[QUI]PBMANA("REQUETE",I)) Q:I=""  U IMP W !,^[QUI]PBMANA("REQUETE",I)
 C IMP
 Q
02 D:$$MES^%VZEOUI($$^%QZCHW("Consultation des problemes rencontres ?"),"O") VISU
 Q
ERREUR W !,REQ," : ",$$^%QZCHW("PROBLEME D'ANALYSE")
 W !,$J(" ",$L(REQ)+3),"------------------"
 Q
ARRET I SOR=1 C IMP
 I SOR=0 W !,!
 D POCLEPA^%VVIDEO
 S ABAN=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 I (SOR=0)&(ABAN=0) O IMP U IMP
 Q
 
 
REQU N VU,REQ,%Y,RES,I,CTRLA,ABAN,SOR,IMP,INTERAC
 S SOR=0
 S INTERAC=0
 G 01
 
 
VISU N CHOIX
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Requetes : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("REQUETE"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""REQUETE"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,"^[QUI]PBMANA(""REQUETE"")",1)
 Q
 ;

