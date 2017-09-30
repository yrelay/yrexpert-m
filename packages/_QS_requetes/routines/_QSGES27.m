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

;%QSGES27^INT^1^59547,73881^0
%QSGES27 ;;06:01 PM  24 Apr 1992;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SUPS(R1,I1,L12,R2,I2) 
 N T1,T2,REPLIEN,QUAL1,QUAL2,TLIEN
 Q:'($D(^[QUI]RQSLIEN(R1,L12)))
 S T1=$P(^[QUI]RQSLIEN(R1,L12),"^") Q:T1=2
 Q:'($D(^[QUI]RQSILIEN(R1,R2,T1,L12)))
 S L21=$P(^[QUI]RQSILIEN(R1,R2,T1,L12),"^",2)
 Q:'($D(^[QUI]RQSLIEN(R2,L21)))
 S T2=$P(^[QUI]RQSLIEN(R2,L21),"^") Q:T2=2
 D PS^%QSGESTI(R1,I1,L12,I2,I2),PS^%QSGESTI(R2,I2,L21,I1,I1)
 S QUAL1=$$QUAL(R1,L12),QUAL2=$$QUAL(R2,L21) Q:'(QUAL1!QUAL2)
 S REPLIEN=$$LIENI^%QSGEL3,TLIEN=$$TLIEN^%QSGES21
 I QUAL1 S NOML=$$NOML1(I1,I2,L12,I2) I NOML'="" D SXLIEN^%QSGESTK(REPLIEN,NOML,L12,R1,I1,R2,I2),SUPNOM(I1,I2,L12,I2)
 I QUAL2 S NOML=$$NOML1(I2,I1,L21,I1) I NOML'="" D SXLIEN^%QSGESTK(REPLIEN,NOML,L21,R2,I2,R1,I1),SUPNOM(I2,I1,L21,I1)
 Q
 
 
 
NOML1(OB1,ORD1,L,OB2) 
 N NLIEN
 I ($D(@TLIEN@(L,OB1,OB2,ORD1))#10)=1 S NLIEN=@TLIEN@(L,OB1,OB2,ORD1) Q NLIEN
 Q ""
 
 
SUPNOM(OB1,ORD1,L,OB2) K @TLIEN@(L,OB1,OB2,ORD1) Q
 
 
QUAL(REP,L) Q:$D(^[QUI]RQSQUAL(REP,L)) 1 Q 0

