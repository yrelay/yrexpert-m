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

;%SDEGES2^INT^1^59547,73889^0
SDEGES2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANAOK(MOD,ANCEL,NOUVEL,TEMPREF,AIDE,TYPE,COMPIL,TEXT,COND) 
 N FORC,VART,%V,%I
 S FORC=3
 D:MOD DESTROY2
 S @GLOBJ@("EL",NOUVEL,"SYNT")=AIDE
 S @GLOBJ@("EL",NOUVEL,"TYPE")=TYPE
 F %I=1:1 Q:'($D(COMPIL(%I)))  S @GLCOMP@(NOUVEL,%I-1)=COMPIL(%I)
 S @GLTEXT@(NOUVEL)=TEXT
 
 I TYPE'="POINT" D PTELEM^%SDEPOI2(TEMPREF) G SUITE
 S NOMPT=$O(@TEMPREF@("PT",""))
 S @TEMPREF@("PT",NOMPT,"NOEL")=NOUVEL
SUITE D GLOCOP^%QCAGLC(TEMPREF,GLOBJ)
 
 S VART=""
 F %V=0:0 S VART=$O(^DOC($J,"%",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"VAR",VART)=""
 F %V=0:0 S VART=$O(^DOC($J,"%INDIVIDU",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"IND",VART)=""
 
 I $D(^DOC($J,"ATT")) S @GLOBJ@("EL",NOUVEL,"ATT")=""
 
 K @GLOBJ@("EL",NOUVEL,"COND")
 Q:COND=""
 S COND=$E(COND,2,$L(COND)-1)
 Q:'($$EXISTE^%SDOCTEX(COND))
 S @GLOBJ@("EL",NOUVEL,"COND")=COND
 S VART=""
 F %V=0:0 S VART=$O(^[QUI]SDCOND(COND,"VAR",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"VAR",VART)=""
 F %V=0:0 S VART=$O(^[QUI]SDCOND(COND,"IND",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"IND",VART)=""
 
 I $D(^[QUI]SDCOND(COND,"ATT")) S @GLOBJ@("EL",NOUVEL,"ATT")=""
 Q
 
 
 
 
 
 
 
 
 
 
 
DESTROY(ANCEL,TEMPREF,FORC,PLEI) 
DESTROY2 N TYP
 
 S TYP=@GLOBJ@("EL",ANCEL,"TYPE")
 K @GLOBJ@("EL",ANCEL)
 K @GLCOMP@(ANCEL)
 K @GLTEXT@(ANCEL)
 I TYP'="POINT" D SUPREFEL^%SDEPOIN(GLOBJ,ANCEL,FORC,PLEI,TEMPREF) Q
 
 N NOM
 
 S NOM=$O(@GLOBJ@("PAEI",ANCEL,""))
 K @GLOBJ@("PT",NOM)
 K @GLOBJ@("PTR",NOM)
 K @GLOBJ@("PAEI",ANCEL,NOM)
 K @GLOBJ@("PAE",NOM,ANCEL)
 Q
 
 
 
 
 
 
 
KILL(OBJ,VERS,EL) 
 N I,POINT,ELEM
 I $$TYPELEM^%SDEGEST(OBJ,VERS,EL)'=$$^%QZCHW("POINT") G KILL2
 
 S POINT=$$NOPTEL^%SDEGEST(OBJ,VERS,EL)
 
 K ^[QUI]SDOBJ(OBJ,VERS,"PTR",POINT)
 K ^[QUI]SDOBJ(OBJ,VERS,"PT",POINT)
 S ELEM=""
 F I=0:0 S ELEM=$O(^[QUI]SDOBJ(OBJ,VERS,"PAE",POINT,ELEM)) Q:ELEM=""  K ^[QUI]SDOBJ(OBJ,VERS,"PAE",POINT,ELEM),^[QUI]SDOBJ(OBJ,VERS,"PAEI",ELEM,POINT)
 G FKILL
KILL2 
 S POINT=""
 F I=0:0 S POINT=$O(^[QUI]SDOBJ(OBJ,VERS,"PAEI",EL,POINT)) Q:POINT=""  K ^[QUI]SDOBJ(OBJ,VERS,"PAE",POINT,EL),^[QUI]SDOBJ(OBJ,VERS,"PAEI",EL,POINT)
FKILL 
 K ^[QUI]SDOBJ(OBJ,VERS,"EL",EL)
 K ^[QUI]SDTEXT(OBJ,VERS,EL)
 K ^[QUI]SDCOMP(OBJ,VERS,EL)
 Q
 
CONDOK(NOUVEL) 
 
 S VART=""
 F %V=0:0 S VART=$O(^DOC($J,"%",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"VAR",VART)=""
 F %V=0:0 S VART=$O(^DOC($J,"%INDIVIDU",VART)) Q:VART=""  S @GLOBJ@("EL",NOUVEL,"IND",VART)=""
 
 I $D(^DOC($J,"ATT")) S @GLOBJ@("EL",NOUVEL,"ATT")=""
 Q

