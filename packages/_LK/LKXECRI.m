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

;LKXECRI^INT^1^59547,74868^0
LKXECRI ;
 
 
 
 
 I '($D(^[QUI]LKX("VALIDATION"))) D ^%VSQUEAK,MES("Veuillez faire au moins une validation correcte avant") Q
 N BASE,DEBO,END,FIN,FINOI,I,L,LIST,LISTE,LA,LNUM,LT,LVAL,NENREG,NOP,RET
 N LILA,M
 S L=^[QUI]LKX("LONGUEUR"),LT=$P(L,"^",1),LA=$P(L,"^",2),LVAL=LT-LA
 S LNUM=^[QUI]LKX("NUMERIQUE")
 D CLEPAG^%VVIDEO
 S END="",FIN="" F I=1:1:LT S FIN=FIN_"!",END=END_"*"
 S NENREG=0
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("ECRITURE BANDE OU FICHIER"))
 D SELSUP Q:IO=""
 D PFEN^%QS0D,AFFICH^%QUAPAGM
SEL S LIST=$$UN^%QUAPAGM G:LIST="" STOP
 S LISTE=$$^%QSCALIN("L0",LIST,"ADRESSE",1)
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de cette liste")) G SEL
 S BASE=$$^%QSCALIN("L0",LIST,"BASE",1)
 I BASE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus")) G SEL
 I $D(^[QUI]LKX("REP",$$NOMLOG^%QSF(BASE)))<9 D ^%VZEAVT($$^%QZCHW("le repertoire de cette liste n'est pas defini pour la passerelle, les valeurs par defaut seront utilisees"))
 S DEBO="*DEBUT "_BASE,DEBO=DEBO_$J("",LT-$L(DEBO))
 Q:$$^LKXLILA(.LILA)
 D GO
 
STOP D END^%QUAPAGM Q
 
GO S RET=13 I IO=47 D MES("Veuillez placez la bande dans le lecteur"),POCLEPA^%VVIDEO
 S:RET=-1 RET=1 Q:(RET=1)!(RET=6)
 W $$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Un instant ... transfert en cours")_$$NORM^%VVIDEO1
 D TRANSF(LISTE,BASE,LA,LVAL,$$LIST^%QMLILA(LILA))
 D POCLEPA^%VVIDEO W $$BLD^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Tranfert termine ("),NENREG,$$^%QZCHW(") ... [RETURN]")_$$NORM^%VVIDEO1 R *DX:^TOZE($I,"ATTENTE") Q
 
TRANSF(LIST,BAS,LA,LVAL,LILAT) 
 N IOFI,OKRET
 D OPENFILE^%SYSUTI1(IO,"W",.IOFI,.OKRET)
 D TRANS
 D CLOSE^%SYSUTI1(IOFI,"W")
 U 0
 Q
TRANS N A,CH,D,L,LOP,N,%N,NO,%NO,NUM,O,%O,STOP,S
 S STOP=0
 S O="" F %O=0:0 S O=$O(@LIST@(O)) Q:O=""  D NOM(BAS,O),REP,END,ARRET Q:STOP=1
 D FIN Q
ARRET U 0 R *DX:0 Q:DX'=1
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Arret")_" ? ","O")'=1 G 1
 G 79
 
 
 
1 D POCLEPA^%VVIDEO Q
6 G 1
13 G 79
78 G 1
79 S STOP=1 G 1
END U 0 D INCR,WRITE^%SYSUTI1(IOFI,END) Q
FIN U 0 D INCR,WRITE^%SYSUTI1(IOFI,FIN) Q
INCR S NENREG=NENREG+1,DX=0,DY=23 X XY W $$^%QZCHW("Nombre d'enregistrements ecrits = "),NENREG Q
REP I LILAT="" G REP1
 S M="" F %N=0:0 S M=$O(@LILAT@(M)) Q:M=""  S N=@LILAT@(M) D TGN
 Q
 
REP1 S M="" F %N=0:0 S M=$$NXTRIA^%QSTRUC8(BAS,O,M) Q:M=""  S N=M D TGN
 Q
TGN S CH=$$^%QCAZG($$CONCAS^%QZCHAD("^[QUI]LKX","REP,"_$$NOMLOG^%QSF(BAS)_","_N)),NUM=$P(CH,"^",1),D=$P(CH,"^",2)
 S:NUM="" NUM="N" S:D="" D="N" D LVAL(BAS,O,N,D,NUM) Q
