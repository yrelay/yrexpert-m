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

;%SRVALID^INT^1^59547,73892^0
SRVALID ;
 
 
 
 
 
 N SA,INTERACT
 S INTERACT=1
DEB D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un masque de saisie"),0)
 S SA=$$UN^%PKCHOIX($$ADR^%SRSAIS2,30,3,17)
 Q:SA=""
 D ACT2
 G DEB
 
ACT(SA,INTERACT) 
 
ACT2 N ADR,ADRCOMP,ERR,XG,YH,P,LMAX,CLE,LG,WARNING,Y,CTR,X
 S LMAX=0,CLE=0
 
 S ADR=$$CONCAT^%QZCHAD($$ADR^%SRSAIS2,""""_SA_"""")
 S ADRCOMP=$$ADR^%SRCOMP(SA)
 S WARNING=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"WARNING") K @(WARNING)
 
 S ERR=$$ADR(SA) K @(ERR)
 G:'(INTERACT) DEB3
 D CLEPAG^%VVIDEO,^%VZCDB(SA,0)
 K Y
 S Y(1)=$$^%QZCHW("ATTENTION, vous allez supprimer la compilation existante")_" : "
 S Y(2)=$J("",6)_"1/   "_$$^%QZCHW("assurez-vous que personne ne saisit.")
 S Y(3)=$J("",6)_"2/   "_$$^%QZCHW("assurez-vous que les donnees existantes seront")
 S Y(4)=$J("",11)_$$^%QZCHW("compatibles avec la nouvelle version")_"."
 S Y="10\CWDHRLY\1\\\"
 S %R=6 D PARAM^%PKPOP(.Y) K Y
 S OK=$$POCLE^%PKOUNO(" confirmation ","N") Q:OK'=1
 S DX=0,DY=3 D CLEBAS^%VVIDEO
 
DEB3 K @(ADRCOMP)
 D:INTERACT ATT^%PKUTIL(25,6,$$^%QZCHW("validation en cours")_" ...","HRL")
 S XG=$P(@ADR,$C(0),3)
 I (XG<0)&(XG>75) D INS(ERR,"numero de colonne invalide")
 S YH=$P(@ADR,$C(0),4)
 I (YH<0)&(YH>20) D INS(ERR,"numero de ligne invalide")
 
 
 S P="",LV=0
 F N=0:1 S P=$O(@ADR@("CHAMPS",P)) Q:P=""  D LARG
 I LV=0 D INS(ERR,$$^%QZCHW("Aucune largeur n'est definie"))
 I N>20 D INS(ERR,$$^%QZCHW("Le nombre de champs doit etre inferieur ou egal a 20"))
 
 
 S (LB,NC)=0,P=""
 F N=0:1 S P=$O(@ADR@("CHAMPS",P)) Q:P=""  D ^%SRVALI2
 I N=0 D INS(ERR,$$^%QZCHW("Aucun champ n'est defini"))
 I ((YH+N)+2)>23 D INS(ERR,$$^%QZCHW("Positionnement du masque trop bas"))
 
 D UCLE(.CLE)
 
 
 S LIB=$S($D(@ADR@("UCONTS")):@ADR@("UCONTS"),1:"")
 I LIB="" G SUITE
 I "ON"'[$P(LIB,$C(0),1) D INS(ERR,$$^%QZCHW("Execution")_" : "_$$^%QZCHW("'boucle sur ajout' = O ou N"))
 I "ON"'[$P(LIB,$C(0),2) D INS(ERR,$$^%QZCHW("Execution")_" : "_$$^%QZCHW("'boucle sur erreur' = O ou N"))
 I "CGB"'[$P(LIB,$C(0),3) D INS(ERR,$$^%QZCHW("Execution")_" : "_$$^%QZCHW("'execution controles' = C, G ou B "))
 I "ON"'[$P(LIB,$C(0),4) D INS(ERR,$$^%QZCHW("Execution")_" : "_$$^%QZCHW("'stockage dernier champ' = O ou N"))
 I "ON"'[$P(LIB,$C(0),5) D INS(ERR,$$^%QZCHW("Execution")_" : "_$$^%QZCHW("'ajout seulement' = O ou N"))
 
SUITE 
 D AFF
 I $D(@ERR) K @(ADRCOMP) Q:INTERACT  Q 0
 D ^%SRCOMP(SA,ADRCOMP)
 Q:INTERACT
 Q 1
 
 
M(P) 
 N M
 S M=$$^%QZCHW("champ")_" "_P_" : "
 Q M
 
INS(ERR,M) 
 S @ERR@($E(M,1,74))="",LMAX=$S($L(M)<74:$L(M),1:74)
 Q
 
AFF 
 Q:'(INTERACT)
 S DX=0,DY=3 D CLEBAS^%VVIDEO
 G:'($D(@ERR)) AFF2
 N A
 I LMAX=0 S LMAX=20
 S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  erreurs trouvees ")
 S A=$$UN^%PKCHOIX(ERR,(40-(LMAX/2))\1,8,12)
AFF2 I '($D(@WARNING)) G FAFF
 S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  W A R N I N G  ")
 S A=$$UN^%PKCHOIX(WARNING,(40-(LMAX/2))\1,8,12)
 K @(WARNING)
FAFF Q
 
KONE(SA) 
 N ERR S ERR=$$ADR(SA) K @(ERR)
 Q
ADR(SA) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]RQSDON(""SR"",""VALID"")",""""_SA_"""")
 Q A
 
UCLE(CLE) 
 I CLE=0 D INS(ERR,$$^%QZCHW("Aucune cle n'a ete definie")) Q
 N C,CONT,P,S,ADRSAI,LL
 S ADRSAI=$$ADR^%SRACTIV(SA),ADRSAI=$P(ADRSAI,"(",2,999),LL=$L(ADRSAI)-1
 S CONT=1
 
 S C=""
 
LOP S C=$O(CLE(C)) G:C="" FUCLE
 I C>CLE D INS(ERR,$$M(P)_$$^%QZCHW("numero cle trop grand"))
 S P=$O(CLE(C,""))
 S S=$O(CLE(C,P))
 S LL=LL+CLE(C,P)
 I S'="" D INS(ERR,$$^%QZCHW("champs")_" "_P_" "_"et"_" "_S_" : "_$$^%QZCHW("numero cle identique"))
 
 I CONT=0 G LOP
 S S=$O(CLE(C))
 I S="" G LOP
 I S'=(C+1) D INS(ERR,$$^%QZCHW("les cles ne sont pas consecutives")) S CONT=0
 G LOP
FUCLE 
 I ((LL+CLE)-1)>240 D INS(ERR,$$^%QZCHW("La somme des largeurs des champs cles est trop grande"))
 Q
 
LARG 
 
 S LIB=$$GETLBLAN^%VTLBLAN($P(@ADR@("CHAMPS",P),$C(0),5))
 
 I LIB="$JOUR" S LARG=8 G FL
 
 I $E(LIB,1,7)="$HEURE(" S LARG=8 G FL
 
 I $E(LIB,1,7)="$ANNEE(" S LARG=4 G FL
 
 I $E(LIB,1,6)'="$DATE(" S LARG=$P(@ADR@("CHAMPS",P),$C(0),6) G FL
 
 S CONT=$P($P(LIB,"(",2),")",1)
 S LARG=$L(^RQSGLU("QMDA","FORM",CONT))
FL I LARG>LV S LV=LARG
 Q

