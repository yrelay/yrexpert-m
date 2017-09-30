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

;%QCAPYE^INT^1^59547,73875^0
STACKIN ;
 
 S %PLEIN=0 I '($D(^[QUI]PILE(%NOMPIL))) D ^%VSQUEAK,POCLEPA^%VVIDEO W "CETTE PILE N'EXISTE PAS..." H 2 G FIN
 S %ETAG=$ZP(^[QUI]PILE(%NOMPIL,""))+1
 I $D(^[QUI]PILE(%NOMPIL,0)) S %LIM=$P(^[QUI]PILE(%NOMPIL,0),"^",2) I (%ETAG>%LIM)&(%LIM'="") S %PLEIN=1 G FIN
 S ^[QUI]PILE(%NOMPIL,%ETAG)=%VALPIL
FIN K %LIM,REP Q
PLEIN D ^%VSQUEAK,POCLEPA^%VVIDEO W "(CTRLA) pour abandonner ; (CTRLE) pour ecraser la derniere valeur de la pile " R *REP G:REP=1 FIN G:REP=5 ECRASE G PLEIN
ECRASE S ^[QUI]PILE(%NOMPIL,%ETAG+1)=%VALPIL G FIN
TEST W !,"Nom de la pile : " R %NOMPIL Q:%NOMPIL=""  W !,"Valeur a stocker : " R %VALPIL Q:%VALPIL=""  D STACKIN I %PLEIN=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W "La pile est pleine... "
 G TEST

