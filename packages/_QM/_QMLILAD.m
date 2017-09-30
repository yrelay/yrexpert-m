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

;%QMLILAD^INT^1^59547,73878^0
QMLILAD ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREAT 
 N %R,L,LATT,LISTE,MSG,OK,UC,ZZ
 S MSG="CREATION",UC="UCREAT"
 D LECL Q:'(OK)
GEST 
 D ROUTAF
 D INIT
LI D ^%QUOLST("ZZ")
 D ^%VZEATT
 I '($D(LATT)) D DEL^%QMLILA(LISTE) Q
 D ADD2^%QMLILA(LISTE,"LATT")
 Q
 
UCREAT I $$EX^%QMLILA(Y1) D ^%VZEAVT($$^%QZCHW("Liste deja existante")) S OK=0 Q
 S OK=1 Q
 
MODIF 
 N %I,%R,I,L,LATT,LISTE,MSG,OK,UC,ZZ
 S MSG="MODIFICATION",UC="UMODIF"
 D LECL Q:'(OK)
DIR S L=0,I=""
 F %I=0:0 S I=$O(^[QUI]ZLILA(LISTE,I)) Q:I=""  D INS
 G GEST
INS 
 S L=L+1,AT=^[QUI]ZLILA(LISTE,I)
 S LATT(L)=AT_"^"_$S($D(^[QUI]ZLILA(LISTE,I,"TITRE")):^[QUI]ZLILA(LISTE,I,"TITRE"),1:AT)_"^"
 S LATT(L)=LATT(L)_$S($D(^[QUI]ZLILA(LISTE,I,"INDICE")):^[QUI]ZLILA(LISTE,I,"INDICE"),$D(^[QUI]ZLILAI(LISTE,I)):^[QUI]ZLILAI(LISTE,I),1:1)_"^"
 
 
 S LATT(L)=LATT(L)_$S($D(^[QUI]ZLILA(LISTE,I,"LONGUEUR")):^[QUI]ZLILA(LISTE,I,"LONGUEUR"),1:15)
 Q
 
UMODIF G:Y1'="?" U1
 S %R=1,Y1=$$SELECT^%QSGEST6($$ADR^%QMLILA,$$^%QZCHW("Choisissez une liste")),OK=Y1'=""
 Q
U1 I '($$EX^%QMLILA(Y1)) D ^%VZEAVT($$^%QZCHW("Liste inconnue")) S OK=0 Q
 S OK=1 Q
 
DUP 
 N %I,%R,I,L,LATT,LISTE,OK,UC,MSG
 S MSG="DUPLICATION",UC="UMODIF" D LECL Q:'(OK)
 I %R=1 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW(MSG)),CARSP^%VVIDEO(10,10,3,60,1) S DX=12,DY=11 X XY W $$^%QZCHW("Liste")," : ",LISTE
 D CARSP^%VVIDEO(10,15,3,60,1)
D D ^%VCRIFLD($J("",53),11,16,11,65) S DX=12,DY=16 X XY S Y1=$$^%VZAME1("Nom de la nouvelle liste : ") I Y1="" Q
 D UCREAT I OK=0 G D
 D DUP^%QMLILA(LISTE,Y1)
 S LISTE=Y1 G DIR
 
SUPPR 
 N %R,LISTE,MSG,OK,UC
 S MSG="SUPPRESSION",UC="UMODIF" D LECL Q:'(OK)
 D POCLEPA^%VVIDEO S CONF=$$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression")_" ?") Q:(CONF=-1)!(CONF=0)
 D DEL^%QMLILA(Y1),^%VZEAVT($$^%QZCHW("OK Liste detruite")) Q
 Q
 
LECL 
 S OK=0,Y1=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW(MSG))
 D CARSP^%VVIDEO(10,10,3,60,1)
L1 D ^%VCRIFLD($J("",53),12,11,12,65) S DX=12,DY=11 X XY S Y1=$$^%VZAME1("Liste : ") I Y1="" S OK=0 Q
 S %R=0 D @UC S LISTE=Y1
 G:%R&('(OK)) LECL G:'(OK) L1
 Q
 
ROUTAF 
 D CLEPAG^%VVIDEO,^%VZCD0(LISTE)
 Q
 
INIT 
 S ZZ("AFF")="ROUTAF^%QMLILAD"
 S ZZ("X")=0,ZZ("Y")=5,ZZ("L")=79,ZZ("H")=18
 
 S ZZ("A")="LATT"
 
 S ZZ("LI",1,"X")=1
 S ZZ("LI",1,"T")="Attribut"
 S ZZ("LI",1,"U")="ATT^%QMLILAD"
 S ZZ("LI",2,"X")=25
 S ZZ("LI",2,"T")="Titre"
 S ZZ("LI",2,"U")="TIT^%QMLILAD"
 S ZZ("LI",3,"X")=50
 S ZZ("LI",3,"T")="No d'ordre"
 S ZZ("LI",3,"U")="ORD^%QMLILAD"
 S ZZ("LI",4,"X")=69
 S ZZ("LI",4,"T")="Longueur"
 S ZZ("LI",4,"U")="LON^%QMLILAD"
 
 Q
 
ATT 
 N PCH,PCHCOMP
 S OK=0,PCH=Y1
 D ^%LXABR
AT1 I CONCUR=1 S Y1=PCHCOMP,OK=1 Q
 
 I CONCUR>1 D ^%VZEAVT($$^%QZCHW("Veuillez etre plus precis  ")_PCH_$$^%QZCHW(" est ambigu au lexique")),LEXIQ^%LXSTOCK("AFF^%QMLILAD") Q
 D ^%VZEAVT($$^%QZCHW("Inconnu au lexique"))
 D LEXIQ^%LXSTOCK("AFF^%QMLILAD"),^%LXABR
 G:CONCUR=1 AT1 Q
LON 
 S:Y1="" Y1=$L($P(@A@(LC),"^",1))
 I Y1'?.N D ^%VSQUEAK S OK=0 Q
 S OK=1 Q
ORD 
 S OK=1 Q
TIT 
 S:Y1="" Y1=$P(@A@(LC),"^",1) S OK=1 Q
 
AFF 
 D @ZZ("AFF")
 S IN="ZZ",XC=SX,YC=SY
 D AFF^%QUOLST2 Q

