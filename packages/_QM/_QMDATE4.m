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
;! Nomprog     : %QMDATE4                                                     !
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

%QMDATE4 ;
ZHEUR4 ;
 
 
 
ZADDJOUR 
 
 
 
 
 
 S %DS=$P(%DATE,"/",2)_"/"_$P(%DATE,"/",1)_"/"_$P(%DATE,"/",3) D INT^%DATE
 S %JOUR=$ZD(%DN+%AJOU),%JOUR=$P(%JOUR,"/",2)_"/"_$P(%JOUR,"/",1)_"/"_$P(%JOUR,"/",3),%PNS=%JOUR D NSEM^%QMDATE4 S %SEMA=%RNS
 K %DN,%DS,%PNS,%RNS Q
 
ZCEJOUR 
 S %NJ=$P("JEUDI,VENDREDI,SAMEDI,DIMANCHE,LUNDI,MARDI,MERCREDI",",",(%JR#7)+1) K %JR Q
 
 ;HL2 ZD S %DAT=$ZD($H)
ZD S %DAT=$ZD($H,"MM/DD/YEAR")

 S MM=$P(%DAT,"/",1),$P(%DAT,"/",1)=$P(%DAT,"/",2),$P(%DAT,"/",2)=MM
 K MM
 Q
INVZD S %DAT=$ZD($H),MM=%DAT,%DAT=$P(MM,"/",3)_$P(MM,"/",1)_$P(MM,"/",2)
 K MM
 Q
ZNSEM(%PNS) 
 
 

 
 
 
 
NSEM S %DS="01/01/"_$P(%PNS,"/",3) D INT^%DATE S NOJ1=%DN,%DS=$P(%PNS,"/",2)_"/"_$P(%PNS,"/",1)_"/"_$P(%PNS,"/",3) D INT^%DATE S NOJ=%DN K %DN
 S %JR=NOJ1 D ZCEJOUR^%QMDATE4 S NOJ1=NOJ1-$S(%NJ="LUNDI":0,%NJ="MARDI":1,%NJ="MERCREDI":2,%NJ="JEUDI":3,%NJ="VENDREDI":4,%NJ="SAMEDI":5,%NJ="DIMANCHE":6),%RNS=((NOJ-NOJ1)\7)+1 K NOJ,NOJ1,%PNS,%NJ Q %RNS
 
 ;TEST W "DATE: " R %PNS I %PNS="" K %PNS,%RNS Q
 ;W !,"   ====> SEMAINE NO: ",$$P($ZPOS,"^",2),SEM(%PNS),! G TEST

