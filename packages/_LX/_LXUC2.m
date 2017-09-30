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

;%LXUC2^INT^1^59547,73871^0
LEXUC2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COMP1 S REFUSE=0,PARA=RESUL(2)
 I PARA="" S (ICC,IC)=2,REFUSE=1 G FIN
 Q:RESUL(IC)'=""
 S ICC=IC,TAB(ICC)=PARA_"'REALISATION" D ^%VAFFICH
 S IC=IC+1,ICC=IC,TAB(ICC)=PARA D ^%VAFFICH
 G FIN
COMP2 S REFUSE=0,PARA=RESUL(2)
 I PARA="" S (ICC,IC)=2,REFUSE=1 G FIN
 Q:RESUL(IC)'=""
 S RESUL(IC)=PARA_"'SOURCE",ICC=IC D ^%VAFFICH G FIN
FIN K TAB Q
 
NUCOMP D ^TO4ORCOM G FIN
 
OPABAC S REFUSE=1
 F OP="<",">","'<","'>","=","'=","[]" I RESUL(IC)[OP,$E(RESUL(IC),1,$L(OP))=OP S REFUSE=0 G FIN
 D ^%VZEAVT($$^%QZCHW("Veuillez mettre 1 operateur SVP (""<"","">"",""="",""'="",""'<"",""'>"",""[]"")")) G FIN
 
EXILEX S REFUSE=0
 I %AJM="C" Q
 
 S REFUSE=1
 I RESUL(IC)="" G FIN
 I ^TOZE($I,"L")=1,$D(^[QUI]TOLEX(RESUL(IC))) D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("deja existant")_" !") G FIN
 D EXIOP^%LXUC5
 I $D(^[QUI]TOSYNONY(RESUL(IC))) S PSYN=$O(^[QUI]TOSYNONY(RESUL(IC),"")) D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("est synonyme de")_" "_PSYN_$$^%QZCHW(". Creation refusee !")) G FIN
 S REFUSE=0 G FIN
 
APO S REFUSE=0
 I RESUL(IC)["'" S REFUSE=1
 G FIN
 
EXIUNT 
 
 
 S REFUSE=0
 I %AJM="C" Q
 
 I RESUL(IC)="" S REFUSE=1 G FIN
 I %AJM="M" Q
 I $D(^[QUI]TOLEXU(RESUL(1),RESUL(2))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("L'unite")_" "_RESUL(IC)_" "_$$^%QZCHW("existe deja. Creation refusee !")) G FIN
 I $D(^[QUI]TOLEXU(RESUL(1))) S PUNT=$O(^[QUI]TOLEXU(RESUL(1),"")),REFUSE=1 D ^%VZEAVT(RESUL(1)_" "_$$^%QZCHW("a deja pour unite")_" "_PUNT_$$^%QZCHW(". Creation refusee !"))
 G FIN
 
LONGABR 
 
 S REFUSE=0 G:$L(RESUL(IC))<6 FIN
 S REFUSE=0 D ^%VZEAVT($$^%QZCHW("L'abreviation doit etre de cinq caracteres au maximum"))
 S SAVRES=RESUL(IC),ICC=IC,TAB(IC)=$J(" ",$L(SAVRES)) D ^%VAFFICH
 S RESUL(IC)=$E(SAVRES,1,5),ICC=IC,TAB(ICC)=RESUL(IC) D ^%VAFFICH
 G FIN

