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

;%QWSIT^INT^1^59547,73886^0
%QWSIT ;
 
 
 
 
 
SVGDE 
 N GLOSVG,NUMSV
 D MAJREM
 S ISVGDE=ISVGDE+1
 S NUMSV=NOMETUDE_$S(ISVGDE>99:".",ISVGDE>9:".0",1:".00")_ISVGDE
 D COLR^%VZEAVT($$^%QZCHW("sauvegarde numero ")_NUMSV,0,79,0)
 S GLOSVG=$$CONCAS^%QZCHAD(GLOSAVE,ISVGDE)
 D ^%QCAGLC1(WWSTOCK,$$CONCAS^%QZCHAD(GLOSVG,"K"))
 D ^%QCAGLC1(WWSTEP,$$CONCAS^%QZCHAD(GLOSVG,"S"))
 D ^%QCAGLC1(WWORDAT,$$CONCAS^%QZCHAD(GLOSVG,"O"))
 Q
 
 
 
DEBUT 
 N ISV,WSV
 D INIT^%QUCHOIP(GLOSAVE,1,"",0,2,78,9)
DEB1 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Resultats de l'etude")_" "_NOMETUDE,0)
DEB2 S DY=21,DX=0 D CLEBAS^%VVIDEO
 
 
 D ^%VQUIKMN(0,80,22,MNSITG,.AD,.CTR)
 I AD'="" G @AD
 S DY=21,DX=0 D CLEBAS^%VVIDEO
 D END^%QUCHOIP Q
INIT 
 D SHOWGLO^%QWUT1(WWINIT)
 G DEB1
SUPP 
 I '($D(@GLOSAVE)) D ^%VZEAVT($$^%QZCHW("Il n'y a pas eu de sauvegardes")) G DEB2
 D AFF^%QUCHOIP
 S ISV=$$UN^%QUCHOIP
 G:ISV="" DEB2
 S WSV=$$CONCAS^%QZCHAD(GLOSAVE,ISV) K @(WSV)
 G DEB2
CONS 
 I '($D(@GLOSAVE)) D ^%VZEAVT($$^%QZCHW("Il n'y a pas eu de sauvegardes")) G DEB2
 D AFF^%QUCHOIP
 S ISV=$$UN^%QUCHOIP
 G:ISV="" DEB2
 S DY=22,DX=0 D CLEBAS^%VVIDEO
 S WSV=$$CONCAS^%QZCHAD(GLOSAVE,ISV)
 D SHOW(WSV) G DEB2
 
 
SHOW(WSV) 
 N AD,CTR,RES,SF,TEMP
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SHW") K @(TEMP)
 D LPROD^%QWUT1($$CONCAS^%QZCHAD(WSV,"O"),TEMP)
SH2 D INIT^%QUCHOIP(TEMP,1,"",0,2,78,9)
 D POCLEPA^%VVIDEO
 
EXPL D AFF^%QUCHOIP
CHE S RES=$$UN^%QUCHOIP
 G:RES="" FSH
 S SF=@TEMP@(RES,"S") I SF'>1 D ^%VZEAVT($$^%QZCHW("Cet attribut n'a pas ete produit lors de l'activation")) G CHE
 D SHENCH($$CONCAS^%QZCHAD(WSV,"S"),SF)
 G EXPL
 
FSH 
 S DY=2,DX=0 D CLEBAS^%VVIDEO
 D END^%QUCHOIP K @(TEMP)
 Q
 
SHENCH(WSV,SF) 
 N %I,CH,IF,IND,GLO,VAL,R,DO
 S IF=SF-1
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHEMIN") K @(GLO)
 F %I=1:1:IF S CH=@WSV@(%I,"CHOIX"),DO=$P(CH,"^",4),R=$P(CH,"^",5),IND=$P(CH,"^",2) D INS
 D INIT^%QUCHOIP(GLO,1,"",0,12,78,10)
 S DX=1,DY=11 X XY D REV^%VVIDEO X XY W $J("",5),$$^%QZCHW("Domaine"),$J("",15),$$^%QZCHW("Regle.activee"),$J("",10),$$^%QZCHW("Sur l'individu"),$J("",12) X XY D NORM^%VVIDEO
 D AFF^%QUCHOIP
 S IF=$$UN^%QUCHOIP
 D END^%QUCHOIP
 K @(GLO) Q
INS S DO=$E(DO,1,23),R=$E(R,1,23),IND=$E(IND,1,27)
 S VAL=%I_" "_DO_$J("",24-$L(DO))_R_$J("",24-$L(R))_IND_$J("",28-$L(IND))
 S @GLO@(VAL)=""
 Q
 
 
MAJREM 
 N %IS,%IP,PP,CH,DO,TY,RG,GL
 S GL="^[QUI]RQSDON(""QW"",""REM"")"
 F %IP=1:1 Q:'($D(@WWSTEP@(%IP,"SOURCE")))  S CH=@WWSTEP@(%IP,"SOURCE"),TY=$P(CH,"^",3),DO=$P(CH,"^",4),RG=$P(CH,"^",5),@GL@(TY,DO,RG,"BONUS")=@GL@(TY,DO,RG,"BONUS")+1
 S TY=""
 F %IP=0:0 S TY=$O(@GL@(TY)) Q:TY=""  S DO="" F %IS=0:0 S DO=$O(@GL@(TY,DO)) Q:DO=""  S RG="" F PP=0:0 S RG=$O(@GL@(TY,DO,RG)) Q:RG=""  S @GL@(TY,DO,RG)=@GL@(TY,DO,RG,"MALUS")/(@GL@(TY,DO,RG,"BONUS")+@GL@(TY,DO,RG,"MALUS"))
 Q
 ;

