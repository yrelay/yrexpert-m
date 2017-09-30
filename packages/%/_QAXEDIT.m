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

;%QAXEDIT^INT^1^59547,73875^0
ZSYEDIT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 K ^AFFPAG($J),^AFFSYN($J) N %CH,%I,ARRET,COD,CODIMP,EGAP,GLZ,IMP,LIM,MC,MI,MM,MSG,REP,TIT,ZLG
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("IMPRESSION DES SYNONYMES"))
 S COD=$$COD^%QAX
QUES S DX=10,DY=10 D CLEBAS^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Code a imprimer : ")) Q:Y1=""  G:Y1="?" LIST I '($D(^[QUI]ZSYNONY(Y1))) D ^%VZEAVT($$^%QZCHW("Aucun synonyme pour ce code")) G QUES
 S CODIMP=Y1
DEB S DX=10,DY=12 X XY S Y1=$$^%VZAME1("Liste a partir de : ") Q:CTRLA!CTRLF  S MI=$S(Y1="":"",1:$ZP(^[QUI]ZSYNONY(CODIMP,Y1)))
 S DX=10,DY=14 X XY W $$^%QZCHW("Impression sur ") S REP=$$^%VZESOR("E") Q:REP=-1
 S LIM=21,IMP=0 I REP=1 S LIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60),IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 D AFFICH G @REP
LIST 
 D INIT^%QUCHOIP("^[QUI]ZSYNONY",1,"",0,10,79,12),AFF^%QUCHOIP S Y1=$$UN^%QUCHOIP D END^%QUCHOIP,CLFEN^%VVIDEO(0,10,12,79) G:Y1="" QUES
 S DX=10,DY=10 X XY W $$^%QZCHW("Code a imprimer : "),Y1 S CODIMP=Y1 G DEB
 
0 
 S TIT=$J("",10)_$$^%QZCHW("Mots maitres")_$J("",10)_$$^%QZCHW("Code a imprimer")_$J("",6)_$S((CODIMP=COD)!(COD=""):"",1:$$^%QZCHW("Code courant"))
 D ^%QAXEDE Q
1 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...") D ZD^%QMDATE4,^%QMDAHEU
 O IMP U IMP
 F EGAP=1:1 Q:'($D(^AFFPAG($J,EGAP)))  D ENTET F ZLG=10:1 Q:'($D(^AFFPAG($J,EGAP,ZLG)))  W !,?10,^AFFPAG($J,EGAP,ZLG)
 W !,# C IMP
 D ^%VZEAVT($$^%QZCHW("Impression terminee ... ")) Q
 
AFFICH 
 S DX=0,DY=6 D CLEBAS^%VVIDEO W ?10,$$^%QZCHW("Mots maitres"),?31,$$^%QZCHW("Code a imprimer"),?52,$S((COD="")!(COD=CODIMP):"",1:$$^%QZCHW("Code courant")) S GLZ=0,ZLG=100,EGAP=0
 F %I=1:1 S MI=$O(^[QUI]ZSYNONY(CODIMP,MI)) Q:MI=""  D:MI'="z" TRAIT Q:ARRET=1
 Q
TRAIT 
 S %CH=$E(MI,1,20),MM=$O(^[QUI]ZSYNONY(CODIMP,MI,"")) S:(CODIMP'=COD)&(COD'="") MC=$$S^%QAX(MI)
 S %CH=%CH_$J("",20-$L(%CH))_" "_$E(MM,1,20)_$J("",20-$L(MM))_" "_$S($D(MC):$E(MC,1,20),1:"")
 S GLZ=GLZ+1,ZLG=ZLG+1 I ZLG>LIM S GLZ=1,ZLG=10,EGAP=EGAP+1,^AFFSYN($J,EGAP)=%CH,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,$$^%QZCHW("Page : "),EGAP S DX=0,DY=7 X XY
 S ^AFFPAG($J,EGAP,ZLG)=%CH
 I (GLZ#15)=0 S GLZ=1,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,$$^%QZCHW("Page : "),EGAP S DX=0,DY=7 X XY
 W !,?8,%CH R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) Q
 
ENTET 
 W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,?60,$$^%QZCHW("Page : "),EGAP,!,!
 W ?30,$$^%QZCHW("Mots maitres et synonymes"),!,!,!,?10,$$^%QZCHW("Mots maitres"),?30,$$^%QZCHW("Code a imprimer") I (COD'="")&(CODIMP'=COD) W ?50,$$^%QZCHW("Code courant")
 W !,?36,"(",CODIMP,")" I (COD'="")&(CODIMP'=COD) W ?52,"(",COD,")"
 W ! Q

