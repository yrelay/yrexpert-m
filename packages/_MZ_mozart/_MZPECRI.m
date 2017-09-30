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

;%MZPECRI^INT^1^59547,73872^0
%MZPECRI ;;11:57 AM  1 Jul 1996
 
 
 
 
 
 I '($D(^[QUI]MOZP("VALIDATION"))) D ^%VSQUEAK,MES("Veuillez faire au moins une validation correcte avant") Q
 N BASE,DEBO,END,FIN,FINOI,I,L,LIST,LISTE,LA,LNUM,LT,LVAL,NENREG,NOP,RET
 S L=^[QUI]MOZP("LONGUEUR"),LT=$P(L,"^",1),LA=$P(L,"^",2),LVAL=LT-LA
 S LNUM=^[QUI]MOZP("NUMERIQUE")
 D CLEPAG^%VVIDEO
 S END="",FIN="" F I=1:1:LT S FIN=FIN_"!",END=END_"*"
 S DEBO="*DEBUT OPERATIONS",DEBO=DEBO_$J("",LT-$L(DEBO))
 S NENREG=0
 S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1,MSG="ECRITURE BANDE OU FICHIER" D 4^%VZCD
 D SELSUP Q:IO=""
 D PFEN^%QS0D,AFFICH^%QUAPAGM
SEL S LIST=$$UN^%QUAPAGM G:LIST="" STOP
 S LISTE=$$^%QSCALIN("L0",LIST,"ADRESSE",1)
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de cette liste")) G SEL
 S BASE=$$^%QSCALIN("L0",LIST,"BASE",1)
 I BASE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus")) G SEL
 I BASE'=$$GI^%MZQS D ^%VSQUEAK,MES("Choisissez une liste de gammes"),POCLEPA^%VVIDEO G SEL
 D GO
STOP D END^%QUAPAGM Q
GO S RET=13 I IO=47 D MES("Veuillez placez la bande dans le lecteur"),POCLEPA^%VVIDEO
 S:RET=-1 RET=1 Q:(RET=1)!(RET=6)
 W $$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Un instant ... transfert en cours")_$$NORM^%VVIDEO1
 D TRANSF(LISTE,BASE,LA,LVAL)
 D POCLEPA^%VVIDEO W $$BLD^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Tranfert termine ("),NENREG,$$^%QZCHW(") ... [RETURN]")_$$NORM^%VVIDEO1 R *DX:^TOZE($I,"ATTENTE") Q
 
TRANSF(LIST,BAS,LA,LVAL) O IO:("EFL":LT:8000) U IO W:IO=47 *-5 D TRANS W:IO=47 *-5 C IO U 0 Q
TRANS N A,CH,D,L,LOP,N,%N,NO,%NO,NUM,O,%O,STOP,V S STOP=0
 S O="" F %O=0:0 S O=$O(@LIST@(O)) Q:O=""  D GAMME,LOPER,END,ARRET Q:STOP
 D FIN Q
ARRET U 0 R *DX:0 Q:DX'=1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Arret (O/N) ? [O] : ") R *DX:^TOZE($I,"ATTENTE")
 S:DX=-1 DX=1 F DY=1,6,13,78,79 G:DX=DY @DX
 D ^%VSQUEAK G STOP
1 D POCLEPA^%VVIDEO Q
6 G 1
13 G 79
78 G 1
79 S STOP=1 G 1
END U 0 D INCR U IO W END Q
FIN U 0 D INCR U IO W FIN Q
INCR S NENREG=NENREG+1,DX=0,DY=23 X XY W $$^%QZCHW("Nombre d'enregistrements ecrits = "),NENREG Q
GAMME S N="" F %N=0:0 S N=$O(^[QUI]MOZP("GAMME",N)) Q:N=""  D TGN
 Q
TGN S CH=^[QUI]MOZP("GAMME",N),A=$P(CH,"^",1),NUM=$P(CH,"^",2),D=$P(CH,"^",3)
 S:NUM="" NUM="N" S:D="" D="N" D LVAL(BAS,O,A,D,NUM) Q
