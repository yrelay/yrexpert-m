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

;%QSTSGN1^INT^1^59547,73883^0
%QSTSGN1 ;;12:03 PM  21 May 1992;
 
QSGEO N NPOLY,MPOLY,NESP,NPO,MESP,NQ,NT
 S NPOLY=1000
 S MPOLY=100
 S NESP=1000
 S MESP=1
 S NPO=5442
 D BQS(NPO)
 D QSPOLY(NPOLY,MPOLY)
 D QSESP(NESP,MESP)
 D LIENPOFI,LIENPOES
 Q
 
QSPOLY(N,M) 
 
 
 
 
 
 
 
 
 
 
 
 I N<1 Q
 F I=M:1:(N+M)-1 S NOMPOLY="POLY."_I,NBRESOM=$R(10)+1,TAILLE=$R(20)+1,NBRFIG=$R(4) D CREPOLY S NQ=0,NT=0 F J=1:1:NBRFIG S PAR=$R(4)+1,NOMFIG=$S(PAR=1:"TRIANGLE",1:"QUADRILATERE") D NOMFIG S NBRECOT=$S(PAR=1:3,1:4) D CREFIG
 Q
 
NOMFIG 
 I NOMFIG="QUADRILATERE" S NQ=NQ+1,NOMFIG=NOMFIG_"."_NQ Q
 
 S NT=NT+1,NOMFIG=NOMFIG_"."_NT
 Q
CREPOLY 
 D PA^%QSGESTI("POLY",NOMPOLY,"NOM",NOMPOLY,1)
 D PA^%QSGESTI("POLY",NOMPOLY,"NOMBRE.SOMMETS",NBRESOM,1)
 D PA^%QSGESTI("POLY",NOMPOLY,"TAILLE",TAILLE,1)
 Q
CREFIG 
 D PA^%QSGESTI("FIGU",NOMPOLY_","_NOMFIG,"NOM",NOMFIG,1)
 D PA^%QSGESTI("FIGU",NOMPOLY_","_NOMFIG,"NOMBRE.COTES",NBRECOT,1)
 D ADDO^%QSGEST3("POLY",NOMPOLY,J,"FACE","FIGU",NOMFIG)
 Q
 
QSESP(N,M) 
 
 
 
 
 I N<1 Q
 F I=M:1:(N+M)-1 S NOMESP="ESP."_I,%R=$R(2),METR=$S(%R=0:"EUCLIDIENNE",%R=1:"FRIEDMAN"),DIM=$R(4)+1 D CREESP
 Q
CREESP 
 D PA^%QSGESTI("ESPA",NOMESP,"NOM",NOMESP,1)
 D PA^%QSGESTI("ESPA",NOMESP,"METRIQUE",METR,1)
 D PA^%QSGESTI("ESPA",NOMESP,"DIMENSION",DIM,1)
 Q
LIENPOFI 
 
 S FIG="" F I=1:1 S FIG=$O(^[QUI]QUERYV("FIGU",FIG)) Q:FIG=""  S NBREPO=4 S:FIG["TRIANGLE" NBREPO=3 F K=1:1:NBREPO D CHOIX1
 Q
 
CHOIX1 S %R=$R(NPO)+1
 S POINT="" F J=1:1:%R S POINT=$O(^[QUI]QUERYV("POINT",POINT))
 D ADD^%QSGEST3("POINT",POINT,POINT,"SOMMET.DE","FIGU",FIG,FIG)
 Q
LIENPOES 
 
 S POLY="" F I=1:1 S POLY=$O(^[QUI]QUERYV("POLY",POLY)) Q:POLY=""  S NBREES=$R(2)+1 F K=1:1:NBREES D CHOIX2
 Q
 
CHOIX2 S %R=$R(NESP)+MESP
 S ESPACE="" F J=1:1:%R S ESPACE=$O(^[QUI]QUERYV("ESPA",ESPACE))
 D ADD^%QSGEST3("POLY",POLY,POLY,"ESPACE.DE","ESPA",ESPACE,ESPACE)
 Q
 
BQS(N) 
 
 
 
 
 
 
 
 S DX=0,DY=0 X XY D CLEPAG^%VVIDEO
 D NORM^%VVIDEO
 S SCR="ZSYNONY",ABENDSCR=0,NOMTAB="^[QUI]ZSYNONY",RESUL(1)="COORDONNEES"
 S BORNE=N-441 F NUM=1:1:BORNE D TRAIT
 S:N<442 NOM=0 D ENTIER
 Q
TRAIT S ABS=($R(201)-100)/10,ORD=($R(201)-100)/10
TRAIT1 S NOM="P"_$E("000",1,4-$L(NUM))_NUM,P=$R(101),COUL=$S(P<5:"JAUNE",P<15:"",P<25:"BLANC",P<40:"BLEU",P<65:"ROUGE",P<101:"RVB")
 D PA^%QSGESTI("POINT",NOM,"ABSCISSE",ABS,1)
 D PA^%QSGESTI("POINT",NOM,"ORDONNEE",ORD,1)
 D PA^%QSGESTI("POINT",NOM,"NOM",NOM,1)
 D:COUL'="" PA^%QSGESTI("POINT",NOM,"COULEUR",COUL,1)
 S RESUL(2)=NOM,RESUL(3)="("_ABS_","_ORD_")"
 Q
ENTIER S ABS=-11
 F JJ=1:1:21 S ABS=ABS+1,ORD=-11 F JJJ=1:1:21 S ORD=ORD+1,NUM=NUM+1 D TRAIT1
 Q

