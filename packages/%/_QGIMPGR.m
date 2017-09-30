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

;%QGIMPGR^INT^1^59547,73876^0
GRIMPGRO ;
 
 S DY1=$Y I '($D(^PAD($J,PAD,DY1))) D ^%VSQUEAK G END2
 S GROIMP=^PAD($J,PAD,DY1) D ZD^%QMDATE4,^%QMDAHEU K LGMAX,^AFFPAG($J)
AA S STR="@E#cran ou @I#mprimante ?" D ^%QGOPTIO R *X G:($C(X)'="E")&($C(X)'="I") END1 S OPTION=$C(X),NBML=$S(OPTION="E":21,'($D(^TABIDENT(WHOIS,"IMPRCOUR"))):60,1:^TABIDENT(WHOIS,"IMPRCOUR"))
 D POCLEPA^%VVIDEO,BLK^%VVIDEO W "Un instant..." D NORM^%VVIDEO
 S %TABCH="@GROUPE@(1,GROIMP,""OBJET"")" D ^%QGLGIND S LGMAX0=%LGMAX
 S L=$L(%NIND) S:L>LGMAX0 LGMAX0=L
 S NBAT=0 F I=1:1:5 I $P(^[QUI]GRATT(NUFA),"^",I)'="" S NBAT=NBAT+1
 S OBJ=-1 F I=1:1:NBAT S LGMAX(I)=$L(^ATTR($J,"O",I))
LOOP1 S OBJ=$N(@GROUPE@(1,GROIMP,"OBJET",OBJ)) G:OBJ=-1 FL1 F I=1:1:NBAT S VALAT=$$PI^%QGCALVA(OBJ,^ATTR($J,"O",I)) I $L(VALAT)>LGMAX(I) S LGMAX(I)=$L(VALAT)
FL1 S LGTOT=LGMAX0 F I=1:1:NBAT S LGTOT=(LGTOT+LGMAX(I))+3
 S NBCOL=$S(LGTOT<81:80,LGTOT<133:132,1:LGTOT) G:NBCOL>132 IMPR
 
 S NBL=80 D BLANC S LIGBL=BLANC
 D ENTET1,ENTET2 S EGAP=0 D PAGE1
 
 S ^AFFPAG($J,EGAP,LIGN)="NOMBRE "_%NINDS_": "_@GROUPE@(1,GROIMP,"CARD"),LIGN=LIGN+1
 S:^ATTR($J,"O",6)'="" ^AFFPAG($J,EGAP,LIGN)="somme "_^ATTR($J,"O",6)_": "_^GRV($J,GROIMP,"SOMME.DES."_^ATTR($J,"O",6)),LIGN=LIGN+1 D LB
 
 S ^AFFPAG($J,EGAP,LIGN)=ENTET2,LIGN=LIGN+1 D LB
 S OBJ=-1
LOOP2 S OBJ=$N(@GROUPE@(1,GROIMP,"OBJET",OBJ)) G:OBJ=-1 IMPR D:LIGN=NBML PAGE2 D LIGNE2 G LOOP2
LIGNE2 S A=OBJ,LONG=LGMAX0+3,NBL=LONG-$L(A) D BLANC S A=A_BLANC
 F K=1:1:NBAT S A=A_$$PI^%QGCALVA(OBJ,^ATTR($J,"O",K)),LONG=(LONG+LGMAX(K))+3,NBL=LONG-$L(A) D BLANC S A=A_BLANC,^AFFPAG($J,EGAP,LIGN)=A
 S LIGN=LIGN+1 Q
PAGE1 S EGAP=EGAP+1,^AFFPAG($J,EGAP,1)=ENTET1 F LIGN=2:1:3 D LB
 Q
PAGE2 S EGAP=EGAP+1,^AFFPAG($J,EGAP,1)=ENTET1,^AFFPAG($J,EGAP,4)=ENTET2 F LIGN=2,3,5 D LB
 Q
LB S ^AFFPAG($J,EGAP,LIGN)=LIGBL,LIGN=LIGN+1 Q
ENTET2 S ENTET2=%NIND_" ",LONG=LGMAX0+3,NBL=LONG-$L(ENTET2) D BLANC S ENTET2=ENTET2_BLANC F IA=1:1:NBAT S ENTET2=ENTET2_^ATTR($J,"O",IA),LONG=(LONG+LGMAX(IA))+3,NBL=LONG-$L(ENTET2) D BLANC S ENTET2=ENTET2_BLANC
 Q
ENTET1 S ENTET1="***   "_%NGRO_": "_GROIMP_"         le "_%DAT_" a "_HEURE_"   ***" Q
BLANC S BLANC="" F I=1:1:NBL S BLANC=BLANC_" "
 Q
IMPR F P=1:1:EGAP S ^AFFPAG($J,P,1)=^AFFPAG($J,P,1)_"  (p "_P_"/"_EGAP_")"
 I LGTOT>132 D ^%VSQUEAK,POCLEPA^%VVIDEO W "desole, cette impression necessite plus de 132 colonnes..." H 2 G END1
 I OPTION="E" D 132^%VVIDEO,^%QGOPAGI,80^%VVIDEO,ENTETE^%QGECRAN,AFFGD^%QGECRAN S RETOUR=1 Q
 S IMPR=^TABIDENT(WHOIS,"PRINTER"),NBCOL=$S(LGTOT<81:80,1:132),STR="Impression @[RETURN]# " D ^%QGOPTIO R *RET O IMPR U IMPR
 F P=1:1:EGAP W # D IMPA
 C IMPR U 0 G END1
IMPA F L=1:1 Q:'($D(^AFFPAG($J,P,L)))  W ^AFFPAG($J,P,L),!
 Q
END2 S RETOUR=2 Q
END1 S RETOUR=1 Q
END0 S RETOUR=0 Q

