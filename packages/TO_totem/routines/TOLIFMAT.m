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

;TOLIFMAT^INT^1^59547,74873^0
TOLIFMAT ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("FAMILLE & SOUS FAMILLE MATIERES") D TO4^%VZCD
LECART S DX=0,DY=6 D CLEBAS^%VVIDEO W $$^%QZCHW("Article : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LECART S ART=Y1
LECMAC S DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Matiere ou famille technologique : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LECMAC S DX=0,DY=6,M1=Y1 D CLEBAS^%VVIDEO
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP)
 G:(SUP=1)!(SUP=6) FIN S SUP=$C(SUP) G:(SUP'=$$^%QZCHW("E"))&(SUP'=$$^%QZCHW("I")) LECSUP
 S LILIM=21 I SUP=$$^%QZCHW("I") S LILIM=$S($D(^IMPRCOUR(WHOIS))-6:^IMPRCOUR(WHOIS),1:60)
 D M1 I '($D(^AFFPAG($I))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Pas de matiere...") H 2 G FIN
 S TIT=$$^%QZCHW("Matiere"),%CH=$$^%QZCHW("Famille technologique"),%LGR=54 D ^%QZCHBK S TIT=TIT_%CH D @SUP G LECART
FIN K DXG,DXD,DYH,DYB,GRAPH,MSG,Y1,^AFFPAG($I),M1,S1,TH,VU,MI,%U,%CH,%LGR,TIT,PAGE
 Q
M1 K ^AFFPAG($I) S DX=0,DY=6,LI=50,EGAP=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant...")
 I $D(^[QUI]MATSTOCK(M1)) S S1=$N(^[QUI]MATSTOCK(M1,-1)) G:S1=-1 FM1 S MACH=M1 D STO G FM1
 S M2=-1 F %U=1:1 S M2=$N(^[QUI]SELMAT(ART,M1,M2)) Q:M2=-1  S M4=$E(M2,1,$L(M2)-1)_$C($A($E(M2,$L(M2)))-1)_"z" D M2
FM1 Q
M2 F %V=1:1 S M4=$N(^[QUI]MATSTOCK(M4)) Q:M4=-1  Q:$E(M4,1,$L(M2))'=M2  I $D(^[QUI]MATSTOCK(M4,M1)) S MACH=M4,S1=M1 D STO
 Q
STO S LI=LI+1 I LI>21 S LI=8,EGAP=EGAP+1
 S LIGNE=$E(MACH,1,39),%CH=$E(S1,1,39),%LGR=(40+$L(S1))-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_%CH,^AFFPAG($I,EGAP,LI)=LIGNE
 Q
E D ^TOPAGIN Q
I S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0),DOLARI=$I
 O IMPR U IMPR F PAGE=1:1 Q:$D(^AFFPAG(DOLARI,PAGE))  D ENTET F LI=8:1 Q:'($D(^AFFPAG(DOLARI,PAGE,LI)))  W !,AFFPAG(DOLARI,PAGE,LI)
 W !,# C IMPR Q
ENTET W #,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW("a : "),HEURE,$$^%QZCHW("      *** MACHINES ET SOUS FAMILLE ***"),?65,$$^%QZCHW("Page : "),PAGE,!,!,TIT,!,! Q

