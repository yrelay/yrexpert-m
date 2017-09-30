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

;%TXPETY^INT^1^59547,74032^0
%TXPETY ;;12:44 PM  3 May 1993; ; 03 May 93  3:11 PM
 
 
 
 N TEMP,MENG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 S PMAX=$$^%TXPMAX(ATELIER)
 S ARTICLE="" D INIVAR^%TXPETU
 
S1 D LINEUP^%TXPSUTI K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("gestion directe")_"^GESDI",@MENG@(1,"COM")=$$^%QZCHW("acceder au menu de gestion des articles")
 S @MENG@(2)=$$^%QZCHW("passerelle")_"^PASS",@MENG@(2,"COM")=$$^%QZCHW("recuperation d'un fichier contenant les articles et la demande")
 S @MENG@(3)=$$^%QZCHW("fin")_"^F1",@MENG@(3,"COM")=$$^%QZCHW("revenir a l'atelier")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G S1
 
PASS 
 I '($$MES^%VZEOUI("confirmer l'activation de la paserelle","N")) G S1
 D ^%TXPPAS1,^%TXPPAS2,^%TXPPAS4
 G S1
F1 
 K @(TEMP)
 Q
 
 
GESDI 
BCPL D CLEPAG^%VVIDEO
 D LOOKUP(etuatag,"ARTICLE",.ARTICLE," articles attaches a l'atelier","voulez-vous associer un nouvel article a cet atelier","SHOW^%TXPETY","SHOW1^%TXPETY")
 G:ARTICLE="" F1
 
SUITE 
 I '($D(@etuata@("Valeur Jauge"))) D INIART^%TXPSW2(etuata)
 S VALEUR=@etuata@("Valeur Jauge")\1 D LINEUP^%TXPSUTI
 K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODI",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux")
 S @MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRI",@MENG@(2,"COM")=$$^%QZCHW("supprimer cet article")
 S @MENG@(3)=$$^%QZCHW("demande")_"^DMD",@MENG@(3,"COM")=$$^%QZCHW("descrition de la demande sur cet article")
 S @MENG@(4)=$$^%QZCHW("description stock")_"^STOCK",@MENG@(4,"COM")=$$^%QZCHW("descrition contraintes de stock")
 S @MENG@(5)=$$^%QZCHW("description prod")_"^PROD",@MENG@(5,"COM")=$$^%QZCHW(" description des contraintes de production associees")
 S @MENG@(6)=$$^%QZCHW("resoudre")_"^ACTIV",@MENG@(6,"COM")=$$^%QZCHW("calculer la production optimale ")
 S @MENG@(7)=$$^%QZCHW("solution")_"^SOL",@MENG@(7,"COM")=$$^%QZCHW("examiner le resultat")
 S @MENG@(8)=$$^%QZCHW("fin")_"^GESDI",@MENG@(8,"COM")=$$^%QZCHW("revenir aux articles ")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
 
END K @(TEMP)
 Q
 
MODI D SHOW1 G SUITE
 
SUPPRI D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") K @(etuata) G BCPL
 G BCPL
 
DMD D DEMART^%TXPSW3
 G SUITE
 
SOL 
S2 D LINEUP^%TXPSUTI K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("solution")_"^SSOL",@MENG@(1,"COM")=$$^%QZCHW("examiner/modif la solution"),@MENG@(2)=$$^%QZCHW("contrainte")_"^VISCO",@MENG@(2,"COM")=$$^%QZCHW("visualiser la contribution de cet article aux contraintes")
 S @MENG@(3)=$$^%QZCHW("imprimer")_"^SIMP",@MENG@(3,"COM")=$$^%QZCHW("imprimer cette solution")
 S @MENG@(4)=$$^%QZCHW("fin")_"^SUITE",@MENG@(4,"COM")=$$^%QZCHW("revenir a l'article")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G S2
