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

;%TXPETU^INT^1^59547,74032^0
%TXPETU ;;09:59 AM  30 Jul 1993; ; 08 Oct 93  9:03 AM
 
 
 N TEMP,MENG
 N etu,CTG,ARB,ctglob,etuat,etuatg,etuatc,etuatcg,etuatag,etuata,SOL,PRD,prd,dmd,demd,QMINC,QMAXC,RMINC,RMAXC,QMINP,QMAXP,RMINP,RMAXP,QMINCO,QMAXCO,RMINCO,RMAXCO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 D INIVAR
 S printer=32
 
 K DELTA1 ;;chrono de 112R
 S AVORT=0
BCPL D CLEPAG^%VVIDEO
 S (ETUDE,ATELIER,ARTICLE,VALEUR)=""
 D LINEUP^%TXPSUTI
 G:'($D(^[QUI]etu)) CREER
 S DX=10,DY=10 X XY W "ETUDE TXP ? :" R ETUDE
 I $$GETLBLAN^%VTLBLAN(ETUDE)="?" S ETUDE=$$TITINT^%PKCHOIX("^[QUI]etu",10,10,10," etudes existantes",0,"SHOW^%TXPETU") D CLFEN^%VVIDEO(1,4,12,70) Q:ETUDE=""  G SUITE
CREER I ETUDE'="" S:(ETUDE+0)=ETUDE ETUDE=$$FULNUM^%QCAPOP("TXP",ETUDE+0) Q:ETUDE=""  G SUITE
LOOPETU 
 D CLEPAG^%VVIDEO
 D POCLEPA^%VVIDEO
 I '($$CONFIRM^%VZEOUI("voulez-vous creer une etude")) Q
 S DUPCRE(1)=$$^%QZCHW("creer")_"^C",DUPCRE(1,"COM")=$$^%QZCHW("creer une nouvelle etude vierge"),DUPCRE(2)=$$^%QZCHW("dupliquer")_"^D",DUPCRE(2,"COM")=$$^%QZCHW("creer une nouvelle etude a partir d'une etude existante")
 S ETUDE=$$GEN^%QCAPOP("TXP")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(0,80,22,"DUPCRE",.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") BCPL
 I ADRES="C" D SHOW1 G SUITE
 S DUPCRE=$$TITINT^%PKCHOIX("^[QUI]etu",10,10,10," etudes existantes",0,"SHOW^%TXPETU") D CLFEN^%VVIDEO(1,4,12,70) G:DUPCRE="" BCPL
 D ^%VZEATT
 D COPY^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]etu",DUPCRE),$$CONCAS^%QZCHAD("^[QUI]etu",ETUDE))
 D SHOW1
SUITE 
 S VALEUR=$S($D(@etu@("Valeur")):@etu@("Valeur"),1:"")
 S PMAX=$S($D(@etu@("Nombre de Periodes")):@etu@("Nombre de Periodes"),1:"")
 D LINEUP^%TXPSUTI
 S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("modifier")_"^MODI",@MENG@(1,"COM")=$$^%QZCHW("modifier les parametres generaux"),@MENG@(2)=$$^%QZCHW("supprimer")_"^SUPPRI",@MENG@(2,"COM")=$$^%QZCHW("supprimer cette etude")
 S @MENG@(3)=$$^%QZCHW("atelier")_"^ATELIER",@MENG@(3,"COM")=$$^%QZCHW("examiner les ateliers associes")
 S @MENG@(4)=$$^%QZCHW("dupliquer")_"^LOOPETU",@MENG@(4,"COM")=$$^%QZCHW("creer une nouvelle etude par copie d'une autre ")
 S @MENG@(5)=$$^%QZCHW("changer d'etude")_"^BCPL",@MENG@(5,"COM")=$$^%QZCHW("passer de cette etude a une autre "),@MENG@(6)=$$^%QZCHW("resoudre")_"^ACTIV",@MENG@(6,"COM")=$$^%QZCHW("calculer la production optimale ")
 S @MENG@(7)=$$^%QZCHW("fin")_"^END",@MENG@(7,"COM")=$$^%QZCHW("mettre un terme a cette etude ou cette session ")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXPSUTI,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
