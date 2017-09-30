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

;PLCORCA2^INT^1^59547,74868^0
PLCORCAL ;
 
 
 
REGIME(MAC) 
 N RG
 S RG=$$^%QSCALVA($$RMACH^JALRPJ,MAC,$$REGIME^JALRPJ)
 Q:RG'="" RG
 
 S M2=MAC,OK=0
LM I $D(^[QUI]PLPLACAL(M2)) S OK=1 G FLM
 F I=1:0 S U=$F(M2,".",I) Q:U=0  S I=U
 I I>2 S M2=$E(M2,1,I-2) G LM
FLM I '(OK) Q "STANDARD"
 Q M2
NEXTC(H,MAC,CHARGE,VC,FC,DL,STOP) 
 N I,M2,OK,RGM,SEC,U,X,DF
 S STOP=0
 S RGM=$$REGIME(MAC)
 I '($D(^[QUI]PLPLACAL(RGM))) S STOP=1 Q ""
 S X=$O(^[QUI]PLPLACAL(RGM,H-1))
 I X="" S STO=1 Q ""
 S DF=X
 G:FC FORCDEF
BNEXTC G:X'="" BNEX2
 G:VC FORCDEF
 Q ""
 Q $S(X="":H,1:X)
BNEX2 I X>DL S X="" G BNEXTC
 Q:$$ADDCONT^JALCAP(MAC,"H",X,CHARGE) X
 S X=X+6
 S X=$O(^[QUI]PLPLACAL(RGM,X))
 G BNEXTC
 
NJAPC(H,MAC,NJ,CHARGE,VC,FC,RD,DL,STOP) 
 N RGM,X,U,DF
 S STOP=0
 S RGM=$$REGIME(MAC)
 I '($D(^[QUI]PLPLACAL(RGM))) S STOP=1 Q ""
 S X=H F U=1:1:NJ Q:X=""  S X=$O(^[QUI]PLPLACAL(RGM,X))
 I X="" S STOP=1 Q ""
 S DF=X
 G:FC FORCDEF
BNAJPC G:X'="" BNAJP2
 G:VC FORCDEF
 Q ""
BNAJP2 I X>DL S X="" G BNAJPC
 Q:$$ADDCONT^JALCAP(MAC,"H",X,CHARGE) X
 I RD G:VC FORCDEF Q ""
 S X=X+6
 S X=$O(^[QUI]PLPLACAL(RGM,X))
 G BNAJPC
PREVC(H,MAC,CHARGE,VC,FC,DL,STOP) 
 
 N I,M2,OK,RGM,SEC,U,X,DF
 S STOP=0
 S RGM=$$REGIME(MAC)
 I '($D(^[QUI]PLPLACAL(RGM))) S STOP=1 Q ""
 S X=H+1
 S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 I X="" S STOP=1 Q ""
 S DF=X
 G:FC FORCDEF
BPREVC G:X'="" BPREV2
 G:VC FORCDEF
 Q ""
 Q:X="" H
BPREV2 I X<DL S X="" G BPREVC
 Q:$$ADDCONT^JALCAP(MAC,"H",X,CHARGE) X
 S X=X-6
 S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 G BPREVC
 
NJAVC(H,MAC,NJ,CHARGE,VC,FC,RD,DL,STOP) 
 
 
 N RGM,X,U,DF
 S STOP=0
 S RGM=$$REGIME(MAC)
 I '($D(^[QUI]PLPLACAL(RGM))) S STOP=1 Q ""
 S X=H
 F U=1:1:NJ Q:X=""  S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 I X="" S STOP=1 Q ""
 S DF=X
 G:FC FORCDEF
BNAJVC G:X'="" BNAJV2
 G:VC FORCDEF
 Q ""
BNAJV2 I X<DL S X="" G BNAJVC
 Q:$$ADDCONT^JALCAP(MAC,"H",X,CHARGE) X
 I RD G:VC FORCDEF Q ""
 S X=X-6
 S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 G BNAJVC
 
FORCDEF 
 D ADD^JALCAP(MAC,"H",DF,CHARGE)
 Q DF

