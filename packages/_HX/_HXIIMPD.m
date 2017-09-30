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

;%HXIIMPD^INT^1^59547,73869^0
%HXIIMPD ;;02:33 PM  4 Sep 1996
 
 
 
 
 
 
AFFI(GL,HIS,OPTH) 
 D MKGRA^%HXIISS2(GL,HIS,OPTH),MKCOL^%HXIISS2(GL,HIS,OPTH),MKTEX^%HXIISS2(GL,HIS,OPTH)
 D REAFFI(GL,HIS,OPTH)
 Q
 
REAFFI(GL,HIS,OPTH) 
 
 
 
 
 S I=11,DX=LMARG(HIS)-I,DY=1 X XY
 I HIS=2 S DX=DX+I
 I HIS=1 S ^IMP($J,$Y,$X)=$$^%QZCHW("Liste : ")_@TEMP@("LISTE")
 I $D(@PARGL@(1,"DATE"))&(HIS=2) X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Date")_" : "_@PARGL@(1,"DATE")
 S DX=DX+3,DY=2
 I HIS=1 X XY S ^IMP($J,$Y,$X)=$S((CARD="")!(CARD=0):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 I HIS=2 X XY S ^IMP($J,$Y,$X)=R_": "_$S($D(@PARGL@(1,INDCOCOU,"TEXT")):@PARGL@(1,INDCOCOU,"TEXT"),1:"?")
 S DX=DX-3,DY=3 X XY
 S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH:"Cumul",1:"Moyenne"))_" : "_ATTOT
 S DY=4 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Sur   : ")_$S(HIS=1:ATGROUP,HIS=2:ATECL)
 
 S DY=(HFHA+HHIST)+4 X XY
 S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH:"Total",1:"Moyenne")_" col.")
 S DY=DY+1 X XY
 S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH:"Pourcentage",1:"Ecart type "))
 S DY=DY+1 X XY
 S ^IMP($J,$Y,$X)=$$^%QZCHW("Nb individus")
 I $D(SSCUMUL) S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH:"Total courant",1:"Ecart type total"))_" = "_SSCUMUL
 S DY=DY+1
 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH:"Total cumule",1:"Moyenne totale"))_" = "_$J(@GL@("TOTAL"),1,2)
 D AFGRAI(GL,HIS),AFCOLI(GL,HIS),AFTEXI(GL,HIS)
 Q
 
AFGRAI(GL,HIS) 
 S I=11
 D ^%HXIIMP2(LMARG(HIS)-$S(HIS=1:I,1:0),HFHA+2,HHIST+1,I-2,I-2,0,$$CONCAS^%QZCHAD(TEXT2,HIS))
 Q
 
AFCOLI(GL,HIS) 
 S I=11
 D CARSP((LMARG(HIS)+3)+$S(HIS=1:0,1:I),HFHA+1,HHIST+2,LHIST(HIS)+2)
 D ^%HXIIMP1((LMARG(HIS)+4)+$S(HIS=1:0,1:I),HFHA+2,HHIST,LHIST(HIS),LARG(HIS),ECART,$$CONCAS^%QZCHAD(COLON,HIS))
 Q
 
AFTEXI(GL,HIS) 
 S I=11
 D ^%HXIIMP2((LMARG(HIS)+4)+$S(HIS=1:0,1:I),(HFHA+HHIST)+3,HTEXT,LHIST(HIS),LARG(HIS),ECART,$$CONCAS^%QZCHAD(TEXT,HIS))
 Q
 
IMPR 
 N NOM,I,X,Y,CLE
 S I=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 S ^IMP($J,0,(80-$L(TIT))\2)=TIT
 S NOM="^IMP($J,-1,-1)"
 S (X,Y)=-1 K CLE
 O I U I W #
BIMPR S NOM=$Q(@NOM)
 S NOM=$$^%Q(NOM)   ;; cao debug
 G:NOM="" FIMPR
 D ^%QCAGLCN(NOM,"CLE") G:$J'=CLE(1) FIMPR
 D GO(X,CLE(3),Y,CLE(2))
 S X=CLE(3)+$L(@NOM),Y=CLE(2)
 W @(NOM)
 G BIMPR
FIMPR C I Q
 
GO(A,B,C,D) 
 N IND
 F IND=C:1:D-1 W !
 I C'=D S A=0
 F IND=A:1:B-1 W " "
 Q
 
CARSP(X,Y,H,L) 
 N A
 S ^IMP($J,Y,X+1)=$$SUITEC^%HXIIMP1("_",L-1)
 S ^IMP($J,(Y+H)-1,X+1)=$$SUITEC^%HXIIMP1("_",L-1)
 F A=Y+1:1:(Y+H)-1 S ^IMP($J,A,X)="|",^IMP($J,A,X+L)="|"
 Q
 
BOUCL(OPTH,OPTH2,TYP,TIT) 
 N BB
 S NOCOL(1)=1,NOCOL(2)=1,INDCOCOU=NOCOL(1)
 D MSG^%VZEATT("    "_$$^%QZCHW("Impression en cours"))
 I TYP'="standard" D ^%HXITABD("la totalite de l'histogramme",TIT) K ^IMP($J) Q
 F BB=1:1 K ^IMP($J) Q:'($D(@PARGL@(1,NOCOL(1))))  D PTENTR^%HXITOD2(1,1,OPTH,TYP),PTENTR^%HXITOD2(2,1,OPTH2,TYP),IMPR S NOCOL(1)=NOCOL(1)+NBCOL(1),INDCOCOU=NOCOL(1)
 S NOCOL(1)=1,INDCOCOU=NOCOL(1)
 Q
 
IMP(OPTH,OPTH2,TYP) 
QUOI D POCLEPA^%VVIDEO
 S REPON=$$^%VZECH2("Voulez-vous imprimer ? ","l'ecran","la totalite de l'histogramme") D POCLEPA^%VVIDEO Q:(REPON=1)!(REPON=6)
 G:(REPON'="l'ecran")&(REPON'="la totalite de l'histogramme") QUOI
 N REPONSE
 G:TYP="standard" STAN G:TYP="graphique" GRAP
OU S REPONSE=$$^%VZECH2("Impression ","standard","graphique") D POCLEPA^%VVIDEO Q:(REPONSE=1)!(REPONSE=6)
 G:(REPONSE'="graphique")&(REPONSE'="standard") OU
 G:REPONSE="graphique" GRAP
STAN D MSG^%VZEATT("   "_$$^%QZCHW("Impression en cours"))
 I REPON="la totalite de l'histogramme" D BOUCL(OPTH,OPTH2,TYP,TIT) Q
 K ^IMP($J) S INDCOCOU=NOCOL(1)
 D PTENTR^%HXITOD2(1,1,OPTH,TYP),PTENTR^%HXITOD2(2,1,OPTH2,TYP),IMPR
 Q
GRAP D MSG^%VZEATT("   "_$$^%QZCHW("Impression en cours"))
 D ^%HXITABD(REPON,TIT)
 Q

