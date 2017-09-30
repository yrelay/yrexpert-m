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

;TOP0KFLI^INT^1^59547,74874^0
TOP0KFLI ;
 
 D CLEPAG^%VVIDEO S DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="SUPPRESSION DE FICHES DE LIAISONS" D TO4^%VZCD
LEC S DX=0,DY=6 D CLEBAS^%VVIDEO W "OK pour la suppression de fiches de liaisons (O/N) ? " R *REP G:REP=78 FIN I REP'=79 D ^%VSQUEAK G FIN
 W !,"Tous (O/N) :" R *TOUS S DX=0,DY=5 D CLEBAS^%VVIDEO G:TOUS'=79 LECNUM W "Suppression en cours..." S ARC=-1 F %AA=1:1 S ARC=$N(^[QUI]PSRLFILI(ARC)) Q:(ARC="z")!(ARC=-1)  D KILL1 W "."
 G FIN
LECNUM W !,"Numero ARC : " S DX=$X-1,DY=$Y D ^%VLEC G:CTRLA!CTRLF FIN
 G:Y1="" KILL I $D(^[QUI]PSRLFILI(Y1)) S ^FLASUP($I,Y1)=1 G LECNUM
 D ^%VSQUEAK W " ???" G LECNUM
KILL S DX=0,DY=6,ARC=-1 D CLEBAS^%VVIDEO F %AA=1:1 S ARC=$N(^FLASUP($I,ARC)) Q:ARC=-1  D KILL2
FIN K ^FLASUP($I),VALCLE,ADR,NOMTAB,REP,TOUS,NUMD,NUMF,NC,NUMCLI,NUMSUP,GRAPH,DXD,DXG,DYH,DYB,MSG,DEV,ARC,B2,B3,B4,%RS,%NUM,%NUM2,%NOM,%NOM1,%NOM2,%NOM3,%NOM4
 Q
KILL2 S DX=0,DY=12 D CLEBAS^%VVIDEO W "Suppression de la fiche correspondant a l'ARC No ",ARC," (O/N) ? " R *REP Q:REP'=79
KILL1 K ^[QUI]PSRLFILI(ARC),^[QUI]PSRLPARF(ARC),^[QUI]PSRLRTES(ARC) Q

