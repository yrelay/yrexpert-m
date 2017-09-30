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

;%SDOCMS^INT^1^59547,73889^0
SDOCMS ;
 
 
 
 
 
 
 
 
DUP 
 N %C,%R,DUP,OBJ,PK,TIT,VDUP,VERS,X,Y
 S TIT=$$^%QZCHW("duplication d'un objet graphique")
DSO 
 D ^%SDOBJ(TIT_" ("_$$^%QZCHW("objet a dupliquer")_")",1,.DUP,.VDUP)
 
 I DUP="" Q
 
 D ^%SDOBJ(TIT_" ("_$$^%QZCHW("objet a creer")_")",0,.OBJ,.VERS)
 I OBJ="" G DSO
 K PK
 
 D MSG^%VZEATT($$^%QZCHW("duplication en cours")_"...")
 D GLOCOP^%QCAGLC($$DEF(DUP,VDUP),$$DEF(OBJ,VERS))
 D GLOCOP^%QCAGLC($$TEXT(DUP,VDUP),$$TEXT(OBJ,VERS))
 D GLOCOP^%QCAGLC($$COMP(DUP,VDUP),$$COMP(OBJ,VERS))
 
 D EXT^%SDODEF(OBJ,VERS)
 G DSO
 
 
SUP 
 N %C,%R,OBJ,PK,STO,VERS,X,Y
 
SUD D ^%SDOBJ($$^%QZCHW("suppression d'un objet"),1,.OBJ,.VERS)
 
 I OBJ="" Q
 S STO=$$DEF(OBJ,VERS)
 I $D(@STO@("COL")) D ^%VZEAVT($$^%QZCHW("ATTENTION ! Cet objet fait partie d'une collection"))
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("confirmez-vous la suppression de cet objet")_" ? ")=1 D SUPPR(OBJ,VERS)
 G SUD
 
SUPPR(OBJ,VERS) 
 N %C,STO,COL,VERC
 S STO=$$DEF(OBJ,VERS)
 
 S COL=""
 F %C=0:0 S COL=$O(@STO@("COL",COL)) Q:COL=""  S VERC="" F %V=0:0 S VERC=$O(@STO@("COL",COL,VERC)) Q:VERC=""  D SUPOBJ^%SDCCMS(COL,VERC,OBJ,VERS)
 
 K @(STO),@($$TEXT(OBJ,VERS)),@($$COMP(OBJ,VERS))
 Q
 
 
 
DEF(O,V) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDOBJ",$S($$NUM^%QZNBN(O):O,1:""""_O_""""))
 S A=$$CONCAT^%QZCHAD(A,$S($$NUM^%QZNBN(V):V,1:""""_V_""""))
 Q A
 
TEXT(O,V) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDTEXT",$S($$NUM^%QZNBN(O):O,1:""""_O_""""))
 S A=$$CONCAT^%QZCHAD(A,$S($$NUM^%QZNBN(V):V,1:""""_V_""""))
 Q A
 
COMP(O,V) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDCOMP",$S($$NUM^%QZNBN(O):O,1:""""_O_""""))
 S A=$$CONCAT^%QZCHAD(A,$S($$NUM^%QZNBN(V):V,1:""""_V_""""))
 Q A
 
 
EXI(O,V) 
 I (O="")!(V="") Q 0
 N A
 S A=$$DEF(O,V)
 I $D(@A) Q 1
 Q 0
 
EXO(O) 
 I O="" Q 0
 I $D(^[QUI]SDOBJ(O)) Q 1
 Q 0
 
EXELE(O,V,EL) 
 I ((O="")!(V=""))!(EL="") Q 0
 N A
 S A=$$DEF(O,V)
 I $D(@A@("EL",EL)) Q 1
 Q 0

