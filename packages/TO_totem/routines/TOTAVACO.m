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

;TOTAVACO^INT^1^59547,74875^0
TOTAVACO ;
 
 K ^POSENR($I),^POSFUL($I) S LG=7,PAGE=1,NRO=-1,OK=1
 Q:'($D(^%ANT($I)))
 F NNN=1:1 S NRO=$N(^%ANT($I,NRO)) Q:NRO=-1  S ETUD=^%ANT($I,NRO),TYPE=-1 D TRAIT
 G FIN
TRAIT S NU=-1 F NNU=0:1 S NU=$N(^%ANT($I,NRO,NU)) Q:NU=-1  F TTT=1:1:2 S TYPE=$N(^%ANT($I,NRO,NU,TYPE)) Q:TYPE=-1  S:TYPE="A" ART=^%ANT($I,NRO,NU,TYPE) D:TYPE="A" TET F NO=0:1 Q:'($D(^%ANT($I,NRO,NU,TYPE,NO)))  S %LN=1 D DEBTAB,INC,LG1,LOST,LOOP
 Q
FIN K TYPE,NNU,ART,NRO,NU,NO,PARAM,PPP,NNN,ETU,ETUD,EEE,LIN1,DEB,ETD,ET Q
LOOP S PARAM=-1 F PPP=1:1 S PARAM=$N(^%ANT($I,NRO,NU,TYPE,NO,PARAM)) Q:PARAM=-1  D INC S ETU=-1 D LOOP2,LOST
 Q
LOOP2 F EEE=1:1 S ETU=$N(^%ANT($I,NRO,NU,TYPE,NO,PARAM,ETU)) Q:ETU=-1  S PAR=^%ANT($I,NRO,NU,TYPE,NO,PARAM,ETU) S:EEE=1 ^POSENR($I,PAGE,LG)="|"_"^"_$P(PAR,"^",1)_"^"_"|" D TAB I ((LG>8)&(EEE=1))&(OK=1) S OK=0,^POSFUL($I,PAGE)=$P(PAR,"^",1)_"^"_ETU
 Q
TAB S ^POSENR($I,PAGE,LG)=^POSENR($I,PAGE,LG)_"^"_$P(PAR,"^",2)_"^"_"|" Q
LG1 S LIN1=$S(TYPE="A":$$^%QZCHW("ARTICLE"),1:$$^%QZCHW("MATIERE")),LIN1="|"_"^"_LIN1_"^"_"|"
 S DEB=(NO*6)+1 F ETD=DEB:1:DEB+5 S ET=$P(ETUD,"^",ETD),LIN1=LIN1_"^"_$E(ET,4,999)_"^|"
 S ^POSENR($I,PAGE,LG)=LIN1 Q
INC S LG=LG+1 I LG'<21 S LG=8,PAGE=PAGE+1,OK=1
 Q
DEBTAB D INC S ^POSENR($I,PAGE,LG)="",%LN=%LN+1 G:%LN'>2 DEBTAB
LOST D INC S ^POSENR($I,PAGE,LG)="LOSTAR" Q
TET D INC S ^POSENR($I,PAGE,LG)="LOSTARTET" D INC S ^POSENR($I,PAGE,LG)=$$^%QZCHW("TITRE^")_ART D LOST Q

