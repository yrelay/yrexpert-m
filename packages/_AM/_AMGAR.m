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

;%AMGAR^INT^1^59547,73865^0
%AMGAR ;;04:07 PM  5 Nov 1993;
 
 
 
 
REG G:'($D(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE"))) ACT^%AMGA1
 S IREG=INST F %IREG=0:0 Q:$D(@GJOURN@(IREG,"T"))  S IREG=$ZP(@GJOURN@(IREG)) Q:IREG=""
 S LIGNE=@GJOURN@(IREG,"T")
 S GEN=@GJOURN@(IREG,"D")
 
 S JONE=0
 
 S TO=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",""))
 S TO2=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TO))
 I TO2="" S PREG=^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TO),JONE=1 G PREG
 D FK2
 D ^%funckey(CHOBJ)
READR 
 R *xx
 I $D(@TCHOBJ@(xx)) S PREG=@TCHOBJ@(xx) G PREG
 I xx=31 D ^%funckey(""),AFFKEY^%AMGA1 G ACT^%AMGA1
 
 I xx=27 G ESCA^%AMGA1
 G READR
 
 
 
PREG S @("GLO="_^%RQSGLO("EXPLIC",@MOTEUR,"REGLE",PREG,"GETGLO")_"(GEN)") I GLO="" G:JONE ACT^%AMGA1 G READR
 S @("GLOET="_^%RQSGLO("EXPLIC",@MOTEUR,"REGLE",PREG,"GETGLOET")_"(GEN)") I GLOET="" G:JONE ACT^%AMGA1 G READR
RPREG 
 
 S ETUREG=$$INIT^%AMUTXT2("",GLO,"$$MORE^%AMGAR",ORIGX,ORIGY,60,9)
 S @LFEN@(@LFEN,"ETUREG")=ETUREG
REPRAFF D AFF^%AMUTXT2(ETUREG)
REPRISE S COUR=$$RUN^%AMUTXT2(ETUREG)
 I COUR<1 D KILLAFF^%AMUTXT2(ETUREG),KILL^%AMUTXT2(ETUREG) K @LFEN@(@LFEN,"ETUREG") G:JONE ACT^%AMGA1 G READR
 S TYPE=$S($D(@GLO@(COUR,"TYPE")):@GLO@(COUR,"TYPE"),1:"")
 I TYPE="" D NOFOUND^%AMGA2 G REPRISE
 S DESC=@GLOET@(COUR)
 I '($D(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS"))) D NOFOUND^%AMGA2 G REPRISE
 S NBKEY=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS")
 S RES=$$FIND^%AMFIND2(JRN,INST,.NJRN,.NINST,TYPE,profondeur,NBKEY,$P(DESC,$C(0)),$P(DESC,$C(0),2),$P(DESC,$C(0),3),$P(DESC,$C(0),4),$P(DESC,$C(0),5),$P(DESC,$C(0),6))
 I RES=0 D NOFOUND^%AMGA2 G REPRISE
 G POP
 
 
POP S INST=NINST,JRN=NJRN
 D ^%funckey("")
 D AFFKEY^%AMGA1
 G NXFEN^%AMGA1
 
 
 
 
MORE(LIG) 
 N VAL,DESC,TYPE,AFFI
 
 S TYPE=$S($D(@GLO@(LIG,"TYPE")):@GLO@(LIG,"TYPE"),1:"")
 S VAL=$S($D(@GLOET@(LIG,"VAL")):@GLOET@(LIG,"VAL"),1:"???")
 S DESC=$S($D(@GLOET@(LIG)):@GLOET@(LIG),1:"")
 S @("AFFI="_^%RQSGLO("EXPLIC",@MOTEUR,"REGLE",PREG,"AFFIVAL")_"(TYPE,DESC,VAL)")
 Q AFFI
 
FK2 
 S ITF=21,NBTF=0
 S TCHOBJ=$$TEMP^%SGUTIL
 S CHOBJ="",TF=""
 S TF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TF)),TTF=^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TF),CHOBJ=^%RQSGLO("EXPLIC",@MOTEUR,"REGLE",TTF,"TEXTE"),@TCHOBJ@(ITF)=TTF
 S ITF=$S(ITF'=26:ITF+1,1:ITF+2)
 F %TF=0:0 S TF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TF)) Q:TF=""  S TTF=^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.REGLE",TF),CHOBJ=CHOBJ_","_^%RQSGLO("EXPLIC",@MOTEUR,"REGLE",TTF,"TEXTE"),@TCHOBJ@(ITF)=TTF,ITF=$S(ITF'=26:ITF+1,1:ITF+2),NBTF=NBTF+1
 S NBV=$L(CHOBJ,",")
 F %TF=NBV:1:8 S CHOBJ=CHOBJ_","
 S CHOBJ=CHOBJ_",ppal"
 Q

