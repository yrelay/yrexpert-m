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

;%TLHELPN^INT^1^59547,74029^0
%TLHELPN ;;02:02 AM  23 Jun 1992; 23 Jun 92  2:38 PM ; 08 Oct 92  7:10 PM
 
 S MODU="TRAITEMENT"
 D HELPV(MODU)
 Q
HELPV(MODU) 
 N XG,YH,DH,DV,VERBE,NOTE,INOTE,NT,TYPE,MENG,ADRES,CONTR
 S MENG=$$TEMP^%SGUTIL
 S XG=1,YH=6,DH=78,DV=16
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("VERBES"))
 S DY=6,DX=0 X XY
 
 S @MENG="22^10^79"
 S @MENG@(1)=$$^%QZCHW("page suivante")_"^PLUS",@MENG@(2)=$$^%QZCHW("page precedente")_"^MOINS"
 
VERBE D CLFEN^%VVIDEO(XG,YH,DV,DH)
 S VERBE=$$UN^%PKCHOIX("^%QUERYT(""PRODUIT"","""_MODU_""")",XG+1,YH,DV-1)
 G:VERBE="" FINVERB
 S INOTE=$O(^%QUERYT("VERBE",VERBE,""))
 G:INOTE="" VERBE
 S TYPE=^%QUERYT("VERBE",VERBE)
 
 
NEXTN S NOTE="^%QUERYT(""VERBE"","""_VERBE_""","_INOTE_")"
 S NT=TYPE_VERBE_" : "_^%QUERYT("VERBE",VERBE,INOTE)
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 D REAFF2^%QULIMO3(1,1,NOTE,XG,YH,DH,DV,0)
 S DX=(XG+(((DH-2)-$L(NT))\2))-1,DY=YH X XY W " " S DX=DX+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W NT D NORM^%VVIDEO
 S DX=DX+$L(NT) X XY W " "
 S DX=0,DY=22 D CLEBAS^%VVIDEO
AFFMEN D ^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") FIN G:ADRES'="" @ADRES
FIN S DX=0,DY=22 D CLEBAS^%VVIDEO G VERBE
MOINS S NXTN=$ZP(^%QUERYT("VERBE",VERBE,INOTE)) G NXN
PLUS S NXTN=$O(^%QUERYT("VERBE",VERBE,INOTE))
NXN I NXTN="" D ^%VSQUEAK G AFFMEN
 S INOTE=NXTN G NEXTN
 
 
 
FINVERB 
 K @(MENG)
 D CLFEN^%VVIDEO(XG-1,YH,DV,DH) Q
 
 
 
UTIL N PROD,%P,VERBE,%V,INOTE,TNOTE,%T,%I,VAL,TYPE
 K ^%QUERYT
 S VERBE="" F %V=0:0 S VERBE=$$NXTRI^%QSTRUC8("FONCTION",VERBE) Q:VERBE=""  D UTIL2 S INOTE=0 F TNOTE="SIGNIFICATION","SYNTAXE","EXEMPLE","FORMULATION" D UTIL3
 Q
UTIL2 S TYPE=$$^%QSCALIN("FONCTION",VERBE,"TYPE",1)
 S ^%QUERYT("VERBE",VERBE)=$$MIN^%VMINUSC(TYPE)_$S(TYPE="":"",1:" ")
 S PROD="" F %P=0:0 S PROD=$$NXTRIAO^%QSTRUC8("FONCTION",VERBE,"ACCESSIBLE.DEPUIS",PROD) Q:PROD=""  S %V=$$VALEUR^%QSTRUC8("FONCTION",VERBE,"ACCESSIBLE.DEPUIS",PROD) I %V S ^%QUERYT("PRODUIT",PROD,VERBE)=""
 Q
UTIL3 S VAL=TNOTE
 Q:'($$VAIR^%QSGE5("FONCTION",VERBE,"NOTE",TNOTE))
 K TAB
 S INDICE=""
 F %I=1:1 S INDICE=$$NXTRIAO^%QSTRUC8("FONCTION",VERBE,"NOTE",INDICE) Q:INDICE=""  S VAL=$$VALEUR^%QSTRUC8("FONCTION",VERBE,"NOTE",INDICE) I $E(VAL,1,$L(TNOTE))=TNOTE S IX=$P(VAL,".",2)+0,TAB(IX)=INDICE
 S IX=""
 F %I=1:1 S IX=$O(TAB(IX)) Q:IX=""  S INOTE=INOTE+1,INDICE=TAB(IX) D COPY^%QCAGLC("^[QUI]QUERYT(""FONCTION"","""_VERBE_""","""_INDICE_""",""LIGNE"")","^%QUERYT(""VERBE"","""_VERBE_""","_INOTE_")") S ^%QUERYT("VERBE",VERBE,INOTE)=TNOTE_" ("_%I_")"
 Q

