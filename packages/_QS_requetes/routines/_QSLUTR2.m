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

;%QSLUTR2^INT^1^59547,73882^0
%QSLUTR2(ARGUMTRI) ;;03:37 AM  2 May 1991;
 
 
 
 
 
 
 N A,C,I,J,S,TABC K ARGUMTRI
 S S=0 F I=1:1 D ARG Q:S
 Q
ARG D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Tri sur : "))
 G:CTRLA STOP G:Y1="" END
 S PCH=Y1 D ^%LXABR I CONCUR=1 S A=PCHCOMP G SUIT
 I CONCUR>1 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(" est ambigu au lexique ... refuse") H 2 G ARG
INCO S TABC(1)="OUI",TABC(2)="NON"
 D POCLEPA^%VVIDEO,^%VSQUEAK W Y1,$$^%QZCHW(" est inconnu au lexique") H 2
 D POCLEPA^%VVIDEO S C=$$MES^%VZECHO($$^%QZCHW("Persistez-vous ? : "),"TABC")
 F J=1,6,13,"OUI","NON" G:J=C @("A"_J)
 D ^%VSQUEAK G INCO
A1 K ARGUMTRI Q
A6 G A1
A13 G AOUI
ANON G ARG
AOUI S A=Y1 G SUIT
SUIT D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Indice : ")),IX=$S(Y1="":1,1:Y1)
LIEN D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Lien : ")) I Y1="" S LI="" G SSUIT
 S PCH=Y1 D ^%LXABR I CONCUR=1 S LI=PCHCOMP G SSUIT
 I CONCUR>1 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(" est ambigu au lexique ... refuse") H 2 G LIEN
 D POCLEPA^%VVIDEO,^%VSQUEAK W Y1,$$^%QZCHW(" est inconnu au lexique") H 2 G LIEN
SSUIT S TABC(1)="CROISSANT",TABC(2)="DECROISSANT"
 D POCLEPA^%VVIDEO S C=$$MES^%VZECHO(A_$$^%QZCHW(" tri ? : "),"TABC")
 F J=1,6,13,"CROISSANT","DECROISSANT" G:J=C @J
 D ^%VSQUEAK G SUIT
1 Q
6 Q
13 G DECROISSANT
DECROISSANT S ARGUMTRI(I)=A_"^<"_"^"_IX_"^"_LI Q
CROISSANT S ARGUMTRI(I)=A_"^>"_"^"_IX_"^"_LI Q
END S S=1 Q
STOP K ARGUMTRI G END

