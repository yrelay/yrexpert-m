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
;! Nomprog     : TO3DEJFA                                                     !
;! Module      : TO3 (TOTEM Version 3)                                        !
;! But         : Gestion des études déjà faites                               !
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
;! HL002 ! HL     ! 16/07/12 ! Nettoyer la zone d'affichage                   !
;! HL003 ! HL     ! 16/07/12 ! 1 Reetude de l'article -> F(in),(S)uite        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3DEJFA^INT^1^59547,74870^0
TO3DEJFA ;

 D CLETEX^%VVIDEO ;HL002
 
 S:'($D(BATCH)) BATCH=0 S FCONT=1 G:BATCH=1 END Q:IDSTO'["/"  Q:'($D(^[QUI]ANTETUDE(YB)))  Q:$D(^[QUI]USINART(YB))  S REFID=IDSTO,ARTCT=YB,ARTET=YA D ^TO3RETUD G:$L(RRR)>250 END
AFFICH S DX=5,DY=7 X XY S TIT=$$^%QZCHW("Article deja analyse lors des etudes : "),REP=0 D LIST G:REP=0 END
QUES S DX=5,DY=9 X XY W !,?5,$$^%QZCHW("1 Reetude de l'article "),!,?5,$$^%QZCHW("2 Acceptation d'une etude deja faite "),!,?5,$$^%QZCHW("3 Edition ") R OPT:10 S:OPT="" OPT=1 I (OPT'=1)&((OPT'=2)&(OPT'=3)) S DE=7,FI=$Y D ^%ABNETTO G QUES
 G @OPT
1 S FCONT=1,DE=7,FI=12 D ^%ABNETTO G END
2 D ^TO3COPST S FCONT=1,DE=7,FI=12 D ^%ABNETTO G END
3 D ^TO3ETSEE G QUES
LIST S STOP=0,CO=0,LIG=1,TABG="^[QUI]REFANTET("_RRR_")",B2=-1 F TQ=0:0 S B2=$N(@TABG@(B2)) Q:B2=-1  S B3=-1 F TR=0:0 S B3=$N(@TABG@(B2,B3)) Q:B3=-1  I $E(B2,1)=$$^%QZCHW("T") D TRAIT G:STOP=1 SSYY
 I (REP'="F")&(REP'=0),STOP'=1 W "   [RETURN]" R *RET:15 S DE=7,FI=$Y D ^%ABNETTO
SSYY S STOP=0 Q
TRAIT W:REP=0 TIT,! S REP=1 W ?CO,B2 S CO=CO+20,^ETUFAIT($I,B2)=B3 I CO>60 W ! S CO=0,LIG=LIG+1 I LIG>4 S LI=1 D ALORS
 Q
;HL003 ALORS W $$^%QZCHW("F(in),(S)uite ")
ALORS S LIG=0 W $$^%QZCHW("F(in),(S)uite ")
AL1 R *REP:15 D TOUCHE^%INCCLAV(REP,.REP)
 S:REP=-1 REP=$A("F") S REP=$C(REP) G:(REP'="F")&(REP'="S") AL1 I REP="F" S STOP=1,DE=7,FI=$Y D ^%ABNETTO Q
 S DE=8,FI=$Y D ^%ABNETTO S DX=0,DY=5 X XY Q
FIN K ^ETUFAIT($I) Q
END D T1^TOTCADRE K ^ETUFAIT($I),TR,REFID,ARTCT,ARTET,RRR,TIT,REP,OPT,DE,FI,CO,LIG,TABG,B1,B2,TQ,B3,LI Q

