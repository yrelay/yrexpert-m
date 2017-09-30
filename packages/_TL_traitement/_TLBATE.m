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

;%TLBATE^INT^1^59547,74028^0
A ;
 D DEBUT^%TLBADEB("PAGE.CALCUL.POIDS","RQS88090006","PROCEDURAL",2,0,"")
 Q
B 
 D DEBUT^%TLBADEB("TRT.TEST.PAGE","RQS88090006","PROCEDURAL",2,0,"")
 Q
C 
 D DEBUT^%TLBADEB("TRT.TEST.PAGE","RQS88090006","FAIBLEMENT PROCEDURAL",2,0,"")
 Q
D 
 D DEBUT^%TLBADEB("TRT.TEST.PAGE","RQS88090006","LINEAIRE.REMANENT",2,0,"")
 Q
E 
 D DEBUT^%TLBADEB("TRT.TEST.PAGE","RQS88090006","ARBRE",2,0,"")
 Q
F 
 D DEBUT^%TLBADEB("TRT.TEST.PAGE","RQS88090006","ARBRE.REMANENT",2,0,"")
 Q
G 
 D DEBUT^%TLBADEB("ESSAI.ALLER","RQS88060006","LINEAIRE.REMANENT",2,0,"")
 Q
H 
 D INIT,CLEPAG^%VVIDEO
 W !,"Nom du traitement : " R TRT Q:TRT=""
 G:'($D(^[QUI]TTL(TRT))) H
HL W !,"Nom de la liste : " R LIS Q:LIS=""
 G:'($$IR^%QSGEST5("L0",LIS)) HL
 W !,"Deroulement : " R DER Q:TRT=""
 D DEBUT^%TLBADEB(TRT,LIS,DER,2,2,"BIDON")
 Q
I 
 D INIT,DEBUT^%TLBADEB("TEST.CALCUL.POIDS","RQS88090006","ARBRE",2,0,"")
 Q
K 
 D INIT,DEBUT^%TLBADEB("ESSAI.ARBRE","RQS88090006","ARBRE.REMANENT",2,0,"")
 Q
L 
 D DEBUT^%TLBADEB("ESSAI.ALLER","RQS88060006","PROCEDURAL",2,0,"")
 Q
M 
 D DEBUT^%TLBADEB("ESSAI.RECUSATION","RQS88090006","ARBRE.RECUSATION",2,2,"BIDON")
 Q
INIT 
 K ^ZPILF($J)
 K ^PILANAD($J)
 K ^PILANVAL($J)
 K ^TEMPORAI($J)
 K ^TMP($J)
 K ^Z($J)
 K ^QX($J)
 K ^ATT($J),^LATT($J),^VAL($J)
 Q
INIAFF 
 D NORM^%VVIDEO,G0OFF^%VVIDEO,80^%VVIDEO,ECHON^%VVIDEO,CURON^%VVIDEO
 Q

