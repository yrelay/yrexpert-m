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

;%ABGRCNS^INT^1^59547,73864^0
%ABGRCNS ;
 
 G LIST
DEB K ^COLDUP($I),^PLUCOL($I) S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI,(QUW,QUS,QU)=QUI,%DOS=0,%SUIV=0,%OWN=1 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Nom de l'abaque : ") S (DXD,DX)=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S NOMG=Y1 I NOMG="?" D LISTE^%ABDELGR G DEB
 S PARA=NOMG D ^%QZCHBT S NOMG=PARA,DX=DXD,DY=$Y X XY W NOMG G:$D(^[QUCOM]STRUCT(NOMG)) UVW
 I '($D(^[QU]STRUCT(NOMG))) D ^%ABGRABR G:'($D(^[QUI]TOLEX(NOMG))) DEB
UVW S CONT=1 D CONT^%ABSUISF G:CONT=0 DEB
 S NOMGC=NOMG_"/COMMENT" D ^%ABGTPAR,CLEPAG^%VVIDEO
QUES S %CONSUN=1 G C
C D ^%ABCMSGR S:'($D(IFIN)) IFIN=0 I (ABENDSCR=1)!(IFIN=1) D CLEPAG^%VVIDEO G FIN
C2 S DE=3,FI=18 D ^%ABNETTO S:'($D(^[QUW]OCGRIL(NOMG))) ^[QUW]OCGRIL(NOMG)=1 S DP=^[QUW]OCGRIL(NOMG),DPCH=DP D ^%ABDPFIR,^%ABDERDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG,AFFICH^%ABGRPAG
65 D LIGBA S DX=$S(DP=DERDP:OLDPX,1:10),DY=4 X XY D PAGE S DY=DY+1 X XY
FIN Q
LIGBA D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire ") D AFFICH^%ABGRPAG G FIN
PAGE D READ G @PGQ
ABPAG D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D PGE^%ABGRPAG,AFFICH^%ABGRPAG S DX=10,DY=4 X XY G @ADR
PGNUM S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) PAGE S PGE=Y1 D DP^%ABGRPAG,^%ABAFGRI,^%ABEMPGR G PAGE
43 D MORE^%ABCALDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG G PAGE
45 G:DP=^[QUW]OCGRIL(NOMG) PAGE D LESS^%ABCALDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG G PAGE
READ S PGQ="PGNUM",AFTIM=0 D POCLEPA^%VVIDEO W $$^%QZCHW("+,-,page,CTRLZ:Comment.<->Val.,CTRLB:Balay.+unites ")
 D AFFICH^%ABGRPAG W " ?" S DX=XCU,AFTIM=1 X XY D ^%VLEC S:(CTRLA=1)!((CTRLF=1)!(Y1="")) PGQ="END" S:CTRLZ=1 PGQ="COM" S:CTRLB=1 PGQ="BALAY" S:(Y1="+")!(Y1=$$^%QZCHW("-")) PGQ=$A(Y1) S:Y1="=" PGQ=$A("+")
 Q
COM G:NOMGC="zzzzzz" RES S COLC=($X-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,%DX=DXC,%DY=$Y
 S ODP=DP,ONOMG=NOMG,NOMG=NOMGC,ONOMGC=NOMGC,NOMGC="zzzzzz",^[QUW]OCGRIL(NOMG)=DP D ^%ABGTPAR S DP=ODP,PSEP=0 D ^%ABAFGRI,^%ABEMPGR S DX=0,DY=10 D BLK^%VVIDEO,BLD^%VVIDEO X XY W $$^%QZCHW("Comment.") D NORM^%VVIDEO S DX=DXC,DY=4 X XY G PAGE
RES S DX=0,DY=10 X XY W "        " S NOMG=ONOMG,NOMGC=ONOMGC D ^%ABGTPAR S DP=ODP D ^%ABAFGRI,^%ABEMPGR S DX=%DX,DY=%DY X XY G PAGE
END G:NOMGC="zzzzzz" RES Q
BALAY S %LL="",AW="partie basse",%V=$$^%QZCHW("P") D SSMEN^%ABMOCUR,^%ABAFGRI,^%ABEMPGR G PAGE
LIST S %LIST=1,TIT=$$^%QZCHW(" Consultation d'abaques"),PROGTRA="FIN^%ABGRCNS" D ^%ABPRESA G:'($D(^TACOMPIL($I))) FIN
 S %IP=-1 F %I1=1:1 S %IP=$N(^TACOMPIL($I,%IP)) Q:%IP=-1  S %IL=-1 F %I2=1:1 S %IL=$N(^TACOMPIL($I,%IP,%IL)) Q:%IL=-1  D ^%ABGRGRI I '(ABENDSCR) D C2
 G LIST

