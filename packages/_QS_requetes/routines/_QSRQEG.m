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
;! Nomprog     : %QSRQEG                                                      !
;! Module      : %QS - requete                                                !
;! But         : Calculer la requete                                          !
;!                                                                            !
;! Description : $REQUETE                                                     !
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
;! HL002 ! HL     ! 05/05/20 ! Traiter le cas du GUILLEMET.DROIT              !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSRQEG^INT^1^59547,73883^0
RQSRQEG(A,LD,B,FC,N) 
 
 
 
 
 
 
 
 
 
 
 
 N I2,NB,O,J,L,V,%V,ATS
 S L=$$RED^%ANA(A,"LATT"),J=$P(L,",",1),N=0
 S P1=$P(FC,"=",1),P2=$P(FC,"=",2)
 F V="P1","P2" S @V=$S(@V[")":$E(@V,1,$L(@V)-1),@V["(":$E(@V,2,$L(@V)),1:@V)
 S V=$S(P1=J:P2,1:P1)
 
 
 I (V+0)=V S @("V="_V) G ATR0

 ;test S REQUETE="%%%" view "LINK":"RECURSIVE" zl "_QSRQEG" D ACT^%QSINTER
 ;HL002 S V=$$ZSUBST^%QZCHSUB(V,"""","")
 I V="""""""""" S V="""" G ATR0
 I V="""""""" S V="""" G ATR0
 I V="""" S V="=" G ATR0
 S V=$$ZSUBST^%QZCHSUB(V,"""","")
 
ATR0 S ATS=J_"/"_$$NOMLOG^%QSF(B)
 I $$TYPE^%QSGESPE(ATS)="DATE" S V=$$INTF^%QMDAUC(B,J,V)
 
ATR S NB=0
 G:IND=0 SUIT
 
 I WHOIS("ETUDE")=0 S O="" F %V=0:0 S O=$$NXTRAVOI^%QSTRUC8(B,J,V,IND,O) Q:O=""  S NB=NB+1 W:(NB#10)=0 "*" I $D(@LD@(O)) S N=N+1,^[QUI]RQS3($J,B,FC,"OBJET",O)=""
 
 I WHOIS("ETUDE")'=0 S O="" F %V=0:0 S O=$O(@LD@(O)) Q:O=""  I $$GETVAL^%QSTRUC8(B,O,J,IND)=V S N=N+1,^[QUI]RQS3($J,B,FC,"OBJET",O)=""
 Q
SUIT 
 I WHOIS("ETUDE")=0 S I2="" F %I2=0:0 S I2=$$NXTRAVO^%QSTRUC8(B,J,V,I2) Q:I2=""  S O="" F %V=0:0 S O=$$NXTRAVOI^%QSTRUC8(B,J,V,I2,O) Q:O=""  S NB=NB+1 W:(NB#10)=0 "*" I $D(@LD@(O)) S N=N+1,^[QUI]RQS3($J,B,FC,"OBJET",O)=""
 I WHOIS("ETUDE")'=0 S O="" F %V=0:0 S O=$O(@LD@(O)) Q:O=""  I $$AIR^%QSGE5(B,O,J) S I2="" F %I2=0:0 S I2=$$NXTRIAO^%QSTRUC8(B,O,J,I2) Q:I2=""  I $$VALEUR^%QSTRUC8(B,O,J,I2)=V S N=N+1,^[QUI]RQS3($J,B,FC,"OBJET",O)=""
 Q

