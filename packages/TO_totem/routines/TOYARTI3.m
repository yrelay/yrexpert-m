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

;TOYARTI3^INT^1^59547,74877^0
TOYARTI3 ;
TEMP Q:$N(^[QUI]FLFORM(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*     Temps et Couts      *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLFORM(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLFORM(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLFORM(A,N,P,Q)) Q:Q=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]FLFORM(A,N,P,Q,R)) Q:R=-1  D ATEMP
 Q
ATEMP D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLFORM(A,N,P,Q,R)
 W !,!,$$^%QZCHW("Phase : "),N,?40,$$^%QZCHW(" Operation : "),P,?80,$$^%QZCHW(" Section : "),Q S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Temps de preparation : "),$P(CH,"^",17)
 W !,$$^%QZCHW("    Unite : "),$P(CH,"^",18)
 W !,$$^%QZCHW("  Temps unitaire       : "),$P(CH,"^",19)
 W !,$$^%QZCHW("    Unite : "),$P(CH,"^",20)
 S NL=NL+4 Q
ATEM Q:$N(^[QUI]FLAUTRFO(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*     Autres Temps        *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLAUTRFO(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLAUTRFO(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLAUTRFO(A,N,P,Q)) Q:Q=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]FLAUTRFO(A,N,P,Q,R)) Q:R=-1  D ATE
 Q
ATE S S=-1 F %S=0:0 S S=$N(^[QUI]FLAUTRFO(A,N,P,Q,R,S)) Q:S=-1  D TS
 Q
TS D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLAUTRFO(A,N,P,Q,R,S)
 W !,!,$$^%QZCHW("Phase : "),N,?40,$$^%QZCHW(" Operation : "),P,?80,$$^%QZCHW(" Section : "),Q S NL=NL+2
 W !,$$^%QZCHW("  Attribut   : "),S
 W !,$$^%QZCHW("  Evaluation : "),$P(CH,"^",2)
 W !,$$^%QZCHW("  Unite      : "),$P(CH,"^",1) S NL=NL+3
 Q
TPCP Q:$N(^[QUI]FLTPCPG(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*  Temps et cout finals   *")
 W !,"***************************",! S NL=NL+4
 Q:'($D(^[QUI]FLTPCPG(A)))
 D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLTPCPG(A,1)
 W !,!,$$^%QZCHW("Temps final : "),$P(CH,"^",1)
 W !,!,$$^%QZCHW("Cout  final : "),$P(CH,"^",2)
 Q
CONS Q:$N(^[QUI]FLCONS(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*        Consignes        *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLCONS(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLCONS(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLCONS(A,N,P,Q)) Q:Q=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]FLCONS(A,N,P,Q,R)) Q:R=-1  D COT
 Q
COT D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLCONS(A,N,P,Q,R)
 W !,!,$$^%QZCHW("Phase : "),N,?40,$$^%QZCHW(" Operation : "),P,?80,$$^%QZCHW(" Section : "),Q,?110,$$^%QZCHW(" no : "),R S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Consigne : "),$P(CH,"^",17) S NL=NL+1 Q
DIMO Q:$N(^[QUI]FLDIM(A,-1))=-1  D TETE^TOYARTI2
 W !,"***************************"
 W !,$$^%QZCHW("*   Dimensions a l'outil  *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLDIM(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLDIM(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLDIM(A,N,P,Q)) Q:Q=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]FLDIM(A,N,P,Q,R)) Q:R=-1  D DIMOT
 Q
DIMOT S S=-1 F %S=0:0 S S=$N(^[QUI]FLDIM(A,N,P,Q,R,S)) Q:S=-1  D TD
 Q
TD D:NL>(NBL-7) TETE^TOYARTI2 S CH=^[QUI]FLDIM(A,N,P,Q,R,S)
 W !,!,$$^%QZCHW("Phase : "),N,?40,$$^%QZCHW(" Operation : "),P,?80,$$^%QZCHW(" Section : "),Q,?110,$$^%QZCHW(" no : "),S S NL=NL+2
 W !,$$^%QZCHW("  Dimension : "),R S NL=NL+1
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Action    : "),$P(CH,"^",17) S NL=NL+1 Q

