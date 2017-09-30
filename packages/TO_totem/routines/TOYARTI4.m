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

;TOYARTI4^INT^1^59547,74877^0
TOYARTI4 ;
MATI Q:$N(^[QUI]FLMAT(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*        Matieres         *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLMAT(A,N)) Q:N=-1  D T1
 Q
T1 D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLMAT(A,N)
 W !,!,$$^%QZCHW("No de condition : "),N S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Familles matiere : ") S NL=NL+1
 F I=1:1:6 Q:$P(CH,"^",16+I)=""  W !,"    ",$P(CH,"^",16+I) S NL=NL+1
 Q
SELT Q:$N(^[QUI]FLSELM(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*   Selection   Matiere   *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLSELM(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLSELM(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLSELM(A,N,P,Q)) Q:Q=-1  D T2
 Q
T2 D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLSELM(A,N,P,Q)
 W !,!,$$^%QZCHW("Famille : "),N,?40,$$^%QZCHW(" Matiere : "),P,?80,$$^%QZCHW(" No de condition : "),Q
 S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Formule : "),$P(CH,"^",17) S NL=NL+1
 Q
SELN Q:$N(^[QUI]FLSELC(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*   Selection   Machine   *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLSELC(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLSELC(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLSELC(A,N,P,Q)) Q:Q=-1  D T3
 Q
T3 D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLSELC(A,N,P,Q)
 W !,!,$$^%QZCHW("Section : "),N,?40,$$^%QZCHW(" Machine : "),P,?80,$$^%QZCHW(" No de condition : "),Q
 S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 Q

