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

;%SGNETQM^INT^1^59547,73890^0
%SGNETQM() ;;03:06 PM  2 Nov 1993; ; 02 Nov 93  3:41 PM
 
 
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK
 N TEMP
 S VERIF=$$TEMP^%SGUTIL
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 
 S @VAL="STOCK"
 S VALDEF=""
 F I=2:2:10 S @VAL@(I)=""
 F I=1:2:11 S @VAL@(I)="OUI"
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) 0
 
 S @VERIF@("PARASITES")=$P(STOCK,$C(0))="OUI"
 S @VERIF@("QUERY")=$P(STOCK,$C(0),3)="OUI"
 S @VERIF@("SUPPREP")=$P(STOCK,$C(0),5)="OUI"
 S @VERIF@("SGNETQL")=$P(STOCK,$C(0),7)="OUI"
 S @VERIF@("SGNETQA")=$P(STOCK,$C(0),9)="OUI"
 S @VERIF@("SUPPSF")=$P(STOCK,$C(0),11)="OUI"
 I @VERIF@("SUPPREP") D CLEPAG^%VVIDEO,OKREP($$CONCAS^%QZCHAD(VERIF,"SUPPREP"))
 Q 1
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=11
 
 
 
 
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="caracteristiques du nettoyage"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S J=1,PLL=0 F I="Nettoyage des caracteres parasites","Integrite des 4 Query","Suppression de repertoires inutiles","Verification des liaisons","Suppression des donnees regenerables","Archivage puis suppression du savoir-faire" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=3 F I=1:1:NBC S @GLO@("LARG",I)=3
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Suppression des caracteres de controles")_$C(0)_$$^%QZCHW("dans tous les globals")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 S @GLO@("AIDE",3)=$$^%QZCHW("Homogeneisation des quatre QUERYs")_$C(0)_$$^%QZCHW("(stockage redondant des attributs)")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 S @GLO@("AIDE",5)=$$^%QZCHW("Vider completement certains repertoires")_$C(0)_$$^%QZCHW("(apres selection de ceux-ci)")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 S @GLO@("AIDE",7)=$$^%QZCHW("Verification de la validite du repertoire lien")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 S @GLO@("AIDE",9)=$$^%QZCHW("Suppression des etudes, des resultats")_$C(0)_$$^%QZCHW("d'analyse, de comprehension, ..")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 S @GLO@("AIDE",11)=$$^%QZCHW("Suppression de tout le savoir-faire apres")_$C(0)_$$^%QZCHW("archivage automatique de celui-ci")_$C(0)_$$^%QZCHW("repondre OUI on NON ")
 
 
 
 S TJSOK="S OK=1"
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 F I=1:2:NBC S @GLO@("UCONT.CHAMPS",I)="D OKOUINON^%SGNETQM"
 S @GLO@("UCONT")="D OKGRIL^%SGNETQM"
 
 
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1:2:NBC S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
OKOUINON S OK=$S(X="OUI":1,X="NON":1,1:0) Q
OKGRIL S OK=1 Q
 
OKREP(LSUP) 
 D ^%VZCD0("Repertoires a eliminer")
 S TABUTI=$$TEMP^%SGUTIL,LSEL=$$TEMP^%SGUTIL
 S X="" F %X=0:0 S X=$O(^[QUI]QUERYV(X)) Q:X=""  I (((((X'="TRAITEMENT")&(X'="RQS"))&(X'="ATTRIBUT"))&(X'="L0"))&(X'="ETAT"))&(X'="ETAT.RESEAU") D CARD I CARD>0 S NOMEX=$$NOMLOG^%QSF(X),@TABUTI@(X_" (nom externe : "_$S(NOMEX="":"???",1:NOMEX)_", cardinal : "_CARD_")")=""
 D INIT^%QUCHOIP(TABUTI,1,"",0,5,78,15)
 D AFF^%QUCHOIP
 D ^%QUCHOYP(LSEL)
 D END^%QUCHOIP
 S X="" F %X=0:0 S X=$O(@LSEL@(X)) Q:X=""  S @LSUP@($P(X," ("))=""
 Q
 
CARD S III="" F CARD=0:1 S III=$O(^[QUI]QUERYV(X,III)) Q:III=""
 Q

