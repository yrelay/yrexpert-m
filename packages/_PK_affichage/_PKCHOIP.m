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

;%PKCHOIP^INT^1^59547,73874^0
PKCHOIP ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PLUS(GLO,XG,YH,LV,GLOSEL) 
 N TITRE,LD,ROUTINT
 S TITRE="",LD=0,ROUTINT=""
 
COMM1 N INTAV,INTAR,LAR,GLOREF
 
 
 S LARG=75-XG,GLOREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REF")
 S INTAV="K @GLOREF F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=$E(S,1,LARG),@GLOREF@(CPT)=S Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="K @GLOREF F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=$E(S,1,LARG),@GLOREF@(CPT)=S Q:CPT=1  S S=$ZP(@GLO@(S))"
 
COMM2 N RES,I
LOOP S RES=$$COMM3^%PKCHOIX
 Q:RES=""
 I '($D(@GLOSEL@(RES))) S @GLOSEL@(RES)="" G LOOP
 K @GLOSEL@(RES)
 G LOOP
FLOOP 
 K @(GLOREF)
 
 
 
 
TIT(GLO,XG,YH,LV,TITRE,LD,GLOSEL) 
 N ROUTINT
 S ROUTINT=""
 G COMM1
 
 
 
 
TITINT(GLO,XG,YH,LV,TITRE,LD,ROUTINT,GLOSEL) 
 G COMM1
 
 
 
 
 
 
 
NUM(GLO,XG,YH,LV,TITRE,LD,GLOSEL) 
 N INTAV,INTAR,ROUTINT
 S ROUTINIT=""
 S INTAV="F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=@GLO@(S) Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=@GLO@(S) Q:CPT=1  S S=$ZP(@GLO@(S))"
 G COMM2
 
 
 
 
NUMINT(GLO,XG,YH,LV,TITRE,LD,ROUTINT,GLOSEL) 
 N INTAV,INTAR
 S INTAV="F %S=0:0 Q:(S="""")!(S=""z"")  S CPT=CPT+1,Y(CPT)=@GLO@(S) Q:CPT=LV  S S=$O(@GLO@(S))"
 S INTAR="F %S=0:0 Q:S=""""  S CPT=CPT-1,Y(CPT)=@GLO@(S) Q:CPT=1  S S=$ZP(@GLO@(S))"
 G COMM2
 
TEST D CLEPAG^%VVIDEO
TEST1 W !,"GLOBAL : " R GLO
 Q:GLO=""
 I '($D(@GLO)) W "  Inexistant !!!" G TEST1
 W !,"XG : " R XG
 W !,"YH : " R YH
 W !,"LV : " R LV
TEST2 S CH=$$UN^%PKCHOIX(GLO,XG,YH,LV)
 W !,"CHOIX : ",CH R *YY
 I CH="" G TEST
 D CLEPAG^%VVIDEO
 G TEST2
 ;

