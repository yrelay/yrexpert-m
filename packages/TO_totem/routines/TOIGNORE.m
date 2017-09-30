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

;TOIGNORE^INT^1^59547,74872^0
TOIGNORE ;
 
GETDEP S NUM=-1,NOMTAB="^[QUI]IGNORER(YA,%CP,%VALE)" F %GG=0:0 S NUM=$N(@NOMTAB@(NUM)) Q:NUM=-1  D TRAIT
 K %RS,%IA,%IP,%IU,%ITW,%ITB,%ST
FIN Q
TRAIT I $D(@NOMTAB@(NUM))'=10 S RS=@NOMTAB@(NUM) D ^%VKMULC G SUI
 S %NOM=$P(NOMTAB,")",1)_","""_NUM_""")" D ^%VKMULNG
SUI F WWQ=1:1:10 I $D(%RS(WWQ)),%RS(WWQ)'="" D SUIT
 G FIN
SUIT G:%RS(WWQ)["'" RL S ^V($I,YA,%RS(WWQ))=$$^%QZCHW("A ignorer"),^AIGNOR($I,YA,%RS(WWQ))=1,^[QUI]RAISON(NUFA,TWREF,%RS(WWQ))="IMPLICIYST(Car "_%CP_" = "_%VALE,^[QUI]TVPAR(NUFA,TWREF,%RS(WWQ))=$$^%QZCHW("A ignorer") G FIN
RL S %IP=$P(%RS(WWQ),"'",1),%IA=$P(%RS(WWQ),"'",2),%ITW=-1,%ITB="^[QUI]TVPAR(NUFA)"
 S %ST=0 F %IU=1:1 S %ITW=$N(@%ITB@(%ITW)) Q:%ITW=-1  D T0 G:%ST=1 FIN
 S ^AIGNOR($I,%IA,%IP)=1,^IGNOR($I,%IA,%IP)="IMPLICIYST(Car "_%CP_$$^%QZCHW(" de ")_YA_" = "_%VALE G FIN
T0 Q:'($D(@%ITB@(%ITW,$$^%QZCHW("ARTICLE"))))
 I @%ITB@(%ITW,$$^%QZCHW("ARTICLE"))=%IA S ^V($I,%IA,%IP)=$$^%QZCHW("A ignorer"),^AIGNOR($I,%IA,%IP)=1,@%ITB@(%ITW,%IP)=$$^%QZCHW("A ignorer"),^[QUI]RAISON(NUFA,%ITW,%IP)="IMPLICIYST(Car "_%CP_$$^%QZCHW(" de ")_YA_" = "_%VALE,%ST=1
 Q

