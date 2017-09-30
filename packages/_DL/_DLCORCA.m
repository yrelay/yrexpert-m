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

;%DLCORCA^INT^1^59547,73867^0
JLCORCA ;
 
 
 
 
NEXT(H,CL,LJ,JAL,DL,MAC,CHARGE,REF,PAS,CPT,ERR) 
 N RGM,CAPST,CAPM,CHARRES,LJ2,DEC,X0
 S LJ2=LJ
 S RGM=@REGIMAC@(MAC)
 I '($D(^[QUI]PLPLACAL(RGM))) S ERR=6 Q ""
 S X=$O(^[QUI]PLPLACAL(RGM,H-1))
 I X="" G REGINC
 S DEC=$$NBJ^%QMDRUTI(RGM,H,X)
 S:X>DL ERRNONBL=8
 S:CL=2 CL=$$RESPECT^%DLMACAP(MAC)
 I CL=0 D ADDCHA(PAS) Q X
 S CAPST=$$CAPASTA^%DLCAP2(MAC,"H",0)
 G BNEX2
BNEXTC I X="" G REGINC
BNEX2 
 I $$ADDPART^%DLCAP2(MAC,"H",CAPST,X,CHARGE,0,.CHARRES) S:CHARRES'=0 LJ="" D AFF(OP,REF,X,LJ,DEC,CHARGE-CHARRES,OPRES,PAS,.CPT) Q:CHARRES=0 X S CHARGE=CHARRES,LJ=LJ2
 S X0=X
 S X=$O(^[QUI]PLPLACAL(RGM,X))
 S DEC=$$NBJ^%QMDRUTI(RGM,X0,X)
 S:X>DL ERRNONBL=8
 G BNEXTC
 
 
PREV(H,CL,LJ,JAL,DL,MAC,CHARGE,REF,PAS,CPT,ERR) 
 
 N RGM,CAPST,CAPM,CHARRES,LJ2,DEC,X0
 S RGM=@REGIMAC@(MAC),LJ2=LJ
 I '($D(^[QUI]PLPLACAL(RGM))) S ERR=6 Q ""
 S X=H+1
 S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 I X="" G REGINC
 I X<DATDUJ S ERR=28 Q ""
 S DEC=-($$NBJ^%QMDRUTI(RGM,X,H))
 S:X<DL ERRNONBL=8
 S:CL=2 CL=$$RESPECT^%DLMACAP(MAC)
 I CL=0 D ADDCHA(PAS) Q X
 S CAPST=$$CAPASTA^%DLCAP2(MAC,"H",0)
 G BPREV2
BPREVC I X="" G REGINC
 I X<DATDUJ S ERR=28 Q ""
 S:X<DL ERRNONBL=8
BPREV2 I $$ADDPART^%DLCAP2(MAC,"H",CAPST,X,CHARGE,0,.CHARRES) S:CHARRES'=0 LJ="" D AFF(OP,REF,X,LJ,DEC,CHARGE-CHARRES,OPRES,PAS,.CPT) Q:CHARRES=0 X S CHARGE=CHARRES,LJ=LJ2
 S X0=X
 S X=$ZP(^[QUI]PLPLACAL(RGM,X))
 S DEC=-($$NBJ^%QMDRUTI(RGM,X,X0))
 G BPREVC
 
 
REGINC 
 D INSERR2^%DLUTIL($$^%QZCHW("Regime")_" "_RGM,7,GLERR)
 S ERR=100
 Q ""
 
ADDCHA(PAS) 
 D ADD^%DLCAP2(MAC,"H",X,CHARGE)
 D AFF(OP,REF,X,LJ,CHARGE,OPRES,PAS,.CPT)
 Q
 
 
NEXTW(JOURS) Q JOURS+7
 Q $$HLUN^%QMDAK4($$NOSEM^%QMDAK4(JOURS+7))-1
 
 
PRECW(JOURS) Q JOURS-7
 Q $$HLUN^%QMDAK4($$NOSEM^%QMDAK4(JOURS))
 
AFF(DESOP,NOP,DAT,LIB,DEC,CH,OPRES,PAS,ETAP) 
 S @OPRES@(ETAP)=@DESOP@(NOP)
 S @OPRES@(ETAP,1)=CH
 S @OPRES@(ETAP,2)=DAT
 S @OPRES@(ETAP,3)=@DESOP@(NOP,0)
 S @OPRES@(ETAP,4)=@DESOP@(NOP,1)
 S @OPRES@(ETAP,5)=LIB
 S:DEC'=0 @OPRES@(ETAP,9)=DEC
 S @OPRES@(ETAP,10)=NOP
 S ETAP=ETAP+PAS
 Q
 ;
 ;
 ;

