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
;! HL002 ! HL     ! 01/02/07 ! Q:A="" -> Q:A=" "                              !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%PKREAD^INT^1^59564,57630^0
PKREAD ;
 
 
 
 
 
 
 
 
 
 
 
SETUP D ^%QCAGLK("^%PKREAD")
 S PK("OS")=^%PK("OS")
 ;HL S PK("OS")=""
 S ^%PKREAD=$P($T(READ),";;",2) X:PK("OS")="DTM" "S ^%PKREAD=$ZEECUTE(^%PKREAD)"
 ;HL002 F I=1:1 S A=$T(READ+I) Q:A=""  S ^%PKREAD($P(A," "))=$P(A,";;",2) X:PK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$ZEECUTE(^(A))"
 F I=1:1 S A=$T(READ+I) Q:A=" "  S ^%PKREAD($P(A," "))=$P(A,";;",2) X:PK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$ZEECUTE(^(A))"
 ;HL002 F I=1:1 S A=$T(READ2+I) Q:A=""  S ^%PKREAD($P(A," "))=$P(A,";;",2) X:PK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$ZEECUTE(^(A))"
 S PK("OS")=^%PK("OS")
 Q
TEST S %R=24,%C=5,LNG=5,X="",RX=0,PAT="X?1.20A" X ^%PKREAD W !,X,"  RX = ",RX,!,! G TEST
READ ;;X:$D(PK)=0 ^%PK("INIT") S ML=27 X ^%PKREAD(0) F %I=1:0:ML X ^%PKREAD(%I)
0 ;;S %L=1,ESC=0,RX=0,INS=0 X:$D(PROMPT) ^%PKREAD(2) W @PK("P"),PK("HI") X ^%PK("TERM-ON"),^%PK("WRAP-OFF"),^%PK("ECHO-OFF") S:$D(LNG)=0 LNG=79-%C S:$D(CHR)=0 CHR="" S:$D(RX) RX=0 S X=X_$J("",LNG-$L(X))
1 ;;S %I=3 F %J=1:1 R B#1:^TOZE($I,"ATTENTE") X PK("T") Q:B=""  Q:%L>LNG  S:CHR'="" %I=CHR'[B*4+3 S:$D(TRM) ESC=TRM[B,%I=ESC*10+3 Q:%I>3  X ^%PKREAD(23+INS)
2 ;;W @PK("P"),PK("LO"),PROMPT,PK("HI"),X,PK("CL") S %C=%C+$L(PROMPT)
3 ;;S %I=$S(ZF=PK("RK"):5,ZF=PK("LK"):6,ZF=PK("INK"):14,ZF=PK("DLK"):8,$A(ZF)=127:9,$A(ZF)=13:25,$A(ZF)=7:26,ZF=PK("CL"):11,$D(RX):15,1:7) ; $A(ZF)=8:9
5 ;;X $S(%L<LNG:"W PK(""RT"") S %L=%L+1,%I=1",$D(RX):"S RX=5,%I=13",1:"S %I=1")
6 ;;X $S(%L>1:"S %L=%L-1,%I=1 W PK(""L"")",$D(RX):"S:'$D(TO) TO=""PREC"" S RX=4,%I=13",1:"S %I=1")
7 ;;W *7 S %I=1
8 ;;W $E(X,%L+1,256)," " S X=$E(X,1,%L-1)_$E(X,%L+1,256)_" ",%I=1 W @PK("P"),$E(X,1,%L-1)
9 ;;S %I=1 I %L>1 S X=$E(X,1,%L-2)_" "_$E(X,%L,256),%L=%L-1 W *8," ",*8
11 ;;S X=$E(X,0,%L-1),CC=%C,%C=%C+%L-1,%I=1 W @PK("P"),$J("",LNG-%L),@PK("P") S %C=CC,%L=$L(X) K CC
12 ;;S %L=X,%I=13 I $E(X,$L(X))=" " F %J=0:0 S %J=$F(X," ",%J) Q:'%J  I $E(X,%J,255)?." " S X=$E(X,1,%J-2) Q
13 ;;S:X="" %I=20 I X'="" X:$D(PAT) "I $L(PAT) S %I=19 I @PAT S %I=13" X:%I=13 "I $D(MAX),X>MAX S %I=19" X:%I=13 "I $D(MIN),X<MIN S %I=19" S:%I=13 %I=20
14 ;;X $S($E(X,LNG)'=" ":"W *7",1:"W "" "",$E(X,%L,LNG-1) S X=$E(X,1,%L-1)_"" ""_$E(X,%L,LNG-1) W @PK(""P""),$E(X,1,%L-1)") S %I=1
15 ;;S %I=12 X $S(ZF=PK("UK"):"S TO=""PREC""",ZF=PK("DK"):"S TO=""SUIV""",$A(ZF)=9:"S %I=22,RX=3",$A(ZF)=1!($A(ZF)=27):"S TO=""ABAND""",$A(ZF)=6:"S TO=""ARRET""",$A(ZF)=8:"S TO=""HELP""",$A(ZF)=0:"S TO=""ABAND""",1:"S TO=""AUTRE"",TCO=$A(ZF)")
19 ;;S X=%L,%L=1,ESC=0,%I=1 S:$D(RX) RX=0 W *7,@PK("P")
20 ;;X ^%PK("ECHO-ON"),^%PK("TERM-OFF"),^%PK("WRAP-ON") K PROMPT,MAX,MIN,LNG,CHR,PAT,%L,TRM,ZF,%J S %I=99
22 ;;S INS=$S(INS:0,1:1),%I=1    ; 22, 23 et 24 mode insertion
23 ;;W B S X=$E(X,1,%L-1)_B_$E(X,%L+1,255),%L=%L+1
24 ;;X $S($E(X,LNG)'=" ":"W *7 X ^%PKREAD(22)",1:"W B,$E(X,%L,LNG-1) S X=$E(X,1,%L-1)_B_$E(X,%L,LNG-1),%L=%L+1 W @PK(""P""),$E(X,1,%L-1) S %I=1")
25 ;;S TO="RETURN",%I=12
26 ;;S X=$E(X,1,%L-1) W $J("",LNG-$L(X)),@PK("P"),X S %I=1
NORM ;;S PK(1)=1 X ^%PK("TERM-OFF")
SUIV ;;S I=@GLO@("SUIV",I)
PREC ;;S I=@GLO@("PREC",I)
ABAND ;;S ABANDON=1
ARRET ;;S ARRET=1
RETURN ;;X ^("RETURN"_MRET) S I=@GLO@("SUIV",I)
RETURN0 ;;
RETURN1 ;;S:I=NBC ARRET=1
HELP ;;D HELP^%PKSAISI(I)
AUTRE ;;X ^%PKREAD(7)
INIT ;;X ^("INIT2"),^%PKREAD("INIT3")
INIT2 ;;F X=1:1:NBC S POSY(X)=@GLO@("V")+X,LARG(X)=@GLO@("LARG",X)
INIT3 ;;S I=$O(@GLO@("SUIV","")),%IC=@GLO@("H")+@GLO@("PLL")+4,ARRET=0,ABANDON=0
CHAMP ;;S %C=%IC,LNG=LARG(I),X=VAL(I),%R=POSY(I)
VCHAMPG ;;S OK=1
VCHAMPB ;;S OK=1
VCHAMPC ;;X ^%PKREAD("VCH"_TO)
VCHSUIV ;;S OK=1
VCHPREC ;;S OK=1
VCHABAND ;;S OK=1
VCHARRET ;;S VAL=X S OK=1 X @GLO@("OBLIGAT",I) X ^%PKREAD("OBLI"_OK)
VCHRETURN ;;S VAL=X S OK=1 X @GLO@("OBLIGAT",I) X ^%PKREAD("OBLI"_OK)
VCHHELP ;;S OK=1
VCHAUTRE ;;S OK=1
VCHAMP0 ;;D:VISU MERVL^%PKSAISI(VAL,I)
VCHAMP1 ;;
VCHAMP2 ;;X @GLO@("FORMAT",I),^%PKREAD("VCHAMP2"_(VISU&'OK))
VCHAMP20 ;;
VCHAMP21 ;;D MERFO^%PKSAISI(VAL,I)
OBLI0 ;;D:VISU MEROBL^%PKSAISI(VAL,I)
OBLI1 ;;X:VAL'="" @GLO@("VALEG",I,0) X ^%PKREAD("VCHAMP"_OK)
VGRILC ;;S OKTOT=1
VGRILB ;;S OKTOT=1
VGRILG ;;S TO="RETURN",OKTOT=1 S II=I,I="" X ^%PKREAD("VGRIL2") S I=II
VGRIL2 ;;F %I=0:0 S I=$O(@GLO@("SUIV",I)) Q:I=""  S OK=1,X=VAL(I) X ^%PKREAD("VCHAMPC") S OKTOT=OKTOT&OK
BLANC ;;S %CH=X,%LCH=$L(%CH),X="" F %ICH=1:1:%LCH S %CACH=$E(%CH,%ICH) I %CACH<32 S X=X_%CACH
BLANC1 ;;S %CH=VAL(%R),%LCH=$L(%CH),VAL(%R)="" F %ICH=1:1:%LCH S %CACH=$E(%CH,%ICH) I %CACH<32 S VAL(%R)=VAL(%R)_%CACH
POPER10 ;;
POPER11 ;;X @GLO@("POP1")
POPER20 ;;
POPER21 ;;X @GLO@("POP2")
UCCH0 ;;S OK=1
UCCH1 ;;S OK=1 X @GLO@("UCONT.CHAMPS",I)
UCONT0 ;;S OK=1
UCONT1 ;;S OK=1 X @GLO@("UCONT") 

