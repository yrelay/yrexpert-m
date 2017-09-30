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

;%QSGES26^INT^1^59547,73881^0
%QSGES26 ;;10:41 AM  5 Apr 1993; ; 05 Apr 93 10:52 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VERIF(R1,L1,R2) 
 N T1,T2,ORD1,ORD2,REPLIEN,L2,QUAL1,QUAL2
 Q:'($D(^[QUI]RQSNOINT(R1))) 0
 Q:'($D(^[QUI]RQSNOINT(R2))) 0
 Q:'($D(^[QUI]RQSLIEN(R1,L1))) 0
 S T1=$P(^[QUI]RQSLIEN(R1,L1),"^") Q:'(T1) 0 Q:T1=2 0
 Q:'($D(^[QUI]RQSILIEN(R1,R2,T1,L1))) 0
 S L2=$P(^[QUI]RQSILIEN(R1,R2,T1,L1),"^",2)
 Q:'($D(^[QUI]RQSLIEN(R2,L2))) 0
 S T2=$P(^[QUI]RQSLIEN(R2,L2),"^") Q:'(T2) 0 Q:T2=2 0
 S QUAL1=$S($D(^[QUI]RQSQUAL(R1,L1)):1,1:0)
 S QUAL2=$S($D(^[QUI]RQSQUAL(R2,L2)):1,1:0)
 Q:('(QUAL1))&('(QUAL2)) 1
 S REPLIEN=$$LIENI^%QSGEL3
 Q:'($D(^[QUI]RQSNCLES(REPLIEN))) 0
 I QUAL1 Q:'($$VERIF2(R1,"LIEN."_L1,REPLIEN)) 0 Q:'($$VERIF2(REPLIEN,"DESTINATION."_L1,R2)) 0
 I QUAL2 Q:'($$VERIF2(R2,"LIEN."_L2,REPLIEN)) 0 Q:'($$VERIF2(REPLIEN,"DESTINATION."_L2,R1)) 0
 Q 1
 
VERIF2(R1,L1,R2) 
 N L2
 Q:'($D(^[QUI]RQSILIEN(R1,R2,3,L1))) 0
 S L2=$P(^[QUI]RQSILIEN(R1,R2,3,L1),"^",2) Q:'($D(^[QUI]RQSLIEN(R1,L1))) 0
 Q:'($D(^[QUI]RQSLIEN(R2,L2))) 0
 Q 1
 
 
 
ADDS(R1,I1,L1,R2,I2) 
 N T1,T2,REPLIEN,L2,QUA1,QUA2,REPL1,REP2,NOML,LI
 S T1=$P(^[QUI]RQSLIEN(R1,L1),"^")
 S L2=$P(^[QUI]RQSILIEN(R1,R2,T1,L1),"^",2)
 S T2=$P(^[QUI]RQSLIEN(R2,L2),"^")
 D PASPEED^%QSGESTJ(R1,I1,L1,I2,I2),PASPEED^%QSGESTJ(R2,I2,L2,I1,I1)
 S QUA1=$S($D(^[QUI]RQSQUAL(R1,L1)):1,1:0)
 S QUA2=$S($D(^[QUI]RQSQUAL(R2,L2)):1,1:0)
 Q:('(QUA1))&('(QUA2))
 S REPLIEN=$$LIENI^%QSGEL3,REPL1=^[QUI]RQSNOINT(R1),REPL2=^[QUI]RQSNOINT(R2)
 G:'(QUA1) LIEN2
 
 S NOML=$$NOML^%QSGES20(I1,I2,L1,I2)
 I $$IR^%QSGE5(REPLIEN,NOML) D SX^%QSGESTK(REPLIEN,NOML)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.SOURCE",REPL1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.DESTINATION",REPL2,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NUMERO.ORDRE",I2,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM.LIEN",L1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM",NOML,1)
 D PASPEED^%QSGESTJ(R1,I1,"LIEN."_L1,NOML,NOML)
 S LI=$P(^[QUI]RQSILIEN(R1,REPLIEN,3,"LIEN."_L1),"^",2)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,LI,I1,I1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"DESTINATION."_L1,I2,I2)
 S LI=$P(^[QUI]RQSILIEN(REPLIEN,R2,3,"DESTINATION."_L1),"^",2)
 D PASPEED^%QSGESTJ(R2,I2,LI,NOML,NOML)
 Q:'(QUA2)
LIEN2 
 S NOML=$$NOML^%QSGES20(I2,I1,L2,I1)
 I $$IR^%QSGE5(REPLIEN,NOML) D SX^%QSGESTK(REPLIEN,NOML)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.SOURCE",REPL2,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.DESTINATION",REPL1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NUMERO.ORDRE",I1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM.LIEN",L2,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM",NOML,1)
 D PASPEED^%QSGESTJ(R2,I2,"LIEN."_L2,NOML,NOML)
 S LI=$P(^[QUI]RQSILIEN(R2,REPLIEN,3,"LIEN."_L2),"^",2)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,LI,I2,I2)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"DESTINATION."_L2,I1,I1)
 S LI=$P(^[QUI]RQSILIEN(REPLIEN,R1,3,"DESTINATION."_L2),"^",2)
 D PASPEED^%QSGESTJ(R1,I1,LI,NOML,NOML)
 Q
 
 
 
 
CREERLS(REP1,REPL1,OB1,ORD1,L,REP2,REPL2,OB2) 
 S NOML=$$NOML^%QSGES20(OB1,ORD1,L,OB2)
 I $$IR^%QSGE5(REPLIEN,NOML) D SX^%QSGESTK(REPLIEN,NOML)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.SOURCE",REPL1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"REP.DESTINATION",REPL2,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NUMERO.ORDRE",ORD1,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM.LIEN",L,1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"NOM",NOML,1)
 D PASPEED^%QSGESTJ(REP1,OB1,"LIEN."_L,NOML,NOML)
 S LI=$P(^[QUI]RQSILIEN(REP1,REPLIEN,3,"LIEN."_L),"^",2)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,LI,OB1,OB1)
 D PASPEED^%QSGESTJ(REPLIEN,NOML,"DESTINATION."_L,OB2,OB2)
 S LI=$P(^[QUI]RQSILIEN(REPLIEN,REP2,3,"DESTINATION."_L),"^",2)
 D PASPEED^%QSGESTJ(REP2,OB2,LI,NOML,NOML)
 Q
 ;

