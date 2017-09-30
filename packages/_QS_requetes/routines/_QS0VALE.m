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

;%QS0VALE^INT^1^59547,73880^0
%QS0VALE() 
 
 
 
 
 
 N BASE,CONCUR,LISTE,MSG,PCH,PCHCOMP,RES S RES=1
 D ^%QUAPAD($$^%QZCHW("VALEURS D'UN ATTRIBUT D'UNE LISTE"))
 S LISTE=$$UN^%QUAPAGM
 G:LISTE="" FIN
 S BASE=$$^%QSCALVA("L0",LISTE,"BASE") I BASE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus de cette liste ... desole")) G FIN
L0 D POCLEPA^%VVIDEO W $$^%QZCHW("Attribut : ") S DX=$X,DY=$Y D ^%VLEC G:CTRLA!(Y1="") FIN
 G:Y1'="?" SL0
 S Y1=$$^%QUCHOYO($$LISTATT2^%QSGEST6(BASE),.RES,2),PCHCOMP=Y1 G:Y1="" FIN G OK
SL0 S PCH=Y1 D ^%LXABR G:CONCUR=1 OK D POCLEPA^%VVIDEO,^%VSQUEAK
 I CONCUR=0 W $$^%QZCHW("Inconnu ...") H 2 G L0
 W $$^%QZCHW("Ambigu ...") H 2 G L0
OK S SORTIE=$$GEN^%QCAPOP("VAL")
 D EXTR(LISTE,PCHCOMP,SORTIE),INIT2^%QUAPAGM
 D AFFP^%QUAPAGM(SORTIE),AFFICH^%QUAPAGM
FIN D POCLEPA^%VVIDEO Q RES
 
 
 
EXTR(L,A,S) 
 N AD,B,OKECR,TEMP,LVAL,ERRM
 N LV,CARD,TY,J,%J,CH,I,%I,N,NT,P,T,TOTAL,V,VT,CAR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S LVAL=$$CONCAS^%QZCHAD(TEMP,"LVA")
 S OKECR=$$GET^%SGVAR("ECR")
 D USE^%QS0(L)
 S @LVAL=0
 S AD=$$^%QSCALVA("L0",L,"ADRESSE") I AD="" S ERRM=$$^%QZCHW("Impossible de retrouver les individus de la liste") G ERRM
 S B=$$^%QSCALVA("L0",L,"BASE") I B="" S ERRM=$$^%QZCHW("Impossible de retrouver le type des individus ... desole") G ERRM
 I OKECR D POCLEPA^%VVIDEO W L," --(",A,")--> ",S," ","."
 S I=-1,NT=0,TOTAL=0,CARD=0
 F %I=0:0 S I=$N(@AD@(I)) Q:I=-1  S NT=NT+1 K LV D MVG^%QSCALVA(B,I,A,"LV",.TY) W:((NT#100)=0)&OKECR "%" S J="" F %J=0:0 S J=$O(LV(J)) Q:J=""  S V=LV(J),TOTAL=TOTAL+V S:'($D(@LVAL@(V))) CARD=CARD+1,@LVAL@(V)=0 S @LVAL@(V)=@LVAL@(V)+1
 S I=""
 F %I=0:0 S I=$O(@LVAL@(I)) Q:I=""  S VT=@LVAL@(I),P=" "_VT_"/"_NT_" ("_$J((VT/NT)*100,3,2)_"%)",T=$S(TOTAL=0:"",1:" soit "_(VT*I)_" ("_$J(((VT*I)/TOTAL)*100,3,2)_"%)"),CH=I_$J("",15-$L(I))_P_$J("",20-$L(P))_T,^[QUI]ZLIGVALE(S,CH)=""
 S CAR("AUTRE",1)=L_"("_A_")",CAR("SOURCE",1)="VALEURS",CAR("CARD",1)=CARD,CAR("ADRESSE",1)="^[QUI]ZLIGVALE("""_S_""")" D ADD^%QS0(S,"CAR")
 D PA^%QSGESTI("L0",S,"ATTRIBUT.VALORISATION",A,1)
 G:'(OKECR) TERM
 D POCLEPA^%VVIDEO,BLD^%VVIDEO W S
 D NORM^%VVIDEO W $$^%QZCHW(" contient ") D BLD^%VVIDEO W CARD D NORM^%VVIDEO W $$^%QZCHW(" valeurs ...") H 3
TERM K @(TEMP)
 Q
ERRM I OKECR D POCLEPA^%VVIDEO,^%VSQUEAK W ERRM H 3 D POCLEPA^%VVIDEO
 K @(TEMP)
 Q

