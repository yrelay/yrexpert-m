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

;TO3MODRE^INT^1^59547,74870^0
TO3MODRE ;
 
 D ^%AB3STAR S NIV=2,$ZT="",C1=$$^%QZCHW("IMPRIMANTE"),C2=$$^%QZCHW("ECRAN"),IMPR=^TABIDENT(WHOIS,"PRINTER")
 D CLEPAG^%VVIDEO I '($D(^[QUI]PHAS(NUFA))) S %DIM=0 G QU
 S DX=0,DY=8 X XY W !,!,?20,$$^%QZCHW("1 Gamme avec temps et couts"),!,?20,$$^%QZCHW("2 Gamme avec dimensions a l'outil"),!,!,?20,$$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'=1)&(REP'=2) QU S %DIM=$S(REP=1:0,1:1) D CLEPAG^%VVIDEO
QU 
 S REP=$$^%QZCHW("E") I $E(REP,1)=$$^%QZCHW("I") S DEV="IMPR",LILIM=55 O IMPR U IMPR W *-1,*23,#
 E  S DEV="ECR",LILIM=17 D CLEPAG^%VVIDEO
EDITION S ANUFA=NUFA,NUM=-1 S:'($D(OSFA)) OSFA=NUFA
 D EDIT G END
 S NUFA=ANUFA G END
EDIT W ?20,$$^%QZCHW("MODIFICATION DE L'ETUDE NUMERO : "),NUFA,!,!,! H 2
 S %ABAND=0,DURTOT=0,PRITOT=0,PRIMATOT=0,NUC=1,ADR="TRAIT^TO3MODRE",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1 G FIN
TRAIT H:DEV="IMPR" 15 D ^TO3GREF S DATACOUR=@NOM,YA=$P(DATACOUR,"^",1),YB=$P(DATACOUR,"^",2),TOID=$P(DATACOUR,"^",4),QTEART=$P(DATACOUR,"^",3),QTEMAT=$P(DATACOUR,"^",5),SFMAT=$P(DATACOUR,"^",6) D ^TO3MODPA,^TO3MODPH
 G FIN
END I DEV="IMPR" W # C:IMPR'=0 IMPR
FIN Q

