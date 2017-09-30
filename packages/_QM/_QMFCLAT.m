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

;%QMFCLAT^INT^1^59547,73878^0
ZECLAT(REP,I,NOM) 
 
 
 
 
 
 
 
 
 
 
 
 N ATTR,BA,C,J1,J2,L,LB,LI,NA,NI,TEST
 S BA=$$NOMINT^%QSF(REP)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Eclatement de ")_I)
NOMBRE 
 S DX=10,DY=10 D CLEBAS^%VVIDEO S NI=$$^%VZAME1($$^%QZCHW("Nombre d'individus generes par l'eclatement ? ")) Q:NI=""
 S TEST=NI?.N
 I TEST=0 D ^%VZEAVT($$^%QZCHW("Entrez un entier !")) G NOMBRE
 I NI=0 D ^%VZEAVT($$^%QZCHW("Le nombre d'individus doit etre superieur a 0")) G NOMBRE
LISTE 
 S DX=10,DY=13 D CLEBAS^%VVIDEO S LI=$$^%VZAME1($$^%QZCHW("Liste des attributs d'eclatement ? ")) Q:LI=""
 I LI="?" D ^%VZEAVT($$^%QZCHW("Liste d'attributs separes par des virgules !")) G LISTE
 S NA=0
TESTL 
 S TEST=1
LEX1 I LI'["," D ADR^%LXABR(LI,.C,.ATTR) S:C=1 LI=ATTR S TEST=('($D(^[QUI]RQSLIEN(BA,LI))))&$$AIR^%QSGEST5(BA,I,LI) I TEST S NA=NA+1,L(NA)=LI G GEN
MESSL I TEST=0 D ^%VZEAVT($$^%QZCHW("Mauvaise liste ! ")) G LISTE
 S NA=NA+1,L(NA)=$P(LI,",",1),LI=$P(LI,",",2,100)
LEX2 D ADR^%LXABR(L(NA),.C,.ATTR) S:C=1 L(NA)=ATTR
 S TEST=('($D(^[QUI]RQSLIEN(BA,L(NA)))))&$$AIR^%QSGEST5(BA,I,L(NA)) I TEST=0 G MESSL
 G TESTL
 
GEN 
 S (J1,J2)=1
BGEN S NOM(J1)=I_"."_J2
 I '($$IR^%QSGEST5(BA,NOM(J1))) S J2=J2+1,J1=J1+1 G:J1=(NI+1) INDIV0 G BGEN
 S J2=J2+1
 G BGEN
 
INDIV0 S J1=1
 D PARTA
INDIV 
 D POCLEPA^%VVIDEO,RECOP^%QSGEST2(BA,I,NOM(J1),.LB)
 
 D MAJLIEN^%QSGEST2(BA,I,NOM(J1),.LB)
 S DX=10,DY=20 D CLEBAS^%VVIDEO W $$^%QZCHW("Individu ")_J1_" ("_NOM(J1)_") "
 S J2=1
ATTRI 
 S DX=10,DY=22 D CLEBAS^%VVIDEO S REPONSE=$$^%VZAME1($$^%QZCHW("Valeur de ")_L(J2)_" ? ") G:REPONSE="" ATTRI
 
 D SAH^%QSGESTI(BA,NOM(J1),L(J2))
 D PA^%QSGESTI(BA,NOM(J1),L(J2),REPONSE,1)
 S J2=J2+1
 I J2=(NA+1) S J2=1,J1=J1+1 G:J1=(NI+1) FIN G INDIV
 G ATTRI
FIN 
 D SX^%QSGESTK(BA,I)
 Q
 
PARTA 
 N PREF,SUF
 S PREF="^RQSAUTOR("""_WHOIS_""")"
 S SUF=""
BPAR S SUF=$O(@PREF@(SUF))
 Q:SUF=""
 S LB($$NOMINT^%QSF(SUF))=""
 G BPAR
 
TEST N NOM,R,I
A W !,"Repertoire : " R R Q:R=""
B W !,"Individu : " R I G:I="" A G:'($$IR^%QSGEST5(R,I)) B
 D ZECLAT(R,I,.NOM) G B

