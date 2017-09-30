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

;%MZGAM4^INT^1^59547,73871^0
MOZGAM4 ;
 
 
 
 
 
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1)="MOZGARDE"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,1)="NOM^1^^Identificateur de la gamme"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,2)="PLAN^1^^Plan"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,3)="REPERE^1^^Repere"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,4)="ORDRE^1^^Ordre"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,5)="INDICE^1^^Indice"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,6)="PLAN.COMPLEMENTAIRE^1^^Plan.complementaire (1)"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,7)="PLAN.COMPLEMENTAIRE^2^^Plan.complementaire (2)"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,8)="PLAN.COMPLEMENTAIRE^3^^Plan.complementaire (3)"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,9)="PLAN.COMPLEMENTAIRE^4^^Plan.complementaire (4)"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,10)="MATERIEL^1^^Materiel"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,11)="DESIGNATION.PIECE^1^^Designation.piece"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,12)="CODE.FAMILLE^1^^Code famille"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,13)="OPERATION.PROGRAMME.CONTROLE^1^^Opc"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,14)="OBSERVATION^1^^Observations"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,15)="DERNIER.INDICE^1^^Der indice"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,16)="DATE.DERNIER.INDICE^1^^Date"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,17)="COMMENTAIRE^1^^Commentaire"
 S ^[QUI]MOZPARA("GRILLE","TRAZOM","STAND",1,18)="COMMENTAIRE^2^^Commentaire"
 Q
 
 
 
 
ENTETE 
 K ^[QUI]MOZ("EDITION","TRAZOM","STAND")
 S ^[QUI]MOZ("EDITION","TRAZOM","STAND",1)="O.P.C^OPERATION.PROGRAMME.CONTROLE^1"
 S ^[QUI]MOZ("EDITION","TRAZOM","STAND",2)="Materiel^MATERIEL^1"
 S ^[QUI]MOZ("EDITION","TRAZOM","STAND",3)="Designation^DESIGNATION.PIECE^1"
 Q
 
 
 
 
INIT 
 K ^[QUI]MOZ("GRILLE","TRAZOM")
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1)="MOZLIGN1"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,1)="NUMERO.OPERATION^^1^Numero d'operation^2"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,2)="MACHINE^^7^Machine^7"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,3)="MACHINE.REMPLACEMENT^1^20^Machine de remplacement (1)^7"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,4)="MACHINE.REMPLACEMENT^2^29^Machine de remplacement (2)^7"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,5)="POSTE.MAIN^1^38^Poste.main^7"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,6)="NOMBRE.EXEMPLAIRES^1^52^Nombre d'exemplaires^"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,7)="COEFFICIENT.REMPLACEMENT^1^58^Coefficient de remplacement^"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,8)="TEMPS.PREPARATION^^62^Temps de preparation^"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,9)="TEMPS.FABRICATION^^68^Temps de fabrication^"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",1,10)="CODE.CASCADE^^74^Code cascade^"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",2)="MOZLIGN2"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",2,1)="ACTION^^10^Action^ACTION"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",2,2)="OBJET^^30^Objet^OBJET"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",2,3)="MANIERE^^50^Maniere^MANIERE"
 S ^[QUI]MOZ("GRILLE","TRAZOM","STAND",2,4)="OUTIL^^70^Outil^OUTIL"
 Q

