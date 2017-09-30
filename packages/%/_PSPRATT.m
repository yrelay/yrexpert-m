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

;%PSPRATT^INT^1^59547,73874^0
%PSPRATT(ACT,XG,YH,LA,HA,BASE,INDI,ATT,VAL,ORD,GLO,AFF) ;;04:30 PM  28 Oct 1992; ; 29 Oct 92  4:21 PM
 
 
 
 I ACT="S" G SUPP
 I ACT="C" G AFFI
 I ACT="A" G AJOUT
 I ACT="M" G MOD
 D ^%VSQUEAK S AFF=1
 Q
 
 
 
 
MOD D ^%PSPRSA1(VAL,YH,HA)
 S AFF=2
 Q
 
 
 
AJOUT D LIRE^%VREAD($$^%QZCHW("no d'ordre :")_"  ","",0,22,22,22,.CTR,.ORD)
 S:ORD="" ORD=1
 D LIRE^%VREAD($$^%QZCHW("valeur :")_"  ","",0,22,22,22,.CTR,.VAL)
 I VAL="" S AFF=1 Q
 D ^%PSPRSA1(VAL,YH,HA)
 S GLO("AJ","PREDICAT",ORD)=VAL
 S AFF=2
 Q
 
 
 
 
 
 
AFFI G MOD
 
 
 
 
SUPP D POCLEPA^%VVIDEO
 S DX=XG,DY=23 X XY
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de")_" "_ATT_"("_ORD_") ?")'=1 FINS
 D POCLEPA^%VVIDEO
 S DX=XG,DY=23 X XY
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression du predicat")_" "_VAL_" ?")=1 D SUPP^%PSPRGES(VAL)
 S GLO("SUP",ATT,ORD)=VAL
 S AFF=1
FINS Q
 
 
 
COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,VAL1,OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE) 
 N ADR1,ADR2
 S ADR1=$$ADR(QUI1)
 S ADR2=$$ADR(QUI2)
 D PA^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE)
 
 I MODE=3 Q
 S @ADR2@(IND2,ATT2,OR2)=$$COPY^%ANA(QUI1,@ADR1@(IND1,ATT1,OR1),QUI2)
 
 Q
 
COPIE(WHOIS1,QUI1,BASE1,IND1,ATT1,WHOIS2,QUI2,BASE2,IND2,ATT2,MODE) 
 N I,TEMP,VAL,TYPE1,OR1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIE")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT1,VAL,.TYPE1)
 S OR1=$O(@VAL@(""))
 F I=0:0 Q:OR1=""  D COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,@VAL@(OR1),OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,@VAL@(OR1),OR1,MODE) S OR1=$O(@VAL@(OR1))
 K @(TEMP)
 Q

