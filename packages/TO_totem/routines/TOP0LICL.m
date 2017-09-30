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

;TOP0LICL^INT^1^59547,74874^0
TOP0LICL ;
 
 K ^FLASUP($I) S:'($D(%ROUTR)) %ROUTR=TOP0SCED I '($D(^POSENR($I))) S DX=0,DY=6 D CLEBAS^%VVIDEO,^%VSQUEAK,POCLEPA^%VVIDEO W "Aucun cliche n'a ete recuperes ! [RETURN] " R *RET G END
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=NBPAG
BEG1 S PAGE=$S('($D(OPAGE)):1,1:OPAGE),DX=0,DY=6 D CLEBAS^%VVIDEO,ENTET1 G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets,?:Detail,(T)ous,CTRLJ:Impression") S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=5 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G ORD:Y1="?",1:CTRLA,6:CTRLF,65:CTRLE,10:CTRLJ,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-",84:Y1="T"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
10 S %GL="^POSENR(DOLARI,PAGE)",HPG="ARC^Clients^Date^Qte comm.^Poids comm.",%POS="3^15^40^55^68",BPG="" D ^TOP0EDPA G SUIT
84 D POCLEPA^%VVIDEO,^%VSQUEAK W "Un instant..." S ^GLOCLI($I,"tous")=1 F %PP=1:1:NBPAG F %LL=8:1:21 Q:'($D(^POSENR($I,%PP,%LL)))  S ENR=^POSENR($I,%PP,%LL),ARC=$P(ENR,"^",1),^GLOCLI($I,ARC)=1
 D POCLEPA^%VVIDEO G END
65 D @%ROUTR G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  S LINE=^POSENR($I,PAGE,DY),ARC=$P(LINE,"^",1) X XY D ON S CPT=0 F XX=3,15,40,55,68 S CPT=CPT+1 W ?XX,$P(LINE,"^",CPT)
 I $D(%QUIT) Q:%QUIT=1
 G SUIT
END D:$D(FLASUP($I)) KILL^TOP0KFLI K ^FLASUP($I),PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP,%PP,%LL Q
ON I $D(^GLOCLI($I,ARC)) D BLD^%VVIDEO,BLK^%VVIDEO S DX=0 X XY W "S"
 G FIN
FIN Q
ORD S DX=0,DY=6 D CLEBAS^%VVIDEO,ENTET2 S DY=-1 F %QY=1:1 S DY=$N(^POSFUL($I,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  S LIGNE=^POSFUL($I,PAGE,DY),ARC=$P(LIGNE,"^",1) X XY D ON S CPT=0 F XX=3,15,30,42,54,66 S CPT=CPT+1 W ?XX,$P(LIGNE,"^",CPT)
ORDL D POCLEPA^%VVIDEO W "CTRLJ:Impression,RETURN:Retour " R *RET D TOUCHE^%INCCLAV(RET,.RET)
 I RET=10 S %GL="^POSFUL(DOLARI,PAGE)",HPG="ARC^Alliage^Etat^largeur^Longueur^Epaisseur",%POS="3^15^30^42^54^66",BPG="" D ^TOP0EDPA G ORDL
 S DX=0,DY=6,%QUIT=1 D CLEBAS^%VVIDEO,ENTET1,AFF1 S %QUIT=0 G SUIT
ENTET1 S DX=0,DY=6 X XY W ?3,"ARC",?15,"Clients",?40,"Date",?55,"Qte comm.",?68,"Poids comm."
 Q
ENTET2 S DX=0,DY=6 X XY W ?3,"ARC",?15,"Alliage",?30,"Etat",?42,"largeur",?54,"Longueur",?66,"Epaisseur"
 Q
CADRE D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Fiches de liaison" D TO4^%VZCD Q

