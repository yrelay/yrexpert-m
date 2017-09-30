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

;%MZLISGA^INT^1^59547,73872^0
%MZLISGA ;
 
 S:'($D(^MOZETAT($J,"NBCOL"))) ^MOZETAT($J,"NBCOL")=80
 S V80=1,%PGTR="^%MZTREPG"
 
 K ^AFFGAM($J),^AFFPAG($J),^AFFREP($J)
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("REPERTOIRE DES GAMMES"))
LECSUP S CTRLA=0,DX=0,DY=12 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("impression sur ") S SUP=$$^%VZESOR("E"),DX=$X
 I SUP=-1 S CTRLA=1 Q
 S SUP=$S(SUP=1:"I",1:"E") G:(SUP'="I")&(SUP'="E") LECSUP
ENTREE S DX=0,DY=8 D CLEBAS^%VVIDEO W "Liste a partir de : " S DX=$X D ^%VLEC G FIN:CTRLA,FIN:CTRLF
 S NUINT=$S(Y1="":"",1:$$PRVRI^%QSTRUC8($$GI^%MZQS,Y1))
 S:'($D(%PGTR)) %PGTR="" S LILIM=21,IMPR=0
 I SUP="I" S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60),IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 S DX=0,DY=6 D CLEBAS^%VVIDEO W ?2,"No de gamme",?23,"Materiel",?55,"Designation" S GLZ=0,ZLG=100,EGAP=0
 F IZ=1:1 S NUINT=$$NXTRI^%QSTRUC8($$GI^%MZQS,NUINT) Q:NUINT=""  D:NUINT'="z" TRAIT Q:ARRET=1
 W *-1 D @SUP
FIN . I '(V80) S ^MOZETAT($J,"NBCOL")=132 O $I S RM=132 D 132^%VVIDEO
 K ^AFFPAG($J),^AFFREP($J),%PGTR,ATEST,Y1,SUP,IMPR,LILIM,NUGA,INT,IZ,V80,%CH,%LGR,ZLG,EGAP,TIT Q
TRAIT S NUGA=NUINT D TR Q
TR S %CH=NUGA,MAT=$$^%QSCALVA($$GI^%MZQS,NUGA,"MATERIEL"),DES=$$^%QSCALVA($$GI^%MZQS,NUGA,"DESIGNATION.PIECE")
 S %CH=%CH_$J("",20-$L(%CH))_$E(MAT,1,30)_$J("",30-$L(MAT))_$E(DES,1,25)
 S GLZ=GLZ+1,ZLG=ZLG+1 I ZLG>LILIM S GLZ=1,ZLG=8,EGAP=EGAP+1,^AFFREP($J,EGAP)=%CH,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,"Page : ",EGAP S DX=0,DY=7 X XY
 S ^AFFPAG($J,EGAP,ZLG)=%CH,^AFFGAM($J,EGAP,ZLG)=NUGA
 I (GLZ#15)=0 S GLZ=1,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,"Page : ",EGAP S DX=0,DY=7 X XY
 W !,%CH R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) G FTR
FTR Q
E S TIT="No de gammes"_$J("",10)_"Materiels"_$J("",20)_"Designations"
 D ^%MZAFLGA
 Q
I S DX=0,DY=5 D CLEBAS^%VVIDEO W !,"Impression en cours..." D ZD^%QMDATE4,^%QMDAK0 O IMPR U IMPR
 F EGAP=1:1 Q:'($D(^AFFPAG($J,EGAP)))  D ENTET F ZLG=8:1 Q:'($D(^AFFPAG($J,EGAP,ZLG)))  W !,^AFFPAG($J,EGAP,ZLG)
 W !,# C IMPR Q
ENTET H 5 W #,!,"Le : ",%DAT," a : ",HEURE,?25," *** REPERTOIRE DES GAMMES ***",?65,"Page : ",EGAP,!,!
 W "  No interne",?42,"No de gammes",!
 Q

