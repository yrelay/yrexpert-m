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

;JALACT^INT^1^59547,74867^0
JALACT ;
 
 
 
 
 
 
 
 
 
 
JAVT(A,D,OPM,ERR) 
 N TOP,TIN,T D VIS
 S QUANT=0
 D LIRE(A,"","",.TOP,.ERR)
 G JAV1
JAMT(A,D,OPM,ERR) 
 N TOP,TIN,T,QUANT
 S QUANT=0 G JAMT22
 D VIS
 D LIRE(A,"","",.TOP,.ERR)
 G JAM1
JAMT2(A,D,QUANT,OPM,ERR,LISRES) 
 N TOP,TIN,T D VIS
JAMT22 D LIRE2^JALIRE(A,"","",QUANT,.TOP,.ERR)
 G JAM12
JAV(A,O,D,OPM,ERR) 
 N TOP,TIN,T D VIS
 D LIRE(A,O,"",.TOP,.ERR)
JAV1 I ERR'=0 Q
 Q:'($D(TOP(1)))
 Q:'($$^JALGETJA(A,.TOP,.TIN))
 D INTER(.TOP,.TIN)
 D SETDA(.TOP,.TIN,1,D,.OPM)
 D STOCK(A,.TOP,"")
 Q
 
JAM(A,O,D,OPM,ERR) 
 N TOP,TIN,T D VIS
 D LIRE(A,"",O,.TOP,.ERR)
JAM1 I ERR'=0 Q
 Q:'($D(TOP(1)))
 Q:'($$^JALGETJA(A,.TOP,.TIN))
 D INTER(.TOP,.TIN)
 D SETDA(.TOP,.TIN,-1,D,.OPM)
 D STOCK(A,.TOP,"")
 Q
JAM12 I ERR'=0 Q
 Q:'($D(TOP(1)))
 Q:'($$GET^JALGETJA(A,.TOP,.TIN))
 
 D SETDA2(.TOP,.TIN,-1,D,.OPM)
 D STOCK(A,.TOP,LISRES)
 Q
 
PAV(A,O,D,OPM,ERR) 
 N TOP D VIS
 D LIRE(A,O,"",.TOP,.ERR)
 I ERR'=0 Q
 Q:'($D(TOP(1)))
 D POUSS(.TOP,1,D,.OPM)
 D STOCK(A,.TOP,"")
 Q
 
PAM(A,O,D,OPM,ERR) 
 N TOP D VIS
 D LIRE(A,"",O,.TOP,.ERR)
 I ERR'=0 Q
 Q:'($D(TOP(1)))
 D POUSS(.TOP,-1,D,.OPM)
 D STOCK(A,.TOP,"")
 Q
LIRE(IDAR,IDOD,IDOF,OP,ER) 
 D LIRE^JALIRE(IDAR,IDOD,IDOF,.OP,.ER)
 Q
 N I,ID,ARTICLE,COMPOSANT,OPERATION,JAL,FIN,OFFSET,M S ER=1
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ) Q:ARTICLE=""
 S COMPOSANT=IDAR_","_ARTICLE,FIN=0,ER=2
 S:IDOD="" OFFSET=0 S:IDOD'="" OFFSET=IDOD-1
 F I=1:1 D STO Q:(((I+OFFSET)=IDOF)!FIN)!ER
 S OP=OFFSET
 
 Q
STO S OPERATION=$$VALOR^%QSGEST6($$GAMME^JALRPJ,COMPOSANT,$$GO^JALRPJ,I+OFFSET) I OPERATION="" S FIN=1 Q
 S OP(I)=OPERATION,ER=3
 S M=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"MACHINE") Q:M=""
 S OP(I,0)=M,ER=0
 S JAL=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"DATE.JALON")
 S:JAL'="" OP(I,1)=$$DH31^%QMDATE(JAL)
 Q
INTER(SOM,INT) 
 
 N X,N,U,V,UU,A
 F N=1:1 Q:'($D(SOM(N)))
 S N=N-1
 S X(1)=0
 F U=2:1:N S UU=U-1,X(U)=X(UU) F V=1:1:UU I $D(INT(V,U)) S A=X(V)+INT(V,U) S:A>X(U) X(U)=A
 K INT F U=2:1:N S INT(U-1,U)=X(U)-X(U-1)
 
 Q
SETDA(OP,INTER,SENS,DATE,OPMOD) 
 N NO,U,D,X K OPMOD
 F U=1:1 Q:'($D(OP(U)))
 
 S NO=U-1
 G CHRON:SENS=1,ANTICHR:SENS=-1
CHRON S X=$$NEXT^PLCORCAL(DATE,OP(1,0))
 S OPMOD(1)=$$^%QCAZG("OP(1,1)")_"^"_X,OP(1,1)=X
 S OPMOD(1,1)=OP(1)
 F U=2:1:NO S D=$$NJAP^PLCORCAL(OP(U-1,1),"*",INTER(U-1,U)),X=$$NEXT^PLCORCAL(D,OP(U,0)),OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G FIN
