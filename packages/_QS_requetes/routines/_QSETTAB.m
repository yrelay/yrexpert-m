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

;%QSETTAB^INT^1^59547,73881^0
QSETTAB ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CHANG,ETAT,IMPR,NL,SOR
 D TITRE
NET 
 S DX=10,DY=8 D CLEBAS^%VVIDEO S ETAT=$$^%VZAME1($$^%QZCHW("Nom de l'etat")_" : ") Q:ETAT=""  G:ETAT="?" LIST
 I '($D(^[QUI]QSETAT(ETAT))) D ^%VZEAVT($$^%QZCHW("Etat inconnu")) G NET
NLI 
 S DX=10,DY=11 D CLEBAS^%VVIDEO S NL=$$^%VZAME1($$^%QZCHW("Nom de la liste")_" : ") G:NL="" NET
 G:NL="?" LISTL G:NL=$P(^[QUI]QSETAT(ETAT),"^",6) SUITE
 I '($$EX^%QSGEST7(NL)) D ^%VZEAVT($$^%QZCHW("Liste inconnue")) G NLI
SUITE 
 S DX=10,DY=14 D CLEBAS^%VVIDEO W $$^%QZCHW("Impression sur") S SOR=$$^%VZESOR("E") G:SOR=-1 NLI
 
 S IMPR="",DX=10,DY=17 X XY
 I SOR=1 S IMPR=$E($$^%VZECH2($$^%QZCHW("Impression")_" ","STANDARD","GRAPHIQUE"),1) G:IMPR=1 SUITE
 I $D(^[QUI]ETAT(ETAT,NL)) D POCLEPA^%VVIDEO S CHANG=$$MES^%VZEOUI($$^%QZCHW("Les donnees ont-elles changees")_" ?","N") Q:CHANG=-1
 D IMP(ETAT,NL,SOR,.CHANG,IMPR) Q
 
LIST 
 S ETAT=$$SELECT^%QSGEST6("^[QUI]QSETAT",$$^%QZCHW("Choisissez un etat"))
 D TITRE G:ETAT="" NET
 S DX=10,DY=8 X XY W $$^%QZCHW("Nom de l'etat")," : ",ETAT G NLI
LISTL 
 S NL=$$^%QS1CHLI($$NOMINT^%QSF($P(^[QUI]QSETAT(ETAT),"^",6)))
 D TITRE S DX=10,DY=8 X XY W $$^%QZCHW("Nom de l'etat")," : ",ETAT G:NL="" NLI
 S DX=10,DY=11 X XY W $$^%QZCHW("Nom de la liste")," : ",NL G SUITE
 
TITRE 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION D'UN ETAT (TABLEAU)")) Q
 
IMP(ETAT,NL,SOR,MOD,IMPR) 
 
 
 
 
 N %CH,%CH2,%CH3,%CH4,%CH5,%I,%I2,ATR,BASE,BL,BOOL,BORNE,CLE,COM1,COM2,COM3,COM4,CONT,CPT,CPT2,DATE,EGAP,GL
 N I,IBL,ICOL,II,IMP,INT,J,JJ,L,L1,LIM,LISTE,LL,N,NBRL,NCOL,NO,NROUT,NOM,PAGE,REP,STOP,TAB,TABS,TEMPO,TIT,TITRE,TOT,TRI,V,ZLG,SAVI
 S BOOL=1 D INIT^%QSETINI Q:'(BOOL)
 I DTM S RM=80 G SIM
 I SOR=0 D POCLEPA^%VVIDEO S RM=$$^%VZECH2("Nombre de colonnes d'affichage","80","132") D POCLEPA^%VVIDEO I (RM'=80)&(RM'=132) S RM=80 Q
 I SOR=1 S RM=$S(IMPR="G":80,1:132)
SIM D CONSTAB^%QSETINI Q:'(BOOL)
 I CPT'=2 D MSG^%VZEATT($$^%QZCHW("Il est impossible d'utiliser plus de 2 premisses pour cette impression")) H 3 Q
 I TOT'=1 D MSG^%VZEATT($$^%QZCHW("Il est necessaire d'utiliser un seul attribut de totalisation")) H 3 Q
 I '($D(^[QUI]ETAT(ETAT,NL))) D CONSGL^%QSETINI G FIMP
 I MOD=1 D CONSGL^%QSETINI
FIMP S NROUT=$P($ZPOS,"^",2) D CHTOT^%QSETIM1
 D ZD^%QMDATE4,^%QMDAK0 G @SOR
 
1 
 D MSG^%VZEATT($$^%QZCHW("Impression en cours")_"...")
 S SAVI=$I
 O IMP U IMP D IMPRI^%QAX(SAVI)
 D IMPR^%QSETTI2(1)
 U IMP W #
 S RM=80 C IMP Q
 
0 
 S ZLG=100,EGAP=0 K ^AFF($J)
 D CLEPAG^%VVIDEO,@(RM_"^%VVIDEO") O IMP U IMP
 D IMPR^%QSETTI2(0),EDIT^%QSETTI1
F0 K ^AFF($J)
 C IMP O $I U $I D CLEPAG^%VVIDEO,80^%VVIDEO
 Q

