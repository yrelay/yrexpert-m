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

;%PKSAI^INT^1^59547,73874^0
PKSAI ;
 S COMPDEF=""
 
 S LIB=$P(CONT,$C(0),4),LIB=$$GETLBLAN^%VTLBLAN(LIB)
 G:((LIB'="$DATE")&(LIB'="$JOUR"))&(LIB'="$HEURE") STOL
 S CONTC=@GLO@("CHAMPS",N,"CONTROLES")
 S FOR=$P(CONTC,$C(0),3)
 G @$E(LIB,2,5)
 
STOL S LIB=LIB_$J("",LARG-$L(LIB))
 S COMPDEF=COMPDEF_" S @GLOCH("_N_")="""_LIB_""""
 Q
DATE S COMPDEF=COMPDEF_" S @GLOCH@("_N_")="""_LIB_$J("",LARG-$L(LIB))_""""
 Q
JOUR S COMPDEF=COMPDEF_" S DA=$E($$J^%QMDATE1($H),1,FOR),@GLOCH@("_N_")=DA_$J("""","_LARG_"-$L(DA))"
 Q
HEUR S COMPDEF=COMPDEF_" S DA=$$HEURNO"_$S(FOR=1:"",1:2)_"^%QMDATE($H),@GLOCH@("_N_")=DA_$J("""","_LARG_"-$L(DA))"
 Q
 ;

