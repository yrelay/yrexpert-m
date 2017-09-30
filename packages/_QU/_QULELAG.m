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

;%QULELAG^INT^1^59547,73885^0
%QULELAG ;;02:30 PM  7 Oct 1992; ; 07 Oct 92  3:38 PM
 
 
 
UTIL k ^%SCRE("QULELV2"),^%SCRE("QULELV2,COMMENT"),^%SCREC("QULELV2")
 s ^%SCRE("QULELV2")=3
 s ^%SCRE("QULELV2",1)="INDEX",^%SCRE("QULELV2",1,1)="",^(2)=2,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QULEL2"""
 s ^%SCRE("QULELV2",2)="INDEX",^%SCRE("QULELV2",2,1)="configuration : ",^(2)=4,^(3)=2,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QULELV2",3,1)="longueur d'affichage : ",^(2)=4,^(3)=3,^(4)="",^(5)="",^(6)=0
 s ^%SCRE("QULELV2","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,1,78,5"
 s ^%SCRE("QULELV2","OPTIONS")="caracteristiques:QULELV2S"
 s ^%SCRE("QULELV2","RELATION","QULELV2S")=1
 s ^%SCRE("QULELV2,COMMENT")=1
 s ^%SCRE("QULELV2,COMMENT",1,1)="~K~78~4",^(2)=2,^(3)=1,^("MODAFF")="NORM"
 
 
 
 k ^%SCRE("QULELV2S"),^%SCRE("QULELV2S,COMMENT"),^%SCREC("QULELV2S")
 s ^%SCRE("QULELV2S")=31
 s ^%SCRE("QULELV2S",1)="INDEX",^%SCRE("QULELV2S",1,1)="",^(2)=2,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="RESUL(1)"
 s ^%SCRE("QULELV2S",2)="INDEX",^%SCRE("QULELV2S",2,1)="",^(2)=4,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="RESUL(2)"
 s ^%SCRE("QULELV2S",3)="INDEX",^%SCRE("QULELV2S",3,1)="",^(2)=4,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""LIEN"""
 s ^%SCRE("QULELV2S",4)="INDEX",^%SCRE("QULELV2S",4,1)="",^(2)=12,^(3)=7,^(4)="",^(5)="",^(6)=0
 f I=0,1,2 s ^%SCRE("QULELV2S",(I*3)+5,1)="-",^(2)=6,^(3)=I+9,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+6,1)="-",^(2)=50,^(3)=I+9,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+7,1)="-",^(2)=58,^(3)=I+9,^(4)="",^(5)="",^(6)=0
 f I=0,1,2 s ^%SCRE("QULELV2S",(I*3)+14,1)="-",^(2)=6,^(3)=I+13,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+15,1)="-",^(2)=50,^(3)=I+13,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+16,1)="-",^(2)=58,^(3)=I+13,^(4)="",^(5)="",^(6)=0
 f I=0,1,2 s ^%SCRE("QULELV2S",(I*3)+23,1)="-",^(2)=6,^(3)=I+17,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+24,1)="-",^(2)=50,^(3)=I+17,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELV2S",(I*3)+25,1)="-",^(2)=58,^(3)=I+17,^(4)="",^(5)="",^(6)=0
 
 s ^%SCRE("QULELV2S","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,6,79,21"
 s ^%SCRE("QULELV2S,COMMENT")=7
 s ^%SCRE("QULELV2S,COMMENT",1,1)="Commentaires",^(2)=17,^(3)=8,^("MODAFF")="REV"
 s ^%SCRE("QULELV2S,COMMENT",2,1)="Attributs de l'individu",^(2)=17,^(3)=12,^("MODAFF")="REV"
 s ^%SCRE("QULELV2S,COMMENT",3,1)="Attributs du lien",^(2)=17,^(3)=16,^("MODAFF")="REV"
 s ^%SCRE("QULELV2S,COMMENT",4,1)="~K~78~15",^(2)=2,^(3)=6,^("MODAFF")="NORM"
 s ^%SCRE("QULELV2S,COMMENT",5,1)="ligne",^(2)=50,^(3)=7,^("MODAFF")="NORM"
 s ^%SCRE("QULELV2S,COMMENT",6,1)="colonne",^(2)=58,^(3)=7,^("MODAFF")="NORM"
 s ^%SCRE("QULELV2S,COMMENT",7,1)="lien : ",^(2)=4,^(3)=7,^("MODAFF")="REV"
 q
 ;

