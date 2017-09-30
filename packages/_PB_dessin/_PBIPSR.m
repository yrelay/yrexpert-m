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

;%PBIPSR^INT^1^59547,73873^0
PTIPASSE ;
 N MA,MC,NA,NC,O,%O,SA,SC,V,%V S (NA,NC)=0,O=-1 F %O=0:0 S O=$N(^[QUI]GRAPHE(O)) Q:O=-1  S V=-1 F %V=0:0 S V=$N(^[QUI]GRAPHE(O,V)) Q:V=-1  D T(O,V)
 Q
T(O,V) 
 D KILL^%PBSOV(O,V)
 W !,!,!,!,"Objet ",O,", Version ",V," en cours de recuperation ..."
 N AD,AF,AN,ATT,CH,CH2,GR,I,IN,IN2,J,N,%N,PA,PAR,PA,PC,PD,PO,POINTS,PP,PR,R,R1,R2,RA,S,SN,SY,SYNT,T,TETE,X,X1,X2,XT,Y,Y1,Y2,YT
 S TETE="" S:($D(^[QUI]GRAPHE(O,V))#10)'=0 TETE=^[QUI]GRAPHE(O,V)
 I TETE="" D ERRO("Impossible de retrouver l'echelle") Q
 S TETE=$P(TETE,"^",6) S:TETE="" TETE=1000
 I '($D(^[QUI]GRDEFOBJ(O,V,5,"DATA","%9XDEB"))) D ERRO("Impossible de retrouver le 1er point") Q
 I '($D(^[QUI]GRDEFOBJ(O,V,5,"DATA","%9YDEB"))) D ERRO("Impossible de retrouver le 1er point") Q
 S XT=^[QUI]GRDEFOBJ(O,V,5,"DATA","%9XDEB"),YT=^[QUI]GRDEFOBJ(O,V,5,"DATA","%9YDEB") D NEW^%PBSOV(O,V),SET^%PBSOV(O,V,"MESURE",TETE),SET^%PBSOV(O,V,"XO",XT),SET^%PBSOV(O,V,"YO",YT)
 S N="" F %N=0:0 S N=$O(^[QUI]GRAPHE(O,V,N)) Q:N=""  D TN
 Q
TN W !,"Element : ",N
 I '($D(^[QUI]GRINFO(O,V,N))) D ERREL(N,"Incoherence des donnees") Q
 S CH=^[QUI]GRINFO(O,V,N),CH2=^[QUI]GRAPHE(O,V,N),SYNT=$P(CH2,"^",19)
 W " --> ",SYNT," ",$P(CH,"^",1) G @$P(CH,"^",1)
TRAIT S J=2 F I="X1","Y1","X2","Y2","TL" S @I=$P(CH,"^",J),J=J+1
 S (PD,PA)="" G:SYNT="" TROK
 K SY,ATT,PAR S SY(1)="(X;X)",SY(2)="(*/*;X;X)"
 I '($$^%PBIANSY(.SY,SYNT,.ATT,.PAR,.SN)) D ERREL(N,"Probleme de syntaxe") Q
 G @("TR"_SN)
TR1 S PD=PAR(1),PA=PAR(2) G TROK
TR2 S PD=PAR(3),PA=PAR(4) D DEP^%PBSOV(O,V,PA,PD) G TROK
TROK D C(PD,.X1,.Y1,"",""),C(PA,.X2,.Y2,1,SYNT)
 W !,$$Y(X1),",",$$Y(Y1),",",$$X(X2),",",$$Y(Y2),",",TL,",",PD,",",PA
 S R=$$ADD^%PBSOV(O,V,$$DROITE^%PBEL($$X(X1),$$Y(Y1),$$X(X2),$$Y(Y2),TL,PD,PA,SYNT)) Q
ARCC S J=2 F I="X","Y","R","AD","AF","TL" S @I=$P(CH,"^",J),J=J+1
 S (PD,PA,PC,AN,RA)="" G:SYNT="" AROK
 K SY,ATT,PAR S SY(1)="(X;X;X)",SY(2)="(X;X/R=*)",SY(3)="(X;X/A=*)"
 I '($$^%PBIANSY(.SY,SYNT,.ATT,.PAR,.SN)) D ERREL(N,"Probleme de syntaxe") Q
 S (MA,SA,MC,SC)="" G @("AR"_SN)
AR1 S PD=PAR(1),PA=PAR(2),PC=PAR(3) G AROK
AR2 S PD=PAR(1),PA=PAR(2),RA=PAR(3),PC=$$NEWPC,(SC,SYNT)=$$SYNT(SYNT,PC),MC=2 G AROK
AR3 S PC=PAR(1),PC=PAR(2),AN=PAR(3),PA=$$NEWPA,(SA,SYNT)=$$SYNT(SYNT,PA),MA=3 G AROK
AROK D:PD'="" NEWP^%PBCACV(X,Y,R,$$NORM^%PBCACV(AD),.X1,.Y1)
 D:PA'="" NEWP^%PBCACV(X,Y,R,$$NORM^%PBCACV(AF),.X2,.Y2)
 D C(PD,.X1,.Y1,"",""),C(PA,.X2,.Y2,MA,SA),C(PC,.X,.Y,MC,SC)
 W !,$$X(X),",",$$Y(Y),",",R,",",AD,",",AF,",",TL,",",PD,",",PA,",",PC,",",AN,",",RA
 S R=$$ADD^%PBSOV(O,V,$$ARC^%PBEL($$X(X),$$Y(Y),R,AD,AF,TL,PD,PA,PC,AN,RA,SYNT)) Q
CERC S J=2 F I="X","Y","R","AD","AF","TL" S @I=$P(CH,"^",J),J=J+1
 S (PD,PP,RA)="" G:SYNT="" CEOK
 K SY,ATT,PAR S SY(1)="(X;X)",SY(2)="(X/*)"
 I '($$^%PBIANSY(.SY,SYNT,.ATT,.PAR,.SN)) D ERREL(N,"Probleme de syntaxe") Q
 G @("CE"_SN)
CE1 S PD=PAR(1),PP=PAR(2) G CEOK
CE2 S PD=PAR(1),RA=PAR(2) G CEOK
CEOK W !,$$X(X),",",$$Y(Y),",",R,",",TL,",",PD,",",PP,",",RA
 S R=$$ADD^%PBSOV(O,V,$$CERCLE^%PBEL($$X(X),$$Y(Y),R,TL,PD,PP,RA,SYNT)) Q
POINT S J=2 F I="X","Y" S @I=$P(CH,"^",J),J=J+1
 D C(SYNT,.X,.Y,"","")
 W !,$$X(X),",",$$Y(Y)
 Q
DELI S J=2 F I="X","Y","PR","GR","IN","TL" S @I=$P(CH,"^",J),J=J+1
 S (PD,PO,PC,R1,R2,IN2)="" G:SYNT="" DEOK
 K SY,ATT,PAR S SY(1)="(X;X/*)",SY(2)="(X/*/*/*)"
 I '($$^%PBIANSY(.SY,SYNT,.ATT,.PAR,.SN)) D ERREL(N,"Probleme de syntaxe") Q
 G @("DE"_SN)
DE1 S PD=PAR(1),PO=PAR(2),R2=PAR(3) G DEOK
DE2 S PC=PAR(1),R1=PAR(2),R2=PAR(3),IN2=PAR(4) G DEOK
DEOK D:PD'="" NEWP^%PBCACV(X,Y,PR/2,$$NORM^%PBCACV(IN),.X1,.Y1)
 D:PO'="" NEWP^%PBCACV(X,Y,PR/2,$$NORM^%PBCACV(IN+180),.X2,.Y2)
 D C(PD,.X1,.Y1,"",""),C(PO,.X2,.Y2,"","")
 W !,$$X(X),",",$$Y(Y),",",PR,",",GR,",",IN,",",TL,",",PD,",",PO,",",PC,",",R1,",",R2,",",IN2
 S R=$$ADD^%PBSOV(O,V,$$DEMIE^%PBEL($$X(X),$$Y(Y),PR,GR,IN,TL,PD,PO,PC,R1,R2,IN2,SYNT)) Q
ELI S J=2 F I="X","Y","PR","GR","IN","TL" S @I=$P(CH,"^",J),J=J+1
 S (PD,PO,PC,R1,R2,IN2)="" G:SYNT="" ELOK
 K SY,ATT,PAR S SY(1)="(X;X/*)",SY(2)="(X/*/*/*)"
 I '($$^%PBIANSY(.SY,SYNT,.ATT,.PAR,.SN)) D ERREL(N,"Probleme de syntaxe") Q
 G @("EL"_SN)
EL1 S PD=PAR(1),PO=PAR(2),R2=PAR(3) G ELOK
EL2 S PC=PAR(1),R1=PAR(2),R2=PAR(3),IN2=PAR(4) G ELOK
ELOK D:PD'="" NEWP^%PBCACV(X,Y,PR/2,$$NORM^%PBCACV(IN),.X1,.Y1)
 D:PO'="" NEWP^%PBCACV(X,Y,PR/2,$$NORM^%PBCACV(IN+180),.X2,.Y2)
 D C(PD,.X1,.Y1,"",""),C(PO,.X2,.Y2,"","")
 W !,$$X(X),",",$$Y(Y),",",PR,",",GR,",",IN,",",TL,",",PD,",",PO,",",PC,",",R1,",",R2,",",IN2
 S R=$$ADD^%PBSOV(O,V,$$ELLIPSE^%PBEL($$X(X),$$Y(Y),PR,GR,IN,TL,PD,PO,PC,R1,R2,IN2,SYNT)) Q
 Q
TEXT S J=2 F I="X","Y","S","T" S @I=$P(CH,"^",J),J=J+1
 W !,$$X(X),",",$$Y(Y),",",T
 S R=$$ADD^%PBSOV(O,V,$$TEXTE^%PBEL($$X(X),$$Y(Y),T,"H")) Q
 Q
ERREL(E,M) D ^%VSQUEAK W !,"Abandon element ",E," : ",M Q
ERRO(M) D ^%VSQUEAK W !,"Abandon : ",M Q
X(X) Q X-XT
Y(Y) Q Y-YT
C(P,X,Y,M,S) Q:P=""  N R
 I $D(POINTS(P)) S X=POINTS(P,"X"),Y=POINTS(P,"Y") Q
 D ADDPOINT^%PBSOV(O,V,P,$$X(X),$$Y(Y))
 S R=$$ADD^%PBSOV(O,V,$$POINT^%PBEL($$X(X),$$Y(Y),M,S,P))
 S POINTS(P,"X")=X,POINTS(P,"Y")=Y Q
NEWPC() S NC=NC+1 Q "CTR"_NC
NEWPA() S NA=NA+1 Q "ARR"_NA
SYNT(S,P) Q $E(S,1,$L(S)-1)_";"_P_")"

