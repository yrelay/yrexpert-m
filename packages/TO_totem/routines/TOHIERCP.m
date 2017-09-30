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

;TOHIERCP^INT^1^59547,74872^0
TOHIERCP ;
 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("edition de l'arbre maximum des composants"),0)
LECDEP S DX=0,DY=6 D CLEBAS^%VVIDEO
 W ?10,$$^%QZCHW("a partir de")," : " S (XD,DX)=$X,DY=$Y D ^%VLEC Q:(Y1="")!((CTRLA=1)!(CTRLF=1))
 S PARA=Y1 D ^%QZCHBT S PCH=PARA D ^%LXABR I CONCUR'=1 D ^%VSQUEAK G LECDEP
 S DX=XD X XY W PCHCOMP
 S (YA,ROUT)=PCHCOMP I '($D(^[QUI]NOMENC(ROUT))) D ^%VZEAVT(ROUT_" "_$$^%QZCHW("n'a pas de composant")) G LECDEP
 W !,!,$$^%QZCHW("OK ! Constitution en cours")
 D ^TO3ARTHE
 S DOLARI=$I
 W !,!
 W $$^%QZCHW("Edition sur (E)cran, ecran (G)raphique, (T)able tracante ou (I)primante")," ? "
 R *DEV S DEV=$C(DEV) G:(((DEV'=$$^%QZCHW("E"))&(DEV'=$$^%QZCHW("I")))&(DEV'=$$^%QZCHW("G")))&(DEV'=$$^%QZCHW("T")) LECDEP
 
 I (DEV=$$^%QZCHW("G"))!(DEV=$$^%QZCHW("T")) D ^TOHIGRAP Q
 
 I DEV=$$^%QZCHW("E") S IMPR=0 G INIT
 
 
 S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:"?") I IMPR="?" W !,!,?10,$$^%QZCHW("sur quelle imprimante")," ? " R IMPR
 O IMPR U IMPR
INIT 
 I IMPR=0 D CLEPAG^%VVIDEO
 S %ESP=75\%PFMAX,LILIM=$S(IMPR=0:20,$D(^TABIDENT(WHOIS,"IMPRCOUR")):^TABIDENT(WHOIS,"IMPRCOUR"),1:50),LI=1
 S NOMTREE="^ARBTHEO(DOLARI,YA",ADR="EDIT^TOHIERCP"
 I IMPR=0 G GO
 W #,!,!,!
 S MSG=$$^%QZCHW("Arbre des composants a partir de")_" "_ROUT W ?40-($L(MSG)\2),MSG,!,!
 S MSG=$$^%QZCHW("Profondeur maxi de")_" "_%PFMAX W ?40-($L(MSG)\2),MSG,!,!,!
GO D TETE,^%QCAGTU1
 I STOP=1 Q
 I IMPR=0 D ^%VZEAVT("") Q
 W # C IMPR Q
 
EDIT S %PROG=@NOM W !
 F %UU=0:1:%PR-4 W ?(%ESP*%UU)+4,"|"
 S DX=((%PR-3)*%ESP)+((8-$L(%PROG))\2)
 
 I (DX+$L(%PROG))>77 S %PROG=$$^%QZCHEV(%PROG,77-DX,"P"),DX=((%PR-3)*%ESP)+((8-$L(%PROG))\2)
 W ?DX,%PROG
 S LI=LI+1 I LI>LILIM D SUIT
 Q
SUIT I IMPR'=0 G IMPR
 D POCLEPA^%VVIDEO W $$L2^%SYSLIB3
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S STOP=1 Q
 D CLEPAG^%VVIDEO,TETE S LI=1 Q
IMPR S LI=1 W # H 10 D TETE Q
 
TETE F %VV=1:1:%PFMAX W ?((%VV-1)*%ESP)+4,%VV
 W ! Q
 
 
 
END W !,!,$$^%QZCHW("Voulez vous une analyse des variables sur cette arborescence (O/N)")_" ?  " R *REP S REP=$C(REP) I REP'=$$^%QZCHW("O") Q
 K %DOLARI
 D ^UTOVAR Q
 
TRAIT Q:%PR>%PFMAX
 S ROUC=@NOM,PFILS=1
 S NUM=-1 F UU=0:0 S NUM=$N(^REFEROUT(ROUC,NUM)) Q:NUM=-1  S ROUF=^REFEROUT(ROUC,NUM) D GET
 Q
GET F ZZ=1:1 S ROUFC=$P(ROUF,"^",ZZ) Q:ROUFC=""  S ROUFC=$P(ROUFC,"(",1),@("^TREEROUT("_%TREFC_","_PFILS_")")=ROUFC,PFILS=PFILS+1
 Q

