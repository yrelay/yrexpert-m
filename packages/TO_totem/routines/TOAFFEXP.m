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

;TOAFFEXP^INT^1^59547,74871^0
TOAFFEXP ;
 
 Q:'($D(^ARTAED($J)))  K ^AFFPAG($I)
LECSUP S DX=0,DY=5 D CLEBAS^%VVIDEO S DY=12 X XY W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP)
 G:(SUP=1)!(SUP=6) FIN S SUP=$C(SUP) G:(SUP'=$$^%QZCHW("E"))&(SUP'=$$^%QZCHW("I")) LECSUP
 S DX=0,DY=6 D CLEBAS^%VVIDEO,@SUP
FIN K SUP,^ARTAED($J),^AFFPAG($I) Q
E W $$^%QZCHW("Un instant...") S EGAP=0,LG=21,ART=-1 F %AA=1:1 S ART=$N(^ARTAED($J,ART)) Q:ART=-1  D STO
 S TIT=$$^%QZCHW("Article"),%CH=$$^%QZCHW("No"),%LGR=26 D ^%QZCHBK S TIT=TIT_%CH_$$^%QZCHW("   Parametres explicites")
 D ^TOPAGIN Q
STO S OK=0,NUM=-1 F %NU=1:1 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  S EXP=$N(^[QUI]EXPLICI(ART,NUM,-1)) D STO1
 Q
STO1 S LG=LG+1 I LG>21 S LG=8,EGAP=EGAP+1
 S TRA=$S(%NU=1:$E(ART,1,30),1:" "),%CH=NUM,%LGR=33-$L(TRA) D ^%QZCHBK I TRA'=" " S ^AFFPAG($I,EGAP,LG)="" I (OK=0)&(%AA'=1) S OK=1 G STO1
 S OK=0,^AFFPAG($I,EGAP,LG)=TRA_%CH_"   "_EXP
 Q
I W $$^%QZCHW("Impression en cours...")
 D ZD^%QMDATE4,^%QMDAK0 S IMPR=0,LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-3,1:63) I $D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 O IMPR U IMPR S CPT=0,ART=-1 F %AA=1:1 S ART=$N(^ARTAED($J,ART)) Q:ART=-1  S NUM=-1 F %NU=1:1 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  S EXP=$N(^[QUI]EXPLICI(ART,NUM,-1)),CPT=CPT+1 D AFF
 W !,# C IMPR Q
AFF I (CPT#63)=1 S PAG=(CPT\63)+1 D ENTET
 S TRA=$S(%NU=1:$E(ART,1,30),1:" "),%CH=NUM,%LGR=33-$L(TRA) D ^%QZCHBK I TRA'=" " S CPT=CPT+1 W !
 W !,TRA,%CH,"   ",EXP Q
ENTET W #,!,?2,$$^%QZCHW("le : "),%DAT,$$^%QZCHW(" a : "),HEURE,$$^%QZCHW("    *** PARAMETRES EXPLICITES ***"),?65,$$^%QZCHW("Page : "),PAG,!,!
 W $$^%QZCHW("Article"),?31,$$^%QZCHW("No   Parametres explicites"),!
 S CPT=CPT+5 Q

