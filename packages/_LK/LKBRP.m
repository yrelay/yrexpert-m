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

;LKBRP^INT^1^59547,74867^0
LKBRP ;
LEC ;;===================================================================
 ;; LECTURE BANDE BARPHONE
 X ^BPH N IND
LEC1 D CLEPAG^%VVIDEO
 S DX=20,DY=12 X XY W "NOM DU CIRCUIT.IMPRIME : " S DX=$X D ^%VLEC
 Q:Y1=""
 I $D(^[QUI]LK("BRP",Y1)) D ^%VZEAVT("CIRCUIT DEJA TRANSFERE, VEUILLER LE SUPPRIMER POUR POURSUIVRE LE TRAITEMENT") G LEC1
 S APP="BRP",DATE=$H
 S ER=$$LIRE^LKPRIM(APP,Y1,DATE,47,"ASCIIST","LEC^LKTXBRP1")
DECRYPT 
 
 
 
 
 X ^BPH D CLEPAG^%VVIDEO
DECR D CLEPAG^%VVIDEO
 S GLO="^[QUI]LK(""BRP"",Y1)"
 S DATE=$ZP(@GLO@(""))
 S ENR="" K ^[QUI]TEMPO("BPH")
LOOP S ENR=$O(@GLO@(DATE,"DATA",1,ENR)) G:ENR="" FIN
 S VAL=@GLO@(DATE,"DATA",1,ENR),VAL2=""
 F I=1:2:$L(VAL) S VAL2=VAL2_$E(VAL,I+1)_$E(VAL,I)
 S ^[QUI]TEMPO("BPH",ENR)=$$CTR(VAL2)
 S DX=38,DY=14 X XY W ENR
 G LOOP
FIN Q
CTR(%LIB) 
 Q:%LIB="" %LIB S %LIB=$$ADR^%QZCHNET(%LIB)
 Q %LIB
 ;;
 ;;====================================================================
RECUP ;; recuperation de la syntaxe de la CAO
 ;; ce traitement peut etre long !!!!
 D ^LKBRP2,^LKBRP3,^LKBRP4
 Q
 ;;
 ;;===================================================================
PREPRQS ;; preparation pour ecrire dans DKBMS pour les composants
 ;;
 
 N ERR,X,SEL,TEMP,APP,DATE,CIRCUIT
 D CLEPAG^%VVIDEO
 S APP="BARPHONE"
 I $D(^[QUI]RQSDON("LKBRP","ENTITE")) S CIRCUIT=^[QUI]RQSDON("LKBRP","ENTITE"),H=^[QUI]RQSDON("LKBRP","DATE") G T2
 S DX=10,DY=6 X XY W "nom du circuit.imprime : " S DX=$X D ^%VLEC
 Q:Y1=""  Q:CTRLA
 S CIRCUIT=Y1,^[QUI]RQSDON("LKBRP","ENTITE")=Y1
PREP0 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 K @(TEMP)
 
 D ^LKLSEL(APP,"COMP",SEL)
 D T
 K @(TEMP)
 Q
T N I,SDE,H S SDE=$O(@SEL@(""))
 F I=0:0 Q:SDE=""  D T1 S SDE=$O(@SEL@(SDE))
 Q
T1 S H=@SEL@(SDE)
 
T2 
 S ER=$$^LKLO(APP,"COMP",H,APP,CIRCUIT,H,"LOST","ELC^LKTXBRP1","","",1)
 Q
 ;;
 ;;====================================================================
ECRRQS 
 
 
 N CIRCUIT,DATE
 D CLEPAG^%VVIDEO
 I $D(^[QUI]RQSDON("LKBRP","ENTITE")) S CIRCUIT=^[QUI]RQSDON("LKBRP","ENTITE") G ECR0
 S DX=10,DY=6 X XY W "nom du circuit.imprime : " S DX=$X D ^%VLEC
 Q:Y1=""  Q:CTRLA
 S CIRCUIT=Y1,^[QUI]RQSDON("LKBRP","ENTITE")=Y1
 
ECR0 D POCLEPA^%VVIDEO
 
 S DATE=^[QUI]RQSDON("LKBRP","DATE")
 S ER=$$^LKRQS("BARPHONE",CIRCUIT,DATE,DATE,"BRPRQS","ELC2^LKTXBRP1","","")
 Q
 ;;
 ;;====================================================================
ECRGEOM 
 ;; doit etre execute apres le module RECUP
 D CLEPAG^%VVIDEO,^%VZCDB("passerelle graphique : PHASE 1",0)
 N X1,Y1,X2,Y2,OB,GEOM,CPT,SX1,SX2,SY1,SY2,NBR
 S GLO="^[QUI]LK(""BARPHONE"",""GEOM"")"
 S GEOM="",OB="",NBR=0
LOOP1 S GEOM=$$NEXT(GEOM)
 Q:GEOM=""
 S NBR=NBR+1,OB=$$ZSUBST^%QZCHSUB(GEOM,"_",".")
 
 K ^[QUI]GRAPHE2(OB,OB)
 S ^[QUI]GRAPHE2(OB,OB)=0
 S ^[QUI]GRAPHE2(OB,OB,0,"MESURE")=1000
 S ^[QUI]GRAPHE2(OB,OB,0,"XO")=2000
 S ^[QUI]GRAPHE2(OB,OB,0,"YO")=1500
 
 S DX=30,DY=10 X XY W "nombre de geometries : ",NBR
 S CPT=1
 S X1=@GLO@(GEOM,"POINT",CPT,"X"),X0=X1
 S Y1=@GLO@(GEOM,"POINT",CPT,"Y"),Y0=Y1
LOOP2 S CPT=$$NEXT2(GEOM,CPT)
 I CPT="" G LOOP1
 S X2=@GLO@(GEOM,"POINT",CPT,"X")
 S Y2=@GLO@(GEOM,"POINT",CPT,"Y")
 
 S SX1=(((X1/254E-2)/635E-5)*20)\1
 S SY1=(((Y1/254E-2)/635E-5)*20)\1
 S SX2=(((X2/254E-2)/635E-5)*20)\1
 S SY2=(((Y2/254E-2)/635E-5)*20)\1
 
 
 S ^[QUI]GRAPHE2(OB,OB,CPT-1)="5^"_SX1_"^"_SY1_"^"_SX2_"^"_SY2_"^F^^^"
 S ^[QUI]GRAPHE2(OB,OB)=^[QUI]GRAPHE2(OB,OB)+1
 S X1=X2,Y1=Y2
 G LOOP2
FLOOP2 
 S SX1=((X1/254E-2)\635E-5)*20
 S SY1=((Y1/254E-2)\635E-5)*20
 S SX2=((X0/254E-2)\635E-5)*20
 S SY2=((Y0/254E-2)\635E-5)*20
 W !,"( ",SX1," , ",SY1," )","         ","( ",SX2," , ",SY2," )"
 
 S ^[QUI]GRAPHE2(OB,OB,CPT)="5^"_SX1_"^"_SY1_"^"_SX2_"^"_SY2_"^F^^^"
 S ^[QUI]GRAPHE2(OB,OB)=^[QUI]GRAPHE2(OB,OB)+1
 G LOOP1
NEXT(G) 
 S G=$O(@GLO@(G))
 Q G
NEXT2(G,N) 
 S N=$O(@GLO@(G,"POINT",N))
 Q N

