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

;%AMJAJ^INT^1^59547,73865^0
%AMJAJ ;
 
 
 
ADDEXEC(JRN,TYPE,VAL,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 N DEFETU,GJOURN,GEXEC
 D INIVAR^%AMG
 Q:JRN=""
 S DERL=@GJOURN
 I $D(@GJOURN@(DERL))#10 S (@GJOURN,DERL)=DERL+1
 I $D(KEY6),KEY6'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_KEY2_$C(0)_KEY3_$C(0)_KEY4_$C(0)_KEY5_$C(0)_KEY6_$C(0)_VAL,@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,DERL)=VAL G ADDF
 I $D(KEY5),KEY5'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_KEY2_$C(0)_KEY3_$C(0)_KEY4_$C(0)_KEY5_$C(0)_VAL,@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,DERL)=VAL G ADDF
 I $D(KEY4),KEY4'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_KEY2_$C(0)_KEY3_$C(0)_KEY4_$C(0)_VAL,@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,DERL)=VAL G ADDF
 I $D(KEY3),KEY3'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_KEY2_$C(0)_KEY3_$C(0)_VAL,@GEXEC@(TYPE,KEY1,KEY2,KEY3,DERL)=VAL G ADDF
 I $D(KEY2),KEY2'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_KEY2_$C(0)_VAL,@GEXEC@(TYPE,KEY1,KEY2,DERL)=VAL G ADDF
 I $D(KEY1),KEY1'="" S @GJOURN@(DERL)=$H_$C(0)_TYPE_$C(0)_KEY1_$C(0)_VAL,@GEXEC@(TYPE,KEY1,DERL)=VAL G ADDF
ADDF Q
 
 
AJJOURN(JRN,TXT) 
 N DERL
 N DEFETU,GJOURN,GEXEC
 D INIVAR^%AMG
 Q:JRN=""
 S DERL=@GJOURN
 I $D(@GJOURN@(DERL))#10 S (@GJOURN,DERL)=DERL+1
 S @GJOURN@(DERL)=$H_$C(0)_"TEXTE"_$C(0)_TXT
 Q
 
NOUVINST(JRN,TEXTE,DESC) 
 N DERL
 N DEFETU,GJOURN,GEXEC
 D INIVAR^%AMG
 Q:JRN=""
 S DERL=@GJOURN
 S (@GJOURN,DERL)=DERL+1
 S @GJOURN@(DERL,"T")=TEXTE
 S @GJOURN@(DERL,"D")=DESC
 Q