LVAL(B,I,AT,DA,NU) N V G:$$MULT(B,I,AT) MULTI
 S V=$$^%QSCALIN(B,I,AT,1) S:DA="O" V=$$DAT(V) S:NU="O" V=$$NUM(V)
 U 0 D INCR,WRITE^%SYSUTI1(IOFI,$$FORMAT(AT,LA,V,LVAL)) Q
NOM(B,I) N V
 U 0 D INCR,WRITE^%SYSUTI1(IOFI,$$FORMAT("NOM",LA,I,LVAL)) Q
 
MULTI N N,%N,V,%V,V1
 S N="" K ^MULT($J) F %N=0:0 S V=$$NXTRIAO^%QSTRUC8(B,I,AT,N) Q:N=""  S V=$$VALEUR^%QSTRUC8(B,I,AT,N) D PLAC
 S N="" F %V=0:0 S N=$O(^MULT($J,N)) Q:N=""  U 0 D INCR,WRITE^%SYSUTI1(IOFI,$$S^%QAX(^MULT($J,N)))
 K ^MULT($J) Q
PLAC S:DA="O" V1=$$DAT(V) S:NU="O" V1=$$NUM(V1)
 S ^MULT($J,N)=$$FORMAT(AT_"."_N,LA,V,LVAL) Q
 
MULT(B,I,A) N V1
 S V1=$$NXTRIAV^%QSTRUC8(B,I,A,"") Q:V1="" 0
 S V1=$$NXTRIAV^%QSTRUC8(B,I,A,V1) Q:V1="" 0
 Q 1
 
DAT(D) Q $$NUM($P(D*10000,".",1))
 
NUM(V) N V2 S V2=$E(V,1,LNUM),V2=$E("000000000000000000000000000000000000000000000000000000000000000000000000000000",1,LNUM-$L(V))_V2 Q V2
 
FORMAT(C1,L1,C2,L2) S C1=$$S^%QAX(C1),C2=$$S^%QAX(C2),C1=$E(C1,1,L1),C2=$E(C2,1,L2)
 S C1=C1_$J("",L1-$L(C1)),C2=C2_$J("",L2-$L(C2)) Q C1_C2
 
MES(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M_" ... [RETURN]") R *RET:^TOZE($I,"ATTENTE") Q
 
SELSUP N SUP D POCLEPA^%VVIDEO S SUP=$$^%VZECH2($$^%QZCHW("Support choisi :"),$$^%QZCHW("BANDE"),$$^%QZCHW("FICHIER"))
 I SUP=$$^%QZCHW("BANDE") S IO=47 Q
 D POCLEPA^%VVIDEO S IO=$$^%VZAME1($$^%QZCHW("Nom du fichier : ")) Q
 
 
 
ACTIV(MODAFF,LIST,NOMFICH) 
 N BASE,DEBO,END,FIN,FINOI,I,L,LISTE,LA,LNUM,LT,LVAL,NENREG,NOP,RET
 N LILA,M
 I '($D(^[QUI]LKX("VALIDATION"))) D:MODAFF ^%VSQUEAK,MES("Veuillez faire au moins une validation correcte avant") Q
 S LISTE=$$^%QSCALIN("L0",LIST,"ADRESSE",1)
 I LISTE="" D ^%VSQUEAK,MES($$^%QZCHW("Impossible de retrouver les individus de cette liste")) Q
 S L=^[QUI]LKX("LONGUEUR"),LT=$P(L,"^",1),LA=$P(L,"^",2),LVAL=LT-LA
 S LNUM=^[QUI]LKX("NUMERIQUE")
 D:MODAFF CLEPAG^%VVIDEO
 S END="",FIN="" F I=1:1:LT S FIN=FIN_"!",END=END_"*"
 S NENREG=0
 D:MODAFF ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("ECRITURE BANDE OU FICHIER"))
 S SUP=$$^%QZCHW("FICHIER"),IO=NOMFICH
 S BASE=$$^%QSCALIN("L0",LIST,"BASE",1)
 S DEBO="*DEBUT "_BASE,DEBO=DEBO_$J("",LT-$L(DEBO))
 Q:$$^LKXLILA(.LILA)
 D GO
 ;

