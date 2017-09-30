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

;%HXYIMP^INT^1^59547,73870^0
%HXYIMP ;;02:32 PM  4 Sep 1996
 
 
 
 
 
ENTR 
 
 
 N SNOCOL
 D POCLEPA^%VVIDEO
QUOI S REPON=$$^%VZECH2("Voulez-vous imprimer ?","l'ecran","la totalite de l'histogramme") D POCLEPA^%VVIDEO Q:(REPON=1)!(REPON=6)
 G:(REPON'="l'ecran")&(REPON'="la totalite de l'histogramme") QUOI
OU S REPO=$$^%VZECH2("Impression ","standard","graphique") D POCLEPA^%VVIDEO Q:(REPO=1)!(REPO=6)
 G:(REPO'="graphique")&(REPO'="standard") OU
 D MSG^%VZEATT("   "_$$^%QZCHW("Impression en cours")),CUROF^%VVIDEO
 S F=1,SNOCOL=NOCOL
 G PRIT
 
PRINT(REPON,REPO,F,TIT) 
 N SNOCOL
 S SNOCOL=NOCOL
PRIT I REPO'="standard" D DEB^%HXYTAB(REPON,TIT) G END
 K ^IMP($J) D REAFFI,IMPR
 G:REPON'="la totalite de l'histogramme" END
 
 F %C=0:0 Q:'($D(@HISTO@(NOCOL+NBCOL)))  S NOCOL=NOCOL+NBCOL D IMP
END S NOCOL=SNOCOL
 D MKCOL^%HXYIST2,MKTEX^%HXYIST2
 D CURON^%VVIDEO D:F=1 ^%VZEAVT($$^%QZCHW("Impression terminee"))
 Q
IMP 
 D MKCOL^%HXYIST2,MKTEX^%HXYIST2
 K ^IMP($J) D REAFFI,IMPR Q
 
 
 
REAFFI 
 S DX=LMARG-15,DY=0 X XY S ^IMP($J,$Y,$X)=" "
 S DY=1 X XY S ^IMP($J,$Y,$X)=" "
 S DY=2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Liste : ")_L
 S DY=3 X XY S ^IMP($J,$Y,$X)=$S((CARD="")!(CARD=0):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 I $D(@HISTO@("DATE")) S DY=4 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Date")_" : "_@HISTO@("DATE")
 S DX=(MDCOL-LMARD)-43,DY=3 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH=1:"Cumul",1:"Moyenne"))_" : "_ATOT
 S DY=4 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Sur   : ")_ATCUM
 
 S DX=LMARG-15,DY=(HFHA+HHIST)+4 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH=1:"Total colonne",1:"Moyenne "))
 I FCOL="" S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH=1:"Pourcentage ",1:"Ecart type "))
 I FCOL'="" S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$E($$^%QCAZG("FCOL(""LIB"")"),1,12)
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Nb individus")
 S DY=DY+2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH=1:"Total cumule",1:"Moyenne totale"))_" = "_$J(CUMUL,4,2)
 I $D(SSCUMUL) S DY=DY-1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW($S(OPTH=1:"Total courant",1:"Ecart type total "))_" = "_SSCUMUL
 D AFGRAI,AFCOLI,AFTEXI
 Q
 
AFGRAI D ^%HXIIMP2(LMARG-15,HFHA+2,HHIST+1,13,13,0,TEXT2) Q
 
AFCOLI D CARSP(LMARG-1,HFHA+1,HHIST+2,LHIST+2),^%HXYIMP1(LMARG,HFHA+2,HHIST,LHIST,LARG,ECART,COLON) Q
 
AFTEXI D ^%HXIIMP2(LMARG,(HFHA+HHIST)+3,HTEXT,LHIST,LARG,ECART,TEXT)
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
 D ^%QCAGLCN(NOM,"CLE") G:CLE(1)'=$J FIMPR
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
 S ^IMP($J,Y,X+1)=$$SUITEC^%HXYIMP1("_",L-1)
 S ^IMP($J,(Y+H)-1,X+1)=$$SUITEC^%HXYIMP1("_",L-1)
 F A=Y+1:1:(Y+H)-1 S ^IMP($J,A,X)="|",^IMP($J,A,X+L)="|"
 Q

