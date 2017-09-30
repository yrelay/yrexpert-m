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
;! Nomprog     : %QZCHW                                                       !
;! Module      : TRADUCTION                                                   !
;! But         : Traduire les menus                                           !
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

;%QZCHW^INT^1^59552,41623^0
%QZCHW(M) 
 Q:M="" "" X ^REMANENCE($J,"LG") Q M
 
INITREM N %LG
 K ^REMANENCE($J,"LG")
 S ^REMANENCE($J,"LG")="S:'$D(^ATRADUIR(""FR"",M)) ^ATRADUIR(""FR"",M)="""""
 S %LG=$S($D(^TOZE($I,"LG")):^TOZE($I,"LG"),1:"FR") G:%LG="FR" I2
 I %LG="VERLAN" S ^REMANENCE($J,"LG")=^REMANENCE($J,"LG")_" S:'$D(^COMMENT("""_%LG_""",""PG"",M)) ^COMMENT("""_%LG_""",""PG"",M)=$$^xverlan(M) S M=^COMMENT("""_%LG_""",""PG"",M)" G I2
 S ^REMANENCE($J,"LG")=^REMANENCE($J,"LG")_" S:$D(^COMMENT("""_%LG_""",""PG"",M)) M=^COMMENT("""_%LG_""",""PG"",M)"
 
I2 
 Q  ;HL
 S ^REMANENCE($J,"LG")=$$COMPILE^%SYSUTI1(^REMANENCE($J,"LG"))
 Q
 
 
 
OLD(M) Q:M="" ""
 N %LG
 S %LG=$S($D(^TOZE($I,"LG")):^TOZE($I,"LG"),1:"FR")
 I %LG'="FR",$D(^COMMENT(%LG,"PG",M)) S M=^COMMENT(%LG,"PG",M) Q M
 I '($D(^ATRADUIR("FR",M))) S ^ATRADUIR("FR",M)=""
 Q M
 ;

