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

;%QMDASAI^INT^1^59547,73877^0
QMDASAI(VALS,VALI) 
 
 
 
 
 
 
 
 
 
 
 
 
 S VALI=""
 S VALS=$$GETLBLAN^%VTLBLAN(VALS)
 Q:VALS="" 0
 N %P,A,ANN,BIS,C,D,DAT,DC,DH,DP,DS,I,J,JO,JOUR,LD,LDA,M,MC,MOI,MP,P,PAR,PC,PH,S,SUF,STOP,T
 S (JOUR,STOP)=0,VALS=$$MAJ^%VMINUSC(VALS)
 
 D ZD^%QMDATE4 S ANN=$P(%DAT,"/",3),MOI=$P(%DAT,"/",2)
 
 
 I $L(VALS)'=4 G suite
 I VALS'=(VALS+0) G suite
 N VALS1 S VALS1=$E(VALS,3,4) I VALS1'>52 Q 1
suite 
 F I=1:1 S PAR=$P(VALS," ",I) Q:PAR=""  D DET(PAR) Q:(STOP=1)!(STOP=2)
 
 I STOP=1 S VALI="" Q 0
 S VALI=$$GETLBLAN^%VTLBLAN(VALI)
 
 D TRANS(.VALI) Q 1
 
TRANS(V) 
 S MP=$$JOUR^%QZDAJM($P(V," ",1),.MC)
 I MP=0 S V=$$^%QMDAFIN(V) Q
 
 S V=$$^%QMDAFIN($P(V," ",2,$L(V," "))) Q
 
DET(P) 
 S PC=$E(P,1),DC=$E(P,2),STOP=1
 I $$ADR^%QZNBN1(PC) D NUM(P,.PC),INS Q
 
 I DC="" D LETTRE(PC) Q
 
 I $$ADR^%QZNBN1(DC) D DAT^%QMDASA2(P,PC),INS Q
 
 D LETTRE(P)
 Q
LETTRE(C) 
 I I=1 S STOP='($$JOUR^%QZDAJM(C,.MC)) Q:STOP  S VALI=MC_" " Q:$P(VALS," ",2)'=""  S STOP=1 Q
 S MP=$$JOUR^%QZDAJM($P(VALI," ",1),.MC) Q:(MP=0)&(I'=2)  Q:(MP=1)&(I'=3)
 
 S STOP='($$MOIS^%QZDAJM(C,.MC)) Q:STOP=1
 
 S JO=$P(VALI," ",$L(VALI," ")-1),VALI=$P(VALI," ",1,$L(VALI," ")-2)
 S:VALI'="" VALI=VALI_" "
 S PP=$P(VALS," ",I+1) I '($$ADR^%QZNBN1(PP)) S PP=ANN G TJ
 I $L(PP)=4 S PP=$E(PP,3,4)
TJ 
 S STOP=1,PC="J",DAT=PC_JO_"/"_$$MOISINV^%QMDATE1($E(MC)_$$MIN^%VMINUSC($E(MC,2,$L(MC))))_"/"_PP D J^%QMDASA2 Q:STOP=1
 S:$P(VALS," ",I+1)'["H" I=I+1
 S VALI=VALI_"J"_DAT_" " Q
 
INS 
 Q:STOP=1
 I DAT'["/" S VALI=VALI_DAT_" " Q
 N DEL,PA S DEL=PC
 F %P=1:1:3 S PA=$P(DAT,"/",%P) Q:PA=""  S:$L(PA)=1 PA="0"_PA S DEL=DEL_PA_"/"
 S:PA="" %P=%P-1
 S DEL=$P(DEL,"/",1,%P),VALI=VALI_DEL_" "
 S:(((PC="S")!(PC="D"))!(PC="M"))!(PC="T") STOP=2
 
 Q
 
NUM(D,PC) 
 N ES
 S ES=0
 S LD=$L(D) G:D'["/" JHEUR
 S MP=$$JOUR^%QZDAJM($P(VALI," ",1),.MC) Q:(MP=0)&(I=('(1)))  Q:(MP=1)&(I'=2)
 S DAT=D,DP=$P(DAT,"/",3)
 S:DP="" DP=ANN
 S:$L(DP)=4 DP=$E(DP,3,4)
 S PC="J",DAT=PC_$P(D,"/",1,2)_"/"_DP
NUM2 S ES=ES+1
 D J^%QMDASA2
 Q:STOP=0
 Q:ES=2
 S DAT=PC_DP_"/"_$P(D,"/",2)_"/"_$P(D,"/",1)
 G NUM2
 
JHEUR I D["H" D HEURE Q
 G:LD<3 HEJO
 I JOUR S DAT=D,STOP=0 Q
 I LD=3 S DAT=$E(D,1,2)_"/0"_$E(D,3)_"/"_ANN G JHF
 I LD=4 S DAT=$E(D,1,2)_"/"_$E(D,3,4)_"/"_ANN G JHF
 S DP=$E(D,5,$L(D))
 S:$L(DP)=4 DP=$E(D,7,8)
 S DAT=$E(D,1,2)_"/"_$E(D,3,4)_"/"_DP
JHF S ES=ES+1
 S PC="J",DAT=PC_DAT
 D J^%QMDASA2
 Q:STOP=0
 Q:ES=2
 
 S DAT=$P(DAT,"/",3)_"/"_$P(DAT,"/",2)_"/"_$E(D,1,2)
 G JHF
 
HEJO 
 I JOUR S D=D_"H" G HEURE
 S PS=$P(VALS," ",I+1)
 I $$MOIS^%QZDAJM(PS,.MP) S JOUR=1,STOP=0,DAT=D Q
 S PC="J",DAT=PC_D_"/"_MOI_"/"_ANN
HEJO2 S ES=ES+1
 D J^%QMDASA2
 Q:STOP=0
 Q:ES=2
 S DAT="J"_ANN_"/"_MOI_"/"_D
 G HEJO2
 
HEURE 
 Q:(I=1)!(JOUR'=1)
 S PH=$P(D,"H",1),DH=$P(D,"H",2) Q:PH=""
 S:DH="" DH="00" S:$L(PH)=1 PH="0"_PH S:$L(DH)=1 DH="0"_DH
 Q:('($$ENTP^%QZNBN(PH)))!(PH>23)
 I DH'["'" Q:('($$ENTP^%QZNBN(DH)))!(DH>59)  S DAT=PH_"H"_DH,STOP=0 Q
 S DS=$P(DH,"'",2),DH=$P(DH,"'",1) S:DS="" DS="00"
 S:$L(DH)=1 DH="0"_DH S:$L(DS)=1 DS="0"_DS
 Q:((('($$ENTP^%QZNBN(DH)))!(DH>59))!('($$ENTP^%QZNBN(DS))))!(DS>59)
 S DAT=PH_"H"_DH_"'"_DS,STOP=0 Q
 
TEST N C,R,V D CLEPAG^%VVIDEO
DEB W !,"Chaine saisie : " R C Q:C=""
 S R=$$QMDASAI(C,.V)
 W !,!,"Resultat : ",R,!,"Forme interne : ",V,! G DEB