END 
 K @(TEMP)
 Q
 
MODI 
 D SHOW1 G SUITE
 
SUPPRI D CLEBAS^%VVIDEO I $$CONFIRM^%VZEOUI("confirmer la suppression") D SUPET(ETUDE)
 G BCPL
SUPET(ETUDE) 
 K ^[QUI]etu(ETUDE),^[QUI]arb(ETUDE),^[QUI]OPTPRD(ETUDE),^[QUI]OPTprd(ETUDE),^[QUI]apb(ETUDE),^[QUI]valpb(ETUDE),^[QUI]tmax(ETUDE)
 Q
 
DEPOUIL(ETUDE) 
 K ^[QUI]arb(ETUDE),^[QUI]OPTPRD(ETUDE),^[QUI]OPTprd(ETUDE),^[QUI]apb(ETUDE),^[QUI]valpb(ETUDE),^[QUI]tmax(ETUDE)
 Q
NETTOIE(ETUDE) 
 K ^[QUI]OPTPRD(ETUDE),^[QUI]OPTprd(ETUDE)
 K ^[QUI]etu(ETUDE,"TEMPO")
 Q
ATELIER D ^%TXPETT S ATELIER="" D CLEPAG^%VVIDEO,LINEUP^%TXPSUTI G SUITE
 
 
ACTIV 
 S NBC=13 D INIETU^%TXPSW2(etu)
 D ACTIV^%TXPACTI(ETUDE)
 
FINACT G SUITE
 
 
SHOW 
 S ETUDE=@GLOREF@(X)
SHOW1 
 D CLEPAG^%VVIDEO
 I $D(@etu@("Valeur")) S VALEUR=@etu@("Valeur") D LINEUP^%TXPSUTI
 D DEFETU^%TXPSW2
 Q
 
 
INIVAR 
 S etu="^[QUI]etu(ETUDE)",CTG="CTGLOB"
 S ARB="^[QUI]arb(ETUDE,ATELIER)"
 S ctglob="^[QUI]etu(ETUDE,ATELIER,CTG)"
 S etuat="^[QUI]etu(ETUDE,""AT"",ATELIER)"
 S etuatg="^[QUI]etu(ETUDE,""AT"")"
 S etuatc="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"",CONTRAINTE)"
 S etuatcg="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"")"
 S etuatag="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"")"
 S etuata="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE)"
 S SOL="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""SOL"")"
 S PRD="^[QUI]OPTPRD(ETUDE,PB,ATELIER,ARTICLE)"
 S prd="^[QUI]OPTprd(ETUDE,PB,ATELIER,ARTICLE)"
 
 
 S dmd="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")"
 
 S demd="^[QUI]etu(ETUDE,""TEMPO"",ATELIER,ARTICLE)"
 S QMINC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S QMAXC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S RMINC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S RMAXC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S QMINP="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"",""PB"")"
 S QMAXP="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"",""PB"")"
 S RMINP="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""rm"",""PB"")"
 S RMAXP="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""rM"",""PB"")"
 S QMINCO="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"",""copie"")"
 S QMAXCO="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"",""copie"")"
 S RMINCO="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"",""copie"")"
 S RMAXCO="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"",""copie"")"
 S tapb="^[QUI]apb(ETUDE,ATELIER)",valpb="^[QUI]valpb(ETUDE,ATELIER)",tmax="^[QUI]tmax(ETUDE,ATELIER)"
 S AVORT=0,VLIMI=90000000000E-0
 S printer=$S($D(^TXPMODE($J,"printer")):^TXPMODE($J,"printer"),1:32)
 Q
 
SUPALL 
 K ^[QUI]etu,^[QUI]arb,^[QUI]OPTPRD,^[QUI]OPTprd,^[QUI]apb,^[QUI]valpb,^[QUI]tmax
 Q

