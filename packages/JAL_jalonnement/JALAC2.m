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

;JALAC2^INT^1^59547,74867^0
JALAC2 ;
 
 
 
 
 
 
 
 
 
 
JAMT(A,D,QUANT,DATELIM,VC,RD,SEN,FC,MODEX,MAJDEL,OPM,ERR,LISRES) 
 N TOP,TIN,T,DUDEL
 D VIS
 K ^RESSOURCE($J)
 D LIRE2^JALIRE(A,"","",QUANT,.TOP,.ERR)
 G:ERR'=0 JAM12ER
 G:'($D(TOP(1))) JAM12ER
 G:'($$GET^JALGETJA(A,.TOP,.TIN,.MAXDEL)) JAM12ER
 
 D SETDA2(.TOP,.TIN,SEN,D,DATELIM,.OPM,VC,RD)
 G:ERR'=0 JAM12ER
 D STOCK(A,.TOP,LISRES)
JAM12ER K ^RESSOURCE($J)
 Q
 
INTER(SOM,INT) 
 
 N X,N,U,V,UU,A
 F N=1:1 Q:'($D(SOM(N)))
 S N=N-1
 S X(1)=0
 F U=2:1:N S UU=U-1,X(U)=X(UU) F V=1:1:UU I $D(INT(V,U)) S A=X(V)+INT(V,U) S:A>X(U) X(U)=A
 S MAXDEL=0
 K INT F U=2:1:N S INT(U-1,U)=X(U)-X(U-1),MAXDEL=MAXDEL+INT(U-1,U)
 
 Q
SETDA2(OP,INTER,SENS,DATE,DATELIM,OPMOD,VC,RD) 
 N NO,U,D,X,STOP,IN
 K OPMOD
 F U=1:1 Q:'($D(OP(U)))
 
 S NO=U-1
 K ^RESSOURCE($J)
 G CHRON2:SENS=1,ANTICHR2:SENS=-1
CHRON2 S (IN,X)=$$NEXTC^PLCORCA2(DATE,OP(1,0),OP(1,2),VC,FC,DATELIM,.STOP)
 G:X="" ERCHRON2
 I (X+MAXDEL)>DATELIM S ERR=5 D ERRDA G FIN
 S OPMOD(1)=$$^%QCAZG("OP(1,1)")_"^"_X,OP(1,1)=X
 S OPMOD(1,1)=OP(1)
 F U=2:1:NO S X=$$NJAPC^PLCORCA2(OP(U-1,1),OP(U,0),INTER(U-1,U),OP(U,2),VC,RD,FC,DATELIM,.STOP) Q:X=""  S OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G:X="" ERCHRON2
 S DUDEL=(X-IN)+1
 G FIN
 
ERCHRON2 D ERRDA
 I STOP S ERR=6 G FIN
 I RD=0 S ER=5 G FIN
 S DATE=DATE+1
 I (DATE+MAXDEL)>DATELIM S ERR=5 G FIN
 G CHRON2
 
ANTICHR2 S (IN,X)=$$PREVC^PLCORCA2(DATE,OP(NO,0),OP(NO,2),VC,FC,DATELIM,.STOP)
 G:X="" ERACHR2
 I (X-MAXDEL)<DATELIM D ERRDA S ERR=5 G FIN
 S OPMOD(NO)=$$^%QCAZG("OP(NO,1)")_"^"_X,OP(NO,1)=X
 S OPMOD(NO,1)=OP(NO)
 F U=NO-1:-1:1 S X=$$NJAVC^PLCORCA2(OP(U+1,1),OP(U,0),INTER(U,U+1),OP(U,2),VC,FC,RD,DATELIM,.STOP) Q:X=""  S OPMOD(U)=$$^%QCAZG("OP(U,1)")_"^"_X,OP(U,1)=X,OPMOD(U,1)=OP(U)
 G:X="" ERACHR2
 S DUDEL=(IN-X)+1
 G FIN
 
ERACHR2 D ERRDA
 I STOP S ERR=6 G FIN
 I RD=0 S ERR=5 G FIN
 S DATE=DATE-1
 I (DATE-SOMDEL)<DATELIM S ERR=5 G FIN
 G ANTICHR2
 
FIN K ^RESSOURCE($J)
 Q
 
 
 
ERRDA N MA,NOSEM,CHA,RMA,P1,P2,P3,CH,R
 S RMA=$$MACHINE^JALRPJ,CHA=$$CHARGE^JALRPJ
 S MA=""
BMAERR S MA=$O(^RESSOURCE($J,MA))
 G:MA="" FERR
 S NOSEM=""
BSEMERR S NOSEM=$O(^RESSOURCE($J,MA,NOSEM))
 G:NOSEM="" BMAERR
 S CH=^[QUI]MACAP(MA,"SECTION","H",NOSEM)
 S R=^RESSOURCE($J,MA,NOSEM)
 S P1=$P(CH,"^"),P2=$P(CH,"^",2),P3=$P(CH,"^",3,10)
 S R=P2-R
 I R=0 S R="" I P1="" K ^[QUI]MACAP(MA,"SECTION","H",NOSEM) G BSEMERR
 S ^[QUI]MACAP(MA,"SECTION","H",NOSEM)=P1_"^"_R_"^"_P3
 G BSEMERR
 
FERR K ^RESSOURCE($J) Q
 Q
 
STOCK(IDAR,OP,LISRES) 
 
 N ATJAL,DA,NOP,ROP,NR,EXART,MONT,IOP
 S ATJAL=$$DATEJAL^JALRPJ
 S MONT=LISRES'=""
 I VISU,('($D(NBAJ)))!('($D(NBAV))) S VISU=0
 S NBAJ=$$^%QCAZG("NBAJ")+1
 N I,ARTICLE,COMPOSANT,OFFSET S VISU=$$^%QCAZG("VISU")
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ) Q:ARTICLE=""
 S COMPOSANT=IDAR_","_ARTICLE,FIN=0
 S IOP=$$OP^JALRPJ
 S ROP=$$NOMLOG^%QSF(IOP)
 S EXART=$$NOMLOG^%QSF($$ART^JALRPJ)
 S OFFSET=$$^%QCAZG("OP")+0
 G:'(MONT) AFB
 S NR=@LISRES
 S NR=NR+1
 S @LISRES@(NR)="   ",NR=NR+1
 S @LISRES@(NR)=EXART_" "_IDAR
AFB F I=1:1 Q:($D(OP(I))#10)=0  S H=$$^%QCAZG("OP(I,1)") I H S DA=$$DATENO3^%QMDATE(H),NOP=COMPOSANT_","_OP(I) D:MODEX'=1 MAJ D:MONT AFFVIS
 S @LISRES=NR
 I MODEX D ERRDA
 Q:'(MAJDEL)
 S NR=NR+1
 S @LISRES@(NR)="   "_$$DUFAB^JALRPJ_" : "_DUDEL
 S @LISRES=NR
 Q:MODEX
 D PA^%QSGESTI($$ART^JALRPJ,IDAR,$$DUFAB^JALRPJ,DUDEL,$$DATE^%QMDATE)
 
 Q
 
 
MAJ D PA^%QSGESTI(IOP,NOP,ATJAL,DA,DA)
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

