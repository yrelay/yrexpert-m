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

;%QMNF5^INT^1^59547,73879^0
QMNF5(ARBRE,BASE,NSS,LIEN,PROFMX) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %UU,%VV,ADR,D,DEV,%PORT,LI,LILIM,MSG,NOMTREE,PGC,PX,PY,REP,SENS,STOP,TYPIMP,%TERM
 D TITRE
SUITE D POCLEPA^%VVIDEO W $$^%QZCHW("constitution en cours")_"..."
 
 D ^%QMNF6(ARBRE,NSS,PROFMX,.X),POCLEPA^%VVIDEO
 S DOLARJ=$J,%PROF=%PFMAX-1
CHOIX S DX=10,DY=10 X XY W $$^%QZCHW("impression sur")_" " S DEV=$$^%VZESOR("E")
 I DEV=-1 K ^ARBTHEO($J),^COMPNOM($J),^POS($J) Q
 S PGC=1
 K ^POS($J)
 I DEV=0 S %PORT=0,SENS="v" G INIT
 I DEV'=1 D ^%VSQUEAK G CHOIX
CHIMP 
 I DTM G CHSENS
 S DX=10,DY=13 X XY S TYPIMP=$E($$^%VZECH2($$^%QZCHW("impression")_" ",$$^%QZCHW("standard"),$$^%QZCHW("graphique")),1)
 I (TYPIMP=1)!(TYPIMP=6) G CHOIX
 
 I TYPIMP="s" S SENS="v",%PORT=$$TABID^%INCOIN("PRINTER") S:%PORT="" %PORT=0 G IMPR
CHSENS 
 S DX=10,DY=15 X XY S SENS=$E($$^%VZECH2($$^%QZCHW("sens")_" ",$$^%QZCHW("vertical"),$$^%QZCHW("horizontal")),1)
 I (SENS=1)!(SENS=6) G CHIMP
 S %PORT=$$TABID^%INCOIN("TABTRA") S:%PORT="" %PORT=0
 S %TERM="HP-KYO"
IMPR O %PORT U %PORT
 
 I SENS="h" S %FONC="LANDSCAPE" D ^%PBPZ
INIT 
 S %ESP=40\%PROF,LILIM=$S(%PORT=0:20,1:45),LI=$S(%PORT=0:6,1:1)
 S NOMTREE="^ARBTHEO(DOLARJ",ADR="EDIT^%QMNF5"
 I %PORT=0 D CLEPAG^%VVIDEO,^%VZCD0($E($$NOMLOG^%QSF(BASE)_":"_NSS_"/"_LIEN_"...",1,37)),^%VZEATT S DX=0,DY=6 X XY G GO
 U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("impression en cours")_"..."
 U %PORT W #,! S MSG=$$^%QZCHW("Arbre des composants a partir de")_" "_NSS W ?40-($L(MSG)\2),MSG,!,! S MSG=$$^%QZCHW("Profondeur maxi de")_" "_%PROF W ?40-($L(MSG)\2),MSG,!,!
GO D:%PORT'=0 TETE
 S PY=6 D ^%QCAGTU1
 I %PORT=0 G PAG
 
 U %PORT W #
 
 I SENS="h" S %FONC="PORTRAIT" D ^%PBPZ
 C %PORT U 0 D ^%VZEAVT($$^%QZCHW("impression terminee"))
 K ^ARBTHEO($J),^COMPNOM($J),^POS($J)
 Q
PAG 
 D ^%QMNF7
 D CLEPAG^%VVIDEO,80^%VVIDEO,TITRE
 G CHOIX
 
EDIT 
 N AT,INF1,INF2,NOEUD,CAR,%PROG,CG,CD,%I,D
 S CD="",CG=""
 S %PROG=@NOM S:%PORT=0 PY=PY+1
 S INF1=$P(%PROG,"^",1),NOEUD=$P(%PROG,"^",2)
 S INF2=$P(%PROG,"^",3),CAR=$P(%PROG,"^",4)
 I %PORT'=0 W ! S PY=$Y F %UU=0:1:%PR-4 W ?(%ESP*(%UU+1))+4,"|"
 S:CAR="*" CG="*",CD="*"
 S:CAR="!" CG="!!! ",CD=" !!!"
 S AT=NOEUD,AT=$$S^%QAX(AT)
 S INF1="<"_INF1_">" F %I=$L(INF1)+1:1:6 S INF1=INF1_"."
 S D=" "_INF1_CG_AT_CD
 
 
 S:(NOEUD=NSS)&(CAR'="!") D=" "_AT
 S:INF2'="" D=D_" ("_INF2_")"
 S PX=((%PR-2)*%ESP)+((8-$L(%PROG+1))\2) I %PORT'=0 W ?PX,D
 S ^POS($J,PGC,PY,PX)=D,^POS($J,PGC,PY,PX,"INT")=NOEUD,LI=LI+1
 I LI>LILIM D SUIT
 Q
 
SUIT 
 I %PORT'=0 S LI=1 W # H 5 D TETE Q
 S DX=0,(DY,PY)=6 X XY
 S (PGC,PAGT)=PGC+1,LI=6
 Q
 
TETE F %VV=0:1:%PROF W ?(%VV*%ESP)+4,%VV
 W ! Q
 
TITRE D CLEPAG^%VVIDEO,^%VZCD0($E($$NOMLOG^%QSF(BASE)_":"_NSS_"/"_LIEN_"...",1,37))
 Q

