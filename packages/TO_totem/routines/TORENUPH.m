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

;TORENUPH^INT^1^59547,74875^0
TORENUPH ;
 
 D CADRE
QUES S DX=5,DY=7 X XY W "Pour l'article                  : " S DX=$X D ^%VLEC
 G:(CTRLA=1)!((CTRLF=1)!(Y1="")) END
 S ARTI=Y1
 I '($D(^[QUI]PHASE(ARTI))) D POCLEPA^%VVIDEO W " Pas de phases ! [RETURN] " R *RET:60 D POCLEPA^%VVIDEO G TORENUPH
 D LIST S PAGE=1
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO
 S MSG="Page "_PAGE_"/"_NBPAG,DX=40-($L(MSG)\2),DY=6 X XY W MSG,!
 S LI=-1 F UU=1:1 S LI=$N(^POSENR($I,PAGE,LI)) Q:LI=-1  S RS=^POSENR($I,PAGE,LI) W !,?5,$P(RS,"^",1),?20,$E($P(RS,"^",2),1,28),?50,$E($P(RS,"^",3),1,28)
 
DIAL D POCLEPA^%VVIDEO W "+,-,page,CTRLA Abandon,CTRLF Selection "
 S DX=$X D ^%VLEC
 G FIN:CTRLA=1,SEL:CTRLF=1,DIAL:Y1="",PLUS:(Y1="+")!(Y1="="),MOIN:Y1="-"
 S PCH=Y1 D TO^%QZNBN1 G DIAL:('(ISNUM))!('($D(^POSENR($I,PCH)))) S PAGE=PCH G AFF
PLUS S PAG=PAGE+1 G:'($D(^POSENR($I,PAG))) DIAL S PAGE=PAG G AFF
MOIN S PAG=PAGE-1 G:'($D(^POSENR($I,PAG))) DIAL S PAGE=PAG G AFF
SEL D POCLEPA^%VVIDEO W "Renumerotation depuis : " S DX=$X D ^%VLEC
 G:(CTRLA=1)!(CTRLF=1) FIN
 I Y1="?" D POCLEPA^%VVIDEO W "CTRLA Abandon,RETURN : ",DNUM,"  [RETURN] " R *RET D POCLEPA^%VVIDEO G SEL
 I Y1="" W DNUM S NBEG=DNUM G SEL2
 G:'($D(^TACOMPIL($I,Y1))) SEL S NBEG=Y1
SEL2 W ?40,"Jusqu'a : " S DX=$X D ^%VLEC
 I Y1="?" D POCLEPA^%VVIDEO W "CTRLA Abandon,CTRLF:numero de depart,RETURN : ",FNUM,"  [REURN] " R *RET D POCLEPA^%VVIDEO W "Renumerotation depuis : ",NBEG G SEL2
 G FIN:CTRLA,SEL:CTRLF I Y1="" W FNUM S NEND=FNUM G PAS
 I '($D(^TACOMPIL($I,Y1))) D POCLEPA^%VVIDEO W "Renumerotation depuis : ",NBEG G SEL2
 S NEND=Y1
PAS D POCLEPA^%VVIDEO S ard="O"
 W "Depuis : ",NBEG,"  jusqu'a : ",NEND,"  Increment : "
 S DX=$X D ^%VLEC
 I Y1="?" D ^%VZEAVT("CTRLA Abandon,CTRLF resaisie des valeurs") G PAS
 G FIN:CTRLA,SEL:CTRLF,SEL:Y1=""
 S PCH=Y1 D TO^%QZNBN1
 G:'(ISNUM) PAS S PAS=Y1
 I PAS=0 D ^%VZEAVT("valeur refusee") G PAS
 I ((NBEG+PAS)<0)!((NEND+PAS)<0) D ^%VZEAVT("Refuse ! des numeros de phases deviennent negatifs") G PAS
 
