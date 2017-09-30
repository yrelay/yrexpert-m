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

;%QMEADUP^INT^1^59547,73877^0
QMEADUP(S) 
 
 
 
 
 
 
 N NS,IND,NOT,ONOT,AT,ORD,BASE,ONOT2,ATT,ACT,GLO,NT,GL,Y1
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL.ATR") K @(GL)
DMDNOM S BASE="SAISIE.I"
 D POCLEPA^%VVIDEO
 S NS=$$^%VZAME1($$^%QZCHW("Nom de la nouvelle SAISIE : "))
 Q:NS="" 0
INT I $$IR^%QSGEST5(BASE,NS) D ^%VZEAVT($$^%QZCHW("Une SAISIE portant ce nom existe deja")) G DMDNOM
 D ^%VZEATT
 D PA^%QSGESTI(BASE,NS,"NOM",NS,1)
 D PA^%QSGESTI(BASE,NS,"COMMENTAIRE",$$^%QSCALVA(BASE,S,"COMMENTAIRE"),1)
 D PA^%QSGESTI(BASE,NS,"SENS.AFFICHAGE",$$^%QSCALVA(BASE,S,"SENS.AFFICHAGE"),1)
 S NOT=$$^%QSCALVA(BASE,S,"PRESENTATION")
 G:NOT="" SUIT1
 S IND=NS,ATT="PRESENTATION",ACT="",NT=NOT
 S ONOT2=$$OR^%QSCALVA(BASE,S,"PRESENTATION",NOT)
 D SAISD^%QSNOTE(.ONOT) K GLO
 D DUPL^%QSNOTE(BASE,S,ONOT2,QUI,NS,ONOT)
 D PA^%QSGESTI(BASE,NS,"PRESENTATION",NOT,ONOT)
 
SUIT1 K @(GL)
 D MVG^%QSCALVA(BASE,S,"ATTRIBUT",GL,.Y1)
 S ORD=""
BAT S ORD=$O(@GL@(ORD)) G:ORD="" SUIT2
 S AT=@GL@(ORD)
 D PA^%QSGESTI(BASE,NS,"ATTRIBUT",AT,ORD)
 D PA^%QSGESTI(BASE,NS,"NUMERO.ORDRE",$$^%QSCALIN(BASE,S,"NUMERO.ORDRE",ORD),ORD)
 D PA^%QSGESTI(BASE,NS,"VALEUR.DEFAUT",$$^%QSCALIN(BASE,S,"VALEUR.DEFAUT",ORD),ORD)
 D PA^%QSGESTI(BASE,NS,"LONGUEUR",$$^%QSCALIN(BASE,S,"LONGUEUR",ORD),ORD)
 S NOT=$$^%QSCALIN(BASE,S,"AIDE",ORD)
 G:NOT="" BAT
 S ONOT2=$$^%QSCALIN(BASE,S,"INDICE.NOTE",ORD)
 S ATT="AIDE",IND=NS,ACT="",NT=NOT
 D SAISD^%QSNOTE(.ONOT) K GLO
 D DUPL^%QSNOTE(BASE,S,ONOT2,QUI,NS,ONOT)
 D PA^%QSGESTI(BASE,NS,"AIDE",NOT,ORD)
 D PA^%QSGESTI(BASE,NS,"INDICE.NOTE",ONOT,ORD)
 G BAT
 
SUIT2 K @(GL)
 D MVG^%QSCALVA(BASE,S,"VALEUR.LEGALE",GL,.Y1)
 S ORD=""
BVL S ORD=$O(@GL@(ORD))
 I ORD="" K @(GL) D POCLEPA^%VVIDEO Q 1
 S VL=@GL@(ORD)
 D PA^%QSGESTI(BASE,NS,"VALEUR.LEGALE",VL,ORD)
 G BVL
 
 
INTF(S,NS) 
 
 
 
 
 
 
 
 N IND,NOT,ONOT,AT,ORD,BASE,ONOT2,ATT,ACT,GLO,NT
 G INT

