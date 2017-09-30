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

;%QSVISER^INT^1^59547,73883^0
RQSVISER ;
 
 
 
 
DIALOG N COL,D,%D,H,%H,I,L,STOK
 S STOCK("MSG")="DETECTIONS DES INCOHERENCES"
 S STOCK("TITC")="Date Heure"
 S STOCK("LGC")=14
 S STOCK("COL",1)="Taux-1^6^T1"
 S STOCK("COL",2)="Taux-2^6^T2"
 S STOCK("COL",3)="Taux-3^6^T3"
 S STOCK("COL",4)="Taux-4^6^T4"
 S STOCK("COL",5)="Fin du test^14^FIN"
 S L=0,D=-1 F %D=0:0 S D=$N(^[QUI]RQSINTEG(D)) Q:D=-1  S H=-1 F %H=0:0 S H=$N(^[QUI]RQSINTEG(D,H)) Q:H=-1  D TDH
 S COL="STOCK" D ^%QUKOLO Q
TDH S L=L+1,STOCK(L)=D_" "_H F I=1:1:4 S STOCK(L,"T"_I)=$S($D(^[QUI]RQSINTEG(D,H,I,"TAUX")):$J(^[QUI]RQSINTEG(D,H,I,"TAUX"),1,2),1:"?")
 S STOCK(L,"FIN")=$S($D(^[QUI]RQSINTEG(D,H,"DATE.FIN")):^[QUI]RQSINTEG(D,H,"DATE.FIN"),1:"?")_" "_$S($D(^[QUI]RQSINTEG(D,H,"HEURE.FIN")):^[QUI]RQSINTEG(D,H,"HEURE.FIN"),1:"?")
 Q

