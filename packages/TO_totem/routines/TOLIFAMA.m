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

;TOLIFAMA^INT^1^59547,74872^0
TOLIFAMA ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("FAMILLE & SOUS FAMILLE MACHINES") D TO4^%VZCD
LECMAC S DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Machine ou famille technologique : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LECMAC S DX=0,DY=6,M1=Y1 D CLEBAS^%VVIDEO
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP)
 G:(SUP=1)!(SUP=6) FIN S SUP=$C(SUP) G:(SUP'=$$^%QZCHW("E"))&(SUP'=$$^%QZCHW("I")) LECSUP
 S LILIM=21 I SUP=$$^%QZCHW("I") S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS),1:60)
 D M1 I '($D(^AFFPAG($I))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Pas de machine...") H 2 G FIN
 S TIT=$$^%QZCHW("Machine"),%CH=$$^%QZCHW("Famille technologique"),%LGR=49 D ^%QZCHBK S TIT=TIT_%CH,%CH=$$^%QZCHW("Tx hor."),%LGR=77-$L(TIT) D ^%QZCHBK S TIT=TIT_%CH D @SUP G LECMAC
FIN 
 Q
M1 K ^AFFPAG($I) S DX=0,DY=6,LI=50,EGAP=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant...")
 I $D(^[QUI]DESMACH(M1)) S S1=$N(^[QUI]DESMACH(M1,-1)) G:S1=-1 FM1 S TH=$P(^[QUI]DESMACH(M1,S1),"^",2),MACH=M1 D STO G FM1
 S VU=0,MI=M1,M1=$E(M1,1,$L(M1)-1)_$C($A($E(M1,$L(M1)))-1)_"z"
 F %U=1:1 S M1=$N(^[QUI]DESMACH(M1)) Q:M1=-1  Q:$E(M1,1,$L(MI))'=MI  S S1=$N(^[QUI]DESMACH(M1,-1)) I S1'=-1 S TH=$P(^[QUI]DESMACH(M1,S1),"^",2),VU=1,MACH=M1 D STO
 G:VU=1 FM1 I $D(^[QUI]SECTION(MI)) S S1=$N(^[QUI]SECTION(M1,-1)) I S1'=-1 S TH=$P(^[QUI]SECTION(MI,S1),"^",5),MACH=MI D STO G FM1
FM1 Q
STO S LI=LI+1 I LI>21 S LI=8,EGAP=EGAP+1
 S LIGNE=$E(MACH,1,34),%CH=$E(S1,1,34),%LGR=(35+$L(S1))-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_%CH,%CH=TH,%LGR=(71+$L(TH))-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_%CH
 S ^AFFPAG($I,EGAP,LI)=LIGNE
 Q
E D ^TOPAGIN Q
I S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0),DOLARI=$I
 O IMPR U IMPR F PAGE=1:1 Q:'($D(^AFFPAG(DOLARI,PAGE)))  D ENTET F LI=8:1 Q:'($D(^AFFPAG(DOLARI,PAGE,LI)))  W !,^AFFPAG(DOLARI,PAGE,LI)
 W !,# C IMPR Q
ENTET D ZD^%QMDATE4,^%QMDAK0 W #,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW("a : "),HEURE,$$^%QZCHW("      *** MACHINES ET SOUS FAMILLE ***"),?65,$$^%QZCHW("Page : "),PAGE,!,!,TIT,!,! Q

