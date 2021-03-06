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
;! HL002 ! HL     ! 26/08/12 ! Pour acceder a ^["YXP"] -> creer $ZDIRECTORY   !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABPRESA^INT^1^59547,73864^0
%ABPRESA ;
 
 K ^TACOMPIL($I) D CLEPAG^%VVIDEO,CUROF^%VVIDEO S DX=0 F DY=0:1:4 X XY D CAG^%VVIDEO
 S DXG=0,DXD=38,DYH=0,DYB=4 D ^%AB3CADR
 S DX=0,DY=10 X XY W "Liste a partir de : " S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) END S YC=$S(Y1="":-1,1:$E(Y1,1,$L(Y1)-1)_$C($A($E(Y1,$L(Y1)))-1)_"z")
 S DX=0,DY=10 D CLEBAS^%VVIDEO
 K ^POSENR($I),^TACOMPIL($I) S STOP=0,LB=20,LH=6,DX=66,DY=LB+2,PAGE=1 X XY W "Page : ",PAGE S LI=LH,POSY=LH
LISTE S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI,I=1,QU=QUI,Y1=YC F UU=0:0 S Y1=$N(^[QU]SCRC(Y1)) Q:Y1=-1  D TRAIT G:STOP=1 FIN
 ;HL002 I QUI'=QUCOM S QU=QUCOM,Y1=YC F UU=0:0 S Y1=$N(^[QU]SCRC(Y1)) Q:Y1=-1  D TRAIT Q:STOP=1
 I QUI'=QUCOM S QU=QUCOM,Y1=YC F UU=0:0 S ZDOK=$$ZDIRECTORY^%GTM(QU) S Y1=$N(^[QU]SCRC(Y1)) S ZDOK=$$ZDIRECTORY^%GTM(QUI) Q:Y1=-1  D TRAIT Q:STOP=1
FIN S NBPAG=PAGE D ^%ABCPGPA,@PROGTRA Q
TRAIT Q:'($D(^[QU]PRONUM(Y1)))
 S NORM=-1 F VV=0:0 Q:STOP=1  S NORM=$N(^[QU]PRONUM(Y1,NORM)) Q:NORM=-1  S IDENT=-1 F WW=0:0 S IDENT=$N(^[QU]PRONUM(Y1,NORM,IDENT)) Q:IDENT=-1  S NOMG=Y1,TYPGR=$S(QU=QUI:"(P)",1:"(C)") D GTNORM,^%ABCPGBD Q:STOP=1
END Q
GTNORM I $D(^[QUI]PRONUM(Y1,NORM,IDENT))=1 S TYPNORM=$P(^[QU]PRONUM(Y1,NORM,IDENT),"^",15) G END
 S OSTOP=STOP,NOMTAB="^[QU]PRONUM(Y1,NORM,IDENT",ADR="TYPN^%ABPRESA" D ^%VTENR S STOP=OSTOP G END
TYPN S TYPNORM=$S($D(%RS(15)):%RS(15),1:"") K %RS S STOP=1 G END

