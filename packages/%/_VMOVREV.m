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
;! Nomprog     : %VMOVREV                                                     !
;! Module      : VIDEO                                                        !
;! But         : Gestion des mouvements de flèches                            !
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
;! HL003 ! HL     ! 08/07/12 ! PB saut de ligne                               !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VMOVREV ;
 N ZB
 
 D CLEAR^%SYSUTI1
 S:'($D(IOM)) IOM=80 D ECHOFF^%VVIDEO
 S:'($D(REVID)) REVID=0 I '($D(VID)) K VID F %U="NORM","BLD","REV" S VID(REVID,%U)=%U_"^%VVIDEO"
LOOP1 I '($D(@TBMOV)) S X1=1 G FIN
 D CUROF^%VVIDEO
LOOP I $D(@TBMOV@(DY,DX)) S LIB=@TBMOV@(DY,DX),ODX=DX,ODY=DY X XY D WRITR S %MC=ODX_"^"_ODY_"^"_$TR(LIB,"#",""),DX=ODX,DY=ODY X XY D:$D(@T5@(DY,DX)) COM(DY,DX) S DX=ODX,DY=ODY X XY
 
 ;HL002 R *X1:^TOZE($I,"ATTENTE")
 ;;HL001 S X1=$$^%VTOUC("")
 R *X1:^TOZE($I,"ATTENTE") S X1=$$^%VCONVT(X1)
 
 S (X2,X3)=""
 ;HL002 G:$$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) FLEC
 I ($A($ZB)=27)&($$FLECHE^%INCCLAV(X1,.X1,.X2,.X3)) G FLEC
 D TOUCHE^%INCCLAV(X1,.X1)
 I X1=-1 S X1=1 G FIN
 G:X1=27 27 I X1=32 D REP,67 G LOOP
 D CURON^%VVIDEO X XY G FIN
27 G:MODTM BELL
 R *X2
 G:X2=91 271
 G BELL
271 R *X3
 G:(X3<48)!(X3>57) BELL
272 R *X3
 S X3=$C(X3)
 G:X3="~" BELL
 G 272
FLEC G FIN:(X2=27)!(X3=27) I (((X1'=27)!(X2'=91))!(X3'>64))!(X3'<69) D ^%VSQUEAK G LOOP
 D REP,@X3 G LOOP
BELL D ^%VSQUEAK G LOOP
FIN D ECHON^%VVIDEO Q
66 S DX=DX-1
661 S DY=$O(@TBMOV@(DY)) G:DY="" 661
67 S DX=$O(@TBMOV@(DY,DX)) G:DX="" 661 G TEST
65 S DX=DX+1
651 S DY=$ZP(@TBMOV@(DY)) G:DY="" 651
68 S DX=$ZP(@TBMOV@(DY,DX)) G:DX="" 651 G TEST

TEST I $D(@TBMOV@(ODY,ODX)) S LIB=@TBMOV@(ODY,ODX),NDX=DX,NDY=DY,DX=ODX,DY=ODY X XY D WRIT S DX=NDX,DY=NDY
 Q
WRIT S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S AX=$X,AY=$Y D:(%X#2)=1 @VID(REVID,"BLD") D:(%X#2)=0 @VID(REVID,"NORM") S DX=AX,DY=AY X XY
 D @VID(REVID,"NORM") Q
WRITR D @VID(REVID,"REV") X XY S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S AX=$X,AY=$Y D:(%X#2)=1 @VID(REVID,"BLD") D:(%X#2)=0 @VID(REVID,"NORM"),@VID(REVID,"REV") S DX=AX,DY=AY X XY
 D @VID(REVID,"NORM") Q
COM(AY,AX) ;Affiche le commentaire correspondant a la ligne du menu
 S EQ=@T5@(AY,AX),%EQI=@T6
 D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3))
 D ^%VCRIFLD(EQ,$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) S $P(@T6,"^",4)=$L(EQ) Q
REP S ODX=DX,ODY=DY Q

