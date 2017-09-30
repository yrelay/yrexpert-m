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

;TOTBEDIT^INT^1^59547,74876^0
TOTBEDIT ;
 S LIG="                  ",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("RESULTATS ETUDES CHAINAGE ARRIERE") D CLEPAG^%VVIDEO,TO4^%VZCD
LEC S DX=10,DY=14 D CLEBAS^%VVIDEO W $$^%QZCHW("No de l'etude a editer : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN S %ETUD=Y1 G:%ETUD="" FIN G:"?.*"[$E(%ETUD,$L(%ETUD)) LISTET G:'($D(^[QUI]TOIVANTE(0,%ETUD))) LEC
 S %ART=$N(^[QUI]TOIVANTE(0,%ETUD,-1)) D ^TOTBEDET G TOTBEDIT
FIN K ^LISTAFF($I),DXD,DXG,DYB,DYH,E,EGAP,EI,GRAPH,MSG,POSY Q
LISTET I (%ETUD="?")!(%ETUD="*") S (E,EI)="MET" G SUIT
 S (E,EI)=$E(%ETUD,1,$L(%ETUD)-1)
SUIT K ^LISTAFF($I) S TIT=$$^%QZCHW("  No d'etude  Article"),%CH=$$^%QZCHW("Date"),%LGR=55-$L(TIT) D ^%QZCHBK S TIT=TIT_%CH_$$^%QZCHW("     Debut    Fin"),DX=0,DY=6 D CLEBAS^%VVIDEO W TIT
 S EGAP=0,POSY=21 F %EEII=1:1 S E=$N(^[QUI]TOIVANTE(0,E)) Q:E'[EI  S TART=$N(^[QUI]TOIVANTE(0,E,-1)) Q:TART=-1  D STO R *ARR:0 D TOUCHE^%INCCLAV(ARR,.ARR) Q:ARR=1
 G:$D(^LISTAFF($I)) FSUIT
 S TART=-1 F %EEII=1:1 S TART=$N(^[QUI]TOIVANTE(1,TART)) Q:TART=-1  I TART[EI S E=-1 F %EE=1:1 S E=$N(^[QUI]TOIVANTE(1,TART,E)) Q:E=-1  D STO R *ARR:0 D TOUCHE^%INCCLAV(ARR,.ARR) Q:ARR=1
 I '($D(^LISTAFF($I))) D POCLEPA^%VVIDEO W $$^%QZCHW("Aucune etude ne correspondt a votre demande... [RETURN]") R *BIDON G TOTBEDIT
FSUIT S %PROGTR="^TOTBPED" D ^TOAFFPAG G TOTBEDIT
STO Q:'($D(^[QUI]TOIVANTE(0,E,TART,0)))
 S RESU=^[QUI]TOIVANTE(0,E,TART,0),POSY=POSY+1
 I POSY>21 S POSY=8,EGAP=EGAP+1,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?65,$$^%QZCHW("Page : "),EGAP S DX=0,DY=7 X XY
 S LIGNE=E,%CH=$E(TART,1,38),%LGR=1+$L(%CH) D ^%QZCHBK S LIGNE=LIGNE_%CH,%CH=$P(RESU,"^",2),%LGR=57-$L(LIGNE)
 D ^%QZCHBK S LIGNE=LIGNE_%CH,%CH=$P(RESU,"^",3),%LGR=(%LGR+7)-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_" "_%CH,%CH=$P(RESU,"^",4),%LGR=(%LGR+7)-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_" "_%CH,^LISTAFF($I,EGAP,POSY)=LIGNE
 W !,LIGNE Q

