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

;TODUPBIS^INT^1^59547,74871^0
TODUPBIS ;
 
 K ^BISIMP($I,NUFAC),^INDEF($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^BISIMP("_K1_","""_NUFA_"""",%TREECOP="^BISIMP("_K1_","""_NUFAC_"""" D ^%QCAGLC
 S %TB="^INDEF($I,NUFA)",%NB1=-1
L1 S %NB1=$N(@%TB@(%NB1)) G:%NB1=-1 FIN S %NB2=-1
L2 S %NB2=$N(@%TB@(%NB1,%NB2)) G:%NB2=-1 L1 S %NB3=-1
L3 S %NB3=$N(@%TB@(%NB1,%NB2,%NB3)) G:%NB3=-1 L2 S %NB4=-1
L4 S %NB4=$N(@%TB@(%NB1,%NB2,%NB3,%NB4)) G:%NB4=-1 L3 S %NB5=-1
L5 S %NB5=$N(@%TB@(%NB1,%NB2,%NB3,%NB4,%NB5)) G:%NB5=-1 L4
 I ($D(@%TB@(%NB1,%NB2,%NB3,%NB4,%NB5))#10)=1 S ^INDEF($I,NUFAC,%NB1,%NB2,%NB3,%NB4,%NB5)=1
 G L5
FIN K %TREECOP,K1,%TAD,DATAC,%TB,%NB1,%NB2,%NB3,%NB4,%NB5 Q

