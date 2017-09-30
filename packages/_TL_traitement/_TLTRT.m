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

;%TLTRT^INT^1^59547,74031^0
TLTRT(AR,MODE) 
 
 
 
 
 
 N SAVOBJ,SAVREP,TRT,REP,ADRRET,LISTE,SAVL,BA,OBJ,POS
 S POS=1,TRT=$$SUBST^%ANARBR2($$RED^%ANA(AR,1),.CXT,"ATT^%TLIACT3",.POS)
 I (TRT="")!(POS=0) D:MODE'=0 ADD^%QUPILF("LOG",$$^%QZCHW("   Impossible de trouver le traitement")) Q
 I '($D(^[QUI]TTL(TRT))) D:MODE'=0 ADD^%QUPILF("LOG",$$^%QZCHW("   Impossible de trouver le traitement")) Q
 S REP=$$RED^%ANA(AR,2)
 S SAVOBJ=CXT("@","OBJET"),SAVREP=CXT("@","BASE")
 I REP=0 S OBJ=CXT("@","OBJET"),BA=CXT("@","BASE") G TLTRT2
 S REP=$$RED^%ANA(REP,"TEXTE")
 I '($D(CXT(REP,"BASE"))) D:MODE'=0 ADD^%QUPILF("LOG",$$^%QZCHW("   Le repertoire de l'individu fils n'est pas defini")) Q
 I '($D(CXT(REP,"OBJET"))) D:MODE'=0 ADD^%QUPILF("LOG",$$^%QZCHW("   L'individu fils n'est pas defini")) Q
 S OBJ=CXT(REP,"OBJET"),BA=CXT(REP,"BASE"),ADRRET="RETOUR^%TLTRT"
TLTRT2 S LISTE=$$GEN^%QCAPOP("TRT")
 D ^%QSGES11(BA,LISTE,"GDX",0,"","")
 D STOCK^%QSGES11(LISTE,OBJ)
 G AVECXT^%TLIACTI
RETOUR D DEL^%QSGES11(LIST)
 S CXT("@","OBJET")=SAVOBJ,CXT("@","BASE")=SAVREP Q
TRAITER(AR,CTXTRT,MODE) 
 S VAR="@" G TRA

