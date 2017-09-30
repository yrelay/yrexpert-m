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

;%CARUC^INT^1^59547,73867^0
%CARUC ;
 
 
 
 
 
 
 
 
 
 
JOUR(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))
 I RESUL(ICC-2)="" D ^%VZEAVT($$^%QZCHW("Veuillez saisir en premier l'annee")) Q
 I RESUL(ICC-1)="" D ^%VZEAVT($$^%QZCHW("Veuillez saisir en premier le mois")) Q
 Q:(P<1)!(P>31)
 N BIS,NBJ,MOIS
 S MOIS=RESUL(ICC-1)
 I MOIS="02" G FEV
 
 S NBJ=$$LONGM^%QZDAJM(MOIS)
 I P>NBJ D ^%VZEAVT($$^%QZCHW("Numero de jour superieur au nombre de jours du mois donnee")) Q
 S REFUSE=0
 G FJOUR
FEV 
 S BIS=$$BIS^%QMDATE(RESUL(ICC-2))
 S REFUSE=P>(28+BIS)
FJOUR Q:REFUSE=1
 I $L(P)=1 S TAB(ICC)="0"_P D ^%VAFFICH
 Q
 
MOIS(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:(P<1)!(P>12)
 
 I $L(P)'=2 S TAB(ICC)="0"_P D ^%VAFFICH
 S REFUSE=0 Q
 
AN(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:(P<1)!(P>99)
 S REFUSE=0 Q
 
HEURE(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:(P<0)!(P>24)
 I $L(P)'=2 S TAB(ICC)="0"_P D ^%VAFFICH
 S REFUSE=0 Q
 
HEURED(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:((P<0)!(P>99))&(P'="")
 I $L(P)=0 S TAB(ICC)="00" D ^%VAFFICH
 I $L(P)=1 S TAB(ICC)="0"_P D ^%VAFFICH
 S REFUSE=0 Q
 
MINUTE(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:((P<0)!(P>60))&(P'="")
 I $L(P)=0 S TAB(ICC)="00" D ^%VAFFICH
 I $L(P)=1 S TAB(ICC)="0"_P D ^%VAFFICH
 S REFUSE=0 Q
 
MINUTED(P) 
 S REFUSE=1 Q:'($$POSN^%QZNBN(P))  Q:((P<0)!(P>99))&(P'="")
 I $L(P)=0 S TAB(ICC)="00" D ^%VAFFICH
 I $L(P)=1 S TAB(ICC)="0"_P D ^%VAFFICH
 S REFUSE=0 Q
 
NUM 
 S REFUSE=0
 Q:%AJM="C"
 I %AJM="A" D ^%VUCPOP Q
 I %LLI'="modifier" D ^%VUCPOP Q
 I AFRESU(ICC)'=RESUL(ICC) D ^%VZEAVT($$^%QZCHW("Vous ne pouvez pas modifier ce champ")) S REFUSE=1 Q
 Q
 
 
 
 
STO 
 N NUMTAC
 D ^%VAUTOST Q:ABENDSCR=1
 S NUMTAC=RESUL(1)
 D SUPTACH^%CARECH(NUMTAC),AJTACH^%CARECH(NUMTAC)
 Q
 
SUPT() 
 N NUMTAC
 K @(m("OLDN")),@(m("OLDF"))
 S NUMTAC=RESUL(1)
 D SUPTACH^%CARECH(NUMTAC)
 
 
 K @NOMTAB@(RESUL(1),"CYC")
 
 K @NOMTAB@(RESUL(1),"ECH")
 F %I=1,3,4,5 S RESUL(%I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
 
MODI() 
 I OR(1)'=RESUL(1) D ^%VZEAVT($$^%QZCHW("Vous ne pouvez pas modifier ce champ")) Q 0
 Q 1
 
DUPL() 
 N NUMTAC,ANCNUM
 S ANCNUM=AFRESU(1)
 S NUMTAC=RESUL(1)
 D ^%VAUTOST Q:ABENDSCR=1 0
 
 
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(NOMTAB,ANCNUM_",""ECH"""),$$CONCAT^%QZCHAD(NOMTAB,NUMTAC_",""ECH"""))
 
 I $D(@NOMTAB@(ANCNUM,"CYC")) S @NOMTAB@(NUMTAC,"CYC")=@NOMTAB@(ANCNUM,"CYC")
 
 D SUPTACH^%CARECH(NUMTAC),AJTACH^%CARECH(NUMTAC)
 D:$D(NOM) NEWOLD^%VCMSCOR
 Q 0
 
SUP() 
 N NUMTAC
 K @(m("OLDN")),@(m("OLDF"))
 S NUMTAC=RESUL(1)
 D SUPTACH^%CARECH(NUMTAC),AJTACH^%CARECH(NUMTAC)
 Q 1