SIMP 
 S PMAX=$$^%TXPMAX(ATELIER)
 I '($D(@SOL@("NOEUD"))) D ^%VZEAVT(" pas de solution actuellement") G SUITE
 
 
 
 F t=1:1:PMAX S @demd@(t)=@SOL@("demd",t)
 S NOEUD=@SOL@("NOEUD"),pb=@SOL@("pb"),apb=@SOL@("apb")
 S ARB=@SOL@("ARB"),PMAX=@SOL@("PMAX") I '($D(VISU)) S VISU=5
 D ^%TXP112R(ETUDE,ARB,NOEUD,pb,apb,ATELIER,ARTICLE,PMAX,demd,32,5)
 
 I VISU=5 K VISU
 G S2
SSOL 
 S PMAX=$$^%TXPMAX(ATELIER)
 I '($D(@etuat@("OPTIMUM"))) D ^%VZEAVT(" pas de solution actuellement") G SUITE
 S NOEUD=@etuat@("OPTIMUM")
 F t=1:1:PMAX S @SOL@("Periode "_t)=$$PULLMAT^%TXPPRIM(ARB,NOEUD,"Q",t,ARTICLE)
 D SOLART^%TXPSW3
 G S2
 
 G SUITE
 
 
STOCK S titre="contrainte de niveau de stock"
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""st"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=@etuata@("Valeur Std de Stock Mini"),vsM=@etuata@("Valeur Std de Stock Maxi")
 D MATRICE^%TXPSUTI(e,em,eM,titre,vsm,vsM)
 G SUITE
 
PROD S titre="contrainte de niveau de production"
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""q"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=1000000
 D MATRICE^%TXPSUTI(e,em,eM,titre,vsm,vsM)
 G SUITE
 
VISCO 
 N %capa,qmh S %capa=$O(@etuatcg@("")) Q:%capa=""
 S DX=10,DY=5 X XY
 W "Contribution de ",ARTICLE," aux contraintes de ",%capa
 S qmh=@etuata@("Quantite moyenne horaire"),DX=10,DY=8 X XY
 N %t F %t=1:1:PMAX W !,%t," ",?4,$J(@SOL@("Periode "_%t)/qmh," ",2),?30," sur ",@etuatcg@(%capa,"Periode "_%t)
 G S2
 
 
 
ACTIV 
 N KEEPART
 S KEEPART=ARTICLE
 D NETTOIE^%TXPETU(ETUDE)
 D ARTISEUL^%TXPARB(ETUDE)
 D VALATE^%TXPSUTI(ETUDE,ATELIER)
 D VALETU^%TXPSUTI(ETUDE)
 
 S ARTICLE=KEEPART
 S VALEUR=@etuata@("Valeur Jauge")\1
 G SUITE
 
 
SHOW 
 S ATELIER=@GLOREF@(X)
SHOW1 
 I $D(@etuat@("Valeur Atelier")) S VALEUR=@etuat@("Valeur Atelier") D LINEUP^%TXPSUTI
 D DEFART^%TXPSW2
 Q
GET(ENS,OBJ,G) 
 D POCLEPA^%VVIDEO S DX=0,DY=22 X XY W " "_ENS_" " R OBJ Q:OBJ="" "" Q:$D(@G@(OBJ)) OBJ S DX=0,DY=23 X XY Q:$$CONFIRM^%VZEOUI("confirmez-vous ce nom") OBJ G GET
 
LOOKUP(G,ENS,OBJ,COM1,COM2,SHOW,SHOW1) 
 G:'($D(@G)) CREER
 
 S DX=10,DY=10 X XY W " "_ENS_" ? :" R OBJ G:OBJ="" CREER
 I $$GETLBLAN^%VTLBLAN(OBJ)="?" D CLFEN^%VVIDEO(1,4,14,78) S OBJ=$$TITINT^%PKCHOIX(G,10,10,10,COM1,0,SHOW) D CLFEN^%VVIDEO(1,4,14,78) Q:OBJ=""  G SUITL
CREER I OBJ="" D CLEBAS^%VVIDEO S DX=3,DY=23 X XY I $$CONFIRM^%VZEOUI(COM2) S OBJ=$$GET(ENS,OBJ,G) G:OBJ="" END D @SHOW1 G SUITL
SUITL Q
 ;

