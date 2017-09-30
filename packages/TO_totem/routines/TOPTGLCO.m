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

;TOPTGLCO^INT^1^59547,74874^0
TOPTGLCO ;
 K ^COURBE($I),^RGRDATA($I) Q:'(^TOZE($I,"GRAPH"))
 D CLEPAG^%VVIDEO S DX=20,DY=3 D REV^%VVIDEO X XY W "DESCRIPTION DU GLOBAL" D NORM^%VVIDEO
QU S DX=0,DY=8 D CLEBAS^%VVIDEO W "Nom du global : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" QU S NOMTREE=Y1 I '($D(@NOMTREE)) D ^%VSQUEAK W "   ???" G QU
 S NGLO=NOMTREE,DEBCLE="" I $E(NOMTREE,$L(NOMTREE))=")" S NOMTREE=$E(NOMTREE,1,$L(NOMTREE)-1),NGLO=$P(NOMTREE,"(",1)_"(",DEBCLE=$E(NOMTREE,$L(NGLO)+1,500)_","
 F M="abscisses","ordonnees" S DY=DY+1 D QU1 G:CTRLA!CTRLF FIN
 S DX=0,DY=DY+1 X XY W "Type de separateur : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN S %TS=$S(Y1="":"^",1:Y1)
QU3 S DX=0,DY=DY+1 X XY W "Nom de cette courbe : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" QU3 S %9NAMCOU=Y1
QU4 S DX=0,DY=DY+1 X XY W "Unite des X : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" QU4 S %9UX=Y1
QU5 S DX=0,DY=DY+1 X XY W "Unite des Y : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" QU4 S %9UY=Y1
 S DX=0,DY=6 D CLEBAS^%VVIDEO W "Un instant..." D ZD^%QMDATE4 S NAME="COURBE",DATE=%DAT,%9NUM=1 D ^TOPTMEN2,^TOPTPCOU S %PROGET="^"_%PROGET D @%PROGET
FIN K ^COURBE($I),NOMTREE,ADR,M,CTRLA,CTRLF,TR,PCH,ISNUM,TP,%TPX,%TPY,%TS,%9UX,%9UY,%PROGET Q
QU1 S DX=0 D CLEBAS^%VVIDEO W "Les ",M," sont-elles des cles (O/N) : " R *TR D TOUCHE^%INCCLAV(TR,.TR)
 I (TR=1)!(TR=6) S CTRLA=1,CTRLF=1 Q
 S TR=$C(TR) G:(TR'="O")&(TR'="N") QU1 S TR=$S(TR="O":"C",1:"R")
QU2 S DX=45 X XY W "Position des ",M," : " S DX=$X D ^%VLEC I CTRLA!CTRLF Q
 G:Y1="" QU2 S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) QU2 S TP=$S(M="abscisses":"%TPX",1:"%TPY"),@TP=TR_PCH Q

