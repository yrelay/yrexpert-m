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

;TOSPRDUP^INT^1^59547,74875^0
TOSPRDUP ;
 
 D CADRE
QUES S CHX=1
 K ^TACOMPIL($I) G:CHX=2 CH2 F UU=1:1:1 S ^TACOMPIL($I,UU)=1
Q2 S DX=0,DY=6 D CLEBAS^%VVIDEO
 S DX=0,DY=10 X XY W "Vous voulez dupliquer le SF de quel article : " S DX=10,DY=12 X XY W "- " S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") QUES S PCH=Y1 D REC G:REF=1 Q2 S DX=10,DY=12 X XY W "- ",PCHCOMP S OART=PCHCOMP
Q3 S DX=0,DY=13 D CLEBAS^%VVIDEO S DX=0,DY=14 X XY W "Nom du nouvel Article : " S DX=10,DY=16 X XY W "- " S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") Q2 S PCH=Y1 D REC G:REF=1 Q3 S DX=10,DY=16 X XY W "- ",PCHCOMP S ART=PCHCOMP
Q4 S DX=0,DY=6 D CLEBAS^%VVIDEO
 W "   Pendant la duplication, s'il existe du Savoir-Faire concernant",!,?40-($L(ART)\2),ART,!,"le supprime-t-on (O/N/(A)bandon) ? " R *REP S REP=$C(REP) G:(REP'="O")&((REP'="N")&(REP'="A")) Q4 I REP="A" S DX=0,DY=6 D CLEBAS^%VVIDEO G Q3
 S %DEL=REP,NU=-1 K ^COMPILVU($I),^TABVU($I) S DX=0,DY=6 D CLEBAS^%VVIDEO
LNU S NU=$N(^TACOMPIL($I,NU)) G:NU=-1 END S BAT=$P($T(@NU),";;",2),TB=$P(BAT,"/",1),BAT=$P(BAT,"/",2) G:NU=18 TRIP
 F UU=1:1 S TBT=$P(BAT,",",UU) Q:TBT=""  Q:$D(^TABVU($I,TBT))  S ^TABVU($I,TBT)=1 K:%DEL=1 @("^[QUI]"_TBT_"("""_ART_""")") S ADR="TRAIT^TODUPSF",NOMTAB="^[QUI]"_TBT_"("""_OART_"""" D ^%VTENR
 G LNU
TRAIT S:$E(TBT,1,2)'="FL" ^COMPILVU($I,TB)=1 W "-" S RS=@NOM,P1=$P(NOM,OART,1),P2=$P(NOM,OART,2),NNOM=P1_ART_P2,@NNOM=RS
FIN Q
END D CLEPAG^%VVIDEO,CADRE S DX=0,DY=6 X XY W "Duplication de ",OART,!,"en ",ART,!,!,?30,"a ete duplique : ",!,!
 I '($D(^COMPILVU($I))) W "Aucun Savoir-Faire !" G FINI
 S VV=-1 F UU=1:1 S VV=$N(^COMPILVU($I,VV)) Q:VV=-1  W ?(((UU-1)#2)*40)+10,VV I (UU#2)=0 W !
FINI D POCLEPA^%VVIDEO W "[RETURN] " R *RET:60 Q
REC S REF=0 D ^%LXABR I CONCUR=0 S M1="Inconnu",REF=1 G REC1
 I CONCUR>1 S M1="Ambigu",REF=1 G REC1
 I $D(^[QUI]TOSYNONY(PCHCOMP)) S M1="Synonyme de "_$N(^[QUI]TOSYNONY(PCHCOMP,-1)),REF=2 G REC1
REC1 I REF=0 G FIN
 D POCLEPA^%VVIDEO W "(L)exique,(B) consultation breve" R *REP S REP=$C(REP) G:(REP'="L")&(REP'="B") FIN G @REP
L D CLEPAG^%VVIDEO,^%VAJOUT("LEXIQUE"),CLEPAG^%VVIDEO,CADRE G FIN
B D ^%LXCONS,CLEPAG^%VVIDEO,CADRE G FIN
CADRE D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Duplic. parametres associes aux oper." D TO4^%VZCD G FIN
1 ;;Parametres associes aux operations/SPROPARA,FLSPROPA,SPROPVAL,FLSPROPV

