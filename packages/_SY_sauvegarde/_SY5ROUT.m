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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SY5ROUT^INT^1^59547,73892^0
%SY5ROUT ;;09:30 AM  8 Jun 1993; 09 May 90  2:22 PM ; 08 Jun 93  9:39 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RSET 
 I '($D(%JO)) S %JO=$J#1024
 S %R=$$^%rselect
 N %r,rt S rt=""
 K ^UTILITY(%JO)
 F %r=1:1:%R S rt=$O(^%RSET($J,rt)),^UTILITY(%JO,rt)=""
 S ^UTILITY(%JO,0)=%R_";ROU"
 Q
 
 
 
 
 
 
 
 
 
EXIGLROU(QUR,ROUT) 
 Q:QUR="" 0
 Q:ROUT="" 0
 I $D(^[QUR]ROUTINE(ROUT)) Q 1
 Q 0
 
 
 
 
 
 
 
 
 
CONST(QUR,ROUT) 
 Q:'(DTM)
 N SOUR,%I
 Q:ROUT=""
 K ^[QUR]ROUTINE(ROUT)
 S SOURC=$ZRS(ROUT)
 Q:SOURC=""
 S I=1
 F %I=0:0 S L=$P(SOURC,$C(10),I) Q:L=""  S ^[QUR]ROUTINE(ROUT,0,I)=L,I=I+1
 S ^[QUR]ROUTINE(ROUT,0,0)=I-1
 Q
 
 
 
 
 
 
 
 
 
TUEROUT(QUR,ROUT) 
 Q:'(DTM)
 K ^[QUR]ROUTINE(ROUT)
 Q
 
 
 
 
 
 
 
 
TUEGLOB(QUR) 
 Q:'(DTM)
 K ^[QUR]ROUTINE
 Q
 
 
 
 
 
SELECT(QUR,PREF,GLO) 
 N L,ROU,PCOUR
 S PCOUR=$P($ZPOS,"^",2)SPACE
 ;HL002 S $ZT="G SELERR" ZN QUR
 S $ZT="G SELERR" S ZN=$$ZGBLDIR^%GTM(QUR)
 S $ZT=""
 S L=$L(PREF)
 I $$EXIROU(QUR,PREF) S @GLO@(PREF)=""
 S ROU=PREF F  S ROU=$ZRN(ROU) Q:ROU=""  Q:$E(ROU,1,L)'=PREF  S @GLO@(ROU)=""
 ;HL002 ZN PCOUR
 S ZN=$$ZGBLDIR^%GTM(PCOUR)
 Q
SELERR S $ZT="" Q
 
 
 
 
 
EXIROU(QUR,ROUT) 
 N PCOUR,X1,X2
 Q:QUR="" 0 Q:ROUT="" 0
 S PCOUR=$P($ZPOS,"^",2)SPACE,$ZT="G EXIERR",X1="ZL "_ROUT,X2="ZL "_$P($ZPOS,"^",2)
 ;HL002 ZN QUR X X1
 S ZN=$$ZGBLDIR^%GTM(QUR) X X1
 ;HL002 S $ZT="" ZN PCOUR X X2 Q 1
 S $ZT="" S ZN=$$ZGBLDIR^%GTM(PCOUR) X X2 Q 1
;HL002 EXIERR S $ZT="" ZN PCOUR X X2 Q 0
EXIERR S $ZT="" S ZN=$$ZGBLDIR^%GTM(PCOUR) X X2 Q 0
 
 
 
 
 
SUPROU(QUR,GLO) 
 N PCOUR,X1,X2
 ;HL002 S PCOUR=$P($ZPOS,"^",2)SPACE,$ZT="G SUPERR1" ZN QUR S $ZT=""
 S PCOUR=$P($ZPOS,"^",2)SPACE,$ZT="G SUPERR1" S ZN=$$ZGBLDIR^%GTM(QUR) S $ZT=""
 S ROUT="",X1="ZL @ROUT ZR  ZS @ROUT"
SUPBCL S ROUT=$O(@GLO@(ROUT)) Q:ROUT=""
 S $ZT="G SUPERR2" X X1 S $ZT="" G SUPBCL
SUPERR2 S $ZT="" G SUPBCL
SUPERR1 S $ZT="" Q

