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

;%QSQUESI^INT^1^59547,73883^0
QSQUESI ;
 
 
 
 
 
 
 
 
 
 
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Impression de la requete  ? : "),"O")'=1 G FIN
L0 D POCLEPA^%VVIDEO S BID=$$^%VZECH2($$^%QZCHW("Version : "),$$^%QZCHW("Texte"),$$^%QZCHW("Graphique"))
 D:BID=$$^%QZCHW("Texte") IMPR
 D:BID=$$^%QZCHW("Graphique") GRAPH
FIN D POCLEPA^%VVIDEO
 K BID,DY,%FONC,I,MY,%PORT,%TERM Q
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
 S %FONC="TEXT",%9STR=REQ D ^%PBPZ
 S %FONC="MOUV",%9X=100,%9Y=MY-(5*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=COMM D ^%PBPZ
 S %FONC="MOUV",%9X=500,%9Y=(25+MY)-(7*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Individus intermediaires") D ^%PBPZ
 S %FONC="MOUV",%9X=500,%9Y=(25+MY)-(13*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Criteres de selection") D ^%PBPZ
 S %FONC="MOUV",%9X=3000,%9Y=MY-(8*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Repertoire") D ^%PBPZ
 S %FONC="MOUV",%9X=3000,%9Y=MY-(11*DY) D ^%PBPZ
 S %FONC="TEXT",%9STR=BASE D ^%PBPZ
 F I=1:1:4 Q:'($D(VAR((NOLV+I)-1)))  S %FONC="MOUV",%9X=100,%9Y=MY-((7+I)*DY) D ^%PBPZ S %FONC="TEXT",%9STR=VAR((NOLV+I)-1) D ^%PBPZ
 F I=1:1:11 Q:'($D(CONT((NOLC+I)-1)))  S %FONC="MOUV",%9X=100,%9Y=MY-((13+I)*DY) D ^%PBPZ S %FONC="TEXT",%9STR=CONT((NOLC+I)-1) D ^%PBPZ
 C %PORT
 D ^%VZEAVT($$^%QZCHW("Termine ")) Q
 
IMPR 
 S %PORT=^TABIDENT(WHOIS,"PRINTER") C %PORT O %PORT U %PORT
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE
 W !,!,!,$$^%QZCHW("Requete : "),REQ
 W !,!,!,$$^%QZCHW("Commentaire : "),COMM
 W !,!,!,$$^%QZCHW("Repertoire : "),BASE
 W !,!,$$^%QZCHW("Individus intermediaires : "),!
 F I=1:1 Q:'($D(VAR(I)))  W !,VAR(I)
 W !,!,$$^%QZCHW("Criteres de selection : "),!
 F I=1:1 Q:'($D(CONT(I)))  W !,CONT(I)
 W #
 U 0 C %PORT Q

