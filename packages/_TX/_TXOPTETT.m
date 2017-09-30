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

;%TXOPTETT^INT^1^59547,74031^0
%TXOPTETT ;
 
 S etu="^[QUI]etu(ETUDE)",CTG="CTGLOB"
 S ctglob="^[QUI]etu(ETUDE,ATELIER,CTG)"
 S etuat="^[QUI]etu(ETUDE,""AT"",ATELIER)"
 S etuatg="^[QUI]etu(ETUDE,""AT"")"
 S etuatc="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"",CONTRAINTE)"
 S etuatcg="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"")"
 ;;
 N TEMP,MENG S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG"),(ATELIER,VALEUR)=""
BCPL D CLEPAG^%VVIDEO,LINEUP^%TXOPTETU
 D LOOKUP(etuatg,"ATELIER",.ATELIER," ateliers attaches a l'etude","voulez-vous associer un nouvel atelier a cette etude","SHOW^%TXOPTETT","SHOW1^%TXOPTETT")
 Q:ATELIER=""
SUITE 
 D LINEUP^%TXOPTETU K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODI",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRI",@MENG@(2,"COM")=$$^%QZCHW("supprimer cet atelier"),@MENG@(3)=$$^%QZCHW("articles")_"^ARTICLE",@MENG@(3,"COM")=$$^%QZCHW("acceder aux articles associes"),@MENG@(4)=$$^%QZCHW("contraintes")_"^CONTRAINTES",@MENG@(4,"COM")=$$^%QZCHW("acceder aux contraintes de production associees"),@MENG@(5)=$$^%QZCHW("activer")_"^ACTIV",@MENG@(5,"COM")=$$^%QZCHW("calculer la production optimale "),@MENG@(6)=$$^%QZCHW("fin")_"^END",@MENG@(6,"COM")=$$^%QZCHW("revenir a l'etude")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
END 
 K @(TEMP)
 Q
MODI D SHOW1^%TXOPTETT G SUITE
SUPPRI D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuat) G BCPL
 
ARTICLE D ^%TXOPTETY S ARTICLE="" D LINEUP^%TXOPTETU G SUITE
CONTRAINTES 
 S CONTRAINTE="" D CLEPAG^%VVIDEO,LINEUP^%TXOPTETU
 D LOOKUP(etuatcg,"CONTRAINTE",.CONTRAINTE," contraintes attachees a cet atelier","voulez-vous associer une nouvelle contrainte a cet atelier","SHOWC^%TXOPTETT","SHOWC1^%TXOPTETT")
 G:CONTRAINTE="" SUITE
SUITEG 
 D LINEUP^%TXOPTETU K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODIC",@MENG@(1,"COM")=$$^%QZCHW("modifier les valeurs"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRC",@MENG@(2,"COM")=$$^%QZCHW("supprimer cette contrainte"),@MENG@(3)=$$^%QZCHW("examiner")_"^EXAMC",@MENG@(3,"COM")=$$^%QZCHW("detailler la contrainte"),@MENG@(4)=$$^%QZCHW("fin")_"^SUITE",@MENG@(3,"COM")=$$^%QZCHW("revenir a l'atelier")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITEG
 
MODIC D ^%TXOPTSW3 G SUITEG
EXAMC D ^%TXOPTSW4 G SUITEG
SUPPRC D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuatc) S CONTRAINTE="" G CONTRAINTES
 
ACTIV 
 
 D CHGNORM^%PKUTIL,ATELIER^%TXOPTARB(ETUDE)
 Q
 
 
SHOW 
 S ATELIER=@GLOREF@(X)
SHOW1 
 I $D(@etuat@("Valeur Atelier")) S VALEUR=@etuat@("Valeur Atelier") D LINEUP^%TXOPTETU
 D ^%TXOPTSW2
 Q
GET(ENS,OBJ,G) 
 D POCLEPA^%VVIDEO S DX=0,DY=22 X XY W " "_ENS_" " R OBJ Q:OBJ="" "" Q:$D(@G@(OBJ)) OBJ S DX=0,DY=23 X XY Q:$$CONFIRM^%VZEOUI("confirmez-vous ce nom") OBJ G GET
 
LOOKUP(G,ENS,OBJ,COM1,COM2,SHOW,SHOW1) 
 G:'($D(@G)) CREER
 S DX=10,DY=10 X XY W " "_ENS_" ? :" R OBJ G:OBJ="" CREER I $$GETLBLAN^%VTLBLAN(OBJ)="?" S OBJ=$$TITINT^%PKCHOIX(G,10,10,10,COM1,0,SHOW) Q:OBJ=""  G SUITL
CREER I OBJ="" D CLEBAS^%VVIDEO S DX=3,DY=23 X XY I $$CONFIRM^%VZEOUI(COM2) S OBJ=$$GET(ENS,OBJ,G) D @SHOW1 G SUITL
SUITL 
 Q
SHOWC 
 S CONTRAINTE=@GLOREF@(X)
SHOWC1 
 D ^%TXOPTSW3
 Q

