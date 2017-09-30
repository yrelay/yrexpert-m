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

;TOTBMAJT^INT^1^59547,74876^0
TOTBMAJT ;
 
 K ^SOUV($J) S P=-1 F %P=0:0 S P=$N(^GRAPH($J,P)) Q:P=-1  D TP
 K F,%F,NEWNOM,NF,NOM,NP,P,%P,^SOUV($J) Q
TP Q:$D(^SOUV($J,P))  S NOM=P D MODNOM S NP=NEWNOM
 S F=-1 F %F=0:0 S F=$N(^GRAPH($J,P,F)) Q:F=-1  D TPF
 I NP'=P S:$D(^GRAPH($J,P))#10 ^GRAPH($J,NP)=^GRAPH($J,P) K ^GRAPH($J,P)
 Q
TPF S NOM=F D MODNOM S NF=NEWNOM
 I NF'=F S ^GRAPH($J,NP,NF)=^GRAPH($J,P,F),^SOUV($J,NP,NF)="" K ^GRAPH($J,P,F)
 Q
MODNOM G @$S($F(NOM,"R:",0):"REGLE",$F(NOM,"RS:",0):"REGLE",1:"ATTRI")
REGLE G @$S($F(NOM,"R:"_%ART_"/",0):"RART",$F(NOM,"RS:"_%ART_"/",0):"RART",1:"RNART")
RART S NEWNOM=$S($F(NOM,"R:",0):"R:",1:"RS:")_$P(NOM,"/",2) D AFF Q
RNART D RART S NEWNOM=NEWNOM_"/"_$P($P(NOM,"/",1),":",2) D AFF Q
ATTRI S NOM=NOM G @$S($F("***"_NOM,"***"_%ART_"/",0):"ATTART",1:"ATTNAR")
ATTART G @$S($F(NOM,"/IMPLICI/",0):"ATT1",1:"ATT2")
ATT1 S NEWNOM=$P(NOM,"/",3) D AFF Q
ATT2 D ATT1 S NEWNOM=NEWNOM_"/EXP" D AFF Q
ATTNAR G @$S($F(NOM,"/IMPLICI/",0):"ATT3",1:"ATT4")
ATT3 S NEWNOM=$P(NOM,"/",3)_"/"_$P(NOM,"/",1) D AFF Q
ATT4 D ATT3 S NEWNOM=NEWNOM_"/EXP" D AFF Q
AFF Q

