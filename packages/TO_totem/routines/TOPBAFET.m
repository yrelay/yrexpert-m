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

;TOPBAFET^INT^1^59547,74874^0
TOPBAFET ;
ARFAB Q:'($D(B3))  S TRA=$P(%RS(1),"/",1),MONED=$E(%RS(1),$L(TRA)+2,$L(%RS(1))),LDEN=$L(MONED),%DDEP=1 D GETARC,GETREF
 S LIGNE=ARC_" "_TRA_"  "_REF,%CH="  "_B2_"  ",%LGR=70-$L(LIGNE) D ^%QZCHBK S TAD=$S($D(%RS(3)):%RS(3),1:"???"),LIGNE=LIGNE_%CH_TAD D STO Q:STOP=1  S %CH=" ",%LGR=($L(ARC)+$L(TRA))+3 D ^%QZCHBK
 F %GGG=1:1 Q:LDEN'>0  S LIGNE=%CH D GETREF S LIGNE=LIGNE_REF D STO Q:STOP=1
 Q
STO R *ARR:0 D TOUCHE^%INCCLAV(ARR,.ARR) S CONT=1
 I (ARR=1)!(ARR=6) S CONT=0,STOP=1 Q
 Q:'($D(^[QUI]TVPAR(B2)))  S LI=LI+1 I LI>21 S EGAP=EGAP+1,LI=8,DX=0,DY=8 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,"Page : ",EGAP S DX=0,DY=7 X XY
 W !,LIGNE S ^LISTAFF($I,EGAP,LI)=LIGNE
 Q
GETREF S PLDIS=(43-$L(TRA))-2,REF="" F %III=%DDEP:1 S P=$P(MONED,"/",%III),LDEN=(LDEN-$L(P))-1,PLDIS=(PLDIS-$L(P))-1 Q:PLDIS<0  S REF=REF_P_"/" Q:LDEN'>0
 S %DDEP=%III Q
GETARC Q:'($D(^[QUI]TREEWORK(B2)))  S ARC=$P(^[QUI]TREEWORK(B2,0),"^",10) Q

