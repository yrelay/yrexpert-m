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

;%VCARGR^INT^1^59547,74034^0
GECARGR ;
 
 
NCLE(SCR,NBCH) 
 N I,BCLE
 S BCLE=0
 F I=1:1:NBCH S:$D(^%SCRE(SCR,I))=11 BCLE=BCLE+1
 Q BCLE
NONCLE(SCR,NBCH) 
 N I,BNCLE
 S BNCLE=0
 F I=1:1:NBCH S:$D(^%SCRE(SCR,I))'=11 BNCLE=BNCLE+1
 Q BNCLE
TCHP(SCR) 
 N I,NBCHP
 S NBCHP=^%SCRE(SCR)
 F I=1:1:NBCHP S TABCHP(I)=$D(^%SCRE(SCR,I))=11
 Q
TCLE(SCR) 
 N I,J
 Q:NBCLE=0
 S I=0
BOUCLE1 S I=I+1,J=0 D BOUCLE2 Q:I=NBCLE
 G BOUCLE1
BOUCLE2 S J=J+1 S:$$NCLE(SCR,J)=I TABCLE(I)=J
 G:$$NCLE(SCR,J)'=I BOUCLE2
 Q
 
TNONCLE(SCR) 
 N I,J
 Q:NBNCLE=0
 S I=0
BOUCLEN1 S I=I+1,J=0 D BOUCLEN2 Q:I=NBNCLE
 G BOUCLEN1
BOUCLEN2 S J=J+1 S:$$NONCLE(SCR,J)=I TABNCLE(I)=J
 G:$$NONCLE(SCR,J)'=I BOUCLEN2
 Q
 
TEST(GR) 
 N NBCHP,I
 S NBCHP=^%SCRE(GR)
 S NBCLE=$$NCLE(GR,NBCHP) W !,"NBCLE : ",NBCLE
 S NBNCLE=$$NONCLE(GR,NBCHP) W !,"NBNCLE : ",NBNCLE
 D TCHP(GR) F I=1:1:NBCLE+NBNCLE W !,"LE CHAMP ",I," EST  UN ",TABCHP(I)," CLE"
 D TCLE(GR) F I=1:1:NBCLE W !,"LA CLE NO ",I," EST EN POSITION ",TABCLE(I)
 D TNONCLE(GR) F I=1:1:NBNCLE W !,"LE CHAMP-NON-CLE NO ",I," EST EN POSITION ",TABNCLE(I)
 Q

