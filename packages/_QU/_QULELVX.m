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

;%QULELVX^INT^1^59547,73885^0
%QULELVX ;;09:41 AM  21 Dec 1992; ; 06 Apr 93  4:20 PM
 
 
 
 
 
CONS(G,GROOT,GY,GYINV,UCPDS) 
 N TEMP,VU,NIV,PERE,FILS,COL,PX,ORI,RRR,TABR,POIDS
 N ILV,SUV,%SUV,X,NBC1,NBL,IX,XX,IXX,ILVM,CC,NBR,ILAT
 N PREM,DER,ICOL,KK,IVU,IVX,IVXX,LIG,%I,%J,%K,RO,EXEAFF,IVR,IPDS
 N NBLIG,NBCOL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CONS") K @(TEMP)
 S VU=$$CONCAS^%QZCHAD(TEMP,"V"),NIV=$$CONCAS^%QZCHAD(TEMP,"N")
 S PERE=$$CONCAS^%QZCHAD(TEMP,"P"),PX=$$CONCAS^%QZCHAD(TEMP,"X")
 S FILS=$$CONCAS^%QZCHAD(TEMP,"F"),COL=$$CONCAS^%QZCHAD(TEMP,"C")
 S TABR=$$CONCAS^%QZCHAD(TEMP,"T")
 S ORI=$$CONCAS^%QZCHAD(TEMP,"O"),RRR=$$CONCAS^%QZCHAD(TEMP,"R")
 S POIDS=$$CONCAS^%QZCHAD(TEMP,"PDS")
 S CC=$$CONCAS^%QZCHAD(TEMP,"CC")
 S EXEAFF=$S('($D(@UCO@("AFF"))):"S RET=@TABR@(IVX)",1:"S RET="_@UCO@("AFF")_"(""TAB"",LL)")
 
 D:'($D(TTR)) INITRE^%QULELVZ
 
 
 
 S RO="",IVU=1 F NBR=0:1 S RO=$O(@GROOT@(RO)) Q:RO=""  S @RRR@(RO)=""
 G:NBR=1 ROS
 S ILAT=1,RO="" F %I=0:0 S RO=$O(@RRR@(RO)) Q:RO=""  S IVR=ILAT,@ORI@(IVR)=RO,ILAT=ILAT+1 F %K=0:0 S X=@ORI@(IVR) D RO2 S IVR=$O(@ORI@(IVR)),@VU@(X)="" Q:IVR=""
 G ROS
RO2 S XX="" F ILAT=ILAT:1 S XX=$O(@G@(X,XX)) Q:XX=""  K:XX'=RO @RRR@(XX) I '($D(@VU@(XX))) S @ORI@(ILAT)=XX
 Q
ROS K @(VU)
 
 G:UCPDS="" NOORDR
 S RO="" F %I=0:0 S RO=$O(@RRR@(RO)) Q:RO=""  S @("IPDS="_UCPDS_"("""","""_RO_""")"),@POIDS@(IPDS,RO)=""
 S IVU=0
 S IPDS="" F %I=0:0 S IPDS=$ZP(@POIDS@(IPDS)) Q:IPDS=""  S RO="" F %J=0:0 S RO=$O(@POIDS@(IPDS,RO)) Q:RO=""  S IVU=IVU+1,@NIV@(1,IVU)=IVU,@TABR@(IVU)=RO
 S IVU=IVU+1
NOORDR S RO="" F IVU=1:1 S RO=$O(@RRR@(RO)) Q:RO=""  S @NIV@(1,IVU)=IVU,@TABR@(IVU)=RO
FINORDR 
 
 
 
 S ILV=1,ILVM=0
MB0 S IX="",SUV=0 S:'($D(@CC@(ILV+1))) @CC@(ILV+1)=1
MB1 S IX=$O(@NIV@(ILV,IX))
 I IX="",'(SUV) S:ILVM<ILV ILVM=ILV G MSUI
 S @CC@(ILV+1)=@CC@(ILV+1)+SUV
 I IX="" S ILV=ILV+1 G MB0
 S IVX=@NIV@(ILV,IX) G:$D(@VU@(@TABR@(IVX))) MB1
 S @VU@(@TABR@(IVX))="",X=@TABR@(IVX)
 K @(POIDS)
 G:UCPDS="" NOORDE
 S XX="" F %I=0:0 S XX=$O(@G@(X,XX)) Q:XX=""  S @("IPDS="_UCPDS_"("""_X_""","""_XX_""")"),@POIDS@(IPDS,XX)=""
 S IPDS="" F %I=0:0 S IPDS=$ZP(@POIDS@(IPDS)) Q:IPDS=""  S XX="" F %J=0:0 S XX=$O(@POIDS@(IPDS,XX)) Q:XX=""  S @TABR@(IVU)=XX,SUV=SUV+1,@NIV@(ILV+1,@CC@(ILV+1)+SUV)=IVU,@PERE@(IVU)=IVX,@FILS@(IVX,IVU)="",IVU=IVU+1
 G MB1
NOORDE S XX="" F %J=0:0 S XX=$O(@G@(X,XX)) Q:XX=""  S @TABR@(IVU)=XX,SUV=SUV+1,@NIV@(ILV+1,@CC@(ILV+1)+SUV)=IVU,@PERE@(IVU)=IVX,@FILS@(IVX,IVU)="",IVU=IVU+1
 G MB1
MSUI S NBC1=ILVM
 
 F ILV=NBC1:-1:2 S SUV="" F %SUV=0:0 S SUV=$O(@NIV@(ILV,SUV)) Q:SUV=""  S X=@NIV@(ILV,SUV) S:'($D(@PX@(X))) @PX@(X)=1 S XX=@PERE@(X) S:'($D(@PX@(XX))) @PX@(XX)=0 S @PX@(XX)=@PX@(XX)+@PX@(X)
 
 S SUV="",NBL=0 F %SUV=0:0 S SUV=$O(@NIV@(1,SUV)) Q:SUV=""  S X=@NIV@(1,SUV) S:'($D(@PX@(X))) @PX@(X)=1 S @GY@(1,NBL+1)=$$AFF(X),@GY@(1,NBL+1,"M")=$$MODE(X),@GY@(1,NBL+1,"C")=@TABR@(X),@GYINV@(@TABR@(X))=1_"^"_(NBL+1),@COL@(X)=1+NBL,NBL=NBL+@PX@(X)
 
 S ILV=""
C0 S ILV=$O(@NIV@(ILV)) G:ILV="" SUI2 S CLC=(ILV*2)-1,SUV=""
C1 S SUV=$O(@NIV@(ILV,SUV)) G:SUV="" C0 S IVX=@NIV@(ILV,SUV),IVXX=""
 
 S IVXX=$O(@FILS@(IVX,IVXX)) G:IVXX="" C1
 S (ICOL,@COL@(IVXX))=@COL@(IVX),@GY@(CLC+1,ICOL)=TTR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"M")=$$MODE(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX)
 S @GYINV@(@TABR@(IVXX),@TABR@(IVX))=(CLC+2)_"^"_ICOL,@GY@(CLC,ICOL,"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=ICOL,PREM=ICOL,ICOL=ICOL+@PX@(IVXX)
 
 S IVXX=$O(@FILS@(IVX,IVXX)) G:IVXX="" C1
C2 G:$O(@FILS@(IVX,IVXX))="" C3
 S @COL@(IVXX)=ICOL,@GY@(CLC,ICOL)=TTR("INT"),@GY@(CLC+1,ICOL)=TTR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"M")=$$MODE(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX),@GY@(CLC,@COL@(IVX),"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=@COL@(IVX)
 S @GYINV@(@TABR@(IVXX),@TABR@(IVX))=(CLC+2)_"^"_ICOL,ICOL=ICOL+@PX@(IVXX)
 S IVXX=$O(@FILS@(IVX,IVXX))
 G C2
 
C3 S @COL@(IVXX)=ICOL,@GY@(CLC,ICOL)=TTR("FI"),@GY@(CLC+1,ICOL)=TTR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"M")=$$MODE(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX),@GY@(CLC,@COL@(IVX),"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=@COL@(IVX),DER=ICOL
 S @GYINV@(@TABR@(IVXX),@TABR@(IVX))=(CLC+2)_"^"_ICOL
 F KK=PREM:1:DER S:'($D(@GY@(CLC,KK))) @GY@(CLC,KK)=TTR("TV")
 G C1
SUI2 
 S NBLIG=NBL,NBCOL=(NBC1*2)-1
 K @(TEMP)
 Q
 
 
 
AFF(IVX) 
 N RET,TAB,LL,X
 S (TAB,X)=@TABR@(IVX),LL=$S($D(@VU@(X)):LARA,1:LARA-2)
 X EXEAFF
 Q:'($D(@VU@(X))) "("_$E(RET_"                                    ",1,LARA-2)_")"
 K @VU@(X)
 Q $E(RET_"                                                  ",1,LARA)
 
MODE(IVX) 
 N TAB
 S TAB=@TABR@(IVX)
 I $D(@UCO@("MODEAFF")) S @("RET="_@UCO@("MODEAFF")_"(""TAB"")") Q RET
 Q "NORM"
 
VALAFF(VALINT) 
 N RET,TAB,LL,X
 S TAB=VALINT,LL=100,RET=VALINT
 I $D(@UCO@("AFF")) S @("RET="_@UCO@("AFF")_"(""TAB"""_","_LL_")")
 Q RET
 
 
POS(OBJ,OBJP,POSC,POSL) 
 N CV,LV,LP,VAL
 Q:OBJ="" 0
 I OBJP'="" G POS2
 I $D(@GYINV@(OBJ))#10 S VAL=@GYINV@(OBJ),POSC=$P(VAL,"^"),POSL=$P(VAL,"^",2) Q 1
 Q 0
POS2 I $D(@GYINV@(OBJ,OBJP))#10 S VAL=@GYINV@(OBJ,OBJP),POSC=$P(VAL,"^"),POSL=$P(VAL,"^",2) Q 1
 Q 0
 
 
 
POSSIMP(OBJ,POSC,POSL) 
 N CV,LV,LP,VAL,OBJP,%OBJP,TABC,TABL,NBPO,%I
 Q:OBJ="" 0
 I $D(@GYINV@(OBJ))#10 S VAL=@GYINV@(OBJ),POSC=$P(VAL,"^"),POSL=$P(VAL,"^",2) Q 1
 
 S NBPO=0
 S OBJP="" F %OBJP=0:0 S OBJP=$O(@GYINV@(OBJ,OBJP)) Q:OBJP=""  I $D(@GYINV@(OBJ,OBJP))#10 S VAL=@GYINV@(OBJ,OBJP),NBPO=NBPO+1,TABC(NBPO)=$P(VAL,"^"),TABL(NBPO)=$P(VAL,"^",2)
 Q:NBPO=0 0
 I NBPO=1 S POSC=TABC(1),POSL=TABL(1) Q 1
 F %I=1:1:NBPO I $D(@GY@(TABC(%I),TABL(%I),"F")) S POSC=TABC(%I),POSL=TABL(%I) G POSSI1
 Q 0
POSSI1 Q 1

