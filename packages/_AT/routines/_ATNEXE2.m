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
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ATNEXE2^INT^1^59547,73866^0
%ATNEXE2 ;;05:51 PM  5 Aug 1993; ; 08 Sep 93 10:08 AM
 
 
 
 
 
ETAT 
 
 
 
 
 
 
 S %VNI(%VNGA,5)=0
BCLAC I %FIN=1 S %FIN=0 G FINAC
 I %FIN=2 S %FIN=0 G FIN3^%ATNEXE
 S %VNI(%VNGA,5)=%VNI(%VNGA,5)+1
 G:'($D(@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1),%VNI(%VNGA,5)))) FINAC
 
 
 S %VNG(5)=@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1),%VNI(%VNGA,5))
 I $E(%VNG(5),1,2)=":|" G BCLAC
 I $E(%VNG(5),1,2)="D|" G APACT
 I $E(%VNG(5),1,2)="C|" G APPATN
 
 I $E(%VNG(5),1,2)="X|" S %VNG(5)=$E(%VNG(5),3,$L(%VNG(5)))
 S $ZT="G ERRAC^%ATNEXE2"
 X %VNG(5)
 S $ZT=""
 G BCLAC
APACT 
 S %VNG(6)=$P(%VNG(5),"|",2),%VNG(5)=$P(%VNG(6),"(")
 S @("%VNG(7)="_"("_$P(%VNG(6),"(",2,999))
 
 D @(^RQSGLU("ACTIONS.ATN",%VNG(5),"ADRESSE")_"("_%VNG(7)_")")
 G BCLAC
 
 
APPATN 
 S %VNG(6)=$P(%VNG(5),"|",2),%VNG(5)=$P(%VNG(6),"(")
 D JOURNAL^%ATNEXE3("appel de l'atn "_%VNG(5))
 S %TMP(1)=%VNI(%VNGA,7),%TMP(2)=%VNE(%VNGA,3)
 
 D VARX^%QCAMEM(GSVGDE)
 S @("%VNGA="_"("_$P(%VNG(6),"(",2,999))
 S %VNE(%VNGA,1)=%VNG(5)
 S %VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 S %VNE(%VNGA,3)=$S(%TMP(2)=0:0,1:$$VISIBLE^%ATNEXE3(%VNG(5)))
 S %VNE(%VNGA,7)=%TMP(1)-1
 K ^PARASOR($J,%VNGA)
 G START^%ATNEXE
RETGOA S %TMP(1)=%VNS(%VNGA,7)
 D RVARX^%QCAMEM
 
 S %VNI(%VNGA,7)=%TMP(1)+1
 I %VNE(%VNGA,3) D AFF^%QULELV(%VNI(%VNGA,11))
 D JOURNAL^%ATNEXE3("retour de l'atn "_%VNG(5))
 G BCLAC
 
FINAC I %VNE(%VNGA,3),$D(@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1))),@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1)) D AFF^%QULELV(%VNI(%VNGA,11))
 G FINAC^%ATNEXE
 
 
 
ERRAC S $ZT=""
 D POCLEPA^%VVIDEO
 D ^%VZEAVT($ZE)
 D ^%VZEAVT(%VNG(5))
 B
 G BCLAC
 
 
 
 
 
 
 
 
 
TRANSIT 
 
 
 S %VNI(%VNGA,13)=-1
 
 
 
 I %VNI(%VNGA,12)'="",$D(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")) S @("%VNI(%VNGA,13)="_^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")_"(%VNE(%VNGA,1),%VNI(%VNGA,1),%VNI(%VNGA,6),""?"")")
 G:%VNI(%VNGA,13)=1 OKTRA0 G:%VNI(%VNGA,13)=0 NOKTRA0
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
 S @("%VNG(5)="_^RQSGLU("ACTIONS.ATN",%VNG(5),"ADRESSE")_"("_%VNG(7)_")")
 G:'(%VNG(5)) NOKTRA
 G BCLCND
 
NOKTRA 
 I %VNI(%VNGA,12)'="",$D(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")) S @("%VNI(%VNGA,13)="_^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")_"(%VNE(%VNGA,1),%VNI(%VNGA,1),%VNI(%VNGA,6),0)")
NOKTRA0 I %VNE(%VNGA,3),$D(@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1),%VNI(%VNGA,6))),@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1),%VNI(%VNGA,6)) D AFF^%QULELV(%VNI(%VNGA,11))
 G NOKTRA^%ATNEXE
 
OKTRA 
 I %VNI(%VNGA,12)'="",$D(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")) S @("%VNI(%VNGA,13)="_^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.TRANSITION")_"(%VNE(%VNGA,1),%VNI(%VNGA,1),%VNI(%VNGA,6),1)")
OKTRA0 I %VNE(%VNGA,3),$D(@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1),%VNI(%VNGA,6))),@%VNI(%VNGA,3)@("V",%VNI(%VNGA,1),%VNI(%VNGA,6)) D AFF^%QULELV(%VNI(%VNGA,11))
 G OKTRA^%ATNEXE
 
ERRCOND 
 S $ZT=""
 D POCLEPA^%VVIDEO
 D ^%VZEAVT($ZE)
 D ^%VZEAVT(%VNG(6))
 B
 G NOKTRA^%ATNEXE

