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

;%EDCNOTB^INT^1^59547,73869^0
EDCNOTB(INDIV,NOTE,INDICE,DY,MARG,CADRE,IMPIND,IMPTIT,REEL,XD,YD) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %L,%MARGE,BA,C,COEF,COEF2,DERL,DX,DYB,DYH,L,LC,LIGN,MAXY,MC,%COEF,%COEF2,LG,XR,YR
 S (XR,YR,MAXY)=""
 I $$^%QCAZG("REEL")="" S REEL=1
 I (%9X="")!(%9Y="") U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("impossible de placer la note") H 1 G ENCOMBR:'(REEL) Q
 
 I INDIV="" S BA=BASE,INDIV=OBJET G IND
 I ($E(INDIV,1)="%")&$D(CXT(INDIV)) S BA=CXT(INDIV,"BASE"),INDIV=CXT(INDIV,"OBJET") G IND
 S BA=BASE,INDIV=OBJET
IND I (BA="")!(INDIV="") U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("repertoire de")," ",INDIV," ",$$^%QZCHW("inconnu") H 1 G ENCOMBR:'(REEL) Q
 S:NOTE="" NOTE=$$^%QSCALIN(BA,INDIV,"NOTE",INDICE)
 I '($$VAIR^%QSGEST5(BA,INDIV,"NOTE",NOTE)) U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("note")," ",NOTE," ",$$^%QZCHW("inconnu pour l'individu")," ",INDIV H 1 G ENCOMBR:'(REEL) Q
 I INDICE="" S INDICE=$$PRVRIAVO^%QSTRUC8(BA,INDIV,"NOTE",NOTE,"")
 
 I '($D(^[QUI]QUERYT(BA,INDIV,INDICE))) U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("note")," ",NOTE," ",$$^%QZCHW("d'indice")," ",INDICE," ",$$^%QZCHW("inconnue") H 1 G ENCOMBR:'(REEL) Q
 D POLICE(.COEF,.COEF2)
 S:(MARG="")!(MARG>%MARGE) MARG=%MARGE
 S DX=^V($J,"%","%X",1),DYH=^V($J,"%","%Y",1)
 I REEL G DEB
 
 S XR=DX,YR=DYH
 
 I XD'="" S ^V($J,"%","%X",1)=XD,DX=XD
 I YD'="" S ^V($J,"%","%Y",1)=YD,DYH=YD
DEB D:IMPTIT TITR
 S DERL=$ZP(^[QUI]QUERYT(BA,INDIV,INDICE,"LIGNE",""))
 F L=1:1:DERL S LIGN=^[QUI]QUERYT(BA,INDIV,INDICE,"LIGNE",L) D TL
 G ENCOMBR:(('(CADRE))&('(IMPIND)))&('(REEL))
 
 Q:('(CADRE))&('(IMPIND))
 S DYB=^V($J,"%","%Y",1),^V($J,"%","%Y",1)=DYH-DY
 
 I '(IMPIND) S ^V($J,"%","%Y2",1)=(DYB+(DY*5E-1))-DYH,^V($J,"%","%X",1)=DX-5E-1,^V($J,"%","%X2",1)=(MARG-^V($J,"%","%X",1))+5E-1 G CADRE
 
 S ^V($J,"%","%X",1)=((DX+(MARG-DX))\2)-(($L(INDICE)*COEF)\2) D COOR^%EDENVL S %9STR=INDICE,%FONC="TEXT" D ^%PBPZ G:'(CADRE) FIN
 
 S ^V($J,"%","%Y2",1)=^V($J,"%","%Y",1),^V($J,"%","%X2",1)=^V($J,"%","%X",1)-5E-1,^V($J,"%","%X",1)=DX-5E-1,%FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
 S ^V($J,"%","%X",1)=(^V($J,"%","%X2",1)+($L(INDICE)*COEF))+1
 S ^V($J,"%","%X2",1)=MARG+5E-1,%FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
 S (^V($J,"%","%X",1),^V($J,"%","%X2",1))=DX-5E-1,^V($J,"%","%Y2",1)=DYB+(DY*5E-1),%FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
 S (^V($J,"%","%X2",1),^V($J,"%","%X",1))=MARG+5E-1,%FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
 S ^V($J,"%","%X",1)=DX-5E-1,^V($J,"%","%Y",1)=^V($J,"%","%Y2",1),%FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
 
FIN S ^V($J,"%","%Y",1)=DYB,^V($J,"%","%X",1)=DX
 G ENCOMBR:'(REEL)
 Q
 
TL 
 G TL^%EDCNOTC
 
 
POLICE(COEF,COEF2) 
 S %FONC="CALCUL.COEFFICIENT" D ^%PBPZ
 S COEF=$$^%QCAZG("%COEF"),COEF2=$$^%QCAZG("%COEF2")
 Q
 
TITR 
 I '(REEL) G TITR1
 D COOR^%EDCENVL
 S %9STR=NOTE,%FONC="TEXT" D ^%PBPZ
TITR1 S (^V($J,"%","%Y2",1),^V($J,"%","%Y",1))=^V($J,"%","%Y",1)+15E-2
 S ^V($J,"%","%X2",1)=DX+($L(NOTE)*COEF) G TITR2:'(REEL)
 S %FONC="SEGMENT.TEXTE" D GRAPH^%EDCENVL
TITR2 S ^V($J,"%","%Y",1)=(^V($J,"%","%Y",1)+DY)-15E-2 Q:'(REEL)
 D COOR^%EDCENVL Q
 
CADRE I '(REEL) S MAXY=MAXY+DY G FIN
 S %FONC="CADRE" D GRAPH^%EDCENVL G FIN
 
ENCOMBR 
 I (XR'="")&(YR'="") S ^V($J,"%","%X",1)=XR,^V($J,"%","%Y",1)=YR D COOR^%EDCENVL
 Q MAXY
 
CALCLG(CH) 
 N LG,LG2,CAR
 S LG=$L(CH),LG2=0
 F I=1:1:LG S CAR=$E(CH,I) S:$A(CAR)<97 LG2=LG2+COEF S:$A(CAR)'<97 LG2=LG2+COEF2
 Q LG2
 
TEXTE(LIGN,DY,MARG) 
 G TEXTE^%EDCNOTC

