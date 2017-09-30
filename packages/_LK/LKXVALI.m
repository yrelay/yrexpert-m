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

;LKXVALI^INT^1^59547,74868^0
LKXVALI ;
 
 
 
 
 N ATT,CH,DAT,LATT,LNUM,LONG,LVAL,N,%N,NUM,STOP,REP
 S REP=$$REP^%QSGES14
 I REP="" D ^%VZEAVT($$^%QZCHW("Repertoire inconnu")) Q
 D CLEPAG^%VVIDEO K ^[QUI]LKX("VALIDATION")
 S STOP=0,DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="VALIDATION DE LA DESCRIPTION" D 4^%VZCD
 D KILL(REP)
 I '($D(^[QUI]LKX("LONGUEUR"))) D M("Pas de description des enregistrements") Q
 S DX=10,DY=8 X XY W $$^%QZCHW("Longueur des enregistrements OK ...")
 I '($D(^[QUI]LKX("NUMERIQUE"))) D M("Longueur des valeurs numeriques inconnue") Q
 S LONG=^[QUI]LKX("LONGUEUR"),LATT=$P(LONG,"^",2),LONG=$P(LONG,"^",1)
 S LVAL=LONG-LATT,LNUM=^[QUI]LKX("NUMERIQUE")
 S DX=10,DY=10 X XY W $$^%QZCHW("Longueur totale = "),LONG
 S DX=10,DY=11 X XY W $$^%QZCHW("Longueur zone attribut = "),LATT
 S DX=10,DY=12 X XY W $$^%QZCHW("Longueur zone valeur   = "),LVAL
 S DX=10,DY=13 X XY W $$^%QZCHW("Longueur des valeurs numeriques = "),LNUM
 I LVAL<LNUM D M("Zone valeur trop petite pour les valeurs numeriques") Q
 S DX=1,DY=10 D CLEBAS^%VVIDEO
 S DX=10,DY=10 X XY W $$^%QZCHW("Longueur des valeurs numeriques OK ...")
 I '($D(^[QUI]LKX("REP",REP))) D M("Aucune description concernant le repertoire") Q
 S DX=10,DY=12 X XY W $$^%QZCHW("Description du repertoire presente ...")
 S N=-1 F %N=0:0 S N=$N(^[QUI]LKX("REP",REP,N)) Q:N=-1  D T(REP) Q:STOP
 Q:STOP
 S DX=10,DY=13 X XY W $$^%QZCHW("Description repertoire OK ...")
 S ^[QUI]LKX("VALIDATION")=$H
FIN D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Description correcte ... [RETURN]") R *DXG:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M_" ... [RETURN]") R *DXG:^TOZE($I,"ATTENTE")
 K ^[QUI]LKX("VALIDATION") D POCLEPA^%VVIDEO Q
T(C) S CH=^[QUI]LKX("REP",C,N),NUM=$P(CH,"^",1) S:NUM="" NUM="N"
 S DAT=$P(CH,"^",2) S:DAT="" DAT="N"
 D BLD^%VVIDEO,BLK^%VVIDEO
 S DX=10,DY=18 X XY W N D NORM^%VVIDEO
 S DX=10,DY=19 X XY W $$^%QZCHW("Numerique : "_$S(NUM="O":"oui",1:"non"))
 S DX=10,DY=20 X XY W $$^%QZCHW("Heure     : "_$S(DAT="O":"oui",1:"non"))
 H 2 S DX=0,DY=18 D CLEBAS^%VVIDEO Q
KILL(T) N L,N,%N
 S L=0,N="" F %N=0:0 S N=$O(^[QUI]LKX(T,N)) Q:N=""  S L=L+1,^[QUI]LKX(T,L)=^[QUI]LKX(T,N)
 S N=L F %N=0:0 S N=$O(^[QUI]LKX(T,N)) Q:N=""  K ^[QUI]LKX(T,N)
 S ^[QUI]LKX("CPT",T)=L Q

