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

;TOP0AFFC^INT^1^59547,74873^0
TOP0AFFC ;
 
 Q:'($D(^GLOCLI($I)))  K ^GLOCLI($I,"tous"),^DEBPAG($I) S DX=0,DY=5 D CLEBAS^%VVIDEO
LECSUP S DX=0,DY=12 X XY W $$L19^%QSLIB1 S DX=$X-1 D ^TOLECONE G:CTRLA!CTRLF FIN S SUP=Y1 I (Y1'="E")&(Y1'="I") D ^%VSQUEAK G LECSUP
BEG S IMPR=0,LILIM=20,DOLARI=$I D CLEPAG^%VVIDEO G:SUP="I" IMPR D 132^%VVIDEO
 S %FIN=0,ARC=-1 F %AA=1:1 S ARC=$N(^GLOCLI($I,ARC)) Q:ARC=-1  K ^DEBPAG($I) S ^DEBPAG($I,1,ARC)=$N(^[QUI]CLICHE(ARC,-1)),NPAG=1 D AFF,SUIT Q:%FIN=1
 G END
SUIT D POCLEPA^%VVIDEO W $$L17^%QSLIB1("(CTRLF):Fin du cliche") S PAG="Page "_PAGE
 S DX=65-($L(PAG)\2),DY=0 X XY W PAG S DX=$X-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 D AFF G SUIT
1 S %FIN=1 Q
6 Q
43 G 67
45 S NPAG=PAGE-1 D AFF G SUIT
61 G 67
67 S NPAG=PAGE+1,ODERLG=DERLG,DERLG=$N(^[QUI]CLICHE(ARC,DERLG)) I DERLG'=-1 S ^DEBPAG(DOLARI,NPAG,ARC)=DERLG G 671
 S OARC=ARC,ARC=$N(^GLOCLI(DOLARI,ARC)) I ARC=-1 S ARC=OARC,DERLG=ODERLG D ^%VSQUEAK,POCLEPA^%VVIDEO W "Plus d'autres cliches selectionnes..." H 2 G SUIT
 S DERLG=$N(^[QUI]CLICHE(ARC,-1)),^DEBPAG(DOLARI,NPAG,ARC)=DERLG
671 D AFF G SUIT
AFF I '($D(^DEBPAG(DOLARI,NPAG))) D ^%VSQUEAK Q
 S ARC=$N(^DEBPAG(DOLARI,NPAG,-1)),PAGE=NPAG,DX=0,DY=1,BEG=^DEBPAG(DOLARI,PAGE,ARC) D CLEBAS^%VVIDEO O 0
AFF1 F LI=1:1:LILIM U IMPR W ^[QUI]CLICHE(ARC,BEG),! S OBEG=BEG,BEG=$N(^[QUI]CLICHE(ARC,BEG)) Q:BEG=-1
 S DERLG=BEG S:BEG=-1 DERLG=OBEG Q
END D:SUP="E" 80^%VVIDEO K ^GLOCLI($I),^DEBPAG($I),PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W " " D NORM^%VVIDEO Q
FIN Q
IMPR S DX=0,DY=6,LILIM=60 D CLEBAS^%VVIDEO W "Impression en cours..." S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 D ZD^%QMDATE4,^%QMDAK0 O IMPR
 S ARC=-1 F A=1:1 S ARC=$N(^GLOCLI(DOLARI,ARC)) Q:ARC=-1  S DERLG=-1 F L=1:1 S BEG=$N(^[QUI]CLICHE(ARC,DERLG)) D AFF1 U IMPR W # Q:BEG=-1
 U IMPR W ! C IMPR G END

