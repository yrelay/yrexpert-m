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
;! Nomprog     : %QUCHOI2                                                     !
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
;! HL002 ! HL     ! 28/06/12 ! PB caratères parasites terminal-gnome          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%QUCHOI2 ;
ZCHOSUP2 ;
 
IMPR N INT,Z S INT=0,Z=^QX($J) D IMPROBJ Q
 
IMPROBJ 
 N %L,ARRET,IMP,LOC,DX,DY,SAVI
 S SAVI=$I
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 I INT S DX=^QX($J,Z,"XG")+1,DY=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-1 X XY W "  ",$$^%QZCHW("Impression en cours"),".."
 S ARRET=0 O IMP U IMP D IMPRI^%QAX(SAVI) I IMP'=0 W #
 W ?25,$$^%QZCHW("Liste des objets"),! S LOC=^QX($J,Z,"C") F %L=0:0 Q:ARRET  D IMPLOC
 C IMP Q
IMPLOC G:^QX($J,Z,"MOD")=3 IMP2
 I LOC="" S ARRET=1 Q
 W !,?10,$$S^%QAX(LOC) S LOC=$O(@^QX($J,Z,"GL")@(LOC)) Q
IMP2 I $F(LOC,^QX($J,Z,"DEB"),0)=($L(^QX($J,Z,"DEB"))+1) W !,?10,$$S^%QAX(LOC) S LOC=$O(@^QX($J,Z,"GL")@(LOC)) Q
 S ARRET=1 Q
 
REAFF 
 ;HL002 I '(DTM) O $I:(^QX($J,Z,"LECR"))
 ;HL002 I DTM O $I
 O $I
 D CARSP^%VVIDEO(^QX($J,Z,"XG"),^QX($J,Z,"YH"),^QX($J,Z,"DV"),^QX($J,Z,"DH"),1)
 ;HL002 S DX=^QX($J,Z,"XG")+1 F DY=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 X XY W $J("",^QX($J,Z,"DH")-2) 
 S DX=^QX($J,Z,"XG")+1 F DY=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 X XY W $J("",^QX($J,Z,"DH")-3) 
 D HELP,PAGE,NOPA Q
HELP 
 S DX=^QX($J,Z,"XG")+1,DY=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-1 X XY
 W $$^%QZCHW("(+),(-),(?),(P)age,CTRLJ")
 Q
REAFF2 
 ;HL002 I '(DTM) O $I:(^QX($J,Z,"LECR"))
 ;HL002 I DTM O $I
 O $I
 D CARSP^%VVIDEO(^QX($J,Z,"XG"),^QX($J,Z,"YH"),^QX($J,Z,"DV"),^QX($J,Z,"DH"),1)
 S DX=^QX($J,Z,"XG")+1
 F DY=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 X XY W $J("",^QX($J,Z,"DH")-2)
 D HELP,PAGE,NOPA Q
HELP2 
 S DX=^QX($J,Z,"XG")+1,DY=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-1
 X XY W $$^%QZCHW("(+),(-),(?),(P)age") Q
PAGE 
 N CLOC,LOC
 ;; patch dur
 Q:'($D(^QX($J,Z,"C")))
 S LOC=^QX($J,Z,"C"),DX=^QX($J,Z,"XG")+2
 F DY=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 X XY W $J("",^QX($J,Z,"DH")-4) D TLOC
 S ^QX($J,Z,"FIN")=$S(LOC="":"",1:$ZP(@^QX($J,Z,"GL")@(LOC))) Q
TLOC Q:LOC="z"
 S CLOC=$$S^%QAX(LOC) G:^QX($J,Z,"MOD")=3 TL2
 I LOC="" Q
 D:$D(LSEL) VID X XY W $S($L(CLOC)<(^QX($J,Z,"DH")-4):CLOC,1:$$CAR^%QZCHEV(CLOC,^QX($J,Z,"DH")-4,"D",","))
 D NORM^%VVIDEO S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
TL2 I $F(LOC,^QX($J,Z,"DEB"),0)=($L(^QX($J,Z,"DEB"))+1) X XY W $S($L(CLOC)<(^QX($J,Z,"DH")-4):CLOC,1:$$CAR^%QZCHEV(CLOC,^QX($J,Z,"DH")-4,"D",",")) S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
NOPA 
 Q:'($D(^QX($J,Z,"XG")))  Q:'($D(^QX($J,Z,"DH")))  Q:'($D(^QX($J,Z,"YH")))
 S DX=(^QX($J,Z,"XG")+(^QX($J,Z,"DH")\2))-5,DY=^QX($J,Z,"YH")
 Q:'($D(^QX($J,Z,"P")))  X XY W " Page : ",^QX($J,Z,"P")," " Q
 
VID D:$D(@LSEL@(LOC)) BLD^%VVIDEO
 Q

