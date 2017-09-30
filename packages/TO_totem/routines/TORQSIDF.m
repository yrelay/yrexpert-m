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

;TORQSIDF^INT^1^59547,74875^0
TORQSIDF(BASEL,L) 
 
 
 
 
 N LINK,BATCH,CHOIX,STOP,KEEPIDT
 S BATCH=0,KEEPIDT=0
 S LINK=$S($D(^KLNTOT($J)):1,1:0)
TEST N NBTOT,NBTC,PREM,VALOBJL,EXISTEL,BASEP,%B,DXG,DXD,DYH,DYB,GRAPH,MSG,DX,DY,ECRAN,INDIVIDU,OBJET,XX,II,VR,INDPC,VV,LI,NBP,J,SUIV,VALIDENT,JJ,IN,YA,RECOM,NPAG,CARD,EXIS
 I BASEL="" D ^%VZEAVT($$^%QZCHW("impossible de retrouver le repertoire des individus de la liste")) Q
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE")
 I ADLIST="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de la liste")_L) Q
 S NBTOT=$$^%QSCALVA("L0",L,"CARD"),NBTC=1,PREM=1 K ^TRAITES($J) S ^TRAITES($J,"CARD")=1
 S VALOBJL=$$^%QSCALVA("L0",L,"OBJET.TOTEM"),EXISTEL=$S(VALOBJL'="":1,1:0)
 I BASEL'=$$^%QSCALVA("L0",L,"BASE") D ^%VZEAVT($$NOMLOG^%QSF(BASEL)_$$^%QZCHW(" n'est pas le repertoire des individus de la liste ")_L) Q
 G BEG
TERM D ^%VZEAVT(BASEL_$$^%QZCHW(" n'a pas de base pere")) Q
NDIAL(BASEL,L) 
 S CHOIX="SANS DIALOGUE",BATCH=1 G TEST
BEG G:BATCH BEG2 D CLEPAG^%VVIDEO
 D BLD^%VVIDEO,^%VZCD(2,38,0,4,1,0,$S(LINK:"IDENTIFIANT",1:"IDENTIFIANT TOTEM"))
 S DX=10,DY=10 X XY D CAG^%VVIDEO W $$^%QZCHW("La liste est "),$$^%QZCHW(L) D NORM^%VVIDEO
 D POCLEPA^%VVIDEO S CHOIX=$$^%VZECH2("Identifier","AVEC DIALOGUE","SANS DIALOGUE") D:CHOIX="SANS DIALOGUE" FINAL2 G:(CHOIX'="AVEC DIALOGUE")&(CHOIX'="SANS DIALOGUE") FIN
BEG2 S ECRAN=$S(CHOIX="AVEC DIALOGUE":1,1:0)
 I ECRAN=0 D CREERL^TORQSID2 G DEBSS
 D DESSIN^TORQSID2
DEBSS S INDIVIDU="",OBJET=""
 
 F XX=1:1 K ^VALPAR($I) S INDIVIDU=$$SUIVL^%QS0XG1(L,INDIVIDU) D:(INDIVIDU="")&(ECRAN=0) FINL^TORQSID2 Q:INDIVIDU=""  D EXIS R *STOP:0 D TOUCHE^%INCCLAV(STOP,.STOP) D:(STOP=1)&(ECRAN=0) FINAL(.STOP) Q:STOP=1  D NINDIV^TORQSID2 D:'(EXIS) EXIS2 D:EXIS ACT
 
 S DX=0,DY=0 D CLEBAS^%VVIDEO Q
RECOM D ^%VZEATT,NINDIV^TORQSID2,TRAIT^TORQSID2,QUT^TORQSID2 G ADEXP
ADEXP S:^VALPAR($I,"OBJET.TOTEM")="" ^VALPAR($I,"OBJET.TOTEM")="?",OBJET="?"
 K ^PAREP($J)
 F II=1:1 S PARA=$O(^[QUI]EXPLICI(OBJET,II,"")) G:PARA="" FEXP D EXP
EXP I PARA["INDIVIDU.ETUDIE" S VR=INDPC
 N VAL,TYPE
 D ^%QSCALVH(BASEL,INDIVIDU,PARA,.VAL,.TYPE)
 S VR=$$^%QCAZG("VAL(1)")
 S:VR'="" ^PAREP($J,PARA)=""
 S ^VALPAR($I,PARA)=$S(VR'="":VR,1:$P(^[QUI]EXPLICI(OBJET,II,PARA),"^",18))
 S ^DON($I,PARA)=II,VV=^[QUI]EXPLICI(OBJET,II,PARA),UN=$P(VV,"^",1)
 S ^POSENR($I,PAGE,LI)=PARA_"^"_UN,^POSFUL($I,PAGE,LI)=PARA
 S LI=LI+1 I LI>LILIM S LI=10,PAGE=PAGE+1
 Q
FEXP S NBP=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1
 D:ECRAN=1 AFF^TORQSID2
SUIT I ECRAN D POSSIB
 I ECRAN S DX=$X+1,DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,99:CTRLH,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1=$$^%QZCHW("-") S PCH=Y1 D TO^%QZNBN1 G SUIT:'(ISNUM),SUIT:Y1=PAGE,SUIT:'($D(^POSENR($I,Y1))) S PAGE=Y1 D EFF^TORQSID2,AFF0^TORQSID2 G SUIT
 G:ECRAN=0 6
1 S %ABEND=1 G END
6 S SUIV="" F J=1:1 S SUIV=$O(^VALPAR($I,SUIV)) Q:SUIV=""  G:(^VALPAR($I,SUIV)="")&(ECRAN=1) IMPOS G:(^VALPAR($I,SUIV)="")&(ECRAN=0) METTREL
 S VALIDENT=OBJET
 F JJ=1:1 S SUIV=$O(^[QUI]EXPLICI(OBJET,JJ,"")) Q:SUIV=""  S VALIDENT=VALIDENT_"/"_^VALPAR($I,SUIV)
 D PA^%QSGESTI(BASEL,INDIVIDU,"IDENTIFIANT.TOTEM",VALIDENT,1)
 S ^TRAITES($J,"IND",INDIVIDU)="" G:ECRAN=1 BIS
 G 1
BIS D CLFEN^%VVIDEO(3,6,1,74),CLFEN^%VVIDEO(33,8,1,11),CLFEN^%VVIDEO(3,10,12,74),POCLEPA^%VVIDEO
 D BLD^%VVIDEO
 S DX=27,DY=12 X XY W $$^%QZCHW("L'identifiant ")_$S(LINK:"",1:"TOTEM ")_$$^%QZCHW("est ")
 D ^%VCRIFLD(VALIDENT,12,14,11,74),NORM^%VVIDEO
 D ^%VZEAVT(""),NORM^%VVIDEO
 G 1
IMPOS D ^%VZEAVT($$^%QZCHW("Les valeurs des parametres explicites sont obligatoires")) G SUIT
99 K ^PREPA($J) S SUIV="" F IN=1:1 S SUIV=$O(@ADLIST@(SUIV)) Q:SUIV=""  S ETOI=$S($D(^TRAITES($J,"IND",SUIV)):"* ",1:"  "),ETOI=ETOI_SUIV,^PREPA($J,ETOI)=""
 S DX=0,DY=9 X XY
 D INIT^%QUCHOIP("^PREPA($J)",1,"",4,10,70,12),AFF^%QUCHOIP S INDIVIDU=$$UN^%QUCHOIP D END^%QUCHOIP S DX=0,DY=9 X XY
 I INDIVIDU'="" S INDIVIDU=$E(INDIVIDU,3,$L(INDIVIDU)) D RES^TORQSEXP,AFF^TORQSID2,MESS^TORQSEXP G RECOM Q
 G SUIT
65 S YA=OBJET,RECOM=0 D ^TORQSPAR G:'(RECOM) SUIT G RECOM
13 
43 G 61
45 S NPAG=PAGE-1 G:'($D(^POSENR($I,NPAG))) SUIT S PAGE=NPAG D EFF^TORQSID2,AFF0^TORQSID2 G SUIT
61 S NPAG=PAGE+1 G:'($D(^POSENR($I,NPAG))) SUIT S PAGE=NPAG D EFF^TORQSID2,AFF0^TORQSID2 G SUIT
POSSIB D POCLEPA^%VVIDEO W $$L25^%SYSLIB2
 Q
END D:ECRAN=1 CLFEN^%VVIDEO(3,6,1,74),CLFEN^%VVIDEO(33,8,1,11),CLFEN^%VVIDEO(3,10,12,74),POCLEPA^%VVIDEO S ^TRAITES($J,"CARD")=^TRAITES($J,"CARD")+1
 K ^DON($I) Q
ENDF Q
METTREL 
 S CARD=CARD+1,^[QUI]ZLIGTOID(NOML,"OBJET",INDIVIDU)=""
 S:'($D(SUIV)) SUIV=""
 D PA^%QSGESTI(BASEL,INDIVIDU,"MESSAGE.ERREUR",$$^%QZCHW("attribut")_":"_SUIV)
 G 1
FIN Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W $$^%QZCHW(" ") D NORM^%VVIDEO Q
FINAL(STOP) 
 S STOP=0 D POCLEPA^%VVIDEO S INT=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous interrompre l'identification ?"),"N") S:(INT=-1)!(INT=1) STOP=1 D:STOP=0 MSG^%VZEATT("Identification en cours...") Q
FINAL2 
 D MSG^%VZEATT("Identification en cours...") Q
EXIS 
 S EXIS=1 S:'($$AIR^%QSGE5(BASEL,INDIVIDU,"NOM")) EXIS=0
 Q
EXIS2 I EXIS=0 D:ECRAN'=0 ^%VZEAVT("Cet individu n'existe pas...") S:ECRAN=0 CARD=CARD+1,^[QUI]ZLIGTOID(NOML,"OBJET",INDIVIDU)="" S ^TRAITES($J,"CARD")=^TRAITES($J,"CARD")+1,^TRAITES($J,"IND",INDIVIDU)=""
 Q
ACT 
 
 I KEEPIDT,$$OKIDT^TORQSID2(BASEL,INDIVIDU) Q
 D TRAIT^TORQSID2,QUT^TORQSID2,ADEXP
 Q
 
DIAL(BASEL,INDIVIDU) 
 N KEEPIDT,ECRAN,PAGE,LI,LILIM,NBTOT,EXISTEL,LINK,L,PREM,NBTC
 K ^TRAITES($J)
 S ^TRAITES($J,"CARD")=1
 S KEEPIDT=0,L="",ECRAN=1,PAGE=1,LI=10,LILIM=19,NBTOT=1,EXISTEL=0,LINK=0
 D BLD^%VVIDEO,^%VZCD(2,38,0,4,1,0,$$^%QZCHW("IDENTIFIANT TOTEM"))
 D DESSIN^TORQSID2
 S PREM=1,PAGE=1,NBTC=0,LI=10,LILIM=19,NBTOT=1,EXISTEL=0,LINK=0
 D NINDIV^TORQSID2
 D ACT
 K ^TRAITES($J),^DON($I)
 Q

