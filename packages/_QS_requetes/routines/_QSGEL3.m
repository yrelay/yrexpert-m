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

;%QSGEL3^INT^1^59547,73881^0
QSGEL3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MULT(T,RESUL) 
 N I,A,ADRD,INDICE
 S ADRD=$$ADRD
 S INDICE=$O(@ADRD@(T,"")) K @(RESUL)
 F I=0:0 Q:INDICE=""  D MULT1 S INDICE=$O(@ADRD@(T,INDICE))
 Q
MULT1 S @RESUL@(INDICE)=@ADRD@(T,INDICE) Q
 
 
 
 
 
 
 
 
ONE(T) 
 N ADRD,INDICE
 S ADRD=$$ADRD
 S INDICE=$O(@ADRD@(T,""))
 Q:INDICE="" ""
 S INDICE=@ADRD@(T,INDICE) Q INDICE
 
 
 
 
TYPE(BASE) 
 N ADRI
 S ADRI=$$ADRI
 Q:BASE="" ""
 Q:'($D(@ADRI@(BASE))) ""
 S ADRI=@ADRI@(BASE,"TYPE") Q ADRI
 
 
 
INDICE(BASE) 
 N ADRI
 S ADRI=$$ADRI
 Q:BASE="" ""
 Q:'($D(@ADRI@(BASE))) ""
 S ADRI=@ADRI@(BASE,"INDICE") Q ADRI
 
 
ADRD() Q "^["_$$S1^%QZCHAD(QUI)_"]RQSGLO(""QSMODE"",""NOMEXT"",""DIRECT"")"
 
ADRI() Q "^["_$$S1^%QZCHAD(QUI)_"]RQSGLO(""QSMODE"",""NOMEXT"",""INVERSE"")"
 
 
LIENI() 
 N ADRD
 S ADRD=$$ADRD
 I $D(@ADRD@("LIEN",1)) S ADRD=@ADRD@("LIEN",1) Q ADRD
 Q "LIEN.I"

