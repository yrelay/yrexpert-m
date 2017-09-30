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

;%TLALLAN^INT^1^59547,74028^0
%TLALLAN ;
 
 
 
 
 
 
ALL 
 N LISTE
 S LISTE="^[QUI]TTL"
 G COMMUN
 
PART(LISTE) 
 
 
 
 G COMMUN
 
COMMUN 
 N VU,TRT,%Y,RES,I,CTRLA,ABANDON,SOR,IMP,ANALGLOB,INTERACT,NBRTOT,NBREG
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse de traitements"),0)
 S ANALGLOB=1,INTERACT=0
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:(SOR'=1)&(SOR'=0)
 G @SOR
1 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... ")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP
0 
 D POCLEPA^%VVIDEO
01 S TRT="",ABANDON=0,NBRTOT=0
 K ^[QUI]PBMANA("TRAITEMENT")
 F %Y=0:0 S TRT=$O(@LISTE@(TRT)) Q:(TRT="")!(TRT="z")  W !,! D REV^%VVIDEO W TRT D NORM^%VVIDEO S RES=$$^%TLIANAL(TRT,1,INTERACT,.NBREG) D MAJR,POCLEPA^%VVIDEO I $$ISCTRLA^%SYSCLAV D ARRET Q:ABANDON
 G:'($D(^[QUI]PBMANA("TRAITEMENT"))) FIN
 G:SOR=0 FINAFF
 W #
 F %Y=1:1 Q:'($D(^[QUI]PBMANA("TRAITEMENT",%Y)))  W !,^[QUI]PBMANA("TRAITEMENT",%Y)
 G FIN
FINAFF D POCLEPA^%VVIDEO
 
 I $D(^[QUI]PBMANA("TRAITEMENT"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre"))
 E  D:$$MES^%VZEOUI($$^%QZCHW("Consultation des problemes rencontres ?"),"O") VISU
FIN I SOR=1 C IMP
 Q
 
MAJR S NBRTOT=NBRTOT+NBREG
 Q
 
ARRET I SOR=0 W !,!
 U 0
 D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 I SOR=1 U IMP
 Q
 
EXT 
 N VU,TRT,%Y,RES,I,CTRLA,ABANDON,SOR,IMP,ANALGLOB,INTERACT,LISTE
 S SOR=0
 S INTERACT=1
 S LISTE="^[QUI]TTL"
 G 0
 
 
TRAIT N VU,TRT,%Y,RES,I,CTRLA,ABANDON,SOR,IMP,ANALGLOB,INTERACT,NBREG,NBRTOT
 N LISTE
 S SOR=0
 S INTERACT=0
 S LISTE="^[QUI]TTL"
 G 01
 
 
VISU N CHOIX
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Traitements : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("TRAITEMENT"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""TRAITEMENT"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,"^[QUI]PBMANA(""TRAITEMENT"")",1)
 Q
 ;

