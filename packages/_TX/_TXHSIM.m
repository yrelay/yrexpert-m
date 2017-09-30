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

;%TXHSIM^INT^1^59547,74031^0
%TXHSIM ;
 
 S etu="^[QUI]etu(ETUDE)",CTG="CTGLOB"
 S ctglob="^[QUI]etu(ETUDE,ATELIER,CTG)"
 S etuat="^[QUI]etu(ETUDE,""AT"",ATELIER)"
 S etuatg="^[QUI]etu(ETUDE,""AT"")"
 S etuatc="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"",CONTRAINTE)"
 S etuatcg="^[QUI]etu(ETUDE,""AT"",ATELIER,""CTG"")"
 S etuatag="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"")"
 S etuata="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE)"
 S SOL="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""SOL"")"
 S PRD="^[QUI]OPTPRD(ETUDE,PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(ETUDE,PB,ATELIER,ARTICLE)",dmd="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")",demd="^dmd($j)"
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
 
 N TEMP,MENG
 S NBETU=3,NBATEL=4,NBARTI=4,TEMP=0
BCPL D CLEPAG^%VVIDEO
 S TEMP=TEMP+1 I TEMP>NBETU Q
 S (ETUDE,ATELIER,ARTICLE,VALEUR)=""
CREER S ETUDE=$$GEN^%QCAPOP("TXP")
 S @etu@("Valeur")="",PMAX=$R(17)+1,@etu@("Nombre de Periodes")=PMAX
 S NBC=13 D INIETU^%TXPSW5(etu)
 D ATELIER
 G BCPL
ATELIER 
 S ATELIER="" F z=1:1:NBATEL S ATELIER="SIMATEL"_z,DX=10,DY=10 X XY W ATELIER S ARTICLE="" D INIAT F z1=1:1:NBARTI S ARTICLE="SIMART"_z_z1,DX=12,DY=12 X XY W ARTICLE D INIART
 Q
INIAT 
 S NBC=9 D INIATT^%TXPSW5(etuat),CONTRAINTE Q
 
CONTRAINTE 
 S CONTRAINTE="CAPA",GSUIV=etuatcg
 F t=1:1:PMAX S @etuatcg@("CAPA","Periode "_t)=$R(500)
 F I=1:1:PMAX S V1=$$vstoctr^%TXPSW3(I) I '($D(@etuatcg@(V1))) S @etuatcg@(V1)=$$vdefctr^%TXPSW3(I)
 I '($D(@etuatcg@("Etude"))) S @etuatcg@("Etude")=$$etude^%TXPSW3
 I '($D(@etuatcg@("Atelier"))) S @etuatcg@("Atelier")=$$atelier^%TXPSW3
 I '($D(@etuatcg@("Contrainte"))) S @etuatcg@("Etude")=$$contr^%TXPSW3
 Q
INIART 
 S NBC=17 D INIART^%TXPSW5(etuata),DMD,STOCK,PROD
 Q
 
STOCK 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""st"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 S vsm=0,vsM=50000
 D ^%TXPSINS(e,em,eM,vsm,vsM)
 Q
PROD 
 S e="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""q"")",em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 S vsm=0,vsM=50000
 D ^%TXPSINS(e,em,eM,vsm,vsM)
 Q
DMD 
 F t=1:1:PMAX S @dmd@("Periode "_t)=$R(300)
 Q
 
SHOW 
 S ETUDE=@GLOREF@(X)
SHOW1 
 D CLEPAG^%VVIDEO
 I $D(@etu@("Valeur")) S VALEUR=@etu@("Valeur") D LINEUP^%TXPSUTI
 D DEFETU^%TXPSW2
 Q

