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

;TOPARMAC^INT^1^59547,74874^0
TOPARMAC ;
 
 Q:'($D(^[QUI]PARMAC(NUFA)))  Q:^TOZE(DOLARI,$$^%QZCHW("MACHINE"))=0  K ^ORDOP($J) S LI=0,STP=0,CTRLA=0,CTRLF=0,%DEC=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2)
 I DEV="ECR" D CLEPAG^%VVIDEO
 D ORDOP G LOOP
 W !,!,!
LOOP 
 D ENTET S NO=-1 F %CC=1:1 S NO=$N(^ORDOP($J,NO)) Q:NO=-1  S OP=-1 F %OO=1:1 S OP=$N(^ORDOP($J,NO,OP)) Q:(OP=-1)!(STP=1)  D AFOP Q:STP=1  S N=-1 F %PP=1:1 S N=$N(^ORDOP($J,NO,OP,N)) Q:N=-1  D TTT Q:STP=1
 G:(CTRLA=1)!(CTRLF=1) FIN2 G FIN
TTT S ON=N Q:(ON["$ARG")!(ON["%VAL")  S:$E(ON,1)="%" ON=$E(ON,2,$L(ON)) I $L(ON)>35 S %LIB=ON D PD^TOABSPEC S ON=%ABSP
 S PCH=^ORDOP($J,NO,OP,N) D TO^%QZNBN1 S:ISNUM=1 PCH=$J(PCH,21,%DEC)
 I ISNUM=0 S %CH=PCH,%LGR=21 D ^%QZCHBK S PCH=%CH K %CH,%LGR
 W !,"|",?3,ON,?40,"= ",PCH,?79,"|" S LI=LI+1 I ((LI#3)=0)&(DEV="IMPR") H 2
 I LI>LILIM D SUIT
 Q
AFOP D:LI'<(LILIM-2) SUIT Q:STP=1  W !,"|",?79,"|" S LI=LI+1 D:LI>LILIM SUIT Q:STP=1  W !,"|",?5,$$^%QZCHW("No : "),NO,?20,$$^%QZCHW("Operation : "),OP,?79,"|" S LI=LI+1 D:LI>LILIM SUIT Q:STP=1  W !,"|",?79,"|" S LI=LI+1 D:LI>LILIM SUIT Q:STP=1
 Q
FIN W !,LSTAR K ^ORDOP($J)
FIN1 I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour continuer") R XX S DT=0,PT=0 D CLEPAG^%VVIDEO
 
FIN2 Q
SUIT S STP=0
 I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STP=1 S:RET=6 CTRLF=1,STP=1 Q:STP=1  W !,$$^%QZCHW("Suite des paramatres machines pour :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR D ENTET S LI=10 Q
ENTET H:DEV'="ECR" 5 W # S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,LSTAR,!,"|",?10,$$^%QZCHW("Parametres machines pour : "),?79,"|",!,"|",?79,"|",!,"|",?3,TOID,?79,"|",!,LSTAR
 Q
ORDOP S N=-1 F I=1:1 S N=$N(^[QUI]PARMAC(NUFA,TWREF,N)) Q:N=-1  D TR
 Q
TR S NO=+($P(N,"/",2)),OP=$P(N,"/",1),RAP=-1 F %PP=1:1 S RAP=$N(^[QUI]PARMAC(NUFA,TWREF,N,RAP)) Q:RAP=-1  S ^ORDOP($J,NO,OP,RAP)=^[QUI]PARMAC(NUFA,TWREF,N,RAP)
 Q