LOPER U 0 D INCR U IO W DEBO S NOP=0
 K LOP
 S NO="" F %NO=0:0 S NO=$$NXTRIAO^%QSTRUC8(BAS,O,$$OE^%MZQS,NO) Q:NO=""  S V=$$VALEUR^%QSTRUC8(BAS,O,$$OE^%MZQS,NO),LOP(NO)=V D TNO Q
TNO S N="" F %N=0:0 S N=$O(^[QUI]MOZP("OPERATION",N)) Q:N=""  D TGNO
 S NOP=NOP+1,FINOI="*FIN OPERATION "_NOP,FINOI=FINOI_$J("",LT-$L(FINOI))
 U 0 D INCR U IO W FINOI
 Q
TGNO S OP=O_","_LOP(NO),CH=^[QUI]MOZP("OPERATION",N)
 S A=$P(CH,"^",1),NUM=$P(CH,"^",2),D=$P(CH,"^",3)
 S:NUM="" NUM="N" S:D="" D="N" D LVAL($$OI^%MZQS,OP,A,D,NUM) Q
LVAL(B,I,AT,DA,NU) N V G:$$MULT(B,I,AT) MULTI
 
 S V=$$^%QSCALIN(B,I,AT,1)
 I (AT="MACHINE")!(AT="POSTE.MAIN"),V'="" U 0 S V=$$S^%QAX(V) U IO
 S:DA="O" V=$$DAT(V) S:NU="O" V=$$NUM(V)
 U 0 D INCR U IO W $$FORMAT(AT,LA,V,LVAL) Q
MULTI N N,%N,V,%V,V1
 S N="" K ^MULT($J) F %V=0:0 S N=$$NXTRIAO^%QSTRUC8(B,I,AT,N) Q:N=""  S V=$$VALEUR^%QSTRUC8(B,I,AT,N) D PLAC
 S N="" F %V=0:0 S N=$O(^MULT($J,N)) Q:N=""  U 0 D INCR U IO W ^MULT($J,N)
 K ^MULT($J) Q
PLAC I AT="MACHINE.REMPLACEMENT" U 0 S V=$$S^%QAX(V) U IO
 S:DA="O" V1=$$DAT(V) S:NU="O" V1=$$NUM(V1)
 
 S ^MULT($J,N)=$$FORMAT(AT_"."_N,LA,V,LVAL) Q
MULT(B,I,A) N V1
 S V1=$$NXTRIAV^%QSTRUC8(B,I,A,"") Q:V1="" 0
 S V1=$$NXTRIAV^%QSTRUC8(B,I,A,V1) Q:V1="" 0
 Q 1
DAT(D) Q $$NUM($P(D*10000,".",1))
NUM(V) N V2 S V2=$E(V,1,LNUM),V2=$E("000000000000000000000000000000000000000000000000000000000000000000000000000000",1,LNUM-$L(V))_V2 Q V2
FORMAT(C1,L1,C2,L2) S C1=$E(C1,1,L1),C2=$E(C2,1,L2)
 S C1=C1_$J("",L1-$L(C1)),C2=C2_$J("",L2-$L(C2)) Q C1_C2
MES(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M_" ... [RETURN]") R *RET:^TOZE($I,"ATTENTE") Q
SELSUP N SUP D POCLEPA^%VVIDEO S SUP=$$^%VZECH2($$^%QZCHW("Support choisi :"),$$^%QZCHW("BANDE"),$$^%QZCHW("FICHIER"))
 I SUP=$$^%QZCHW("BANDE") S IO=47 Q
SSF D POCLEPA^%VVIDEO S IO=$$^%VZAME1($$^%QZCHW("Nom du fichier : "))
 I (IO?1A.A1"."1A.A)!(IO?1A.A1"."1A.A1";"1N.N) G SSFIN
SSH D ^%VZEAVT("Nom de fichier sous la forme AAAAA.AAA ou AAAAA.AAA;C (C numerique)") G SSF
SSFIN S IO=^TABIDENT(WHOIS,"MACHINE")_IO Q

