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

;TROPTRA^INT^1^59547,74877^0
TROPTRA ;
 S GRAND=1000000000 K ^U($I),^V($I),^MARLI($I),^MARCO($I),^ETA($I),^EPS($I)
INIT 
 F I=1:1:M S ^U($I,I)=0,^ETA($I,I)=^C($I,I)
 F J=1:1:N S ^V($I,J)=GRAND,^EPS($I,J)=^B($I,J) F I=1:1:M S ^X($I,I,J)=0,^V($I,J)=$S(^V($I,J)>^A($I,I,J):^A($I,I,J),1:^V($I,J))
 D ^TRDRAW G UN
 
UN 
 F I=1:1:M D VALIN S:^ETA($I,I)>0 ^MARLI($I,I)="0,"_^ETA($I,I)
 D ^TRDRAW G UN1
VALIN S %ET=^C($I,I) F J=1:1:N S %ET=%ET-^X($I,I,J)
 S ^ETA($I,I)=%ET Q
 
UN1 
 F J=1:1:N I '($D(^MARCO($I,J))) D MCO
 D ^TRDRAW G TESTUN
MCO 
 F I=1:1:M I $D(^MARLI($I,I)),(^U($I,I)+^V($I,J))=^A($I,I,J) S ^MARCO($I,J)=I_","_$P(^MARLI($I,I),",",2)
 Q
 
TESTUN S VMQ=0 F J=1:1:N D VACO I $D(^MARCO($I,J)),VMQ'>^EPS($I,J) S VMQ=^EPS($I,J),Q=J
 G DEUX:VMQ>0
 G UN2
 
VACO S %ET=^B($I,J) F I=1:1:M S %ET=%ET-^X($I,I,J)
 S ^EPS($I,J)=%ET Q
 
UN2 
 S MARK=0 F I=1:1:M I '($D(^MARLI($I,I))) D MLI
 D ^TRDRAW G UN:MARK'=0,TROIS
 
MLI 
 F J=1:1:N I (^X($I,I,J)>0)&$D(^MARCO($I,J)) S DELTAJ=$P(^MARCO($I,J),",",2),%ET=DELTAJ,%ET=$S(^X($I,I,J)<DELTAJ:^X($I,I,J),1:%ET),^MARLI($I,I)=J_","_%ET,MARK=MARK+1
 Q
 
 
DEUX ;;;;;;;
 S DELTAQ=$P(^MARCO($I,Q),",",2),I=$P(^MARCO($I,Q),",",1),DELTA=$S(DELTAQ>^EPS($I,Q):^EPS($I,Q),1:DELTAQ) ;;W !," modif de la solution primale",*7,!,DELTAQ," ",Q,"  ",DELTA,"  ",^MARCO($I,Q)
DEUX1 D ^TRDRAW
 S P=I,^X($I,P,Q)=^X($I,P,Q)+DELTA,^EPS($I,Q)=^EPS($I,Q)-DELTA,J=$P(^MARLI($I,P),",",1),ETAP=$P(^MARLI($I,P),",",2),KX=0 F %J=1:1:N S KX=KX+^EPS($I,%J)
 G:(J=0)&(KX=0) OPT
 I (J=0)&(KX>0) K ^MARCO($I),^MARLI($I) G UN
DEUX2 
 S Q=J,^X($I,P,Q)=^X($I,P,Q)-DELTA,I=$P(^MARCO($I,Q),",",1),^EPS($I,Q)=^EPS($I,Q)+DELTA D ^TRDRAW G DEUX1
 
TROIS 
 S ALPHA=GRAND F I=1:1:M I $D(^MARLI($I,I)) F J=1:1:N I '($D(^MARCO($I,J))) S AL=(^A($I,I,J)-^U($I,I))-^V($I,J) S:ALPHA>AL ALPHA=AL
 D ^TRDRAW ;;W:ALPHA=GRAND *7,*7,"OPTIMALE AVEC  DEFAUT VECTEUR" 
 G OPT:ALPHA=GRAND
 ;; W !," POP DUAL ",ALPHA
 F I=1:1:M I '($D(^MARLI($I,I))) S ^U($I,I)=^U($I,I)-ALPHA
 F J=1:1:N I '($D(^MARCO($I,J))) S ^V($I,J)=^V($I,J)+ALPHA
 K ^MARLI($I),^MARCO($I) G UN
 
OPT 
 Q

