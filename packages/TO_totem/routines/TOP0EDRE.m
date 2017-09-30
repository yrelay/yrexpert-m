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

;TOP0EDRE^INT^1^59547,74873^0
TOP0EDRE ;
 
 I '($D(^POSENR($I))) D POCLEPA^%VVIDEO W "Aucun resultat a vos requetes ! [RETURN] " R *RET G END
 S NUREQ=0,DOLARI=$I,IMPR=0 D ZD^%QMDATE4,^%QMDAK0,CLEPAG^%VVIDEO,^%AB3STAR S NBPAG=$S($D(^POSENR(DOLARI,PAGE)):PAGE,1:PAGE-1),PAGE=1 G:SUP="I" IMPR S NUREQ=1 D AFF1
SUIT D POCLEPA^%VVIDEO W $$L17^%QSLIB1("?:Repere, (D)etail, CTRLJ:Impression")
 S DX=$X D ^%VLEC G ORD:Y1="D",1:CTRLA,6:CTRLF,10:CTRLJ,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-",REP:Y1="?"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 D AFF G SUIT
1 G END
6 G END
10 S %GL="^POSENR(DOLARI,PAGE)",HPG="ARC^Clients^Date^Qte comm.^Poids comm.",%POS="3^15^40^55^67",BPG="  *** Tonnage total : "_^TONCUM(DOLARI,"TOTAL")_" ***"_"^ ^ ^   Total ^"_^TONCUM(DOLARI,PAGE) D ^TOP0EDPA S IMPR=0 G SUIT
43 G 61
45 S NPAG=PAGE-1 D AFF G SUIT
61 S NPAG=PAGE+1 D AFF G SUIT
AFF I '($D(^POSENR(DOLARI,NPAG))) D ^%VSQUEAK Q
 S PAGE=NPAG D CLEPAG^%VVIDEO S:$D(^POSREQ(DOLARI,PAGE)) NUREQ=NUREQ+1
AFF1 S DY=-1 D TIT,ENTET1 F %QY=1:1 S DY=$N(^POSENR(DOLARI,PAGE,DY)) Q:DY=-1  S LINE=^POSENR(DOLARI,PAGE,DY),ARC=$P(LINE,"^",1) U IMPR W:%QY'=1 ?79,"|" W !,"| " S CPT=0 F XX=3,15,40,55,67 S CPT=CPT+1 U IMPR W ?XX,$P(LINE,"^",CPT)
 W ?79,"|",!,LSTAR,!,"| *** Tonnage total : ",^TONCUM(DOLARI,"TOTAL")," ***",?61,"Total",?67,^TONCUM(DOLARI,PAGE),?79,"|",LSTAR Q
END K ^TOTCUM($I),^POSENR($I),^POSFUL($I),^POSREQ($I),PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP,%PP,%LL Q
FIN Q
ORD S DX=0,DY=3 D CLEBAS^%VVIDEO,ENTET2 S DY=-1 F %QY=1:1 S DY=$N(^POSFUL(DOLARI,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  S LIGNE=^POSFUL(DOLARI,PAGE,DY),ARC=$P(LIGNE,"^",1) U IMPR W ! S CPT=0 F XX=3,15,30,42,54,66 S CPT=CPT+1 U IMPR W ?XX,$P(LIGNE,"^",CPT)
ORDL D POCLEPA^%VVIDEO W "CTRLJ:Impression;RETURN:Retour " R *RET D TOUCHE^%INCCLAV(RET,.RET)
 I RET=10 S %GL="^POSFUL(DOLARI,PAGE)",HPG="ARC^Alliage^Etat^Largeur^Longueur^Epaisseur",%POS="3^15^30^42^54^66",BPG="" D ^TOP0EDPA S IMPR=0 G ORDL
 D CLEPAG^%VVIDEO,AFF1 G SUIT
REP S PG=-1 F %PP=1:1 S PG=$N(^POSREQ($I,PG)) Q:PG=-1  D REPSUI
 D CLEPAG^%VVIDEO,AFF1 G SUIT
REPSUI D CLEPAG^%VVIDEO W !,"Debut des resultats de la requete No ",%PP," : page ",PG,!
 S GL=-1 F GG=1:1 S GL=$N(^POSREQ($I,PG,GL)) Q:GL=-1  W !,^POSREQ($I,PG,GL)
 D POCLEPA^%VVIDEO W "[RETURN] " R *RET Q
ENTET1 W LSTAR,!,"| ",?3,"ARC",?15,"Clients",?40,"Date",?55,"Qte comm.",?67,"Poids comm.",?79,"|",!,LSTAR
 Q
ENTET2 W !,?3,"ARC",?15,"Alliage",?30,"Etat",?42,"largeur",?54,"Longueur",?66,"Epaisseur",!
 Q
IMPR I $D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 S DX=0,DY=6 X XY W "Impression en cours..." O IMPR S PAGE=-1 F PP=1:1 S PAGE=$N(^POSENR(DOLARI,PAGE)) Q:PAGE=-1  U IMPR W # D DEBREQ,AFF1
 U IMPR W !,# C IMPR Q
DEBREQ Q:'($D(^POSREQ(DOLARI,PAGE)))  U IMPR W !," Le : ",%DAT," a : ",HEURE,?30,"*** RESULTATS DE REQUETE ***",!,!,LSTAR
 S NUREQ=NUREQ+1,LG=-1 F LL=1:1 S LG=$N(^POSREQ(DOLARI,PAGE,LG)) Q:LG=-1  U IMPR W !,"| ",^POSREQ(DOLARI,PAGE,LG),?79,"|"
 U IMPR W !,LSTAR,# Q
TIT S PAG="Page : "_PAGE_"/"_NBPAG U IMPR W !," Le : ",%DAT," a : ",HEURE,?30,"RESULTATS DE LA REQUETE No ",NUREQ,?63,PAG,!,!
 Q

