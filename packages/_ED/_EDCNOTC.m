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

;%EDCNOTC^INT^1^59547,73869^0
EDCNOTC ;
 
 
 
 
 
TL 
 
 N NL,LSTU,I,C,IC,MOT,LIGNE
 S NL=1,LIGNE(NL)=""
 S LSTU=DX,IC=1,C=$E(LIGN,IC)
 
 F I=0:0 Q:C=""  D LIGN1
 
 F IC=1:1:NL S %9STR=LIGNE(IC) D ECR
 K LIGNE
TL2 S:'(REEL) MAXY=^V($J,"%","%Y",1)
 Q
LIGN1 
 F I=0:0 Q:C=""  Q:" !#&()*+,-/:;<=>\^~"'[C  D SEP
 I C="" Q
 
 I C="@" D VAL
 S MOT=""
 F I=0:0 Q:C=""  Q:" !#&()*+,-/:;<=>\^~"[C  D MOT
 
 S LIGNE(NL)=LIGNE(NL)_MOT
 S LSTU=LSTU+$$CALCLG(MOT)
 Q
SEP 
 I (LSTU+COEF2)'<MARG S NL=NL+1,LIGNE(NL)="",LSTU=DX
 
 S LIGNE(NL)=LIGNE(NL)_C
 S LSTU=LSTU+COEF2
 
 S IC=IC+1
 S C=$E(LIGN,IC)
 Q
MOT 
 I (LSTU+$$CALCLG(MOT_C))'<MARG D MOT1
 S MOT=MOT_C
 
 S IC=IC+1
 S C=$E(LIGN,IC)
 Q
 
MOT1 
 I LSTU=DX S LIGNE(NL)=MOT,MOT=""
 
 S NL=NL+1,LIGNE(NL)="",LSTU=DX
 Q
 
ECR 
 I REEL S %FONC="TEXT" D ^%PBPZ
 S ^V($J,"%","%Y",1)=^V($J,"%","%Y",1)+DY Q:'(REEL)
 D COOR^%EDCENVL Q
 
POLICE(COEF,COEF2) 
 S %FONC="CALCUL.COEFFICIENT" D ^%PBPZ
 S COEF=$$^%QCAZG("%COEF"),COEF2=$$^%QCAZG("%COEF2")
 Q
 
ENCOMBR 
 I (XR'="")&(YR'="") S ^V($J,"%","%X",1)=XR,^V($J,"%","%Y",1)=YR D COOR^%EDCENVL
 Q MAXY
 
CALCLG(CH) 
 N LG,LG2,CAR
 S LG=$L(CH),LG2=0
 F I=1:1:LG S CAR=$E(CH,I) S:$A(CAR)<97 LG2=LG2+COEF S:$A(CAR)'<97 LG2=LG2+COEF2
 Q LG2
 
TEXTE 
 N %L,%MARGE,BA,C,COEF,COEF2,DERL,DX,DYB,DYH,L,LC,MAXY,MC,%COEF,%COEF2,LG
 S VALPLA=""
 S REEL=1,DX=^V($J,"%","%X",1),DYH=^V($J,"%","%Y",1) D POLICE(.COEF,.COEF2)
 S:(MARG="")!(MARG>%MARGE) MARG=%MARGE
 D TL
 Q
VAL 
 I ($E(LIGN,IC+1)=" ")!($E(LIGN,IC+1)="") Q
 N VAL,ATT,MOT,ICC,IND,LG
 S ICC=IC,MOT=""
 F I=0:0 Q:C=""  Q:" !#&*+,-/:;<=>\^~"[C  D MOTLU
 S MOT=$E(MOT,2,999),ATT=$P(MOT,"(",1)
 S LG=$L(MOT,")"),IND=$P($P(MOT,"(",2),")",1,LG-1)
 S VAL=$$^%QSCALIN(BA,INDIV,ATT,IND)
 S LIGN=$$ZSUBST^%QZCHSUB(LIGN,"@"_MOT,VAL)
 S IC=ICC,C=$E(VAL,1)
 Q
MOTLU 
 S MOT=MOT_C
 S IC=IC+1
 S C=$E(LIGN,IC)
 Q

