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

;%QSCHR2^INT^1^59547,73880^0
QSCHR2 ;
 
 
 
 
CHANGE(FONCT,FONCT2,CHANGER,AUTO,SUBAT) 
 
 
 N SOURCE,Y1,OK,PHRASE,NPHRAS,REQ,REQCH
 I CHANGER N NPHRASE,SX,SY,ATTP,ATTD,APPEX
DEB 
 S DX=0,DY=0 X XY W $$WRON^%VVIDEO1
 K @(PROBLEME) S @PROBLEME=0
 K @(TROUVER) S @TROUVER=0
 S REQCH=$$CONCAS^%QZCHAD(TEMP,"REQUETES.CHANGEES") K @(REQCH)
 S (SOURCE,GLO)="^[QUI]RQS1",REQ=""
 
 D POCLEPA^%VVIDEO S CHOIX=$$MES^%VZEOUI($$^%QZCHW("Recherche dans toutes les requetes"),"N") D POCLEPA^%VVIDEO
 I CHOIX=-1 G FIN
 I CHOIX=0 G LEC
 
 D MSG^%VZEATT($$^%QZCHW($S(CHANGER:"substitution",1:"recherche")_" en cours"))
 D INIT G FIN
LEC 
 S GLO=$$CONCAS^%QZCHAD(TEMP,"ELEMENT") K @(GLO)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Requete")," : " S DX=$X D ^%VLEC
 I (Y1="")!CTRLA S CHOIX=-1 G FIN
 I "*?"[$E(Y1,$L(Y1)) G SELEC
 S @GLO@(Y1)="" G:'($D(^[QUI]RQS1(Y1))) LEC
 D INIT G FIN
 
SELEC 
 D INIT^%QUCHOIP(SOURCE,1,"",0,2,80,20),AFF^%QUCHOIP
 D ^%QUCHOYP(GLO) I '($D(@GLO)) S CHOIX=-1 G SELF
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Confirmation")_" ?","O")'=1 G SELF
 D ^%VZEATT,INIT
SELF D END^%QUCHOIP K @(GLO)
 G FIN
 
INIT I '(CHANGER) G LOOP
 D CLEPAG^%VVIDEO
LOOP R *STOP:0 D TOUCHE^%INCCLAV(STOP,.STOP)
 I STOP=1 D POCLEPA^%VVIDEO S STOP=$$MES^%VZEOUI($$^%QZCHW("Abandon immediat")_" ? ","N") D POCLEPA^%VVIDEO I STOP=1 S CHOIX=-1 G ANAL
 S REQ=$O(@GLO@(REQ)) I REQ="" G ANAL
 
 D PARC("CONTRAINTES")
 I CHANGER,MODIF=1 S @REQCH@(REQ)=""
 
 D PARC("VARIABLES")
 I CHANGER,MODIF=1 S @REQCH@(REQ)=""
 G LOOP
 
PARC(CLE) 
 S LIG="",MODIF=0
LOOP4 S LIG=$O(^[QUI]RQS1(REQ,CLE,LIG))
 
 I LIG="" Q
 S PHRASE=^[QUI]RQS1(REQ,CLE,LIG)
 G:PHRASE'[FONCT LOOP4
 I '(CHANGER) D TROUVER G LOOP4
 
 S CPT=CPT+1 I (CPT#6)=0 D CLEPAG^%VVIDEO
 I '(AUTO) G LOOP40
 S NPHRASE=$S(SUBAT:$$CHANGAT(PHRASE,FONCT,FONCT2,AUTO),1:$$ZSUBST^%QZCHSUB(PHRASE,FONCT,FONCT2))
 I SUBAT G:PHRASE=NPHRASE LOOP4
 I MODIF=0 W !,?30,$$REV^%VVIDEO1,"CONTRAINTES",$$NORM^%VVIDEO1,!
 W ?1,REQ,?20,LIG,?25,PHRASE,!,?25,NPHRASE,!
 G RETOUR
LOOP40 
 
 I '(SUBAT) G LOOP41
 S NPHRASE=$$CHANGAT(PHRASE,FONCT,FONCT2,AUTO)
 G:PHRASE=NPHRASE LOOP4
 G RETOUR
LOOP41 
 S NPHRASE=$$CHANGCH(PHRASE,FONCT,FONCT2,AUTO)
 G:PHRASE=NPHRASE LOOP4
RETOUR 
 D:$D(^[QUI]RQS1(REQ,CLE,LIG,"TETE")) KILL^%ANA(^[QUI]RQS1(REQ,CLE,LIG,"TETE"))
 K ^[QUI]RQS1(REQ,CLE,LIG)
 S ^[QUI]RQS1(REQ,CLE,LIG)=NPHRASE
 S MODIF=1
 G LOOP4
 
ANAL 
 I '(CHANGER) Q
 
 S REQ=""
ANA2 S REQ=$O(@REQCH@(REQ)) I REQ="" Q
 D MSG^%VZEATT($$^%QZCHW("Analyse de -->")_" "_REQ)
 D ANAL2^%QS9(REQ,0,0,.OK)
 Q:OK=1
PB 
 S @PROBLEME=@PROBLEME+1
 S @PROBLEME@($E(" ---> "_REQ,1,77))=""
 Q
 
TROUVER 
 N LIG2,LL
 S LIG2=$J(LIG,3),LIG2=$TR(LIG2," ",0)
 S @TROUVER=@TROUVER+1,LL=$E(REQ_" : "_LIG2_" -> "_PHRASE,1,75)
 S @TROUVER@(LL)=""
 Q
 
FIN S DX=0,DY=0 X XY W $$WROFF^%VVIDEO1
 K @(REQCH)
 Q
 
CHANGAT(PHRASE,FONCT,FONCT2,AUTO) 
 N %I,FIN,LGOLD,A1,A2,LGNEW,NPHRASE,DDY,P1,P2
 S FIN=1,LGOLD=$L(FONCT),LGNEW=$L(FONCT2),NPHRASE=PHRASE
BCHAT S FIN=$F(PHRASE,FONCT,FIN)
 Q:FIN=0 NPHRASE
 
 S A1=$E(PHRASE,(FIN-LGOLD)-1)
 
 S A2=$E(PHRASE,FIN)
 G:('($$SEPAR(A1)))!('($$SEPAR(A2))) BCHAT
 S P1=$E(PHRASE,1,(FIN-LGOLD)-1),P2=$E(PHRASE,FIN,$L(PHRASE))
 S PHRASE=P1_FONCT2_P2,FIN=(FIN-LGOLD)+LGNEW
 I AUTO S NPHRASE=PHRASE G BCHAT
 W ?1,REQ,?20,LIG,?25,P1,$$REV^%VVIDEO1,FONCT2,$$NORM^%VVIDEO1,P2,!
 S DDY=$Y D POCLEPA^%VVIDEO S I=$$MES^%VZEOUI($$^%QZCHW("Substitution")_" ?","N") D POCLEPA^%VVIDEO S DX=0,DY=DDY X XY I I'=1 S PHRASE=NPHRASE G BCHAT
 S NPHRASE=PHRASE
 G BCHAT
 
SEPAR(CARAC) 
 Q:(CARAC=" ")!("^<>'!#()_-+=*[];&/\"[CARAC) 1
 
 Q 0
 
CHANGCH(PHRASE,FONCT,FONCT2,AUTO) 
 
 N %I,FIN,LGOLD,LGNEW,NPHRASE,DDY,P1,P2
 S FIN=1,LGOLD=$L(FONCT),LGNEW=$L(FONCT2),NPHRASE=PHRASE
BCH S FIN=$F(PHRASE,FONCT,FIN)
 Q:FIN=0 NPHRASE
 S P1=$E(PHRASE,1,(FIN-LGOLD)-1),P2=$E(PHRASE,FIN,$L(PHRASE))
 S PHRASE=P1_FONCT2_P2,FIN=(FIN-LGOLD)+LGNEW
 I AUTO S NPHRASE=PHRASE G BCH
 W ?1,REQ,?20,LIG,?25,P1,$$REV^%VVIDEO1,FONCT2,$$NORM^%VVIDEO1,P2,!
 S DDY=$Y D POCLEPA^%VVIDEO S I=$$MES^%VZEOUI($$^%QZCHW("Substitution")_" ?","N") D POCLEPA^%VVIDEO S DX=0,DY=DDY X XY I I'=1 S PHRASE=NPHRASE G BCH
 S NPHRASE=PHRASE
 G BCH
 G BCH

