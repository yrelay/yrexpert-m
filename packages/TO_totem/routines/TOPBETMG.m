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

;TOPBETMG^INT^1^59547,74874^0
TOPBETMG ;
 G:'($D(^SELEC($I))) END
OPE S DX=0,DY=6 D CLEBAS^%VVIDEO W !,!,"Nom de l'operateur : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA!CTRLF END S OPE=Y1,B="SECRET" D ^%INCUPA S OK=$S(B["?":0,1:1) G:'(OK) END
 S DOLARI=$I,DX=0,DY=8 D CLEBAS^%VVIDEO,^%VSQUEAK W "Installer la bande S.V.P. !!! [RETURN] " R *REP D TOUCHE^%INCCLAV(REP,.REP) G:(REP=1)!(REP=6) END
 S DX=0,DY=8 D CLEBAS^%VVIDEO W "Un instant,transfert en cours..."
 D ZD^%QMDATE4,^%QMDAK0 O 47:("EFL":80:8000) U 47 W *-5 D TETE
 S %IP=-1 F %I1=1:1 S %IP=$N(^SELEC(DOLARI,%IP)) Q:%IP=-1  S %IL=-1 F %I2=1:1 S %IL=$N(^SELEC(DOLARI,%IP,%IL)) Q:%IL=-1  D TRAIT
 U 47 W *-5 C 47
END K ^SELEC($I),%IP,%I1,%IL,%I2,OK,REP,RESULT,RES,LIB,LIB1,QUW,DP,%DD,PX,PY,%VV,OPE,NOMG,%NORM,TYP,IDENT,DOLARI
FIN Q
TRAIT S RESULT=^SELEC(DOLARI,%IP,%IL),NUFA=$P(RESULT,"^",1),ARC=$P(RESULT,"^",3),TWREF=$P(RESULT,"^",2) Q:'($D(^[QUI]TVPAR(NUFA,TWREF)))
 S (RES,LIB)="etude" D STO1 S LIB="No TOTEM",RES=NUFA D STO1 S LIB="ARC",RES=$S(ARC'="":ARC,1:"ICONNU") D STO1
 S LIB=-1 F %DD=1:1 S LIB=$N(^[QUI]TVPAR(NUFA,TWREF,LIB)) Q:LIB=-1  D STO
 Q
STO S TLIB=$E(LIB,1,4) Q:(TLIB="$ARG")!(TLIB="%VAL")  S RES=^[QUI]TVPAR(NUFA,TWREF,LIB)
STO1 S LIBEL=$E(LIB,1,40),RES=$E(RES,1,40)
 F BLK=1:1:40-$L(LIBEL) S LIBEL=LIBEL_" "
 F BLK=1:1:40-$L(RES) S RES=RES_" "
 D WRITE
 Q
WRITE S LIB1=LIBEL_RES
 U 47 W LIB1
 Q
TETE S (RES,LIB)="identification" D STO1 S LIB="TOTEM",RES="Le : "_%DAT_" a : "_HEURE D STO1 S LIB="OPERATEUR : "_OPE,RES="" D STO1
 Q

