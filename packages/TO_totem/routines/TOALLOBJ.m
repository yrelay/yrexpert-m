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

;TOALLOBJ^INT^1^59547,74871^0
TOALLOBJ ;
 
 K ^COMPILVU($I),^POSENR($I),^POSFUL($I) S %NU=8,PAGE=1
 F J=0:1 S %TAB=$P($T(TAB+J),";;",2) Q:%TAB=""  S OBJ=$P(%TAB,"#",1),%TAB=$P(%TAB,"#",2) I %TAB'="" D SUIT
 S %A=-1 F %UU=1:1 S %A=$N(^COMPILVU($I,%A)) Q:%A=-1  S:%NU=8 ^POSFUL($I,PAGE)=%A S ^POSENR($I,PAGE,%NU)=%A_"^"_^COMPILVU($I,%A),%NU=%NU+1 I %NU'<21 S %NU=8,^POSFUL($I,PAGE)=^POSFUL($I,PAGE)_"^"_%A,PAGE=PAGE+1
FIN K J,%TAB,OBJ,%UU,%TB,%A,%VV,%NU Q
SUIT F %UU=1:1 S %TB=$P(%TAB,"/",%UU) Q:%TB=""  S %A=-1,%TB="^[QUI]"_%TB F %VV=1:1 S %A=$N(@%TB@(%A)) Q:%A=-1  I %A'="z",'($D(^COMPILVU($I,%A))) S ^COMPILVU($I,%A)=OBJ
 Q
TAB ;;ART#EXPLICI/IMPLICI/NOMENC/PHASE/FORMULE/OUTCONS/MATIERE/SELMAT/MACSEL
 ;;MAC#DESMACH/PEXPMACH/IMPMAC
 ;;MAT#MATSTOCK/IMPMAT
 ;;#ESSABAC

