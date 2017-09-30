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

;TOMATOEV^INT^1^59547,74873^0
TOMATOEV ;
 
 Q:'($D(^[QUI]ORDEVAL(NUFA,TWREF,"MAT")))  Q:^TOZE(DOLARI,$$^%QZCHW("MATIERE"))=0
 S %DEC=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2),CTRLA=0,CTRLF=0
 D:DEV="ECR" CLEPAG^%VVIDEO W:DEV'="ECR" # D ENTET,EDIT
 Q:(CTRLF=1)!(CTRLA=1)
 W !,LSTAR W:DEV="IMPR" !,!,! I DEV="ECR" S DX=1,DY=24 X XY W $$^%QZCHW("entrer RETURN pour continuer.") R FR
 Q
EDIT S NT=-1,LI=0,STP=0
 S %TAB="^[QUI]ORDEVAL(NUFA,TWREF,""MAT"")",%1=-1 F %2=1:1 S %1=$N(@%TAB@(%1)) Q:%1=-1  D AF Q:STP=1  S %11=-1 F %21=1:1 S %11=$N(@%TAB@(%1,%11)) Q:%11=-1  D AF2 Q:STP=1
 Q
U S U="^[QUI]UNITE(YA,NT)" I $D(@U) S %CH=@U,%LGR=5 D ^%QZCHBK W ?72,%CH K %CH,%LGR
 Q
AF S %13=$P(@%TAB@(%1),"^",1) I (%13'["$ARG")&((%13'["%ARG")&(%13'["%VAL")) S RESULT=@%TAB@(%1),XXD=3 D AFF
 Q
AF2 S %13=$P(@%TAB@(%1,%11),"^",1) I (%13'["$ARG")&((%13'["%ARG")&(%13'["%VAL")) S RESULT=@%TAB@(%1,%11),XXD=6 D AFF
 Q
AFF S NT=$P(RESULT,"^",1),VL=$P(RESULT,"^",3)
 W !,"|",?XXD,NT,?47," = " D V W VL,?67 D U W ?79,"|" I (DEV="IMPR")&((LI#3)=0) H 2
 S LI=LI+1 I LI>LILIM D SUIT
 Q
V S PCH=VL D TO^%QZNBN1 I ISNUM=1 S VL=$J(VL,20,%DEC) Q
 S %CH=VL,%LGR=20 D ^%QZCHBK S VL=%CH K %CH,%LGR Q
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$L16^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STP=1 S:RET=6 CTRLF=1,STP=1 Q:(RET=1)!(RET=6)  W !,$$^%QZCHW("Suite des parametres de :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR,# D ENTET S LI=10 Q
ENTET H:DEV'="ECR" 5 S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,!,LSTAR,!,"|",?10,$$^%QZCHW("Analyse matiere par ordre d'evaluation de : "),?79,"|",!,"|",?79,"|",!,"|",?3,TOID,?79,"|",!,LSTAR,!,"|",?79,"|"
 Q

