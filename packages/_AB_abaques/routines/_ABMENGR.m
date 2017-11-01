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
;! HL002 ! HL     ! 01/11/17 ! Si la globale ^["YXP"]STRUCT n'existe pas      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABMENGR^INT^1^59547,73864^0
ABMENGR ;
 
 
 
 
 
 K ^PILABAC($J)
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) D ^%ABGRCNS Q
DEB K ^PILABAC($J),^COLDUP($I),^PLUCOL($I)
 S ^PILABAC($J)=0,%UCI=^TABIDENT($I,"%UCI")
 S %LIST=0,QUCOM=%UCI,(QUW,QUS,QU)=QUI,%DOS=0,%SUIV=0,%OWN=1
 D CLEPAG^%VVIDEO S DX=0,DY=22 X XY
 W $$^%QZCHW("Nom de l'abaque (ou CTRLE:abaques deja Existantes)")," : " D POCLEPA^%VVIDEO W "- "
 S (DXD,DX)=$X D ^%VLEC G:CTRLE=1 LIST G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN
 S NOMG=Y1 I NOMG="?" D LISTE^%ABDELGR G DEB
 S PARA=NOMG D ^%QZCHBT
 S NOMG=PARA,DX=DXD,DY=$Y X XY W NOMG
 S $ZT="G ERRSTRUCT",NUL=^[QUCOM]STRUCT(NOMG) ;HL002
 ;HL002 S NOMG=PARA,DX=DXD,DY=$Y X XY W NOMG G:$D(^[QUCOM]STRUCT(NOMG)) UVW
 S $ZT="" G:$D(^[QUCOM]STRUCT(NOMG)) UVW
ERRSTRUCT S $ZT=""
 I '($D(^[QU]STRUCT(NOMG))) D ^%ABGRABR G:'($D(^[QUI]TOLEX(NOMG))) DEB
UVW S CONT=1 D CONT^%ABSUISF G:CONT=0 DEB
 S NOMGC=NOMG_"/COMMENT" K ^CUMUL($I,NOMG)
 D ^%ABGTPAR,CLEPAG^%VVIDEO
QUES K GRS S %CONSUN=0
 D POCLEPA^%VVIDEO W $$^%QZCHW("(P)remiere saisie d'une abaque,(C)ompleter une abaque ") R *REP D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP=1)!(REP=6) ABMENGR G:(REP'=$A("C"))&(REP'=$A("P")) QUES
 G @$C(REP)
P S %KN=0,%EXIS=0 D POCLEPA^%VVIDEO,^%ABAJGRI
 G:%EXIS=1 QUES G:%KN=1 C2
 I ABENDSCR=1 D CLEPAG^%VVIDEO G:%SUIV=1 FIN G QUES
 S DE=5,FI=18 D ^%ABNETTO,^%ABGETDP,POCLEPA^%VVIDEO
 S DP=^[QUW]OCGRIL(NOMG),DPCH=DP D ^%ABDPFIR,FREQ^%ABAFGRI
 D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D PGE^%ABGRPAG,AFFICH^%ABGRPAG
 S DX=10,DY=$O(^NEXSAIS($I,NOMG,"P",%DH,"")) X XY
 D ^%ABREMGR G:%SUIV=1 FIN G SUIV
C D ^%ABCMSGR S:'($D(IFIN)) IFIN=0
 I (ABENDSCR=1)!(IFIN=1) D CLEPAG^%VVIDEO G QUES
C2 K GRS,GRC S DE=5,FI=18 D ^%ABNETTO
 
 S:($D(^[QUW]OCGRIL(NOMG))#10)=0 ^[QUW]OCGRIL(NOMG)=1
 S DP=^[QUW]OCGRIL(NOMG),DPCH=DP D ^%ABDPFIR,^%ABDERDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG,AFFICH^%ABGRPAG
QUES2 
65 D LIGBA
 S DX=$S(DP=DERDP:OLDPX,1:10),DY=$O(^NEXSAIS($I,NOMG,"P",%DH,"")) X XY
 D AJ^%ABREMGR S DY=DY+1 X XY Q:%LIST=1
 G SUIV
43 D MORE^%ABCALDP,^%ABAFGRI,^%ABEMPGR G QUES2
45 G:DP=^[QUW]OCGRIL(NOMG) QUES2
 D LESS^%ABCALDP,^%ABAFGRI,^%ABEMPGR G QUES2
 
FIN Q
 
LIST S %LIST=1,TIT=$$^%QZCHW("Saisie-consultation d'abaques")
 S PROGTRA="FIN^%ABMENGR" D ^%ABPRESA
 S %IP=-1,GRS=^PILABAC($J)
 F %I1=1:1 S %IP=$N(^TACOMPIL($I,%IP)) Q:%IP=-1  S %IL=-1 F %I2=1:1 S %IL=$N(^TACOMPIL($I,%IP,%IL)) Q:%IL=-1  S GRS=GRS+1,^PILABAC($J,GRS)=^TACOMPIL($I,%IP,%IL)
 S ^PILABAC($J)=GRS G SUIV
 
LIGBA D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire ")
 D AFFICH^%ABGRPAG G FIN
 
SUIV S GRS=^PILABAC($J)
 I GRS=0 G DEB
 S REF=^PILABAC($J,GRS),^PILABAC($J)=GRS-1 K ^PILABAC($J,GRS)
 D BEG^%ABGRGRI G C2

