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

;TOPTGDES^INT^1^59547,74874^0
TOPTGDES ;
 
 S:'($D(%9VISIN)) %9VISIN=0
 D CLEPAG^%VVIDEO,^%PBPZGRA S %FONC="INIT" D ^%PBPZ,^PTCADRE,^PTCADECH
 S %FONC="PRENDRE" D ^%PBPZ
BEG D:%9XES["?" LIMES,PECH S %9FCV=%9XES,%9EEE=0
 
 S %9TL="F"
L0 K CTRLA,Y1,%9EE D ^%PBPZALF,POCLEPA^%VVIDEO,REV^%VVIDEO
 W "Votre Commande  (ou CTRLH aide memoire) : " D ^%PBPZGRA,^PTPOSCUR
 F I=1,2,4,8,18,65,67,68,69,70,71,73,76,77,80,81,82,83,84 G:I=%9EE @I
 D ^%VSQUEAK G L0
1 D ^%PBPZALF,NORM^%VVIDEO,^%PBPZGRA
 K I,%9FCV,%9X,%9Y,%9XA,%9XC,%9XAC,%9XD,%9YA,%9YC,%9YAC,%9YD,%9HX,%9HY,%9EX,%9LX,%9LY,%9Y1S,%9E,%9Y2S,%9X1S,%9X2S,%9EE,%9EEE,%9MSGE,%9TL Q
2 S %9SAUVTL=%9TL D ^PTGOBIBL S %9TL=%9SAUVTL G L0
4 S MSG="demi ellipse" D MSGCOL,^PTDEMELI S MSG="demi ellipse" D EFF G L0
8 D ^PTHELP G L0
18 S %9SAUVTL=%9TL D ^PTREMGRA S %9TL=%9SAUVTL K %9SAUVTL G L0
65 S MSG="arc de cercle" D MSGCOL,^PTARCERC
 S MSG="arc de cercle" D EFF G L0
67 S MSG="cercle" D MSGCOL,^PTCERCLE S MSG="cercle" D EFF G L0
68 S MSG="droite" D MSGCOL,^PTLIBDTE S MSG="droite" D EFF G L0
69 S MSG="ellipse" D MSGCOL,^PTELIPS S MSG="ellipse" D EFF G L0
70 G 1
71 S %9SAUVTL=%9TL,MSG="gomme" D MSGCOL,^PTGOMME S MSG="gomme" D EFF
 S %9TL=%9SAUVTL K %SAUVTL G L0
73 S %9VISIN='(%9VISIN) G 82
76 D ^PTTYPLIN G L0
77 S MSG="mesure" D MSGCOL,^PTMESURE S MSG="mesure" D EFF G L0
79 D ^PTSYMTRI G L0
80 S MSG="point" D MSGCOL,^PTLIBPTS S MSG="point" D EFF G L0
81 D ^%PBPZALF,NORM^%VVIDEO,POCLEPA^%VVIDEO,^TOLECONE G:Y1'="Q" 81 G L0
82 S REP="C",%9SAUVTL=%9TL D ^TOPTVIEW S %9TL=%9SAUVTL K %9SAUVTL G L0
83 S MSG="espace a definir" D MSGCOL,^PTESPACE
 S MSG="espace a definir" D EFF G L0
84 S MSG="texte" D MSGCOL,^PTPOSTEX S MSG="texte" D EFF G L0
88 D ^PTSYMTRI G L0
89 D ^PTSYMTRI G L0
MSGCOL D ^%PBPZALF,NORM^%VVIDEO
 S PHB="B",DXC=79,DYC=22,REV=0 D ^TONRPMS,REV^%VVIDEO Q
EFF D ^%PBPZALF,NORM^%VVIDEO
 S PHB="B",DXC=79,DYC=22 D EFF^TONRPMS,REV^%VVIDEO Q
LIMES D ^%PBPZALF,REV^%VVIDEO
MM D POCLEPA^%VVIDEO W "1000 sur l'ecran correspond en MM a : " S DX=$X D ^%VLEC
 G:Y1="" MM S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) MM G:Y1=0 MM
 S %9XES=1000/Y1,%9ZES=Y1 Q
PECH D NEW^PTPOSMSG(400,2920,"     ",":"),NEW^PTPOSMSG(400,2920,Y1_"mm",":")
 S:'($D(%9ECHX)) %9ECHX=%9ECH
 I ($D(^[QUI]GRAPHE(%9GR,%9VER))#10)=1 S %9RS=^[QUI]GRAPHE(%9GR,%9VER),$P(%9RS,"^",5)=%9XES,$P(%9RS,"^",6)=%9ZES,^[QUI]GRAPHE(%9GR,%9VER)=%9RS K %9RS Q
 S %9RS="",$P(%9RS,"^",1)=%9ECHX,$P(%9RS,"^",2)=%DAT,$P(%9RS,"^",3)=%DAT,$P(%9RS,"^",5)=%9XES,$P(%9RS,"^",6)=%9ZES,^[QUI]GRAPHE(%9GR,%9VER)=%9RS K %9RS Q