MULTIP 
 D CLEBAS^%VVIDEO S DX=0 X XY
 W "Depuis : ",NBEG,"  jusqu'a : ",NEND,"  Increment : ",PAS," ",NBEG," devient :"
 S DX=$X D ^%VLEC I Y1="?" D ^%VZEAVT("CTRLA Abandon,CTRLF resaisie des valeurs") G MULTIP
 G FIN:CTRLA,SEL:CTRLF,SEL:Y1=""
 S PCH=Y1 D TO^%QZNBN1
 G:'(ISNUM) MULTIP S NVDEB=Y1
 I NVDEB=0 D ^%VZEAVT("valeur refusee") G MULTIP
 I NVDEB<0 D ^%VZEAVT("Refuse ! des numeros de phases deviennent negatifs") G MULTIP
 D RENUM,LIST S PAGE=1 G AFF
 
 
LIST D MSG^%VZEATT("Merci. Patientez un instant") S PH=-1 K ^POSENR($I),^TACOMPIL($I)
PH S PH=$N(^[QUI]PHASE(ARTI,PH)) G:PH=-1 ORD S NUM=-1
NUM S NUM=$N(^[QUI]PHASE(ARTI,PH,NUM)) G:NUM=-1 PH S OP=-1
OP S OP=$N(^[QUI]PHASE(ARTI,PH,NUM,OP)) G:OP=-1 NUM S RS=^[QUI]PHASE(ARTI,PH,NUM,OP),^TACOMPIL($I,NUM,PH,OP)=1_$C(0)_RS_$C(0)_$S($D(^[QUI]FLPHAS(ARTI,PH,NUM,OP)):^[QUI]FLPHAS(ARTI,PH,NUM,OP),1:"")
 G OP
ORD S NUM=-1,PAGE=1,LI=8,FNUM=-1
NUM2 S NUM=$N(^TACOMPIL($I,NUM)) G:NUM=-1 FINI S FNUM=NUM,PH=-1
PH2 S PH=$N(^TACOMPIL($I,NUM,PH)) G:PH=-1 NUM2 S OP=-1
OP2 S OP=$N(^TACOMPIL($I,NUM,PH,OP)) G:OP=-1 PH2
 S ^POSENR($I,PAGE,LI)=NUM_"^"_PH_"^"_OP,LI=LI+1 I LI>21 S LI=8,PAGE=PAGE+1
 G OP2
FINI S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),DNUM=$N(^TACOMPIL($I,-1))
 D OFF^%VZEATT Q
 
FIN G TORENUPH
CADRE D CLEPAG^%VVIDEO S DXG=1,DXD=39,DYB=4,DYH=0,GRAPH=1,MSG="RENUMEROTATION DES PHASES" D TO4^%VZCD Q
 
 
RENUM D POCLEPA^%VVIDEO W "Renumerotation en cours..." S NUM=NBEG-1E-5
 K ^[QUI]PHASE(ARTI),^[QUI]FLPHAS(ARTI)
 S NUM=""
NUM3 S NUM=$O(^TACOMPIL($I,NUM)) G:NUM="" FREN S PH=-1
PH3 S PH=$N(^TACOMPIL($I,NUM,PH)) G:PH=-1 NUM3 S OP=-1
OP3 S OP=$N(^TACOMPIL($I,NUM,PH,OP)) G:OP=-1 PH3
 S NUMNEW=$$NEWNUM
 S RS=$P(^TACOMPIL($I,NUM,PH,OP),$C(0),2),^[QUI]PHASE(ARTI,PH,NUMNEW,OP)=RS
 S RS=$P(^TACOMPIL($I,NUM,PH,OP),$C(0),3) I RS'="" S ^[QUI]FLPHAS(ARTI,PH,NUMNEW,OP)=RS
 G OP3
END K ^TACOMPIL($I),^POSENR($I) Q
FREN Q
 
NEWNUM() I NUM<NBEG Q NUM
 I NUM>NEND Q NUM
 I NUM=NBEG S NEWNUM=NVDEB Q NEWNUM
 S NEWNUM=NEWNUM+PAS Q NEWNUM
 ;
 ;

