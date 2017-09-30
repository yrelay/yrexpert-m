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

;%SDOGEN^INT^1^59547,73889^0
SDOGEN ;
 
 
 
 
 
 N %C,%R,OBJ,PK,STO,VERS,X,Y
GEN 
 D ^%SDOBJ($$^%QZCHW("Regeneration d'un objet"),1,.OBJ,.VERS)
 
 I OBJ="" Q
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Confirmez-vous la regeneration de cet objet")_" ?","O")'=1 G GEN
 D EXT(OBJ,VERS)
 G GEN
 
 
EXT(OBJ,VERS) 
 
 N GLERR,GLOTYP,GLOBJ,GLTEXT,GLCOMP,TEMPO,TEMPREF,MERR,NOM,RES,PRES
 S GLERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREURS")
 K @(GLERR)
 D MSG^%VZEATT($$^%QZCHW("initialisations")_"...")
 
 D ISESS^%SDEANTI(OBJ,VERS,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 
 S NEL=""
ELEM S NEL=$O(@GLTEXT@(NEL))
 I NEL="" G FGEN
 D MSG^%VZEATT($$^%QZCHW("analyse de l'element numero")_" "_NEL)
 
 S PRES=$$PRES2^%SDEGEST(NEL)
 
 S OK=$$LIGNE^%SDEANT1(@GLTEXT@(NEL),35,23,NEL,0,1,.NOM,.RES,.MERR)
 
 I MERR'="" D ADD(NEL,MERR,"")
 I PRES="" G PT
 
 D GEN^%SDEGEST(NEL,PRES)
PT I $$TYPELEM^%SDEGEST(OBJ,VERS,NEL)'="POINT" G ELEM
 
 S NP=$$NOPTEL^%SDEGEST(OBJ,VERS,NEL)
 S @GLOBJ@("PTR",NP,"X")=$P(PRES,"^",2)
 S @GLOBJ@("PTR",NP,"Y")=$P(PRES,"^",3)
 G ELEM
 
FGEN 
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 I $D(@GLERR) D AFFERR^%QULIMZ(GLERR,$$^%QZCHW("Liste des erreurs lors de la regeneration"))
 
 
 D MAJVAR^%SDEGES3(OBJ,VERS)
 Q
 
ADD(EL,MSG,TYPA) 
 N I
 S I=$ZP(@GLERR@(""))+1
 S @GLERR@(I)="***** "_$$^%QZCHW("element")_" "_EL_$S(TYPA="":"",1:" ("_TYPA_")")
 S @GLERR@(I+1)="    "_MSG
 S @GLERR@(I+2)=" "
 Q

