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

;%PBP5FG^INT^1^59547,73874^0
PTFG ;
 
 S ENVL(%TERM,"ETAT-CRAYON")="SANS-CRAYON" Q
 S:$D(%9NCO)&$D(%9NLI) ENVL(%TERM,"%9NCO")=%9NCO,ENVL(%TERM,"%9NLI")=%9NLI
 S:'($D(%9NLI)) ENVL(%TERM,"%9NLI")=1
 S:'($D(%9NCO)) ENVL(%TERM,"%9NCO")=1
 S ENVL(%TERM,"PITCH")=$P(^ENVCONF(%TERM),"^",18)
 S ENVL(%TERM,"%PFXI")=^ENVCONF(%TERM,"%PFXI"),ENVL(%TERM,"%PFYI")=^ENVCONF(%TERM,"%PFYI")
 S ENVL(%TERM,"SZX")=^ENVCONF(%TERM,"SZX"),ENVL(%TERM,"SZY")=^ENVCONF(%TERM,"SZY"),ENVL(%TERM,"RAP")=13E-1,ENVL(%TERM,"%DLI")=ENVL(%TERM,"SZY")\ENVL(%TERM,"%9NLI"),ENVL(%TERM,"%DCO")=ENVL(%TERM,"SZX")\ENVL(%TERM,"%9NCO")
 I ENVL(%TERM,"%DCO")>(ENVL(%TERM,"RAP")*ENVL(%TERM,"%DLI")) S ENVL(%TERM,"%TCO")=ENVL(%TERM,"%DLI")*ENVL(%TERM,"RAP"),ENVL(%TERM,"%TLI")=ENVL(%TERM,"%DLI")
 E  S ENVL(%TERM,"%TCO")=ENVL(%TERM,"%DCO"),ENVL(%TERM,"%TLI")=ENVL(%TERM,"%DCO")\ENVL(%TERM,"RAP")
 S ENVL(%TERM,"%FEN")=0,ENVL(%TERM,"%RED")=ENVL(%TERM,"%TCO")/4096
 S ENVL(%TERM,"W")=$J((^ENVCONF(%TERM,"W")*ENVL(%TERM,"%RED"))/2,1,3),ENVL(%TERM,"H")=$J((^ENVCONF(%TERM,"H")*ENVL(%TERM,"%RED"))/2,1,3) W "SI",ENVL(%TERM,"W"),",",ENVL(%TERM,"H"),";",!
 S ENVL(%TERM,"%PFX")=^ENVCONF(%TERM,"%PFXI"),ENVL(%TERM,"%PFY")=(^ENVCONF(%TERM,"%PFYI")+ENVL(%TERM,"SZY"))-ENVL(%TERM,"%DLI")
 S ENVL(%TERM,"PITCH")=ENVL(%TERM,"PITCH")*ENVL(%TERM,"%RED")
 S ENVL(%TERM,"ETAT-CRAYON")="SANS-CRAYON"
 S %FONC="MOUV",%9X=ENVL(%TERM,"%PFX"),%9Y=ENVL(%TERM,"%PFY") D ^%PBPZ
 Q

