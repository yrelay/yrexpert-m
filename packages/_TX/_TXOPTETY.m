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

;%TXOPTETY^INT^1^59547,74031^0
%TXOPTETY ;
 
 S etu="^[QUI]etu(ETUDE)",CTG="CTGLOB"
 S ctglob="^[QUI]etu(ETUDE,ATELIER,CTG)"
 S etuat="^[QUI]etu(ETUDE,""AT"",ATELIER)"
 S etuatg="^[QUI]etu(ETUDE,""AT"")"
 S etuatc="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"",CONTRAINTE)"
 S etuatcg="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"")"
 S etuatag="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"")"
 S etuata="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE)"
 S SOL="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""SOL"")"
 ;;
 N TEMP,MENG S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG"),ARTICLE=""
S1 
 D LINEUP^%TXOPTETU K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("passerelle")_"^PASS",@MENG@(1,"COM")=$$^%QZCHW("recuperation d'un fichier contenant les articles et la demande"),@MENG@(2)=$$^%QZCHW("gestion directe")_"^GESDI",@MENG@(2,"COM")=$$^%QZCHW("acceder au menu de gestion des articles"),@MENG@(3)=$$^%QZCHW("fin")_"^F1",@MENG@(3,"COM")=$$^%QZCHW("revenir a l'atelier")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G S1
PASS 
 
 I '($$MES^%VZEOUI("confirmer l'activation de la paserelle","N")) G S1
 D ^%TXOPTPAS1,^%TXOPTPAS2,^%TXOPTPAS4
 G S1
F1 
 K @(TEMP)
 Q
GESDI 
BCPL D CLEPAG^%VVIDEO,LINEUP^%TXOPTETU
 D LOOKUP(etuatag,"ARTICLE",.ARTICLE," articles attaches a l'atelier","voulez-vous associer un nouvel article a cet atelier","SHOW^%TXOPTETY","SHOW1^%TXOPTETY")
 G:ARTICLE="" S1
SUITE 
 D LINEUP^%TXOPTETU K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODI",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRI",@MENG@(2,"COM")=$$^%QZCHW("supprimer cet article"),@MENG@(3)=$$^%QZCHW("demande")_"^DMD",@MENG@(3,"COM")=$$^%QZCHW("descrition de la demande sur cet article"),@MENG@(4)=$$^%QZCHW("description stock")_"^STOCK",@MENG@(4,"COM")=$$^%QZCHW("descrition contraintes de stock"),@MENG@(5)=$$^%QZCHW("description prod")_"^PROD",@MENG@(5,"COM")=$$^%QZCHW(" description des contraintes de production associees"),@MENG@(6)=$$^%QZCHW("activer")_"^ACTIV",@MENG@(6,"COM")=$$^%QZCHW("calculer la production optimale "),@MENG@(7)=$$^%QZCHW("resultat")_"^SOL",@MENG@(7,"COM")=$$^%QZCHW("examiner le resultat"),@MENG@(8)=$$^%QZCHW("fin")_"^GESDI",@MENG@(8,"COM")=$$^%QZCHW("revenir aux articles ")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
END 
 K @(TEMP)
 Q
MODI D SHOW1^%TXOPTETY G SUITE
SUPPRI D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuata) G BCPL
DMD 
 S GLOB="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")",@GLOB@("Valeur Standard")=0,OBJ="DEMANDE",ENS=OBJ D ^%TXOPTSW6(GLOB,OBJ,ENS)
 G SUITE
SOL 
S2 
 D LINEUP^%TXOPTETU K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("solution")_"^SSOL",@MENG@(1,"COM")=$$^%QZCHW("examiner/modif la soltion"),@MENG@(2)=$$^%QZCHW("contraintes")_"^VISCO",@MENG@(2,"COM")=$$^%QZCHW("visualiser l'etat des contraintes"),@MENG@(3)=$$^%QZCHW("fin")_"^SF1",@MENG@(3,"COM")=$$^%QZCHW("revenir a l'article")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G S2
SSOL 
 G S2
 
 G SUITE
 
 
STOCK 
 S titre="contrainte de niveau de stock"
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""st"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=@etuata@("Valeur Std de Stock Mini"),vsM=@etuata@("Valeur Std de Stock Maxi")
 D ^%TXPSUTI(e,em,eM,titre,vsm,vsM)
 
 G SUITE
PROD 
 S titre="contrainte de niveau de production"
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""q"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=10000
 D ^%TXPSUTI(e,em,eM,titre,vsm,vsM)
 
 G SUITE
CONTRAINTES(GLOB,ENS,OBJ) 
 S CONTRAINTE="" D CLEPAG^%VVIDEO,LINEUP^%TXOPTETU
EXAMC D BAG^%TXOPTSW4(GLOB,ENS,OBJ) G SUITEG
 
ACTIV 
 
 D CHGNORM^%PKUTIL,ARTISEUL^%TXOPTARB(ETUDE)
 Q
 
 
SHOW 
 S ATELIER=@GLOREF@(X)
SHOW1 
 I $D(@etuat@("Valeur Atelier")) S VALEUR=@etuat@("Valeur Atelier") D LINEUP^%TXOPTETU
 D ^%TXOPTSW5
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

