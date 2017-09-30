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

;%EDCNOTE^INT^1^59547,73869^0
%EDCNOTE(INDIV,NOTE,INDICE,DY,MARG,CADRE,IMPIND,IMPTIT,REEL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %L,%MARGE,BA,C,COEF,DERL,DX,DYB,DYH,L,LC,LIGN,MAXY,MC,%COEF,%COEF2
 I $$^%QCAZG("REEL")="" S REEL=1
 I (%9X="")!(%9Y="") U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("impossible de placer la note ...") H 1 G ENCOMBR:'(REEL) Q
 
 I INDIV="" S BA=BASE,INDIV=OBJET G IND
 I ($E(INDIV,1)="%")&$D(CXT(INDIV)) S BA=CXT(INDIV,"BASE"),INDIV=CXT(INDIV,"OBJET") G IND
 S BA=BASE,INDIV=OBJET
IND I (BA="")!(INDIV="") U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("Repertoire de "),INDIV,$$^%QZCHW(" inconnu ...") H 1 G ENCOMBR:'(REEL) Q
 I '($$VAIR^%QSGEST5(BA,INDIV,"NOTE",NOTE)) U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("Note "),NOTE,$$^%QZCHW(" inconnu pour l'individu "),INDIV H 1 G ENCOMBR:'(REEL) Q
 I INDICE="" S INDICE=$$PRVRIAVO^%QSTRUC8(BA,INDIV,"NOTE",NOTE,"")
 
 I '($D(^[QUI]QUERYT(BA,INDIV,INDICE))) U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("Note "),NOTE,$$^%QZCHW(" d'indice "),INDICE,$$^%QZCHW(" inconnue...") H 1 G ENCOMBR:'(REEL) Q
 S DX=^V($J,"%","%X",1),DYH=^V($J,"%","%Y",1) D POLICE(.COEF,.COEF2)
 S:(MARG="")!(MARG>%MARGE) MARG=%MARGE
 D:IMPTIT TITR
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
 S ^V($J,"%","%X",1)=DX-5E-1,^V($J,"%","%Y",1)=^V($J,"%","%Y2",1),%FONC="SEGMENT.TEXTE" D GRAH^%EDCENVL
 
FIN S ^V($J,"%","%Y",1)=DYB,^V($J,"%","%X",1)=DX
 G ENCOMBR:'(REEL)
 Q
 
TL 
 S LONG=$L(LIGN) I ((LONG*COEF)+DX)<MARG S %9STR=LIGN D ECR Q
 S (%9STR,MC)="",LC=DX
 F %L=1:1:LONG S C=$E(LIGN,%L) D TEST
 I %9STR'="",(LC+($L(MC)*COEF))<MARG S %9STR=%9STR_MC D ECR
 I %9STR'="",(LC+($L(MC)*COEF))'<MARG D ECR S %9STR=MC D ECR
 S:'(REEL) MAXY=^V($J,"%","%Y",1)
 Q
TEST 
 I C'=" " S MC=MC_C Q
TM I (LC+(($L(MC)+1)*COEF))<MARG S MC=MC_" ",%9STR=%9STR_MC G FINT
 D ECR S LC=DX,MC=MC_" ",%9STR=MC
FINT S LC=LC+($L(MC)*COEF),MC="" Q
 
ECR 
 I REEL S %FONC="TEXT" D ^%PBPZ
 S ^V($J,"%","%Y",1)=^V($J,"%","%Y",1)+DY Q:'(REEL)
 D COOR^%EDCENVL Q
 
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
 S ^V($J,"%","%X",1)=DX,^V($J,"%","%Y",1)=DYH D COOR^%EDCENVL
 Q MAXY
CALCLG(CH,LG2) 
 N LG,CAR
 S LG=$L(CH),LG2=0
 F I=1:1:LG S CAR=$E(CH,I) S:$A(CAR)<97 LG2=LG2+COEF S:$A(CAR)'<97 LG2=LG2+COEF2
 Q
TESTX S %TERM="KYO",%PORT=0
 S A="THE BROWN FOX JUMPS OVER THE CRAZY DOG AND KILLS THE QUARRY"
 S B="the brown fox jumps over the crazy dog and kills the quarry"
 D CLEPAG^%VVIDEO W "1 (majuscule), 2 (minuscule) : "
 R REP Q:REP=""  I (REP'=1)&(REP'=2) G TESTX
 W !,!,"numero de la police : " R T Q:T=""  S ^V($J,"%","%TAILLE",1)=T
 D POLICE(.COEF,.COEF2)
 D:REP=1 CALCLG(A,.LG)
 D:REP=2 CALCLG(B,.LG)
 S DX=0,DY=23 X XY W "Longueur de la chaine : "_LG R *R
 G TESTX

