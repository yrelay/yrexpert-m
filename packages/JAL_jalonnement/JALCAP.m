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

;JALCAP^INT^1^59547,74867^0
JALCAP(MA,UNITE,DA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N AN,SEM,CAPA,ERR,ANSEM,CH
 I DA<2000 Q 0
 S AN=$$ANNO^%QMDATE1(DA),SEM=$$SEMNO^%QMDATE1(DA)
 S ANSEM=AN_$S($L(SEM)=1:"01",1:SEM)
 S ERR=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]MACAP",MA_",SECTION,"_UNITE_","_ANSEM),1,.CAPA)
 Q:(ERR=0)&(CAPA'="") CAPA
 S ERR=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]MACAPD",MA_",SECTION,"_UNITE),1,.CAPA)
 Q:ERR=0 CAPA
 Q 0
 
 
 
 
 
 
 
ADD(MA,UNITE,DA,VAL) 
 N AN,SEM,CHA,ERR,ANSEM,CH,RMA,CHAT
 I DA<2000 Q 0
 S AN=$$ANNO^%QMDATE1(DA),SEM=$$SEMNO^%QMDATE1(DA)
 S ANSEM=AN_$S($L(SEM)=1:"0"_SEM,1:SEM)
 S ^RESSOURCE($J,MA,ANSEM)=$$^%QCAZG("^RESSOURCE($J,"""_MA_""",ANSEM)")+VAL
 S CH=$S($D(^[QUI]MACAP(MA,"SECTION",UNITE,ANSEM)):^[QUI]MACAP(MA,"SECTION",UNITE,ANSEM),1:"")
 I CH="" S P1="",P2="^^^" G ADDMAJ
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10),VAL=$P(CH,"^",2)+VAL
ADDMAJ S ^[QUI]MACAP(MA,"SECTION",UNITE,ANSEM)=P1_"^"_VAL_"^"_P2
 Q
 
 
 
 
 
 
 
 
ADDCONT(MA,UNITE,DA,VAL) 
 N AN,SEM,CHA,ERR,ANSEM,CH,CAPA,RMA,CHA2,CHAT,P1,P2
 I DA<2000 Q 0
 S AN=$$ANNO^%QMDATE1(DA),SEM=$$SEMNO^%QMDATE1(DA)
 S ANSEM=AN_$S($L(SEM)=1:"0"_SEM,1:SEM)
 S ERR=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]MACAP",MA_",SECTION,"_UNITE_","_ANSEM),1,.CAPA)
 G:(ERR=0)&(CAPA'="") AJCHA
 S ERR=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]MACAPD",MA_",SECTION,"_UNITE),1,.CAPA)
 Q:ERR 0
AJCHA S RMA=$$RMACH^JALRPJ
 
 S CH=$$^%QCAZG("^[QUI]MACAP("""_MA_""",""SECTION"","""_UNITE_""","_ANSEM_")")
 I CH="" S CHAT=0 G AJCHA1
 S CHAT=$P(CH,"^",2)+0
AJCHA1 
 
 
 S CHA=CHAT+VAL
 Q:CHA>CAPA 0
 S ^RESSOURCE($J,MA,ANSEM)=$$^%QCAZG("^RESSOURCE($J,"""_MA_""",ANSEM)")+VAL
 
 
 I CH="" S P1="",P2="^^^" G AJCHA2
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
AJCHA2 S ^[QUI]MACAP(MA,"SECTION",UNITE,ANSEM)=P1_"^"_CHA_"^"_P2
 
 Q 1
TEST W !,$$JALCAP("LG25","POIDS.COMMANDE",$H)
 W !,$$JALCAP("LG24","POIDS.COMMANDE",$H)
 W !,$$JALCAP("LG24","POIDS.COMMANDE",$$DH41^%QMDATE(8750))
 Q

