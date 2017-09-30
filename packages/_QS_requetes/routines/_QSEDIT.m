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

;%QSEDIT^INT^1^59547,73881^0
QSEDIT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 K ^AFFPAG($J),^AFFIND($J),^AFF($J)
 N %A,%CH,%I,A,AF,ARRET,ATT,BASE,BL,CH,E,E2,E3,EA,EGAP,GLZ,I,I2,I3,I4,IF,IMP,IND,INDIV,L,LIM,MSG,NB,NOUV,PREM,REP,TIT,VI2,VI3,VIND,ZLG
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("IMPRESSION D'UN REPERTOIRE"))
QUES S DX=10,DY=8 X XY S Y1=$$^%VZAME1("Repertoire a imprimer : ") G:Y1="?" LIST Q:Y1=""  I '($$REP^%QSGEST5($$NOMINT^%QSF(Y1))) D ^%VZEAVT($$^%QZCHW("Ce repertoire n'existe pas")) G QUES
DEB S BASE=$$NOMINT^%QSF(Y1) I $$REPVID^%QSGEST5(BASE) D ^%VZEAVT($$^%QZCHW("Ce repertoire n'a aucun individu")) G QUES
 S INDIV=$$LISTIND^%QSGEST6(BASE),ATT=$$LISTATT2^%QSGEST6(BASE)
 S DX=10,DY=10 X XY S Y1=$$^%VZAME1("Liste a partir de : ") Q:CTRLA  Q:CTRLF  S PREM=1,IF=$S(Y1="":"",1:$ZP(@INDIV@(Y1)))
 S DX=10,DY=12 X XY W $$^%QZCHW("Impression sur ") S REP=$$^%VZESOR("E") Q:REP=-1
NBI S DX=10,DY=14 X XY W $$^%QZCHW("Combien d'individus par page (de 1 a 4) ? ") R *NB D TOUCHE^%INCCLAV(NB,.NB) Q:NB=1  G:(NB<49)!(NB>52) NBI S NB=$C(NB),L=80\(NB+1)
 S ARRET=0,LIM=21,IMP=0 S:REP=1 LIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60),IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 D INSER G @REP
LIST 
 D ^%QSCHQUE,CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("IMPRESSION D'UN REPERTOIRE")) G:%QUE="" QSEDIT
 S DX=10,DY=8 X XY W $$^%QZCHW("Repertoire a imprimer : "),%QUE S Y1=%QUE G DEB
 
INSER 
 S I=$$^%QZCHW("Individu"),DX=0,DY=6 D CLEBAS^%VVIDEO
 W $$^%QZCHW("Attributs"),?L+1,I G:NB=1 SUITE W ?(L*2)+1,I G:NB=2 SUITE W ?(L*3)+1,I G:NB=3 SUITE W ?(L*4)+1,I
SUITE S GLZ=0,ZLG=100,EGAP=0
 F %I=1:1 Q:(IF="")&('(PREM))  S NOUV=1,PREM=0,IND=IF,IND=$O(@INDIV@(IND)) Q:IND=""  D:IND'="z" TRAIT Q:ARRET=1
 Q
TRAIT 
 D TRAIT^%QSEDI2
 Q
AT D AT^%QSEDI2 Q
TR 
 D TR^%QSEDI2 Q
STR 
 D STR^%QSEDI2 Q
LNI D LNI^%QSEDI2 Q
INT D INT^%QSEDI2 Q
1 
 D 1^%QSEDI2 Q
0 
 D 0^%QSEDI2 Q
AP D ECR^%QSEDECI Q

