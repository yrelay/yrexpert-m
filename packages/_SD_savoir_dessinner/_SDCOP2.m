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

;%SDCOP2^INT^1^59547,73888^0
SDCOP2 ;
 
 
 
 
 
 
 
 
COL(WHOIS1,QUI1,COL1,VER1,WHOIS2,QUI2,COL2,VER2) 
 N I,OB1,V1,LCOL1,LVER1,LCOL2,LVER2
 Q:(((COL1="")!(VER1=""))!(COL2=""))!(VER2="")
 K ^[QUI2]SDCOL(COL2,VER2)
 Q:'($D(^[QUI1]SDCOL(COL1,VER1)))
 S LCOL1=$S((COL1+0)'=COL1:""""_COL1_"""",1:COL1)
 S LVER1=$S((VER1+0)'=VER1:""""_VER1_"""",1:VER1)
 S LCOL2=$S((COL2+0)'=COL2:""""_COL2_"""",1:COL2)
 S LVER2=$S((VER2+0)'=VER2:""""_VER2_"""",1:VER2)
 D ADR^%QCAGLC("^["""_QUI1_"""]SDCOL("_LCOL1_","_LVER1,"^["""_QUI2_"""]SDCOL("_LCOL2_","_LVER2)
 S I=""
BCOL1 S I=$O(^[QUI1]SDCOL(COL1,VER1,"OBJ",I))
 Q:I=""
 G:'($D(^[QUI1]SDCOL(COL1,VER1,"OBJ",I,"R"))) BCOL1
 S OB1=$O(^[QUI1]SDCOL(COL1,VER1,"OBJ",I,"R",""))
 S V1=$O(^[QUI1]SDCOL(COL1,VER1,"OBJ",I,"R",OB1,""))
 D OBJ(WHOIS1,QUI1,OB1,V1,WHOIS2,QUI2,OB1,V1,0)
 K:'($D(^[QUI2]SDCOL(COL1,VER1))) ^[QUI2]SDOBJ(OB1,V1,"COL",COL1,VER1)
 S ^[QUI2]SDOBJ(OB1,V1,"COL",COL2,VER2)=""
 G BCOL1
 
OBJ(WHOIS1,QUI1,OB1,VER1,WHOIS2,QUI2,OB2,VER2,TUERCOL) 
 N LOB1,LVER1,LOB2,LVER2
 Q:(((OB1="")!(VER1=""))!(OB2=""))!(VER2="")
 K ^[QUI2]SDOBJ(OB2,VER2)
 K ^[QUI2]SDTEXT(OB2,VER2)
 K ^[QUI2]SDCOMP(OB2,VER2)
 S LOB1=$S((OB1+0)'=OB1:""""_OB1_"""",1:OB1)
 S LVER1=$S((VER1+0)'=VER1:""""_VER1_"""",1:VER1)
 S LOB2=$S((OB2+0)'=OB2:""""_OB2_"""",1:OB2)
 S LVER2=$S((VER2+0)'=VER2:""""_VER2_"""",1:VER2)
 D ADR^%QCAGLC("^["""_QUI1_"""]SDOBJ("_LOB1_","_LVER1,"^["""_QUI2_"""]SDOBJ("_LOB2_","_LVER2)
 D ADR^%QCAGLC("^["""_QUI1_"""]SDTEXT("_LOB1_","_LVER1,"^["""_QUI2_"""]SDTEXT("_LOB2_","_LVER2)
 D ADR^%QCAGLC("^["""_QUI1_"""]SDCOMP("_LOB1_","_LVER1,"^["""_QUI2_"""]SDCOMP("_LOB2_","_LVER2)
 Q:'(TUERCOL)
 K ^[QUI2]SDOBJ(OB2,VER2,"COL")
 Q

