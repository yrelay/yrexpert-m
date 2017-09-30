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

;%QSUC^INT^1^59547,73883^0
QSUC ;
 
 
 
 
TYPIND 
 N REPONSE
 I RESUL(ICC)="?" D ^%VZEAVT($$^%QZCHW("Manuelle, Popage, Compteur ")) S REFUSE=1
 Q
 
MES(M) D ^%VZEAVT(M) Q
 
SQ D ^%VSQUEAK G ERR
ERR S (REFUSE,STOPUC)=1 Q
OK S (REFUSE,STOPUC)=0 Q
REAF N SIC,SICC S SIC=IC,SICC=ICC D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR
 S IC=SIC,ICC=SICC Q
 
ATT G:RESUL(IC)="" SQ
 I RESUL(IC)="?" D ^%LXIQ("REAF^%QSUC") G ERR
 S PCH=RESUL(IC) D ^%LXABR
 I CONCUR=0 D ^%VZEAVT($$^%QZCHW("Inconnu au lexique ")),^%LXIQ("REAF^%QSUC") G ERR
 I CONCUR>1 D ^%VZEAVT($$^%QZCHW("Ambigu au lexique ")),^%LXIQ("REAF^%QSUC") G ERR
 I CONCUR'=1 D ^%VZEAVT($$^%QZCHW("Je ne comprends pas tres bien ")),^%LXIQ("REAF^%QSUC") G ERR
 S (TAB(ICC),RESUL(IC))=PCHCOMP D ^%VAFFICH G OK
 
INT G:RESUL(IC)="" SQ G:RESUL(IC)="O" INTLEC K INTERV G OK
 
INTLEC D POCLEPA^%VVIDEO
 S Y1=$$^%VZAME1($$^%QZCHW("Intervalle de regroupement : ")_"[1] ")
 D POCLEPA^%VVIDEO I CTRLA!(Y1="") S Y1=1
 I Y1=0 D ^%VZEAVT($$^%QZCHW("L'intervalle ne doit pas avoir une valeur nulle")) G INTLEC
 I '($$ADR^%QZNBN1(Y1)) D ^%VSQUEAK G INTLEC
 S INTERV=Y1,CTRLF=0 G OK
BINF N B S B=0 G BORN
BSUP N B S B=1 G BORN
BORN G:RESUL(3)="N" BNUM
 G BALP
BNUM 
 I RESUL(IC)="" S (TAB(ICC),RESUL(IC))=$S(B:9999999999E-0,1:0) D ^%VAFFICH G OK
 G:RESUL(IC)'?.N SQ
 G OK
BALP 
 I RESUL(IC)="" S (TAB(ICC),RESUL(IC))=$S(B:"z",1:"A") D ^%VAFFICH G OK
 G OK

