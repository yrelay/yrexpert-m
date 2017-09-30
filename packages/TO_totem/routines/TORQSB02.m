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

;TORQSB02^INT^1^59547,74875^0
TORQSB02(BASE,ARC,LIS,LATT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
BEG(BASE,ARC,LIS,LATT) 
 K ^PARVU($J)
 N QUANTI,QUANTIF,QUANT,TB
 S QUANTI=$$^%QSCALVA(BASE,ARC,"QUANTITE"),QUANTIF=$$^%QSCALVA(BASE,ARC,"QUANTITE.A.FABRIQUER"),QUANT=$S(QUANTI'="":QUANTI,1:QUANTIF)
 S IDT=$$^%QSCALVA(BASE,ARC,"IDENTIFIANT.TOTEM") G FIN:IDT=""
 S ART=$P(IDT,"/",1) G:ART="" END G:('($D(^[QUI]FULL(ART))))&('($D(^[QUI]ACOMMEB(ART)))) END S IDT=ART_":"_$P(IDT,"/",2,999),%NE=%NE+1,NU=%NE,^ETUARC($I,%NE)=IDT_"^"_ARC_"^"_QUANT_"^"_LIS_"^"_BASE
 D EXP S TB=$$LISTATT1^%QSGEST6(BASE,ARC)
 
 
 I LATT="*" S %P="" F %U=1:1 S %P=$O(@TB@(%P)) Q:%P=""  S %VAL=$$^%QSCALVA(BASE,ARC,%P) I %VAL'="" S ^PARFIX($I,NU,%P)=%VAL,^PARVU($J,%P)=""
 I (LATT'="*")&(LATT'="") S %P="" F %U=1:1 S %P=$O(LATT(%P)) Q:%P=""  S %VAL=$$^%QSCALVA(BASE,ARC,%P) I %VAL'="" S ^PARFIX($I,NU,%P)=%VAL,^PARVU($J,%P)=""
 
 K TT D LIEN^%QSGEST9(BASE,"TT") S RP="" F %U=1:1 S RP=$O(TT(RP)) Q:RP=""  I TT(RP)=1 G RP
 G FIN
RP 
 S RP=$$REPD^%QSGEL2(BASE,RP)
 S INDP=$P(ARC,",",1,$L(ARC,",")-1)
 S TB=$$LISTATT1^%QSGEST6(RP,INDP)
 
 
 I LATT="*" S %P="" F %U=1:1 S %P=$O(@TB@(%P)) Q:%P=""  S %VAL=$$^%QSCALVA(RP,INDP,%P) I '($D(^PARVU($J,%P))),%VAL'="" S ^PARFIX($I,NU,%P)=%VAL,^PARVU($J,%P)=""
 I (LATT'="*")&(LATT'="") S %P="" F %U=1:1 S %P=$O(LATT(%P)) Q:%P=""  S %VAL=$$^%QSCALVA(RP,INDP,%P) I '($D(^PARVU($J,%P))),%VAL'="" S ^PARFIX($I,NU,%P)=%VAL,^PARVU($J,%P)=""
FIN Q
EXP 
 
 N I,N,P S N="" F I=0:0 S N=$O(^[QUI]EXPLICI(ART,N)) Q:N=""  S P="" F I=0:0 S P=$O(^[QUI]EXPLICI(ART,N,P)) Q:P=""  S ^PARVU($J,P)=""
 Q
END Q

