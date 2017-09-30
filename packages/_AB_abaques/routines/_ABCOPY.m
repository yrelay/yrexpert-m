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

;%ABCOPY^INT^1^59547,73864^0
%ABCOPY ;;06:24 PM  29 Mar 1993 ; 30 Mar 93 11:06 AM
 
 
 N LISCRE,ISU,%ISU
 S LISCRE=$$TEMP^%SGUTIL
 S @LISCRE=0
 S TIT=" "_$$^%QZCHW("DUPLICATION D'ABAQUES")_" ",PROGTRA="^%ABCOPY1" D ^%ABPRESA
 K ^TACOMPIL($I)
 S ISU="" F %ISU=0:0 S ISU=$O(@LISCRE@(ISU)) Q:ISU=""  S ^TACOMPIL($I,1,ISU)=@LISCRE@(ISU)
 D ^%ABCPGEX
FIN Q
 
 
COPIE(QUI1,FAMI1,VALNOR1,TYPNOR1,IDF1,TIT1,QUI2,FAMI2,VALNOR2,TYPNOR2,IDF2,TIT2) 
 
 
 G:$D(^[QUI2]SCRC(FAMI2)) S20
 D COPY^%QCAGLC($$CONCAS^%QZCHAD("^[QUI1]SCRC",FAMI1),$$CONCAS^%QZCHAD("^[QUI2]SCRC",FAMI2))
 D COPY^%QCAGLC($$CONCAS^%QZCHAD("^[QUI1]STRUCT",FAMI1),$$CONCAS^%QZCHAD("^[QUI2]STRUCT",FAMI2))
 D COPY^%QCAGLC($$CONCAS^%QZCHAD("^[QUI1]STRUCT",FAMI1_"/COMMENT"),$$CONCAS^%QZCHAD("^[QUI2]STRUCT",FAMI2_"/COMMENT"))
 
S20 
 D COPY^%QCAGLC($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI1]OCGRIL",FAMI1),VALNOR1),$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI2]OCGRIL",FAMI2),VALNOR2))
 D COPY^%QCAGLC($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI1]PRONUM",FAMI1),VALNOR1),IDF1),$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI2]PRONUM",FAMI2),VALNOR2),IDF2))
 D COPY^%QCAGLC($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI1]OCUNIT",FAMI1),VALNOR1),IDF1),$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD("^[QUI2]OCUNIT",FAMI2),VALNOR2),IDF2))
 S $P(^[QUI2]PRONUM(FAMI2,VALNOR2,IDF2),"^")=TIT2
 S $P(^[QUI2]PRONUM(FAMI2,VALNOR2,IDF2),"^",15)=TYPNOR2
 Q
 ;

