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

;%TXPETT^INT^1^59547,74032^0
%TXPETT ;;03:42 PM  12 Mar 1993; ; 29 Apr 93  6:45 PM
 
 
 
 
 N TEMP,MENG S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG"),(ATELIER,VALEUR)=""
 
BCPL D CLEPAG^%VVIDEO,LINEUP^%TXPSUTI
 D LOOKUP(etuatg,"ATELIER",.ATELIER," ateliers attaches a l'etude","voulez-vous associer un nouvel atelier a cette etude","SHOW^%TXPETT","SHOW1^%TXPETT")
 Q:ATELIER=""
 
SUITE S VALEUR=$S($D(@etuat@("Valeur Atelier")):@etuat@("Valeur Atelier"),1:"")
 S PMAX=$$^%TXPMAX(ATELIER)
 D LINEUP^%TXPSUTI
 K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODI",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRI",@MENG@(2,"COM")=$$^%QZCHW("supprimer cet atelier")
 S @MENG@(3)=$$^%QZCHW("articles")_"^ARTICLE",@MENG@(3,"COM")=$$^%QZCHW("acceder aux articles associes"),@MENG@(4)=$$^%QZCHW("contraintes")_"^CONTRT",@MENG@(4,"COM")=$$^%QZCHW("acceder aux contraintes de production associees")
 S @MENG@(5)=$$^%QZCHW("resoudre")_"^ACTIV",@MENG@(5,"COM")=$$^%QZCHW("calculer la production optimale ")
 S @MENG@(6)=$$^%QZCHW("imprimer")_"^PRINT",@MENG@(6,"COM")=$$^%QZCHW("imprimer un resume de la solution"),@MENG@(7)=$$^%QZCHW("fin")_"^END",@MENG@(7,"COM")=$$^%QZCHW("revenir a l'etude")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
 
END K @(TEMP) Q
 
MODI D SHOW1 G SUITE
PRINT I '($D(VISU)) S VISU=5
 D ^%TXP212R K:VISU=5 VISU G SUITE
 
SUPPRI D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuat) G BCPL
 
ARTICLE D ^%TXPETY S ARTICLE="" D LINEUP^%TXPSUTI G SUITE
 
 
CONTRT S CONTRAINTE="" D CLEPAG^%VVIDEO,LINEUP^%TXPSUTI
 D LOOKUP(etuatcg,"CONTRAINTE",.CONTRAINTE," contraintes attachees a cet atelier","voulez-vous associer une nouvelle contrainte a cet atelier","SHOWC^%TXPETT","SHOWC1^%TXPETT")
 G:CONTRAINTE="" SUITE
 
SUITEG D LINEUP^%TXPSUTI K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODIC",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRC",@MENG@(2,"COM")=$$^%QZCHW("supprimer cette contrainte")
 S @MENG@(3)=$$^%QZCHW("examiner")_"^EXAMC",@MENG@(3,"COM")=$$^%QZCHW("detailler la contrainte")
 S @MENG@(4)=$$^%QZCHW("fin")_"^SUITE",@MENG@(4,"COM")=$$^%QZCHW("revenir a l'atelier")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITEG
 
 
MODIC D CONTATT^%TXPSW3 G SUITEG
 
 
EXAMC D CONTPER^%TXPSW3 G SUITEG
 
 
SUPPRC D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuatc) S CONTRAINTE="" G CONTRT
 
 
 
 
ACTIV 
 D NETTOIE^%TXPETU(ETUDE)
 S ^MESURE($J,"TXPETT","DEBUT")=$H
 D CHGNORM^%PKUTIL,ATELIER^%TXPARB(ETUDE)
 S ^MESURE($J,"TXPETT","FIN")=$H
 D VALETU^%TXPSUTI(ETUDE)
 D NETTOIE^%TXPETU(ETUDE)
 G SUITE
 
 
SHOW 
 S ATELIER=@GLOREF@(X)
SHOW1 
 I $D(@etuat@("Valeur Atelier")) S VALEUR=@etuat@("Valeur Atelier") D LINEUP^%TXPSUTI
 D DEFATT^%TXPSW2
 Q
GET(ENS,OBJ,G) 
 D POCLEPA^%VVIDEO S DX=0,DY=22 X XY W " "_ENS_" " R OBJ Q:OBJ="" "" Q:$D(@G@(OBJ)) OBJ S DX=0,DY=23 X XY Q:$$CONFIRM^%VZEOUI("confirmez-vous ce nom") OBJ G GET
 
LOOKUP(G,ENS,OBJ,COM1,COM2,SHOW,SHOW1) 
 G:'($D(@G)) CREER
 S DX=10,DY=10 X XY W " "_ENS_" ? :" R OBJ G:OBJ="" CREER
 I $$GETLBLAN^%VTLBLAN(OBJ)="?" D CLFEN^%VVIDEO(1,4,10,70) S OBJ=$$TITINT^%PKCHOIX(G,10,10,10,COM1,0,SHOW) D CLFEN^%VVIDEO(1,4,10,70) Q:OBJ=""  G SUITL
CREER I OBJ="" D CLEBAS^%VVIDEO S DX=3,DY=23 X XY I $$CONFIRM^%VZEOUI(COM2) S OBJ=$$GET(ENS,OBJ,G) D @SHOW1 G SUITL
SUITL Q
 
 
SHOWC 
 S CONTRAINTE=@GLOREF@(X)
SHOWC1 
 D CONTATT^%TXPSW3
 Q

