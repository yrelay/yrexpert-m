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

;%PBIMHLP^INT^1^59547,73873^0
PTIHELP ;
 N A,CHOI,DX,DXD,DXG,DYB,DYH,DY,%FIN,I,POS,REP,%STOP,TP,WX,WY
 D ^%PBPZALF,^%PBPZOFG,NORM^%VVIDEO S WX=$X,WY=$Y D CLEPAG^%VVIDEO S DX=0 F DY=0:1:4 X XY D CAG^%VVIDEO
 S DXG=0,DXD=30,DYH=0,DYB=4 D ^%AB3CADR S DX=2,DY=2 X XY W "FONCTIONS GRAPHIQUES"
 S DX=15,DY=5,%STOP=0,%FIN=0,DX=$X-1 X XY W " ",! F I=1:1 S A=$T(FUN+I) Q:A=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6),CHOI=$P(A,";;",2) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
 I %STOP=0 S %FIN=1 D ALORS
FIN D CLEPAG^%VVIDEO,^%PBPZONG Q
ALORS D POCLEPA^%VVIDEO I %FIN=1 W "Fin de liste. [RETURN] pour continuer " R *REP S %STOP=1 Q
 W "[RETURN] pour continuer,(CTRLA) pour abandonner " R *REP S:REP=1 %STOP=1 S DX=0,DY=6 D CLEBAS^%VVIDEO
FUN ;;
 ;;
 ;; ------- Trace d'un point
 ;;         Syntaxe : P
 ;;
 ;; ------- Trace d'une droite
 ;;         Syntaxes : (Pd;Pa)
 ;;                    (Longueur/Theta;Pd;Pa)
 ;;                    Pd=pt de depart, Pa=pt d'arrivee
 ;;
 ;; ------- Trace d'un arc de cercle
 ;;         Syntaxes : (Pd;Pa;Pc)
 ;;                    (Pd;Pa/R=RAYON;Pc)
 ;;                    (Pc;Pd/A=ALPHA;Pa)
 ;;                    Pc=centre, Pd=pt de depart, Pa=pt d'arrivee
 ;;
 ;;
 ;; ------- Trace d'un cercle
 ;;         Syntaxes : (Pc;Pp)
 ;;                    (Pc/Rayon)
 ;;                    (Pc/Rayon;Pp)
 ;;                    Pc=centre, Pp=pt peripherique
 ;;
 ;; ------- Trace d'une ellipse
 ;;         Syntaxes : (Pd;Po/R2)
 ;;                    (Pc/R1/R2/Inclinaison)
 ;;                    Pd=pt depart, Po=pt oppose, Pc=centre
 ;;                    R1=1er rayon, R2=2eme rayon
 ;;
 ;; ------  Trace d'une demi-ellipse
 ;;         Syntaxes : (Pd;Po/R2)
 ;;                    (Pc/R1/R2)
 ;;                    Pd=pt depart, Po=pt oppose, Pc=centre
 ;;                    R1=1er rayon, R2=2eme rayon
 ;

