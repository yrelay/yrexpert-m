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

;%QUBKGR^INT^1^59547,73884^0
%QUBKGR ;;09:13 AM  3 Mar 1992; ; 27 Jul 93  4:47 PM
 
 
 
 
UTIL k ^%SCRE("QUBKGR"),^%SCRE("QUBKGR,COMMENT"),^%SCREC("QUBKGR")
 k ^%SCRE("QUBKGRF"),^%SCRE("QUBKGRF,COMMENT"),^%SCREC("QUBKGRF")
 k ^%SCRE("QUBKGRC"),^%SCRE("QUBKGRC,COMMENT"),^%SCREC("QUBKGRC")
 k ^%SCRE("QUBKGRO"),^%SCRE("QUBKGRO,COMMENT"),^%SCREC("QUBKGRO")
 s ^%SCRE("QUBKGR")=9
 s ^%SCRE("QUBKGR",1)="INDEX",^%SCRE("QUBKGR",1,1)="",^(2)=60,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QUBKGR""",^("ESPACE")="40,40"
 s ^%SCRE("QUBKGR",2)="INDEX",^%SCRE("QUBKGR",2,1)="Configuration : ",^(2)=5,^(3)=2,^(4)="",^(5)="",^(6)=0,^("ESPACE")="4,60"
 s ^%SCRE("QUBKGR",3)="INDEX",^%SCRE("QUBKGR",3,1)="",^(2)=60,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""D"""
 s ^%SCRE("QUBKGR",4,1)="Largeur totale      : ",^(2)=5,^(3)=4,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGR",5,1)="Hauteur             : ",^(2)=40,^(3)=4,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGR",6,1)="Position en X       : ",^(2)=5,^(3)=5,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGR",7,1)="Position en Y       : ",^(2)=40,^(3)=5,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGR",8,1)="Titre                    : ",^(2)=5,^(3)=6,^(4)="",^(5)="",^(6)=""
 s ^%SCRE("QUBKGR",9,1)="Traitement d'acceptation : ",^(2)=5,^(3)=7,^(4)="",^(5)="",^(6)=""
 s ^%SCRE("QUBKGR","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,1,79,9"
 
 s ^%SCRE("QUBKGR","OPTIONS")="fenetres:QUBKGRF,colonnes:QUBKGRC,colonnes.conditionnelles:QUBKGRO"
 s ^%SCRE("QUBKGR","ROUSUP")="$$SUPSMR^%QUBKGES"
 
 s ^%SCRE("QUBKGR","RELATION","QUBKGRF")=1
 s ^%SCRE("QUBKGR","RELATION","QUBKGRC")=1
 s ^%SCRE("QUBKGR","RELATION","QUBKGRO")=1
 s ^%SCRE("QUBKGR,COMMENT")=1
 s ^%SCRE("QUBKGR,COMMENT",1,1)="~K~78~8",^(2)=2,^(3)=1,^("MODAFF")="NORM"
 
 
 
 
SUITE 
 
 s ^%SCRE("QUBKGRF")=6
 s ^%SCRE("QUBKGRF",1)="INDEX",^%SCRE("QUBKGRF",1,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QUBKGR"""
 s ^%SCRE("QUBKGRF",2)="INDEX",^%SCRE("QUBKGRF",2,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="RESUL(2)"
 s ^%SCRE("QUBKGRF",3)="INDEX",^%SCRE("QUBKGRF",3,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""F"""
 s ^%SCRE("QUBKGRF",4)="INDEX",^%SCRE("QUBKGRF",4,1)="Numero             : ",^(2)=5,^(3)=14,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRF",5,1)="Largeur            : ",^(2)=5,^(3)=15,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRF",6,1)="Nombre de colonnes : ",^(2)=5,^(3)=16,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRF","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,11,79,20"
 s ^%SCRE("QUBKGRF","ROUMOD")="$$MODSMR^%QUBKGES"
 s ^%SCRE("QUBKGRF","ROUSUP")="$$SUPSMR^%QUBKGES"
 s ^%SCRE("QUBKGRF","MERE")="QUBKGR"
 s ^%SCRE("QUBKGRF,COMMENT")=1
 s ^%SCRE("QUBKGRF,COMMENT",1,1)="~K~78~9",^(2)=2,^(3)=11,^("MODAFF")="NORM"
 
 
 
 
 s ^%SCRE("QUBKGRC")=10
 s ^%SCRE("QUBKGRC",1)="INDEX",^%SCRE("QUBKGRC",1,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QUBKGR"""
 s ^%SCRE("QUBKGRC",2)="INDEX",^%SCRE("QUBKGRC",2,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="RESUL(2)"
 s ^%SCRE("QUBKGRC",3)="INDEX",^%SCRE("QUBKGRC",3,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""C"""
 s ^%SCRE("QUBKGRC",4)="INDEX",^%SCRE("QUBKGRC",4,1)="Numero    : ",^(2)=5,^(3)=12,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",5,1)="Largeur   : ",^(2)=5,^(3)=13,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",6,1)="Attribut  : ",^(2)=5,^(3)=14,^(4)="EXIOP^%LXUC5,CHBKPT^%LXUC5,ABR^%LXUC4,FULL^%LXUC4",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",7,1)="Indice    : ",^(2)=5,^(3)=15,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",8,1)="Titre     : ",^(2)=5,^(3)=16,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",9,1)="Formule   : ",^(2)=5,^(3)=17,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRC",10,1)="Ecrasement (J/C/T) : ",^(2)=5,^(3)=18,^(4)="",^(5)="",^(6)=0
 
 s ^%SCRE("QUBKGRC","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,11,79,20"
 s ^%SCRE("QUBKGRC","ROUMOD")="$$MODSMR^%QUBKGES"
 s ^%SCRE("QUBKGRC","ROUSUP")="$$SUPSMR^%QUBKGES"
 s ^%SCRE("QUBKGRC","MERE")="QUBKGR"
 s ^%SCRE("QUBKGRC,COMMENT")=1
 s ^%SCRE("QUBKGRC,COMMENT",1,1)="~K~78~9",^(2)=2,^(3)=11,^("MODAFF")="NORM"
 
 
 
 s ^%SCRE("QUBKGRO")=10
 s ^%SCRE("QUBKGRO",1)="INDEX",^%SCRE("QUBKGRO",1,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QUBKGR"""
 s ^%SCRE("QUBKGRO",2)="INDEX",^%SCRE("QUBKGRO",2,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="RESUL(2)"
 s ^%SCRE("QUBKGRO",3)="INDEX",^%SCRE("QUBKGRO",3,1)="",^(2)=2,^(3)=11,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""CC"""
 s ^%SCRE("QUBKGRO",4)="INDEX",^%SCRE("QUBKGRO",4,1)="Numero    : ",^(2)=5,^(3)=12,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",5,1)="Condition : ",^(2)=5,^(3)=13,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",6,1)="Largeur   : ",^(2)=5,^(3)=14,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",7,1)="Attribut  : ",^(2)=5,^(3)=15,^(4)="EXIOP^%LXUC5,CHBKPT^%LXUC5,ABR^%LXUC4,FULL^%LXUC4",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",8,1)="Indice    : ",^(2)=5,^(3)=16,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",9,1)="Titre     : ",^(2)=5,^(3)=17,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QUBKGRO",10,1)="Formule   : ",^(2)=5,^(3)=18,^(4)="",^(5)="",^(6)=0
 
 s ^%SCRE("QUBKGRO","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,10,79,20"
 s ^%SCRE("QUBKGRO","ROUMOD")="$$MODSMR^%QUBKGES"
 s ^%SCRE("QUBKGRO","ROUSUP")="$$SUPSMR^%QUBKGES"
 s ^%SCRE("QUBKGRO","MERE")="QUBKGR"
 s ^%SCRE("QUBKGRO,COMMENT")=1
 s ^%SCRE("QUBKGRO,COMMENT",1,1)="~K~78~9",^(2)=2,^(3)=11,^("MODAFF")="NORM"
 ;

