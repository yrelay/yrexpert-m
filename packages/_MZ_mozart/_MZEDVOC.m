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

;%MZEDVOC^INT^1^59547,73871^0
MZEDVOC ;
 
 
 
 
 N TEMP,DEV,LONG,STOP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SELECTION"),LONG=0
 S VOC=$$CONCAS^%QZCHAD(TEMP,"VOCABULAIRE"),LONG=0
 S ITEM="" F I=1:1 S ITEM=$O(^[QUI]MOZITEM(ITEM)) Q:ITEM=""  S @VOC@(ITEM)="" I $L(ITEM)>LONG S LONG=$L(ITEM)
 S @VOC@($$^%QZCHW("MACHINE"))="" I $L($$^%QZCHW("MACHINE"))>LONG S LONG=$L($$^%QZCHW("MACHINE"))
 S @VOC@($$^%QZCHW("OUTIL"))="" I $L($$^%QZCHW("OUTIL"))>LONG S LONG=$L($$^%QZCHW("OUTIL"))
SEL D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Edition du vocabulaire"),0)
 S A=$$UN^%PKCHOIX(VOC,30,5,I+2)
 Q:A=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur")_" " S DEV=$$^%VZESOR("E")
 I DEV=0 S IMP=0
 E  S IMP=^TABIDENT(WHOIS,"PRINTER")
 O IMP
 I IMP=0 D CLEPAG^%VVIDEO
 I IMP'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("impression en cours") D ENTETE
 S STOP=0
 D TITRE(A),IMP(A) U IMP W:IMP'=0 #
 I IMP'=0 C IMP
 G SEL
FIN 
 K @(TEMP)
 Q
 
IMP(TYPE) 
 N GLO,VAL,I
 I TYPE=$$^%QZCHW("MACHINE") S GLO="^[QUI]DESMACH" G IMP0
 I TYPE=$$^%QZCHW("OUTIL") S GLO="^[QUI]DESOUT" G IMP0
 S GLO="^[QUI]MOZITEM("""_TYPE_""")"
IMP0 
 I IMP=0 D BLD^%VVIDEO
 S VAL=""
 F I=1:1 S VAL=$O(@GLO@(VAL)) Q:(VAL="")!(VAL="z")  Q:STOP  S CH=VAL S:$L(VAL)<40 CH=CH_$J(" ",40-$L(VAL)) U IMP W CH I (I#2)=0 U IMP W ! I IMP=0 D ARRET
 I IMP=0 D NORM^%VVIDEO
 I IMP=0 D POCLEPA^%VVIDEO W "RETURN" R *R S STOP=1
 Q
TITRE(A) 
 D NORM^%VVIDEO
 U IMP W A,!
 F J=1:1:$L(A) U IMP W "-"
 U IMP W !
 Q
 
ARRET 
 I (I#40)=0 D POCLEPA^%VVIDEO W "RETURN" R *R D CLEPAG^%VVIDEO,TITRE(A) I R'=13 S STOP=1
 D BLD^%VVIDEO
 Q
ENTETE 
 U IMP W !
 U IMP W $J(" ",15),"V O C A B U L A I R E   D E   M O Z A R T",!
 U IMP W $J(" ",15),"-----------------------------------------",!,!
 Q

