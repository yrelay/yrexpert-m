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
;! Nomprog     : %QULELV                                                      !
;! Module      : EDITEUR DE LIEN                                              !
;! But         : Editeur en lien code video                                   !
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

%QULELV ;
 
INIT(G,RO,LARA,LART,GLOUC,TIT,IDFC,NOFIN) 
 N TEMPUC,TTR,LGCOL,PROC,%AA,%BB,%CC,%DD,%EE,AFF,Y,OKCONS,LEVEL,OBCOUR,DCC,DLC,BDP,COM,OR,X
 
 N COLAF,LIGAF,CDEB,LDEB,AFFL,EXEFULL,AFFD
 
 N TEMP,GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 S TEMP=$$TEMP^%SGUTIL D GETADR
 S:'($D(NOFIN)) NOFIN=0
 D COPY^%QCAGLC(GLOUC,UCO)
 S @PILBUF=0
 D CHGPK^%PKUTIL
 D OPTIONS^%QULELVW
 
 S LIGAF=$S($D(@UCO@("INFO")):12,1:14),COLAF=((((PK("C")-6)-LARA)\(LARA+LART))*2)+1
 S AFFL=(4+(((COLAF\2)+1)*LARA))+((COLAF\2)*LART),AFFD=((PK("C")-AFFL)+1)\2
 
 S EXEFULL=$S('($D(@UCO@("FULL"))):"S AFF=@GY@(CC,LC,""C"")",1:"S AFF="_@UCO@("FULL")_"(TPAR)")
 
 D CONS^%QULELVX(G,RO,GY,GYINV,$S($D(@UCO@("TRI")):@UCO@("TRI"),1:""))
 
 S (LDEB,CDEB)=1
 F %AA="G","RO","COLAF","LIGAF","TIT","CDEB","LDEB","LARA","LART","AFFL","EXEFULL","AFFD","IDFC" S @TEMP@("VAR",%AA)=@%AA
 S @TEMP@("VAR","OR")=1
 F %AA=1:1 Q:'($D(BDP(%AA)))  S @TEMP@("BDP",%AA)=BDP(%AA),@TEMP@("COM",%AA)=COM(%AA)
 D RETMOD^%PKUTIL
 Q TEMP
 
 
 
 
 
 
NEWVERS(TEMP,IDFC) 
 S @TEMP@("VAR","IDFC")=IDFC
 Q
END(TEMP) K @(TEMP) Q
 
 
ELEM(TEMP,OBJ,OBJP) 
 
 N CC,LC,%AA,%BB,TB,X,TBR
 N Y,TTR,%CC,TW,TF,TC,TD,TT
 
 N G,RO,LARA,LART,TIT,COLAF,LIGAF,CDEB,LDEB,AFFL,EXEFULL,AFFD,IDFC
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 
 D GETADR S %AA="" F %BB=0:0 S %AA=$O(@TEMP@("VAR",%AA)) Q:%AA=""  S @(%AA_"=@TEMP@(""VAR"",%AA)")
 D CHGPK^%PKUTIL
 D INITRE^%QULELVZ
 D VARGPK^%QULELVZ
 
 I '($$POS^%QULELVX(OBJ,OBJP,.CC,.LC)) Q
 I $D(@TEMP@("VALY"))<10 D FDPAGE^%QULELVZ G ELREMA
 I (((CC<CDEB)!(LC<LDEB))!(CC'<(CDEB+COLAF)))!(LC'<(LDEB+LIGAF)) G ELREMA
 I $D(@TEMP@("X")) S X=@TEMP@("X"),TB(X)=@TEMP@("VALY",X) D NORMX^%QULELVZ
 S X=((LC-LDEB)+2)+((LIGAF+2)*((CC-CDEB)+1))
 S TB(X)=@TEMP@("VALY",X)
 S TBR(X)=$S($D(@TEMP@("VALYR",X)):@TEMP@("VALYR",X),1:TRO_TB(X))
 D AFFX^%QULELVZ
 S @TEMP@("X")=X
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL Q
 
 
ELREMA S CDEB=CC,LDEB=LC D MAKEVUE^%QULELVZ,AFFVUE^%QULELVZ
 S X=LIGAF+4 D AFFX^%QULELVZ
 
 S %AA="" F %BB=0:0 S %AA=$O(TB(%AA)) Q:%AA=""  D SAUVTB(%AA)
 S @TEMP@("X")=X
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL
 Q
 
SAUVTB(%AA) 
 S @TEMP@("VALY",%AA)=TB(%AA) S:$D(TBR(%AA)) @TEMP@("VALYR",%AA)=TBR(%AA)
 Q
 
 
AFF(TEMP) 
 N Y,TTR,X,BDP,COM
 N CC,LC,%CC,%DD,%EE
 N TW,TF,TC,TD,TT
 N BDP,COM,%AA,%BB,TB,YMOD,TBR
 
 N G,RO,TIT,COLAF,LIGAF,CDEB,LDEB,LARA,LART,AFFL,EXEFULL,AFFD,IDFC
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 D GETADR
 S %AA="" F %BB=0:0 S %AA=$O(@TEMP@("VAR",%AA)) Q:%AA=""  S @(%AA_"=@TEMP@(""VAR"",%AA)")
 F %AA=1:1 Q:'($D(@TEMP@("BDP",%AA)))  S BDP(%AA)=@TEMP@("BDP",%AA),COM(%AA)=@TEMP@("COM",%AA)
 
 D CHGPK^%PKUTIL
 D INITRE^%QULELVZ
 D VARGPK^%QULELVZ
 
 
 I $D(@TEMP@("VALY"))<10 S CDEB=1,LDEB=1 D MAKEVUE^%QULELVZ S YMOD=1 G AFFI
 S YMOD=0,%AA="" F %BB=0:0 S %AA=$O(@TEMP@("VALY",%AA)) Q:%AA=""  S TB(%AA)=@TEMP@("VALY",%AA),TBR(%AA)=$S($D(@TEMP@("VALYR",%AA)):@TEMP@("VALYR",%AA),1:TRO_TB(%AA))
AFFI D FDPAGE^%QULELVZ,AFFVUE^%QULELVZ
 
 I $D(@TEMP@("X")) S X=@TEMP@("X") D AFFX^%QULELVZ
 
 I YMOD S %AA="" F %BB=0:0 S %AA=$O(TB(%AA)) Q:%AA=""  D SAUVTB(%AA)
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL
 Q
 
 
GETADR 
 S GY=$$CONCAS^%QZCHAD(TEMP,"Y"),GYINV=$$CONCAS^%QZCHAD(TEMP,"IY"),EXT=$$CONCAS^%QZCHAD(TEMP,"E"),TPAR=$$CONCAS^%QZCHAD(TEMP,"PAR")
 S UCO=$$CONCAS^%QZCHAD(TEMP,"UCX"),TABOPT=$$CONCAS^%QZCHAD(TEMP,"TBO"),PILBUF=$$CONCAS^%QZCHAD(TEMP,"BUF")
 Q
 
 
TST K ^TEST,^TEST1 S ^TEST(1,2)="",^(3)="",^TEST1(1)=""
 S TT=$$TEMP^%SGUTIL
 S @TT@("FULL")="$$FULL^%QULELV"
 S VAL=$$INIT("^TEST","^TEST1",3,3,TT,0,1)
 
 D AFF(VAL)
 Q
 D ELEM(VAL,1,"")
 D AFF(VAL)
 D ELEM(VAL,2,1)
 D END(VAL)
 Q
FULL(TP) 
 Q "aff"

