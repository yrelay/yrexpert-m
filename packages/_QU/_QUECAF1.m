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

;%QUECAF1^INT^1^59547,73885^0
QUECAF1(CL,RESUL,EXT,EV) 
 
 
 
 
 
 
 
 
 N I,CHAD,CH
 S CHAD=$$CH^%QUECZ1(CL)
 S CH=$O(@CHAD@(""))
 F I=0:0 Q:CH=""  D CHAFF(CL,CH,RESUL,EXT,EV) S CH=$O(@CHAD@(CH))
 Q
 
 
 
 
 
CHAFF(CL,CH,RESUL,EXT,EV) 
 N CHAD,CHAD1,I,MAFF,MAFF1
 S CHAD="CHAD1"
 D CHCO^%QUECZ1(CL,CH,.TYPE,CHAD)
 I TYPE="VALEUR" G CHVAL
 I TYPE="TEXTE" G CHTXT
 Q
 
CHVAL N VAL
 S VAL=""
 S:EV=1 VAL=$$EVAL^%QUECEV(CL,CH,TYPE,CHAD,RESUL,EXT)
 D:(EV=0)!(EV=1) AFF^%VREAD(@CHAD@("LIB"),VAL,@CHAD@("XG"),(@CHAD@("XG")+@CHAD@("L"))-1,(@CHAD@("YH")+@CHAD@("H"))-1,@CHAD@("YH"))
 D:EV=2 POSCUR^%VREAD(@CHAD@("LIB"),VAL,@CHAD@("XG"),(@CHAD@("XG")+@CHAD@("L"))-1,(@CHAD@("YH")+@CHAD@("H"))-1,@CHAD@("YH"))
 Q
 
CHTXT Q

