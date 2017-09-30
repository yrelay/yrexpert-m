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
;! Nomprog     : %QULELV1                                                     !
;! Module      : REQUETE SUR LISTE / EDITEUR EN LIEN                          !
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
;! HL002 ! HL     ! 06/09/09 ! Pour ne pas sortir avec les flèches.           !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%QULELV1 ;
 
 
RUN(TEMP,OBJ,OBJP,REAFF,MODG,RESUL) 
 N Y,VAR,%V,TTR,X,IVAR,CC,LC,%AA,%BB,%CC,BDP,COM,YMOD,OR,NUMUC,RES,RAF
 N TW,TF,TC,TD,TT,TB,TBR
 
 N G,RO,TIT,COLAF,LIGAF,CDEB,LDEB,LARA,LART,AFFL,EXEFULL,AFFD,IDFC
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 D GETADR^%QULELV
 S VAR="" F %V=0:0 S VAR=$O(@TEMP@("VAR",VAR)) Q:VAR=""  S @(VAR_"=@TEMP@(""VAR"",VAR)")
 F VAR=1:1 Q:'($D(@TEMP@("BDP",VAR)))  S BDP(VAR)=@TEMP@("BDP",VAR),COM(VAR)=@TEMP@("COM",VAR)
 D CHGPK^%PKUTIL,INITRE^%QULELVZ,VARGPK^%QULELVZ
 S YMOD=0
 I MODG K @(GY),@(GYINV),@(EXT),@TEMP@("VALY") D CONS^%QULELVX(G,RO,GY,GYINV,$S($D(@UCO@("TRI")):@UCO@("TRI"),1:""))
 
 
 I '($$POS^%QULELVX(OBJ,OBJP,.CC,.LC)) S (CC,LC)=1
