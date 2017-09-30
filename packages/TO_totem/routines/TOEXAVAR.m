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

;TOEXAVAR^INT^1^59547,74872^0
TOEXAVAR ;
 
 D ^ZZMAJROU K ^TBROUT($I) S XX="ZR  ZL @ROU S ^TOTVAR(ROU)=$T(+1) F LIG=2:1 S XDP=$T(+LIG) Q:XDP=""""  W !,XDP S POS=0 D ^TOLIMVAR X EXAM "
 S EXAM="S NUM=-1 F UU=0:0 S NUM=$N(VAR(NUM)) Q:NUM=-1  S LIB=$$GETLBLAN^%VTLBLAN(VAR(NUM)) I LIB'=""""  S %PCH=LIB D ^%QZNBN1 I 'ISNUM  I $E(%PCH,1)'=""$""  X AFF"
 S AFF="S EXP=%PCH W !,?10,EXP I '$D(^UTILITY(""GLO"",EXP)) S ^TOTVAR(ROU,EXP)=$S($D(^TOTVAR(ROU,EXP)):^TOTVAR(ROU,EXP)+1,1:1),^LOCAVAR(EXP,ROU)=$S($D(^LOCAVAR(EXP,ROU)):^LOCAVAR(EXP,ROU)+1,1:1)"
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$L23^%QSLIB2("RETURN Fin de liste, *XA partir de X, CTRLF toutes") S DX=0,DY=0 X XY W $$^%QZCHW("Cross-reference sur les variables des routines : "),!,!,! S DY=$Y,DX=10
QUES S DY=DY+1 X XY W "- " S DX=$X D ^%VLEC G FIN:CTRLA,TOUTES:CTRLF,TRAIT:Y1="" I $E(Y1,1)="*" G APART
 S ^TBROUT($I,Y1)=1,DX=10,DY=DY+1 G QUES
TRAIT S RO=-1 F %SS=0:0 S RO=$N(^TBROUT($I,RO)) Q:RO=-1  K VALCLE S NOMTAB="^UTILITY",ADR="TRAIT1^TOEXAVAR",VALCLE(1)="ROU",VALCLE(2)=RO D ^%VKMULG
 D MAJSCR Q
TRAIT1 S ROU=B2 K ^TOTVAR(ROU) W !,ROU X XX
 Q
APART S DEBR=$E(Y1,2,$L(Y1)),B2=$E(DEBR,1,$L(DEBR)-1)_$C($A($E(DEBR,$L(DEBR)))-1)_"z"
 F %SS=0:0 S B2=$N(^UTILITY("ROU",B2)) Q:B2=-1  S ^TBROUT($I,B2)=1 D TRAIT1
 D MAJSCR Q
TOUTES K ^TOTVAR,^LOCAVAR S ROU=0 F TT=0:0 S ROU=$N(^UTILITY("ROU",ROU)) Q:ROU=-1  W !,ROU S ^TBROUT($I,ROU)=1 X XX
 D MAJSCR Q
MAJSCR S ROUT=-1 F UU=0:0 S ROUT=$N(^TBROUT($I,ROUT)) Q:ROUT=-1  S:'($D(^EXISROUT(ROUT))) ^EXISROUT(ROUT)="" D MAJGLO
 G FIN
MAJGLO K ^REFERVAR(ROUT) S NUM=1,GLO=-1 F NN=1:1 S GLO=$N(^TOTVAR(ROUT,GLO)) Q:GLO=-1  S $P(^REFERVAR(ROUT,NUM),"^",NN#20)=GLO I (NN#20)=0 S NUM=NUM+1
FIN Q
TEST W !,$$^%QZCHW("A tester : ") R XDP Q:XDP=""  S POS=0 D ^TOLIMVAR X EXAM G TEST

