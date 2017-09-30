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
;! HL002 ! HL     ! 20/07/12 ! PB caractètre parasites sur terminal-gnome     !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QMEXNOE^INT^1^59547,73878^0
%QMEXNOE(ATN) ;;04:40 PM  21 Oct 1992; ; 21 Oct 92  5:31 PM
 
 
 
 
 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP1,TEMP,N,GLOB,NOE,LISNODE,ND,%ND,OND
 S TEMP=$$TEMP^%INCOIN("TEMP1",$P($ZPOS,"^",2))
 S TOTO=$$CONCAS^%QZCHAD(TEMP,"TOTO")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LISNODE=$$TEMP^%SGUTIL
 S OND="" F %ND=0:0 S OND=$$NXTRIAO^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",OND) Q:OND=""  S ND=$$VALEUR^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",OND),@LISNODE@(ATN_","_ND)=""
 K @(TEMP)
 S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE"
 S @TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Creer")_"^CREAT"
 S @TOTO@(2,"COM")=$$^%QZCHW("Creation d'un noeud")
 S @TOTO@(3)=$$^%QZCHW("Consulter/Modifier")_"^MODIF"
 S @TOTO@(3,"COM")=$$^%QZCHW("Consultation, modification d'un noeud du reseau")
 S @TOTO@(4)=$$^%QZCHW("Supprimer")_"^SUPP"
 S @TOTO@(4,"COM")=$$^%QZCHW("Suppression d'un noeud du reseau")
 S @TOTO@(5)=$$^%QZCHW("Dupliquer")_"^DUPLI"
 S @TOTO@(5,"COM")=$$^%QZCHW("Duplication d'un noeud du reseau")
 S @TOTO@(6)=$$^%QZCHW("Page")_"^PAGE"
 S @TOTO@(6,"COM")=$$^%QZCHW("Changer de page")
 S @TOTO@(7)="+^PLUS",@TOTO@(8,"EQU")="="
 S @TOTO@(7,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(8)="-^MOINS",@TOTO@(9,"EQU")="_"
 S @TOTO@(8,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(9)=$$^%QZCHW("Repere")_"^REPER"
 S @TOTO@(9,"COM")=$$^%QZCHW("Voir le repere des pages")
 S @TOTO@(10)=$$^%QZCHW("Changer le nom d'un noeud")_"^CHANGN"
 S @TOTO@(10,"COM")=$$^%QZCHW("Changer le nom d'un noeud du reseau")
 
 
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,TOTO,.ADRES,.CONTR) G:CONTR="R" AFF2
 G:(CONTR="A")!(CONTR="F") ENDACT
 G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM
 K @(TEMP) Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("NOEUDS DU RESEAU")) Q
CADLL D CARSP^%VVIDEO(40,0,3,40,1)
 ;HL002 S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I,DX=41,DY=1 X XY W $J("",38)
 S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I,DX=41,DY=1 X XY W $J("",37)
 S DX=60-($L(LCOUR)\2),DY=1 D REV^%VVIDEO X XY W LCOUR
 D NORM^%VVIDEO Q
ENTREE 
 D GO^%QUAPAGM G ACT2
CREAT 
 D:$$AJ^%QMEXNOG REINIT
 G AFF2
MODIF 
 S NOE=$$UN^%QUAPAGM G:NOE="" AFF3
 S NOE=$P(NOE,",",2)
 D MOD^%QMEXNOG(NOE)
 G AFF2
 
DUPLI S NOE=$$UN^%QUAPAGM G:NOE="" AFF2
 S NOE=$P(NOE,",",2)
 D:$$DUP^%QMEXNOG(NOE) REINIT
 G AFF2
 
CHANGN S NOE=$$UN^%QUAPAGM G:NOE="" AFF2
 S NOE=$P(NOE,",",2)
 D:$$CHGN^%QMEXNOG(NOE) REINIT
 G AFF2
IMPRIM 
 D ^%QMEANPR G AFF3
SUPP 
 K GLOB
 D ENS^%QUAPAGM("GLOB") G:'($D(GLOB)) AFF3
 D POCLEPA^%VVIDEO
 S NOE=""
BSUPP S NOE=$O(GLOB(NOE))
 I NOE="" K GLOB D REINIT G AFF2
 W "."
 D SUP^%QMEXNOG($P(NOE,",",2))
 G BSUPP
PLUS 
 D PLUS^%QUAPAGM G ACT2
MOINS 
 D MOINS^%QUAPAGM G ACT2
PAGE 
 D PAGE^%QUAPAGM G ACT2
REPER 
 D REPER^%QUAPAGM G ACT2
 
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="ETAT.RESEAU",@FEN@("A")=LISNODE
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QMEXNOE"
 D IFEN(FEN) Q
IFEN(FEN) 
 S @FEN@("C",1,"T")=$$^%QZCHW("Titre"),@FEN@("C",1,"L")=30,@FEN@("C",1,"C")="TITRE"
 S @FEN@("C",2,"T")=$$^%QZCHW("1ere regle"),@FEN@("C",2,"L")=50,@FEN@("C",2,"C")="REGLE"
 S @FEN@("ECRAN")="CADR^%QMEXNOE"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
REINIT D END^%QUAPAGM
 D PFEN
 Q