LL I (((($D(@TEMP@("VALY"))<10)!(CC<CDEB))!(LC<LDEB))!(CC'<(CDEB+COLAF)))!(LC'<(LDEB+LIGAF)) G:REAFF REMAKE0 G REMAKE1
 S X="" F %V=0:0 S X=$O(@TEMP@("VALY",X)) Q:X=""  D AFFTB(X)
 G:REAFF REAFF2
 I $D(@TEMP@("X")) S X=@TEMP@("X") D AFFTB(X),NORMX^%QULELVZ
 G XSUIV
 
AFFTB(X) 
 S TB(X)=@TEMP@("VALY",X),TBR(X)=$S($D(@TEMP@("VALYR",X)):@TEMP@("VALYR",X),1:TR_TB(X))
 Q
 
SAUVTB(X) 
 S @TEMP@("VALY",X)=TB(X) I $D(TBR(X)) S @TEMP@("VALYR",X)=TBR(X)
 Q
 
SCROLL D MAKEVUE^%QULELVZ S YMOD=1 G REAFF3
 
REMAKE0 I (((CC'<CDEB)&(LC'<LDEB))&(CC<(CDEB+COLAF)))&(LC<(LDEB+LIGAF)) G REMAKE2
REMAKE1 S CDEB=CC,LDEB=LC
REMAKE2 D MAKEVUE^%QULELVZ S YMOD=1
REAFF2 D FDPAGE^%QULELVZ
REAFF3 D AFFVUE^%QULELVZ
XSUIV S X=((LIGAF+4)+(LC-LDEB))+((CC-CDEB)*(LIGAF+2))
SEL0 D AFFX^%QULELVZ
 
LEC
 U $P:ESCAPE 
 S TM=^%PK("TERMST"),ZF="" R TE#1 X TM
 
 I $A(TE)=32 W TRO,BDP(OR) S OR=OR+1 S:'($D(BDP(OR))) OR=1 W TR,BDP(OR),TRO,COM(OR) G LEC
 S OCDB=CDEB,OLDB=LDEB
 
 F %AA=2,4,6,8 I TE=%AA,$$PAGE^%QULELVY(%AA,.CDEB,.LDEB,.CC,.LC) G:(CDEB'=OCDB)!(LDEB'=OLDB) SCROLL G XSUIV
 
 F %AA="RK","LK","UK","DK" I ZF=PK(%AA),$$FLECHE^%QULELVY(%AA,.CDEB,.LDEB,.CC,.LC) G:(CDEB'=OCDB)!(LDEB'=OLDB) SCROLL W TRO,TB(X) G XSUIV
 S TE=$A(TE)
 I (TE'<$A("A"))&(TE'>$A("Z")) S TE=(TE+$A("a"))-$A("A")
 I (TE<$A("a"))!(TE>$A("z")) G LECS
 
 S %V=0 K LSEL F %AA=1:1 Q:'($D(@TABOPT@(%AA)))  S LSEL(%AA)=@TABOPT@(%AA)
BCLEC S %V=%V+1,%AA="" F %BB=0:0 S %AA=$O(LSEL(%AA)) Q:%AA=""  I $A($E(LSEL(%AA),%V))'=TE,(($A($E(LSEL(%AA),%V))+$A("a"))-$A("A"))'=TE K LSEL(%AA)
 S %AA=$O(LSEL("")) G:%AA="" LEC
 I $O(LSEL(%AA))'="" S TM=^%PK("TERMST"),ZF="" R TE#1 X TM S TE=$A(TE) S:(TE'<$A("A"))&(TE'>$A("Z")) TE=(TE+$A("a"))-$A("A") G:(TE<$A("a"))!(TE>$A("z")) LEC G BCLEC
 W TRO,BDP(OR) S OR=%AA W TR,BDP(OR),TRO,COM(OR) G OPTION
LECS I ZF="" G LEC
 
 ;HL002 S TE=$A(ZF) S:TE=27 TE=1 G:TE=13 OPTION
 S TE=$A(ZF) G:TE=13 OPTION
 
 I (TE<27)&(TE>0) S CTR=$C(TE+64) F %AA=1:1 Q:'($D(@TABOPT@(%AA)))  I $D(@TABOPT@(%AA,"CTR")),@TABOPT@(%AA,"CTR")=CTR W TRO,BDP(OR) S OR=%AA W TR,BDP(OR),TRO,COM(OR) G OPTION
 G LEC
 
 
MAKEG K @(GY),@(GYINV),@(EXT)
 D CONS^%QULELVX(G,RO,GY,GYINV,$S($D(@UCO@("TRI")):@UCO@("TRI"),1:""))
 I '($$POS^%QULELVX(OBJ,OBJP,.CC,.LC)) S (CC,LC)=1 G REMAKE1
 G REMAKE0
 
 
ARRET K:SUPREM @(EXT)
 I $D(X) S @TEMP@("X")=X
 I YMOD S VAR="" F IVAR=0:0 S VAR=$O(TB(VAR)) Q:VAR=""  D SAUVTB(VAR)
 F VAR="CDEB","LDEB","CC","LC","OR" S @TEMP@("VAR",VAR)=@VAR
 S @RESUL@("NUMUC")=NUMUC
 S @RESUL@("O")=@GY@(CC,LC,"C")
 S @RESUL@("P")=$S($D(@GY@(CC,LC,"P")):@GY@(CC-2,@GY@(CC,LC,"P"),"C"),1:"")
 S @RESUL@("N")=(CC\2)+1
ECHEC D RETMOD^%PKUTIL
 Q
 
 
 
OPTION S (MODG,SUPREM)=0
 F %AA="CUT","PASTE","FIN","GOTO" I @TABOPT@(OR,"C")=%AA G @%AA
 S PROC=@TABOPT@(OR,"PROC") G AUTRE
 
CUT 
 G:'($D(@UCO@("CUT"))) LEC
 S OBCOUR=@GY@(CC,LC,"C")
 S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:""),OBJ=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 S OBJP="" I OBJ'="" S PERE=$S($D(@GY@(CC-2,PERE,"P")):@GY@(CC-2,PERE,"P"),1:""),OBJP=$S(PERE="":"",1:@GY@(CC-4,PERE,"C"))
 S PROC=@UCO@("CUT")
 I OBJ="" S %AA=$$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Prendre ")_$$VALAFF^%QULELVX(OBCOUR)_" ?") G CUT2
 S %AA=$$CONFIRM^%PKUTIL(2,14,60,"Confirmez-vous suppression de la liaison entre "_$$VALAFF^%QULELVX(OBJ)_" et "_$$VALAFF^%QULELVX(OBCOUR)_" ?")
