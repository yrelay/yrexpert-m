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

;TOCHEMPF^INT^1^59547,74871^0
TOCHEMPF ;
 
 D CLEPAG^%VVIDEO S DXD=39,DXG=0,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("CHEMIN(S) ENTRE 2 COMPOSANTS") D TO4^%VZCD
LECP S DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Pere : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LECP S THE("YA")=Y1 I '($D(^[QUI]NOMENC(THE("YA")))) D ^%VSQUEAK G LECP
LECF S DX=0,DY=10 D CLEBAS^%VVIDEO W $$^%QZCHW("Fils : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LECP S THE("FIS")=Y1
LECS S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=12 X XY W $$L19^%QSLIB1 S DX=$X D ^TOLECONE G:CTRLA!CTRLF FIN S THE("SUP")=Y1 G:Y1="" LECS S THE("LILIM")=21,THE("IMPR")=0
 S DX=0,DY=6 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant...")
 I THE("SUP")="I" S THE("LILIM")=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS),1:62) S:$D(^TABIDENT(WHOIS,"PRINTER")) THE("IMPR")=^TABIDENT(WHOIS,"PRINTER")
 K ^AFFPAG($I),^DEJAVU($I) S EGAP=0,THE("LI")=50,THE("NBCH")=0,THE("RAC")=THE("YA"),THE("TOTAB")="^[QUI]NOMENC(THE(""RAC""))",THE("IPI")=1,COMP=-1,PILC(0)=THE("YA"),^DEJAVU($I,THE("YA"))=1
GET S COMP=$N(@THE("TOTAB")@(COMP)) G:COMP=-1 SUIT D ^%ABSIDEN G:$D(^DEJAVU($I,COMPID)) SUIT
 I COMPID=THE("FIS") D STOCH G SUIT
 S PILC(THE("IPI"))=COMPID,^DEJAVU($I,COMPID)=1
 S THE("IPI")=THE("IPI")+1,THE("RAC")=COMPID,COMP=-1 G GET
SUIT K PILC(THE("IPI")) S THE("IPI")=THE("IPI")-1 G:('($D(PILC(THE("IPI")))))!(THE("IPI")=0) FIN S THE("RAC")=PILC(THE("IPI")-1),COMP=PILC(THE("IPI")) K ^DEJAVU($I,COMP) G GET
STOCH S THE("OK")=0,THE("NBCH")=THE("NBCH")+1,THE("LIGNE")=$$^%QZCHW("CHEMIN No ")_THE("NBCH")_" :"_THE("YA") F THE("VV")=1:1 Q:'($D(PILC(THE("VV"))))  S THE("CMP")=PILC(THE("VV")) D PRESTO
 S THE("OK")=1,THE("CMP")=THE("FIS") D PRESTO S THE("LIGNE")="" D STO
 Q
PRESTO I (($L(THE("LIGNE"))+$L(THE("CMP")))+1)>79 D STO S THE("LIGNE")=""
 S THE("LIGNE")=THE("LIGNE")_" => "_THE("CMP") D:THE("OK") STO
 Q
STO S THE("LI")=THE("LI")+1 I THE("LI")>21 S EGAP=EGAP+1,THE("LI")=8
 S ^AFFPAG($I,EGAP,THE("LI"))=THE("LIGNE")
 Q
FIN I $D(^AFFPAG($I)) D @THE("SUP") G FIN1
 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Il n'y a pas de chemin entre "),THE("YA"),$$^%QZCHW(" et "),THE("FIS")
FIN1 K ^AFFPAG($I),^DEJAVU($I),THE,COMP,COMPID,PILC Q
E D ^TOPAGIN Q
I S THE("DOLARI")=$I D ZD^%QMDATE4,^%QMDAK0 O THE("IMPR"):(132) U THE("IMPR")
 F THE("P")=1:1 Q:'($D(^AFFPAG(THE("DOLARI"),THE("P"))))  D ENTET F THE("LI")=8:1 Q:'($D(^AFFPAG(THE("DOLARI"),THE("P"),THE("LI"))))  W !,^AFFPAG(THE("DOLARI"),THE("P"),THE("LI"))
 C THE("IMPR") Q
ENTET W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,$$^%QZCHW("    *** CHEMIN(S) ENTRE 2 COMPOSANTS ***"),?65,$$^%QZCHW("Page : "),THE("P"),!,!
 Q

