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

;%ATPATN2^INT^1^59547,73866^0
%ATPATN2 ;;09:47 AM  3 Dec 1992; ; 03 Dec 92 10:33 AM
 
 
INDUCTION(OBJET,OB,DECI) 
 U 0 W !,"induction",OBJET," ",OB," "
 Q:'(@PETRI@(OB))  I @JETON@(OB,"NB")=@DEGINT@(OB),@ATTEND@(OB) S @JETON@(OB)="BLANC",DECIP=@ATTEND@(OB) K @DECKAT@(DECIP) S @ATTEND@(OB)=0 Q
 I @JETON@(OB,"NB")<@DEGINT@(OB) D INSERT(OBJET,OB,DECI) Q
 Q
INSERT(OBJET,OB,DECI) 
 
 I @ATTEND@(OB) D INSERT1(OBJET,OB,DECI) Q
 S TIME=TIME+1,DECIP=$$NEXTDECI^%ATP(DECI)
 D ACCEPTE^%ATP(TIME,DECIP,OB,0,0) S @DECKAT@(DECIP)=TIME,@DECKAT@(DECIP,"RESULTAT")="ATTENTE",@DECKAT@(DECIP,"ATTENTE.SYSTEME")=1,@DECKAT@(DECIP,"ATTENTE.UTILISATEUR")=0,@ATTEND@(OB)=DECIP
 S g="" F j=1:1:NOBJET Q:'($D(@GRAPHE@(j,OB)))  S @DECKAT@(DECIP,"ATTEND.PRED",g)=TIME
 S @JETON@(OB)="ATTEND."_DECIP
 Q
INSERT1(OBJET,OB,DECI) 
 S DECIP=@ATTEND@(OB)
 K @DECKAT@(DECIP,"ATTEND.PRED",OBJET)
 I '($D(@DECKAT@(DECIP,"ATTEND.PRED"))),@JETON@(OB,"NB")=@DEGINT@(OB) S @JETON@(OB)="BLANC" K @DECKAT@(DECIP) S @ATTEND@(OB)=0 Q
 I '($D(@DECKAT@(DECIP,"ATTEND.PRED"))),@JETON@(OB,"NB")<@DEGINT@(OB) S @JETON@(B)="BLANC",DECIP=@ATTEND@(OB) K @DECKAT@(DECIP) S @ATTEND@(OB)=0
q 
 
PROPAG(x) 
 N OB1,OB2 S @AT@(x)=1 U 0 W !,x," provisoirement non recusable"
 S OB1="" F OB2=1:1 S OB1=$O(@ORIJET@(x,OB1)) Q:OB1=""  D PROPAG(OB1)
 Q
 
ECHOUER(OBJET) 
 
 S DECIP=@ATTEND@(OBJET)
 K @DECKAT@(DECIP)
 S @ATTEND@(OB)=0 Q
 
 
 
 
 
 
EVALATN(OBJET) 
 S %VNGA=1
 S %VNI(%VNGA,1)=OBJET-1
 S %VNI(%VNGA,3)="^[QUI]RQSGLO(""ATN"","""_NOMATN_""")"
 
 
 
 
 
 S %VNI(%VNGA,5)=0
BCLAC S %VNI(%VNGA,5)=%VNI(%VNGA,5)+1
 G:'($D(@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1),%VNI(%VNGA,5)))) FINAC
 
 
 S %VNG(5)=@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1),%VNI(%VNGA,5))
 I $E(%VNG(5),1,2)=":|" G BCLAC
 I $E(%VNG(5),1,2)="D|" G APACT
 I $E(%VNG(5),1,2)="C|" G APPATN
 
 I $E(%VNG(5),1,2)="X|" S %VNG(5)=$E(%VNG(5),3,$L(%VNG(5)))
 S $ZT="ERRAC^%ATPATN2"
 X %VNG(5)
 S $ZT=""
 G BCLAC
APACT 
 S %VNG(6)=$P(%VNG(5),"|",2),%VNG(5)=$P(%VNG(6),"(")
 S @("%VNG(7)="_"("_$P(%VNG(6),"(",2,999))
 
 D @(^[QUI]RQSGLO("ACTIONS.ATN",%VNG(5),"ADRESSE")_"("_%VNG(7)_")")
 G BCLAC
 
 
APPATN 
 S %VNG(6)=$P(%VNG(5),"|",2),%VNG(5)=$P(%VNG(6),"(")
 D JOURNAL^%ATNEXE("appel de l'atn "_%VNG(5))
 D MEMX^%QCAMEM
 S @("%VNGA="_"("_$P(%VNG(6),"(",2,999))
 S %VNE(%VNGA,1)=%VNG(5)
 S %VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 K ^PARASOR($J,%VNGA)
 G START^%ATNEXE
RETGOA D RVARX^%QCAMEM
 
 G BCLAC
 
FINAC 
 
 Q 1
 
 
 
ERRAC S $ZT=""
 D POCLEPA^%VVIDEO
 D ^%VZEAVT($ZE)
 D ^%VZEAVT(%VNG(5))
 B
 G BCLAC
 
 
 
 
 
 
 
 
EVALARC(OBJET,OB,RESUL) 
 S %VNG(1)=0
 S %VNGA=1,%VNI(%VNGA,1)=OBJET-1,%VNI(%VNGA,6)=OB-1
 S %VNI(%VNGA,3)="^[QUI]RQSGLO(""ATN"","""_NOMATN_""")"
TRANSIT 
 S $ZT="ERRCOND^%ATPATN2"
 S %VNI(%VNGA,5)=0
BCLCND S %VNI(%VNGA,5)=%VNI(%VNGA,5)+1
 G:'($D(@%VNI(%VNGA,3)@("T",%VNI(%VNGA,1),%VNI(%VNGA,6),%VNI(%VNGA,5)))) OKTRA
 G:@%VNI(%VNGA,3)@("T",%VNI(%VNGA,1),%VNI(%VNGA,6),%VNI(%VNGA,5))="SINON" OKTRA
 S %VNG(6)=@%VNI(%VNGA,3)@("T",%VNI(%VNGA,1),%VNI(%VNGA,6),%VNI(%VNGA,5))
 S %VNG(7)=$E(%VNG(6),1,2)
 I %VNG(7)="I|" S %VNG(6)=$E(%VNG(6),3,$L(%VNG(6))) G CNDI
 I %VNG(7)="X|" S %VNG(6)=$E(%VNG(6),3,$L(%VNG(6))) G CNDX
 I %VNG(7)="D|" S %VNG(6)=$E(%VNG(6),3,$L(%VNG(6))) G CNDD
 I %VNG(7)=":|" G BCLCND
CNDI S @("%VNG(5)=("_%VNG(6)_")")
 G:'(%VNG(5)) NOKTRA
 G BCLCND
CNDX X %VNG(6)
 G BCLCND
CNDD 
 S %VNG(5)=$P(%VNG(6),"(")
 S @("%VNG(7)="_"("_$P(%VNG(6),"(",2,999))
 S @("%VNG(5)="_^[QUI]RQSGLO("ACTIONS.ATN",%VNG(5),"ADRESSE")_"("_%VNG(7)_")")
 G:'(%VNG(5)) NOKTRA
 G BCLCND
 
NOKTRA 
 Q 0
 
OKTRA 
 Q 1
 
 
ERRCOND 
 S $ZT=""
 D POCLEPA^%VVIDEO
 D ^%VZEAVT($ZE)
 D ^%VZEAVT(%VNG(6))
 B
 G NOKTRA