CUT2 G:'(%AA) REAFF2
 K @(TPAR) S @TPAR@("O")=OBCOUR,@TPAR@("N")=(CC\2)+1,@TPAR@("P")=OBJ,@TPAR@("X")=IDFC
 S (OKU,MODG)=1,FINEXE=0
 D CHGNORM^%PKUTIL,@(PROC_"(TPAR)"),RETMOD^%PKUTIL
 G:'(OKU) REAFF2
 K:@TPAR@("P")'="" @G@(@TPAR@("P"),@TPAR@("O"))
 S @PILBUF=@PILBUF+1
 S @PILBUF@(@PILBUF)=@TPAR@("O")_$C(0)_@TPAR@("P")
 G MAKEG
 
 
GOTO 
 D MKPARA
 I '($D(@UCO@("GOTO"))) W !,"element ? " R ELEM G GOTO2
 S PROC=@UCO@("GOTO") I PROC="" W !,"element ? " R ELEM G GOTO2
 D CHGNORM^%PKUTIL S @("ELEM="_PROC_"(TPAR)") D RETMOD^%PKUTIL
GOTO2 S %AA=$$POSSIMP^%QULELVX(ELEM,.%BB,.%CC)
 G:'(%AA) REAFF2
 S CC=%BB,LC=%CC,OBJ=ELEM
 S OBJP="" I OBJ'="" S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:""),OBJP=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 G LL
 
PASTE 
 G:@PILBUF=0 LEC
 G:'($D(@UCO@("PASTE"))) LEC S PROC=@UCO@("PASTE")
 S OBJ=@GY@(CC,LC,"C")
 S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:"")
 S OBJP=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 K @(TPAR) S @TPAR@("P")=OBJ,@TPAR@("O")=$P(@PILBUF@(@PILBUF),$C(0)),@TPAR@("N")=(CC\2)+2,@TPAR@("X")=IDFC
 S (OKU,MODG)=1,FINEXE=0
 S %AA=$$CONFIRM^%PKUTIL(2,14,60,"Confirmez-vous l'etablissement de la liaison entre "_$$VALAFF^%QULELVX(@TPAR@("P"))_" et "_$$VALAFF^%QULELVX(@TPAR@("O"))_"?")
 G:'(%AA) REAFF2
 D CHGNORM^%PKUTIL,@(PROC_"(TPAR)"),RETMOD^%PKUTIL
 G:'(OKU) REAFF2
 S @G@(@GY@(CC,LC,"C"),$P(@PILBUF@(@PILBUF),$C(0)))=""
 S @PILBUF=@PILBUF-1
 G MAKEG
CTR1 
FIN 
 S NUMUC="CTRLA"
 G ARRET
 
AUTRE
 D MKPARA
 S OKU=1,MODG=1,FINEXE=0,SUPREM=0
 S NUMUC=$P(@TABOPT@(OR,"C"),"AUTRE.",2)
 D CHGNORM^%PKUTIL,@(PROC_"(TPAR)"),RETMOD^%PKUTIL
 K:SUPREM @(EXT)
 G:FINEXE ARRET G:'(OKU) REAFF2 G:MODG MAKEG G REAFF2
 
MKPARA 
 S OBJ=@GY@(CC,LC,"C")
 S PERE=$S($D(@GY@(CC,LC,"P")):@GY@(CC,LC,"P"),1:"")
 S OBJP=$S(PERE="":"",1:@GY@(CC-2,PERE,"C"))
 S @TPAR@("O")=OBJ,@TPAR@("P")=OBJP,@TPAR@("N")=(CC\2)+1,@TPAR@("X")=IDFC
 Q

