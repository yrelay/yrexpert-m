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

;TOAFFPH^INT^1^59547,74871^0
TOAFFPH ;
 
 D CADRE
QUES S DX=5,DY=7 D CLEBAS^%VVIDEO W $$^%QZCHW("Pour l'article                  : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) END D LEX I CONCUR'=1 D ^%VSQUEAK G QUES
 X XY W PCHCOMP S ARTI=PCHCOMP I '($D(^[QUI]PHASE(ARTI))) D POCLEPA^%VVIDEO W $$^%QZCHW(" Pas de phases ! [RETURN] ") R *RET:60 D POCLEPA^%VVIDEO G TOAFFPH
 W PCHCOMP D LIST S PAGE=1 D AFF G DIAL
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG,DX=40-($L(MSG)\2),DY=6 X XY W MSG,! S LI=-1 F UU=1:1 S LI=$N(^POSENR($I,PAGE,LI)) Q:LI=-1  S RS=^POSENR($I,PAGE,LI) W !,?5,$P(RS,"^",1),?20,$E($P(RS,"^",2),1,28),?50,$E($P(RS,"^",3),1,28)
 Q
DIAL D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux phases") S DX=$X D ^%VLEC G FIN:CTRLA=1,SEL:CTRLE=1,DIAL:Y1="",PLUS:(Y1="+")!(Y1="="),MOIN:Y1="-" S PCH=Y1 D TO^%QZNBN1 G DIAL:('(ISNUM))!('($D(^POSENR($I,PCH)))) S PAGE=PCH D AFF G DIAL
PLUS S PAG=PAGE+1 G:'($D(^POSENR($I,PAG))) DIAL S PAGE=PAG D AFF G DIAL
MOIN S PAG=PAGE-1 G:'($D(^POSENR($I,PAG))) DIAL S PAGE=PAG D AFF G DIAL
SEL D ^TOTRPH G DIAL
LIST D POCLEPA^%VVIDEO W $$^%QZCHW("Merci. Patientez un instant...") S PH=-1 K ^POSENR($I),^TACOMPIL($I)
PH S PH=$N(^[QUI]PHASE(ARTI,PH)) G:PH=-1 ORD S NUM=-1
NUM S NUM=$N(^[QUI]PHASE(ARTI,PH,NUM)) G:NUM=-1 PH S OP=-1
OP S OP=$N(^[QUI]PHASE(ARTI,PH,NUM,OP)) G:OP=-1 NUM S RS=^[QUI]PHASE(ARTI,PH,NUM,OP),^TACOMPIL($I,NUM,PH,OP)=1 G OP
ORD S NUM=-1,PAGE=1,LI=8,FNUM=-1
NUM2 S NUM=$N(^TACOMPIL($I,NUM)) G:NUM=-1 FINI S FNUM=NUM,PH=-1
PH2 S PH=$N(^TACOMPIL($I,NUM,PH)) G:PH=-1 NUM2 S OP=-1
OP2 S OP=$N(^TACOMPIL($I,NUM,PH,OP)) G:OP=-1 PH2
 S ^POSENR($I,PAGE,LI)=NUM_"^"_PH_"^"_OP,LI=LI+1 I LI>21 S LI=8,PAGE=PAGE+1
 G OP2
FINI S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),DNUM=$N(^TACOMPIL($I,-1)) Q
FIN G TOAFFPH
CADRE D CLEPAG^%VVIDEO S DXG=1,DXD=39,DYB=4,DYH=0,GRAPH=1,MSG=$$^%QZCHW("PHASES") D TO4^%VZCD Q
END K ^TACOMPIL($I),^POSENR($I) Q
FREN Q
LEX S PARA=Y1 D ^%QZCHBT S PCH=$S($E(PARA,$L(PARA))="*":$E(PARA,1,$L(PARA)-1),1:PARA) D ^%LXABR
 Q

