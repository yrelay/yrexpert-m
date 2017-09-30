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

;%EDCTRT^INT^1^59547,73869^0
%EDCTRT(BASE,OBJET,TRT,MODE) 
 
 
 
 
 
TRA 
 N LIST,L,ARRET,STOP
 S (ANOMALIE,STOP)=1
 I TRT="" D POCLEPA^%VVIDEO W $$^%QZCHW("Le traitement n'est pas defini ... ") H 2 Q
 
 I '($$EXISTE^%TLINTER(TRT)) W TRT_$$^%QZCHW(": traitement inexistant") H 2 Q
 
 I (BASE="")!(OBJET="") U 0 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("L'objet du traitement n'est pas defini")),POCLEPA^%VVIDEO U %PORT Q
 D TRANSOUT
 S LIST=$$GEN^%QCAPOP("GDX")
 D ^%QSGES11(BASE,LIST,"GDX",0,"","")
 D STOCK^%QSGES11(LIST,OBJET)
 S L=$$CONTEXTL^%TLIACTI(TRT,LIST,MODE,0,0,.CXT)
 D DEL^%QSGES11(LIST),TRANSIN,SX^%QSGESTK("%",$J)
 ;;;;;  O %PORT  | remplace par prologue
 Q
 
TRANSIN N %ATT,%VAL,%ORD S %ATT=""
BOUCIN S %ATT=$$NXTRIA^%QSTRUC8("%",$J,%ATT) Q:%ATT=""  S %ORD=""
BINORD S %ORD=$$NXTRIAO^%QSTRUC8("%",$J,%ATT,%ORD) G:%ORD="" BOUCIN
 S ^V($J,"%",%ATT,%ORD)=$$VALEUR^%QSTRUC8("%",$J,%ATT,%ORD)
 G BINORD
 
 
 
TRANSOUT N %ATT,%VAL,%ORD
 I $D(^V($J,"%"))'=10 Q
 S %ATT=""
BOUT S %ATT=$O(^V($J,"%",%ATT))
 Q:%ATT=""
 S %ORD=""
BOUTORTD S %ORD=$O(^V($J,"%",%ATT,%ORD))
 G:%ORD="" BOUT
 D PA^%QSGESTI("%",$J,%ATT,^V($J,"%",%ATT,%ORD),%ORD)
 G BOUTORTD

