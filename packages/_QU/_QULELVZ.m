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
;! Nomprog     : %QULELVZ                                                     !
;! Module      : REQUETE SUR LISTE / EDITEUR EN LIEN                          !
;! But         : Affichage                                                    !
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
;! HL002 ! HL     ! 06/09/09 ! Perte du mode graphique W PK("SET").           !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULELVZ^INT^1^59547,73885^0
%QULELVZ ;;11:21 AM  15 Dec 1992; ; 06 Apr 93  3:05 PM
 
 
 
 
 
 
 
VARGPK S TW=AFFL,TF=AFFD,TC=COLAF+2,TD=LIGAF+2,TT=3
 K TJ S:TW#2 TW=TW+1 S @("TRO=PK(""ROF""),TR=PK(""RON"")") W PK("HI"),TRO
 S CTR="",TI=0
 Q
 
 
 
 
MAKEVUE N %I,%J,%AA,%BB,%CDEB,%LDEB,AFFH,NTR K TB,TBR
 D:'($D(TTR)) INITRE
 S TM=0,TE="TA="_PKP,AFFH=3,%LDEB=LDEB-1,%CDEB=CDEB-1
 S @("NTR(0,""NORM"")=PK(""Z""),NTR(1,""NORM"")=PK(""Z"")_PK(""RON"")")
 S @("NTR(0,""UDL"")=PK(""UO""),NTR(1,""UDL"")=PK(""Z"")_PK(""RON"")")
 S @("NTR(0,""BLK"")=PK(""BLK""),NTR(1,""BLK"")=PK(""RBLK"")")
 S @("NTR(0,""BLD"")=PK(""HI""),NTR(1,""BLD"")=PK(""RON"")")
 S @("NTR=PK(""Z"")")
 
 S %C=AFFD+1,%R=AFFH+1,@(TE),TB(1)=TA_"  "
 F %J=1:1:LIGAF S %R=%R+1,@(TE),TB(%J+1)=TA_$S('($D(@GY@(%CDEB,%J+%LDEB))):"  ",@GY@(%CDEB,%J+%LDEB)=TTR("TV"):"  ",@GY@(%CDEB,%J+%LDEB)=TTR("INT"):"  ",@GY@(%CDEB,%J+%LDEB)=TTR("FI"):"  ",1:"<-")
 S %R=%R+1,@(TE),TB(LIGAF+2)=TA_"  "
 
 S %C=%C+2 F %I=1:1:COLAF D COLI
 
 S %R=AFFH+1,@(TE),TB(((LIGAF+2)*(COLAF+1))+1)=TA_"  "
 S %AA=((LIGAF+2)*(COLAF+1))+1,%BB=CDEB+COLAF
 F %J=1:1:LIGAF S %R=%R+1,@(TE),TB(%J+%AA)=TA_$S('($D(@GY@(%BB,%J+%LDEB))):"  ",@GY@(%BB,%J+%LDEB)=TTR("TR"):"->",1:"->")
 S %R=%R+1,@(TE),TB((LIGAF+2)*(COLAF+2))=TA_"  "
 Q
 
COLI N MODE
 S %AA=(%I*(LIGAF+2))+1,%BB=%I+%CDEB
 S BLC=$S(%I#2:TTR("BLV"),1:TTR("BLT"))
 S %R=AFFH+1,@(TE),TB(%AA)=TA_$S('($D(@GY@(%BB,%LDEB))):BLC,@GY@(%BB,%LDEB)=TTR("FI"):"^",@GY@(%BB,%LDEB)=TTR("INT"):"^",1:BLC)
 
 S %J=0
COLI10 S %J=%J+1 G:%J>LIGAF COLI20
 S %R=%R+1,@(TE)
 I $D(@GY@(%BB,%J+%LDEB)) S MODE=$S($D(@GY@(%BB,%J+%LDEB,"M")):@GY@(%BB,%J+%LDEB,"M"),1:"NORM"),TB(%AA+%J)=TA_NTR(0,MODE)_@GY@(%BB,%J+%LDEB)_NTR,TBR(%AA+%J)=TA_NTR(1,MODE)_@GY@(%BB,%J+%LDEB)_NTR G COLI10
 S TB(%AA+%J)=TA_BLC
 G COLI10
COLI20 
 S %R=%R+1,@(TE),TB((%AA+LIGAF)+1)=TA_$S('($D(@GY@(%BB,(LIGAF+1)+%LDEB))):BLC,@GY@(%BB,(LIGAF+1)+%LDEB)=TTR("FI"):"!",@GY@(%BB,(LIGAF+1)+%LDEB)=TTR("INT"):"!",@GY@(%BB,(LIGAF+1)+%LDEB)=TTR("TV"):"!",1:BLC)
 S %C=%C+$S(%I#2:LARA,1:LART)
 Q
 
INITRE N %AA,%BB,%CC,%DD
 S %AA=(LARA-1)\2,%BB=LARA\2
 S TTR("TR")="",TTR("BLT")="" F %CC=1:1:LART S TTR("TR")=PK("HL")_TTR("TR"),TTR("BLT")=TTR("BLT")_" "
 S TTR("BLV")="" F %CC=1:1:LARA S TTR("BLV")=TTR("BLV")_" "
 S TTR("INT")=PK("LI"),TTR("TV")=PK("VL"),TTR("FI")=PK("BLC")
 S %DD="" F %CC=1:1:%AA S %DD=" "_%DD
 S TTR("INT")=%DD_PK("LI"),TTR("TV")=%DD_PK("VL"),TTR("FI")=%DD_PK("BLC")
 F %CC=1:1:%BB S TTR("INT")=TTR("INT")_PK("HL"),TTR("TV")=TTR("TV")_" ",TTR("FI")=TTR("FI")_PK("HL")
 Q
 
AFFVUE N %AA F %AA=1:1 Q:'($D(TB(%AA)))  W TB(%AA)
 Q
 
 
FDPAGE ; Fond de page (Entête et pied de page)
 N AFFH,%AA S AFFH=3
 D CLEPAG^%VVIDEO 

 W PK("SET") ;HL002 

 S %C=AFFD,TE=PK("VL")_$J("",TW)_PK("VL"),TM=PK("HL")_PK("HL")
 S %R=(AFFH+LIGAF)+3 W @(PKP),PK("BLC") F TI=2:2:TW W TM

 W PK("BRC") F %R=AFFH+TD:-1:AFFH+1 W @(PKP),TE
 S %R=AFFH W @(PKP),PK("TLC") F TI=2:2:TW W TM
 W PK("TRC")
 
 W TR S %C=1 F %R=1,2 W @(PKP),$J("",PK("C"))
 F %AA=1:3 Q:$P(TIT,$C(0),%AA)=""  S %R=$P(TIT,$C(0),%AA),%C=$P(TIT,$C(0),%AA+1),%BB=$P(TIT,$C(0),%AA+2) W @(PKP),%BB
 W TRO
 
 F %AA=1:1 Q:'($D(BDP(%AA)))  W BDP(%AA)
 I $D(BDP(OR)) W TR,BDP(OR),TRO,COM(OR)
 Q
 
 
 
 
AFFX N TU,TU1,TU2,PERE
 
 Q:'($D(TB(X)))  W TBR(X)
 
 
 
 G:$D(@EXT@(CC,LC)) AFF0
 K @(TPAR)
 S @TPAR@("O")=@GY@(CC,LC,"C"),@TPAR@("X")=IDFC
 S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:"")
 S @TPAR@("P")=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 S @TPAR@("N")=(CC\2)+1,@TPAR@("L")=AFFL X EXEFULL
 S %AA="",%BB=$E(AFF,1,AFFL),%DD=(AFFL-$L(%BB))\2 F %EE=1:1:%DD S %AA=%AA_PK("HL")
 S %CC=%AA S:((2*%DD)+$L(%BB))<AFFL %CC=%CC_PK("HL")
 S %C=AFFD+1,%R=$S($D(@UCO@("INFO")):18,1:20),@("TA="_PKP),@EXT@(CC,LC)=TA_TRO_%AA_TR_%BB_TRO_%CC
AFFINFO G:'($D(@UCO@("INFO"))) AFF0
 S PROC=@UCO@("INFO")
 S @("AFF="_PROC_"(TPAR)")
 S %CC=TR,%C=AFFD+1 F %R=19,20 S @("TA="_PKP),%CC=%CC_TA_$J("",AFFL)
 
 F %AA=1:3 Q:$P(AFF,$C(0),%AA)=""  S %R=$P(AFF,$C(0),%AA)+18,%C=$P(AFF,$C(0),%AA+1)+AFFD,%BB=$E($P(AFF,$C(0),%AA+2),1,(AFFL+3)-%C),TU(%R,%C)=%BB
 S %R="" F TU1=0:0 S %R=$O(TU(%R)) Q:%R=""  S %C="" F TU2=0:0 S %C=$O(TU(%R,%C)) Q:%C=""  S @("TA="_PKP),%CC=%CC_TA_TU(%R,%C)
 S @EXT@(CC,LC)=@EXT@(CC,LC)_%CC_TRO
AFF0 W @EXT@(CC,LC)
 Q:'($D(@UCO@("AFFIPLUS")))
 K @(TPAR)
 S @TPAR@("O")=@GY@(CC,LC,"C"),@TPAR@("X")=IDFC
 S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:"")
 S @TPAR@("P")=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 S @TPAR@("N")=(CC\2)+1,@TPAR@("L")=AFFL X EXEFULL
 D @(@UCO@("AFFIPLUS")_"(TPAR)")
 Q
 
 
 
NORMX 
 W:$D(TB(X)) TB(X) Q
 ;
 ;

