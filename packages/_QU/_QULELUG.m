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

;%QULELUG^INT^1^59547,73885^0
%QULELUG ;;06:12 PM  13 Feb 1991;
 
 
 
 
CONS(G,GROOT,GY,NBLIG,NBCOL) 
 N TEMP,VU,NIV,PERE,FILS,COL,PX,ORI,RRR,TABR
 N ILV,SUV,X,NBC1,NBL,IX,XX,IXX,RO
 N PREM,DER,ICOL,KK,IVU,IVX,IVXX,LIG,%I,%J
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CONS") K @(TEMP)
 S VU=$$CONCAS^%QZCHAD(TEMP,"V"),NIV=$$CONCAS^%QZCHAD(TEMP,"N")
 S PERE=$$CONCAS^%QZCHAD(TEMP,"P"),PX=$$CONCAS^%QZCHAD(TEMP,"X")
 S FILS=$$CONCAS^%QZCHAD(TEMP,"F"),COL=$$CONCAS^%QZCHAD(TEMP,"C")
 S TABR=$$CONCAS^%QZCHAD(TEMP,"T")
 S ORI=$$CONCAS^%QZCHAD(TEMP,"O"),RRR=$$CONCAS^%QZCHAD(TEMP,"R")
 
 
 
 
 S RO="",IVU=1 F %I=0:0 S RO=$O(@GROOT@(RO)) Q:RO=""  S @RRR@(RO)="",XX="" I $D(@G@(RO)) F IVU=IVU:1 S XX=$O(@G@(RO,XX)) Q:XX=""  I '($D(@VU@(XX))) S @VU@(XX)="",@ORI@(IVU)=XX
 S %I="" F %J=1:1 S %I=$O(@ORI@(%I)) Q:%I=""  S X=@ORI@(%I),XX="" K @RRR@(X) F IVU=IVU:1 S XX=$O(@G@(X,XX)) Q:XX=""  I '($D(@VU@(XX))) S @ORI@(IVU)=XX,@VU@(XX)=""
 K @(VU)
 
 S RO="" F IVU=1:1 S RO=$O(@RRR@(RO)) Q:RO=""  S @NIV@(1,IVU)=IVU,@TABR@(IVU)=RO
 
 
 
 S ILV=1,ILVM=0
MB0 S IX="",SUV=0 S:'($D(CC(ILV+1))) CC(ILV+1)=1
MB1 S IX=$O(@NIV@(ILV,IX))
 I IX="",'(SUV) S:ILVM<ILV ILVM=ILV G MSUI
 S CC(ILV+1)=CC(ILV+1)+SUV
 I IX="" S ILV=ILV+1 G MB0
 S IVX=@NIV@(ILV,IX) G:$D(@VU@(@TABR@(IVX))) MB1
 S @VU@(@TABR@(IVX))="",X=@TABR@(IVX)
 S XX="" F %I=0:0 S XX=$O(@G@(X,XX)) Q:XX=""  S @TABR@(IVU)=XX,SUV=SUV+1,@NIV@(ILV+1,CC(ILV+1)+SUV)=IVU,@PERE@(IVU)=IVX,@FILS@(IVX,IVU)="",IVU=IVU+1
 G MB1
MSUI S NBC1=ILVM
 
 F ILV=NBC1:-1:2 S SUV="" F %SUV=0:0 S SUV=$O(@NIV@(ILV,SUV)) Q:SUV=""  S X=@NIV@(ILV,SUV) S:'($D(@PX@(X))) @PX@(X)=1 S XX=@PERE@(X) S:'($D(@PX@(XX))) @PX@(XX)=0 S @PX@(XX)=@PX@(XX)+@PX@(X)
 
 S SUV="",NBL=0 F %SUV=0:0 S SUV=$O(@NIV@(1,SUV)) Q:SUV=""  S X=@NIV@(1,SUV) S:'($D(@PX@(X))) @PX@(X)=1 S @GY@(1,NBL+1)=$$AFF(X),@GY@(1,NBL+1,"C")=@TABR@(X),@COL@(X)=1+NBL,NBL=NBL+@PX@(X)
 
 S ILV=""
C0 S ILV=$O(@NIV@(ILV)) G:ILV="" SUI2
 S CLC=(ILV*2)-1,SUV=""
C1 S SUV=$O(@NIV@(ILV,SUV)) G:SUV="" C0
 S IVX=@NIV@(ILV,SUV),IVXX=""
 
 S IVXX=$O(@FILS@(IVX,IVXX)) G:IVXX="" C1 S (ICOL,@COL@(IVXX))=@COL@(IVX),@GY@(CLC+1,ICOL)=TR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX),@GY@(CLC,ICOL,"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=ICOL,PREM=ICOL
 S ICOL=ICOL+@PX@(IVXX)
 
 S IVXX=$O(@FILS@(IVX,IVXX)) G:IVXX="" C1
 F %I=1:1 Q:$O(@FILS@(IVX,IVXX))=""  S @COL@(IVXX)=ICOL,@GY@(CLC,ICOL)=TR("INT"),@GY@(CLC+1,ICOL)=TR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX),@GY@(CLC,@COL@(IVX),"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=@COL@(IVX),ICOL=ICOL+@PX@(IVXX),IVXX=$O(@FILS@(IVX,IVXX))
 
 S @COL@(IVXX)=ICOL,@GY@(CLC,ICOL)=TR("FI"),@GY@(CLC+1,ICOL)=TR("TR"),@GY@(CLC+2,ICOL)=$$AFF(IVXX),@GY@(CLC+2,ICOL,"C")=@TABR@(IVXX),@GY@(CLC,@COL@(IVX),"F",ICOL)="",@GY@(CLC+2,ICOL,"P")=@COL@(IVX),DER=ICOL
 F KK=PREM:1:DER S:'($D(@GY@(CLC,KK))) @GY@(CLC,KK)=TR("TV")
 G C1
SUI2 
 S NBLIG=NBL,NBCOL=(NBC1*2)-1
 K @(TEMP)
 Q
 
 
AFF(IVX) 
 N RET,TAB,LL,X
 S (TAB,X,RET)=@TABR@(IVX),LL=$S($D(@VU@(X)):LARA,1:LARA-2)
 I $D(@UCO@("AFF")) S @("RET="_@UCO@("AFF")_"(""TAB"""_","_LL_")")
 Q:'($D(@VU@(X))) "("_$E(RET_"                   ",1,LARA-2)_")"
 K @VU@(X)
 Q $E(RET_"                   ",1,LARA)
 ;
 ;

