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

;%QMTRA2^INT^1^59547,73879^0
QMTRA2 ;
 
 
 
 
 
 
 
 
 
 
 
 
TRMOD(M) 
 N TEMP,QSMOTR,DEJAVU,ATLIEN,QSMOTRI
 N %I,%U,R,C,J,NI,NC,P,F,L,I,FILS,LIE,LIEN1,LIEN2,IN
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transformation du schema ")_M,0)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S DEJAVU=$$CONCAS^%QZCHAD(TEMP,"DEJAVU")
 S ATLIEN=$$CONCAS^%QZCHAD(TEMP,"ATLIEN")
 S QSMOTR="^RQSGLU(""QMTRA"",$J,""QSMOTR"")"
 S QSMOTRI="^RQSGLU(""QMTRA"",$J,""QSMOTRI"")"
 K @(QSMOTR),@(QSMOTRI)
 
 S R="" F %I=1:1 S R=$O(^RQSMOD1(M,R)) Q:R=""  D TR(QSMOTR,QSMOTRI)
 D TRANS^%QMTRA1(M,QSMOTR,QSMOTRI)
 K @(TEMP)
 K @(QSMOTR),@(QSMOTRI)
 Q
TR(GL,GLI) 
 S C=^RQSMOD1(M,R),J=1
 F I="NI","NC","P","F(1)","F(2)","F(3)","F(4)","F(5)","F(6)","F(7)","F(8)","F(9)","F(10)","L(1)","L(2)","L(3)","L(4)","L(5)","L(6)","L(7)","L(8)","L(9)","L(10)" S @I=$P(C,"^",J),J=J+1
 F %U=1:1:10 S FILS=F(%U) D:FILS'="" CFILS
 F %U=1:1:10 S LIE=L(%U) D:LIE'="" CLIE
 
 S ^RQSMDL1(M,R)=NI_"^"_NC_"^"
 S @GLI@(M,R)=NI
 Q
CFILS 
 S LIEN1=FILS
 I $$EXIS(LIEN1) S IN=$$INDICE(LIEN1),LIEN1=LIEN1_"."_IN
 S LIEN2=R
 I $$EXIS(LIEN2) S IN=$$INDICE(LIEN2),LIEN2=LIEN2_"."_IN
 S @DEJAVU@(R,FILS)=""
 S @GL@(R,FILS)=LIEN1
 S @GL@(FILS,R)=LIEN2
 S ^RQSMDL2(M,R,LIEN1)=FILS_"^"_LIEN2_"^N^N^"
 Q
CLIE 
 
 
 Q:$D(@DEJAVU@(LIE,R))
 S LIEN1=LIE
 I $$EXIS(LIEN1) S IN=$$INDICE(LIEN1),LIEN1=LIEN1_"."_IN
 S LIEN2=R
 I $$EXIS(LIEN2) S IN=$$INDICE(LIEN2),LIEN2=LIEN2_"."_IN
 S @DEJAVU@(R,LIE)=""
 S @GL@(R,LIE)=LIEN1
 S @GL@(LIE,R)=LIEN2
 S ^RQSMDL3(M,R,LIEN1)=LIE_"^"_LIEN2_"^N^N^"
 Q
EXIS(AT) 
 I $D(@ATLIEN@(AT)) Q 1
 S @ATLIEN@(AT)=1
 Q 0
INDICE(AT) 
 N NI
 S NI=@ATLIEN@(AT),@ATLIEN@(AT)=@ATLIEN@(AT)+1
 Q NI
 
DIA 
 N YY1,CTR,MES,M,VDEF
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transformation d'un Schema de donnees"),0)
VDEF S YY1="",VDEF=" ",MES=$$^%QZCHW("Nom du modele : ")
 D S1^%VLECFL(VDEF,MES,10,5,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1=" ")
 S M=YY1 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu... ")) G VDEF
 D TRMOD(M)
 Q
AUTO 
 
 N M
 S M=$$MODEL^%QSMODEL
 D TRMOD(M)
 Q

