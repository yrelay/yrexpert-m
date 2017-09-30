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

;%EMSPGES^INT^1^59547,73869^0
EMSPGES ;
 
 
 
 
 
 
 N TEMP
 D INIT("",.TEMP)
 
 D ^%EMSPDEF(TEMP)
 
 Q:'($D(@TEMP))
 D ^%EMSPCAL(TEMP)
 
 D AFFI(TEMP)
 
 I $D(^DEVELOPPE($I)) S ^DEVELOPPE($I,"RESULTAT")=@TEMP@("RESULTAT")
 
 
 Q
 
 
INIT(ROUT,TEMP) 
 
 
 
 
 
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 I ROUT'="" D @ROUT
 Q
 
 
AFFI(TEMP) 
 
 
 
 
 
 D ^%VZCDB($$^%QZCHW("Resultat du calcul du developpe d'une forme specifique"),0)
 S DX=20,DY=22 X XY
 D BLD^%VVIDEO W $$^%QZCHW($$^%QZCHW("Diametre du disque capable"))
 S DX=50,DY=$Y X XY
 W "--->  " D REV^%VVIDEO W @TEMP@("RESULTAT")
 D NORM^%VVIDEO
 D ^%VZEAVT("")
 Q
 
 
EXIST(GLO,TYP) 
 N CTR,Y1
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Numero d'element")_" : ","",DX,RM-4,DY+1,DY-1,"","$$EXI^%EMSPGES",.CTR,.Y1)
 I CTR'="" S Y1=""
 I Y1="" Q Y1
 S TYP=@GLO@(Y1)
 Q Y1
 
EXI(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I '($D(@GLO@(YY1))) D ^%VZEAVT($$^%QZCHW("Cet element n'existe pas")) Q 0
 Q 1
 
 
CRE(GLO,TYP) 
 N CTR,Y1
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Numero d'element")_" : ","",DX,RM-4,DY+1,DY-1,"","$$INEX^%EMSPGES",.CTR,.Y1)
 I Y1="" S Y1=$$NOUV(GLO)
 I CTR'="" S Y1=""
 I Y1="" Q Y1
 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Type de l'element")_" : ","",DX,RM-4,DY+1,DY-1,"","$$TYPE^%EMSPGES",.CTR,.TYP)
 I CTR'="" S Y1="" Q Y1
 Q Y1
 
INEX(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I '($$NUM^%EMSPARC(.YY1,REAF)) Q 0
 I $D(@GLO@(YY1)) D ^%VZEAVT($$^%QZCHW("Cet element existe deja")) Q 0
 Q 1
 
TYPE(YY1,REAF) 
 S REAF=0
 I (YY1="D")!(YY1="d") S YY1="DROITE"
 I (YY1="A")!(YY1="a") S YY1="ARC"
 I (YY1'="DROITE")&(YY1'="ARC") Q 0
 Q 1
 
 
NOUV(GLO) 
 Q $ZP(@GLO@(""))+1

