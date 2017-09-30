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

;%QUAPA3M^INT^1^59547,73884^0
QUAPA3M ;
 
 
 
 
 N SS,SX,SY,TEMP,MEN,ADR,CTR
 S SS=S
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),$P($ZPOS,"^",2))
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 K @(TEMP)
 D MEN(MEN)
LOOP 
 D CLFEN^%VVIDEO(0,22,2,RM-3)
 D ^%VQUIKMN(0,80,23,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") G FIN
 G:ADR="" LOOP
 D @ADR G LOOP
 
FIN S S=SS
 D POCLEPA^%VVIDEO
 K @(TEMP) Q
 
INT 
 N I,LISTE,V,ZZ,Z,J,TEMP,COLF,K,L
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INT")
 S COLF=$$CONCAS^%QZCHAD(TEMP,"COLF")
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISATR")
 K @(TEMP)
 S Z=^Z($J)
 F V="H","L","X","Y" S ZZ(V)=^Z($J,Z,V)
 S ZZ("AFF")=$S($D(^Z($J,Z,"AFF")):^Z($J,Z,"AFF"),1:"")
 S ZZ("TI")="Attributs affiches"
 S ZZ("A")=LISTE
 S ZZ("LI",1,"X")=1
 S ZZ("LI",1,"T")="Attribut"
 S ZZ("LI",1,"U")="ATT^%QUAPA3M"
 S ZZ("LI",2,"X")=20
 S ZZ("LI",2,"T")="Titre"
 S ZZ("LI",2,"U")="TIT^%QUAPA3M"
 S ZZ("LI",3,"X")=40
 S ZZ("LI",3,"T")="No d'ordre"
 S ZZ("LI",3,"U")="ORD^%QUAPA3M"
 S ZZ("LI",4,"X")=60
 S ZZ("LI",4,"T")="Longueur"
 S ZZ("LI",4,"U")="LON^%QUAPA3M"
 
 
 S J=1,K=1
 F I=1:1 Q:'($D(^Z($J,Z,"C",I)))  D STO
 D ^%QUOLST("ZZ")
 K ^Z($J,Z,"C")
 
 
 S J=1
 F I=1:1 Q:'($D(@LISTE@(J)))  D BL S J=J+1
 
 S J=1,K=$O(@COLF@(""))
 F I=1:1 Q:K=""  D BL1 S J=J+1,K=$O(@COLF@(K))
 D AFFICH^%QUAPAGM
 K @(TEMP) Q
STO I '($D(^Z($J,Z,"C",I,"FCT"))) S @LISTE@(J)=^Z($J,Z,"C",I,"C")_"^"_$S($D(^Z($J,Z,"C",I,"T")):^Z($J,Z,"C",I,"T"),1:"")_"^"_$$^%QCAZG("^Z($J,Z,""C"",I,""I"")")_"^"_^Z($J,Z,"C",I,"L")_"^",J=J+1 Q
 
 D GLOCOP^%QCAGLC("^Z("_$J_","_$S((Z+0)=Z:Z,1:$$S1^%QZCHAD(Z))_",""C"","_I_")",$$CONCAT^%QZCHAD(COLF,I))
 Q
 
 
BL F I=I:1 Q:'($D(@COLF@(I)))
 S @COLF@(I,"C")=$P(@LISTE@(J),"^",1)
 S @COLF@(I,"T")=$P(@LISTE@(J),"^",2)
 S @COLF@(I,"L")=$P(@LISTE@(J),"^",4)
 S @COLF@(I,"I")=$P(@LISTE@(J),"^",3)
 S @COLF@(I,"D")=$S($$TYPE^%QSGESPE($P(@LISTE@(J),"^",1)_"/"_$$NOMLOG^%QSF(^Z($J,Z,"B")))="DATE":1,1:0)
 Q
BL1 S (L,^Z($J,Z,"C",J,"D"))=@COLF@(K,"D")
 S ^Z($J,Z,"C",J,"C")=@COLF@(K,"C")
 S ^Z($J,Z,"C",J,"T")=@COLF@(K,"T")
 S ^Z($J,Z,"C",J,"L")=@COLF@(K,"L")
 I L'=2 S ^Z($J,Z,"C",J,"I")=@COLF@(K,"I")
 I L'=2 Q
 S ^Z($J,Z,"C",J,"FCT")=@COLF@(K,"FCT")
 S ^Z($J,Z,"C",J,"FCT.VT")=@COLF@(K,"FCT.VT")
 Q
ATT S SX=XC,SY=YC,OK=0,PCH=Y1
 D ^%LXABR
AT1 I CONCUR=1 S Y1=PCHCOMP,OK=1 Q
 
 I CONCUR>1 D ^%VZEAVT($$^%QZCHW("Veuillez etre plus precis  ")_PCH_$$^%QZCHW(" est ambigu au lexique")),LEXIQ^%LXSTOCK("AFF^%QUAPA3M") Q
A2 D ^%VZEAVT($$^%QZCHW("Inconnu au lexique"))
 D LEXIQ^%LXSTOCK("AFF^%QUAPA3M"),^%LXABR
 G:CONCUR=1 AT1 Q
LON S:Y1="" Y1=$L($P(@A@(LC),"^",1)) I Y1'?.N D ^%VSQUEAK S OK=0 Q
 S OK=1 Q
ORD S OK=1 Q
 I Y1="" Q
 
 
 Q
TIT S:Y1="" Y1=$P(@A@(LC),"^",1) S OK=1 Q
 
AFF 
 D CLEPAG^%VVIDEO S IN="ZZ",XC=SX,YC=SY
 I ZZ("AFF")'="" D @ZZ("AFF")
 D AFF^%QUOLST2 Q
 
MEN(MEN) 
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("attributs")_"^"_"INT",@MEN@(1,"COM")=$$^%QZCHW("colonnes de valeurs d'attributs")
 S @MEN@(2)=$$^%QZCHW("Individu")_"^"_"IND",@MEN@(2,"COM")=$$^%QZCHW("colonne des noms d'individus")
 Q
 
IND 
 N NCP,Z,ONCP,DX,DY
 S DX=0,DY=23 X XY
 S Z=^Z($J)
 
 
 I '($D(^Z($J,Z,"SYN"))) D IND1
 
 S ONCP=^Z($J,Z,"SYN")
 S NCP='($$MES^%VZEOUI("voulez vous afficher le nom complet ?","O"))
 
 I NCP=ONCP Q
 S ^Z($J,Z,"SYN")=NCP
 D INIT2S^%QUAPA7M(1),AFFICH^%QUAPAGM
 Q
IND1 S ^Z($J,Z,"SYN")=1,^Z($J,Z,"SYN.A")="NOM",^Z($J,Z,"SYN.O")=""
 Q

