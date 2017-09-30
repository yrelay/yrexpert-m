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

;%QWDMU^INT^1^59547,73886^0
QWDMU ;
 
 
 
 
 
CHOIX() 
 N %LIG,P,PREF,DOMCOUR,LEVEL,BLANCS,TEMP,CORRES,GREL
 S GREL="^[QUI]RQSDON(""QW"",""CD"")"
 S P=$ZP(^QX($J,""))+1
 S DOMCOUR="GENERAL",LEVEL=1,%LIG=1,PREF="1."
 S BLANCS="                                       "
 K ^[QUI]QX($J,P),^QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=60
MAKE 
 S ^[QUI]QX($J,P,"T",%LIG,1)=PREF_"      "_DOMCOUR
 S %LIG=%LIG+1
 I $D(@GREL@(DOMCOUR,"FILS")) G MAKE11
MAKE05 G:LEVEL=1 CHX
 S PERCOUR=PILE(LEVEL-1)
 S DOMCOUR=$O(@GREL@(PERCOUR,"FILS",DOMCOUR))
 I DOMCOUR="" S PREF=$P(PREF,".",1,LEVEL-1),DOMCOUR=PERCOUR,LEVEL=LEVEL-1 G MAKE05
 S CPT=$P(PREF,".",LEVEL),PREF=$P(PREF,".",1,LEVEL-1)_"."_(CPT+1)_"."
 G MAKE
MAKE11 
 S PILE(LEVEL)=DOMCOUR
 S LEVEL=LEVEL+1
 S DOMCOUR=$O(@GREL@(DOMCOUR,"FILS",""))
 S PREF=PREF_"1."
 G MAKE
CHX 
 S RESINI=$$INI^%QUCHOI4(1,"",0,4,79,17,"",P,0)
 D AFF^%QUCHOI4(P)
 S TR=$$UN^%QUCHOI4(P)
 I TR="" G FCH
 S TR=$P(TR,". ",2)
 F %I=1:1 Q:$E(TR)'=" "  S TR=$E(TR,2,$L(TR))
 F %I=1:1 Q:$E(TR,$L(TR))'=" "  S TR=$E(TR,1,$L(TR)-1)
FCH D END^%QUCHOI4(P)
 K ^[QUI]QX($J,P)
 Q TR
 
EXISTE(YD) 
 Q $D(^[QUI]RQSGLO("QW","DOM",YD))

