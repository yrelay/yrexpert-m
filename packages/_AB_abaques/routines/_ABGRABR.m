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

;%ABGRABR^INT^1^59547,73864^0
%ABGRABR ;
 
 K ^TABGRI($I)
 D CLEPAG^%VVIDEO
 S PCH=NOMG,%FGRI=0,DXG=1,DXD=39,DYB=4,DYH=0,TIT=$$^%QZCHW("Abaques reconnues") D ^%AB3CADR
 
BEG 
 S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=(40-($L(PCH)+4))\4 X XY D CAG^%VVIDEO W "* ",PCH," *"
 W !,!,!,?20,$$^%QZCHW("Un instant...") D ^%LXABREV
 S HA=0,DX=0,DY=7 X XY D CLEBAS^%VVIDEO X XY S PAR=-1,NB=1,NUGR=1
 F UU=0:0 S PAR=$N(^ABRLEX($I,PAR)),S=-1 Q:PAR=-1  I $D(^[QU]STRUCT(PAR)) D ECRI K ^ABRLEX($I,PAR) S NB=NB+1 D NORM^%VVIDEO D:NB>10 STOP Q:HA=1
 I HA'=1,'($D(^TABGRI($I))) D POCLEPA^%VVIDEO W $S($D(^ABRLEX($I)):$$^%QZCHW("Abaque inconnue !"),1:$$^%QZCHW("Inconnu au lexique! (A)cces au Lexique/Autre caractere:Abandon")) R *REP G:$D(^ABRLEX($I)) FIN S REP=$C(REP) G:REP'=$$^%QZCHW("A") FIN G LEXIQ
 I HA'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper le numero choisi (FIN de liste) ") D STOPS
 S DX=0,DY=6 D CLEBAS^%VVIDEO
FIN Q
ECRI D:$D(^[QUI]TOLEX(PAR)) BLD^%VVIDEO W !,?20,NUGR,?25,PAR S:'($D(^[QUI]TOLEX(PAR))) S=$N(^[QUI]TOSYNONY(PAR,S)) S:$D(^[QU]STRUCT(S)) ^TABGRI($I,NUGR)=S,NUGR=NUGR+1 D BLD^%VVIDEO W:S'=-1 " (",S,")"
 S:$D(^[QUI]TOLEX(PAR)) ^TABGRI($I,NUGR)=PAR,NUGR=NUGR+1
 G FIN
STOP D POCLEPA^%VVIDEO W $$L23^%QSLIB2("Frapper le numero choisi, (S)uite ")
STOPS S DX=$X D ^%VLEC
 I (CTRLA=1)!((CTRLF=1)!(Y1="")) S HA=1,NB=1,DX=0,DY=7 D CLEBAS^%VVIDEO X XY Q
 Q:Y1="S"
 G:'($D(^TABGRI($I,Y1))) STOP
 S HA=1,NOMG=^TABGRI($I,Y1),%FGRI=1
 Q
LEXIQ D ^%LXAJMOD,CLEPAG^%VVIDEO G FIN

