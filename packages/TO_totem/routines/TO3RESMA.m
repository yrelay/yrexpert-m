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

;TO3RESMA^INT^1^59547,74870^0
TO3RESMA ;
 
 Q:'($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("MATIERE"))))  Q:SFMAT=""  Q:^TOZE(DOLARI,$$^%QZCHW("MATIERE"))=0
 S LI=0,CTRLA=0,CTRLF=0,%DEC=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2)
 I DEV="ECR" D CLEPAG^%VVIDEO
 G LOOP
 W !,!,!
LOOP 
 D ENTET S N=-1 F I=1:1 S N=$N(^[QUI]PARMAT(NUFA,TWREF,N)) Q:N=-1  I (N'["$")&((N'["%VAL")&(N'["%ARG")) D TTT Q:STOP=1
 G:(CTRLA=1)!(CTRLF=1) FIN2 G FIN
TTT S ON=N I $L(ON)>35 S %LIB=ON D PD^TOABSPEC S ON=%ABSP
 S PCH=^[QUI]PARMAT(NUFA,TWREF,N) D TO^%QZNBN1 S:ISNUM=1 PCH=$J(PCH,21,%DEC)
 I ISNUM=0 S %CH=PCH,%LGR=21 D ^%QZCHBK S PCH=%CH K %CH,%LGR
 W !,"|",?3,ON W:N=$$^%QZCHW("QUANTITE") $$^%QZCHW(" en stock") W ?40,"= ",PCH,?65,$S($D(^[QUI]UNITE(SFMAT,N)):^[QUI]UNITE(SFMAT,N),1:""),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 Q
FIN W !,LSTAR
FIN1 I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour continuer") R XX S DT=0,PT=0 D CLEPAG^%VVIDEO
 
FIN2 Q
SUIT S STOP=0
 I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STOP=1 S:RET=6 CTRLF=1,STOP=1 Q:STOP=1  W !,$$^%QZCHW("Suite de l'analyse matiere pour :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR D ENTET S LI=10 Q
ENTET H:DEV'="ECR" 5 W # S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,LSTAR,!,"|",?10,$$^%QZCHW("Analyse matiere pour : "),?79,"|",!,"|",?79,"|",!,"|",?3,TOID,?79,"|",!,LSTAR
 
 Q

