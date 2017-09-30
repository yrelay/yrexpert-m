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

;TO31GIMP^INT^1^59547,74869^0
TO31GIMP ;
 
 D DELIMP S VA="VALIDATION."
 I ('($D(^[QUI]IMPLICI(ARTI,VA_ARTI))))!('($D(^[QUI]FLIMPLI(ARTI,VA_ARTI)))) S $P(^[QUI]IMPLICI(ARTI,VA_ARTI,1),"^",18)="$VALID(ALLIAGE;ETAT;NORME)",$P(^[QUI]FLIMPLI(ARTI,VA_ARTI,1),"^",18)="$VALID(ALLIAGE;ETAT;NORME)"
 S NOMTAB="^[QUI]FLTRIP",(PQ,PP)="VALI"_ARTI,LPQ=$L(PQ) F UUU=0:0 S PP=$N(@NOMTAB@(PP)) Q:$E(PP,1,LPQ)'=PQ  S PA=-1 F VVV=0:0 S PA=$N(@NOMTAB@(PP,PA)) Q:PA=-1  S NN=-1 F WWW=0:0 S NN=$N(@NOMTAB@(PP,PA,NN)) Q:NN=-1  D TRAIT
 K UUU,VVV,PP,VV,PQ,LPQ,K3,VA G FIN
TRAIT W "/" S K3=$E(PP,$L("VALI"_ARTI)+2,299) I $D(@NOMTAB@(PP,PA,NN))'=10 S ^[QUI]FLIMPLI(ARTI,PA,NN_"("_K3_")")=@NOMTAB@(PP,PA,NN) G FIN
 S NNN=-1 F ZZZ=0:0 S NNN=$N(@NOMTAB@(PP,PA,NN,NNN)) Q:NNN=-1  S ^[QUI]IMPLICI(ARTI,PA,NN_"("_K3_")",NNN)=@NOMTAB@(PP,PA,NN,NNN)
 K ZZZ,NNN
FIN Q
DELIMP S NOMTAB="^[QUI]FLIMPLI(ARTI)",PP=-1 F UUU=0:0 S PP=$N(@NOMTAB@(PP)) Q:PP=-1  S NN=-1 F VVV=0:0 S NN=$N(@NOMTAB@(PP,NN)) Q:NN=-1  I NN["/" W "/" K ^[QUI]FLIMPLI(ARTI,PP,NN)
TRAIT2 K PP,NN,UUU,VVV G FIN