ANTICHR S X=$$PREV^PLCORCAL(DATE,OP(NO,0))
 S OPMOD(NO)=$$^%QCAZG("OP(NO,1)")_"^"_X,OP(NO,1)=X
 S OPMOD(NO,1)=OP(NO)
 F U=NO-1:-1:1 S D=$$NJAV^PLCORCAL(OP(U+1,1),"*",INTER(U,U+1)),X=$$PREV^PLCORCAL(D,OP(U,0)),OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G FIN
 
SETDA2(OP,INTER,SENS,DATE,OPMOD) 
 N NO,U,D,X K OPMOD
 F U=1:1 Q:'($D(OP(U)))
 
 S NO=U-1
 G CHRON2:SENS=1,ANTICHR2:SENS=-1
CHRON2 S X=$$NEXT^PLCORCAL(DATE,OP(1,0))
 S OPMOD(1)=$$^%QCAZG("OP(1,1)")_"^"_X,OP(1,1)=X
 S OPMOD(1,1)=OP(1)
 F U=2:1:NO S D=$$NJAP^PLCORCAL(OP(U-1,1),"*",INTER(U-1,U)),X=$$NEXT^PLCORCAL(D,OP(U,0)),OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G FIN
ANTICHR2 S X=$$PREVC^PLCORCAL(DATE,OP(NO,0),OP(NO,2))
 S OPMOD(NO)=$$^%QCAZG("OP(NO,1)")_"^"_X,OP(NO,1)=X
 S OPMOD(NO,1)=OP(NO)
 F U=NO-1:-1:1 S X=$$NJAVC^PLCORCAL(OP(U+1,1),OP(U,0),INTER(U,U+1),OP(U,2)),OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G FIN
 
FIN Q
STOCK(IDAR,OP,LISRES) 
 
 N ATJAL,DA,NOP,ROP,NR,EXART,MONT
 S ATJAL=$$DATEJAL^JALRPJ
 S MONT=LISRES'=""
 I VISU,('($D(NBAJ)))!('($D(NBAV))) S VISU=0
 S NBAJ=$$^%QCAZG("NBAJ")+1
 N I,ARTICLE,COMPOSANT,OFFSET S VISU=$$^%QCAZG("VISU")
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ) Q:ARTICLE=""
 S COMPOSANT=IDAR_","_ARTICLE,FIN=0
 S ROP=$$NOMLOG^%QSF($$OP^JALRPJ)
 S EXART=$$NOMLOG^%QSF($$ART^JALRPJ)
 S OFFSET=$$^%QCAZG("OP")+0
 G:'(MONT) AFB
 S NR=@LISRES
 S NR=NR+1
 S @LISRES@(NR)="   ",NR=NR+1
 S @LISRES@(NR)=EXART_" "_IDAR
AFB F I=1:1 Q:($D(OP(I))#10)=0  S H=$$^%QCAZG("OP(I,1)") W:0 ^JALDAT($O(^JALDAT(H))) I H S DA=$$DATENO3^%QMDATE(H),NOP=COMPOSANT_","_OP(I) D PA^%QSGESTI($$OP^JALRPJ,NOP,ATJAL,DA,DA) D:MONT AFFVIS
 S @LISRES=NR
 W:VISU $$XY^%VVIDEO1(0,22)_$$^%QZCHW("Jalonnes")_" : "_NBAJ_" / "_NBAV_$J("",20)
 Q
 
AFFVIS S NR=NR+1
 S @LISRES@(NR)=ROP_" "_NOP_" : "_$$^%QZCHW("date jalon")_" "_DA_" "_$$^%QZCHW("ressource")_" "_($$^%QCAZG("OP(I,2)")+0)
 Q
POUSS(OP,SENS,DATE,OPMOD) 
 N U,NO,D,X,DC K OPMOD
 F U=1:1 Q:'($D(OP(U)))
 S NO=U-1,OPMOD=OP
 G CHR:SENS=1,ANT:SENS=-1
CHR S (DC,X)=$$NEXT^PLCORCAL(DATE,OP(1,0)),OPMOD(1)=OP(1,1)_"^"_X,OP(1,1)=X
 F U=2:1:NO D CHR1
 G FIN
CHR1 I OP(U,1)'>DC S X=OP(U,1),OPMOD(U)=X_"^"_X Q
 S (DC,X)=$$NEXT^PLCORCAL(DC,OP(U,0)),OPMOD(U)=OP(U,1)_"^"_X,OP(U,1)=X Q
ANT S (DC,X)=$$PREV^PLCORCAL(DATE,OP(NO,0)),OPMOD(1)=OP(NO,1)_"^"_X,OP(NO,1)=X
 F U=NO-1:-1:1 D ANT1
 G FIN
ANT1 I OP(U,1)'<DC S X=OP(U,1),OPMOD(U)=X_"^"_X Q
 S (DC,X)=$$PREV^PLCORCAL(DC,OP(U,0)),OPMOD(U)=OP(U,1)_"^"_X,OP(U,1)=X Q
 
 Q
VIS Q:$D(VISU)  S VISU=0 Q

