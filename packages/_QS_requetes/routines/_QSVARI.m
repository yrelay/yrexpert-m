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

;%QSVARI^INT^1^59547,73883^0
QSVARI(%PORT) 
 
 
 
 
 
 N I,J,CH
 D POCLEPA^%VVIDEO
IMPR 
 I %PORT'=0 W #
 E  D CLEPAG^%VVIDEO
 W !,$$TEMPS^%QMDATE
 W !,!,!,?10,$$^%QZCHW("variable active")_" : ",VA,$J(" ",5)
 I T="AVANT" W $$^%QZCHW("(prologue)")
 E  W $$^%QZCHW("(epilogue)")
 W !,!,!,$$^%QZCHW("commentaire")_" : ",COMM
 W !,!,!,$$^%QZCHW("repertoire")_" : ",BASE
 W !,!,!,$$^%QZCHW("etat")_" : ",ETAT
 W !,!,!,$$^%QZCHW("attribut")_" : ",ATT
 W !,!,!,$$^%QZCHW("type de mise a jour")_" : ",TYPMAJ
 W !,!,!,$$^%QZCHW("situations")_" : ",!
 F I=1:1 Q:'($D(@SITL@(I)))  S CH=@SITL@(I) W !,?5,$E(CH,1,75) F J=75:80:$L(CH) W !,$E(CH,J+1,J+80)
 
 W !,!,!,$$^%QZCHW("actions")_" : ",!
 F I=1:1 Q:'($D(@ACT@(I)))  S CH=@ACT@(I) W !,?5,$E(CH,1,75) F J=75:80:$L(CH) W !,$E(CH,J+1,J+80)
 
 Q
 
 
 N BID,%FONC,MY,%TERM
 D POCLEPA^%VVIDEO S BID=$$^%VZECH2($$^%QZCHW("Version : "),$$^%QZCHW("Texte"),$$^%QZCHW("Graphique"))
 G:BID=$$^%QZCHW("Texte") IMPR
 G:BID=$$^%QZCHW("Graphique") GRAPH
 
GRAPH 
 
 
 
 D ^%VZEATT
 S %PORT=^TABIDENT(WHOIS,"TABTRA"),%TERM=^TABIDENT(WHOIS,"TYPTAB")
 C %PORT O %PORT
 S %FONC="INIT" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 S DY=3120\24,MY=3120
 S %FONC="RECT",%9X1=0,%9X2=4090,%9Y1=MY-(3*DY),%9Y2=MY D ^%PBPZ
 S %FONC="RECT",%9X1=0,%9X2=4090,%9Y1=MY-(4*DY),%9Y2=MY-(6*DY) D ^%PBPZ
 S %FONC="RECT",%9X1=0,%9X2=4090*(5/8),%9Y1=MY-(12*DY),%9Y2=MY-(7*DY) D ^%PBPZ
 S %FONC="RECT",%9X1=0,%9X2=4090,%9Y1=MY-(23*DY),%9Y2=MY-(13*DY) D ^%PBPZ
 S %FONC="RECT",%9X1=(4090*(5/8))+50,%9X2=4090,%9Y1=MY-(9*DY),%9Y2=MY-(7*DY) D ^%PBPZ
 S %FONC="RECT",%9X1=(4090*(5/8))+50,%9X2=4090,%9Y1=MY-(12*DY),%9Y2=MY-(10*DY) D ^%PBPZ
 S %FONC="MOUV",%9X=1000,%9Y=MY-(2*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=VA D ^%PBPZ
 S %FONC="MOUV",%9X=100,%9Y=MY-(5*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=COMM D ^%PBPZ
 S %FONC="MOUV",%9X=500,%9Y=(25+MY)-(7*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("situations") D ^%PBPZ
 S %FONC="MOUV",%9X=500,%9Y=(25+MY)-(13*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("actions") D ^%PBPZ
 S %FONC="MOUV",%9X=3000,%9Y=MY-(8*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("repertoire") D ^%PBPZ
 S %FONC="MOUV",%9X=3000,%9Y=MY-(11*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=BASE D ^%PBPZ
 F I=1:1:4 Q:'($D(SIT((NOLS+I)-1)))  S %FONC="MOUV",%9X=100,%9Y=MY-((7+I)*DY) D ^%PBPZ S %FONC="TEXT",%9STR=SIT((NOLS+I)-1) D ^%PBPZ
 F I=1:1:6 Q:'($D(ACT((NOLA+I)-1)))  S %FONC="MOUV",%9X=100,%9Y=MY-((13+I)*DY) D ^%PBPZ S %FONC="TEXT",%9STR=ACT((NOLA+I)-1) D ^%PBPZ
 C %PORT
 D ^%VZEAVT($$^%QZCHW("impression terminee ")) Q
 
DEB(%PORT) 
 S %PORT=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) C %PORT O %PORT U %PORT
 Q
FIN(%PORT) 
 W # C %PORT
 D ^%VZEAVT($$^%QZCHW("impression terminee"))
 I %PORT=0 D CLEPAG^%VVIDEO,REAFF^%QSVAREC
 Q

