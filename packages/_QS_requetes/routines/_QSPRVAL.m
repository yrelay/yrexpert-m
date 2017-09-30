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

;%QSPRVAL^INT^1^59547,73883^0
%QSPRVAL(REPER,ATR,VALA,XG,YH,LH,LV) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 I ATR="" Q 0
 N GLO,INS,LIS,NF,P,REP,TAB,V
 S REP=$$NOMLOG^%QSF(REPER) Q:REP="" 0
 
 S GLO="^[QUI]RQSGLO(""QSPR"",REP,ATR)"
 
 S INS=$O(@GLO@(""))
 I VALA'="?" G LEG
 
AFF 
 I INS="" D ^%VZEAVT($$^%QZCHW("Pas de valeur prevue pour cet attribut")) Q 0
 D CLFEN^%VVIDEO(XG,YH,LV,LH)
 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL") K @(TAB)
 S NF=""
CONS S NF=$O(@GLO@(INS,NF))
 I NF="" G CHX
 S LIS=@GLO@(INS,NF)
 
 S P=1
CVAL S V=$P(LIS,"^",P) I V'="" S @TAB@(V)=""
 S P=P+1 I P=15 G CONS
 G CVAL
CHX 
 D INIT^%QUCHOIP(TAB,1,"",XG,YH,LH,LV)
 D AFF^%QUCHOIP
 S VALA=$$UN^%QUCHOIP
 D END^%QUCHOIP
 K @(TAB)
 Q 1
 
LEG 
 
 I (INS="")!(INS="O") Q 0
 
 S NF=""
LEGF S NF=$O(@GLO@(INS,NF))
 
 I NF="" Q 2
 S LIS=@GLO@(INS,NF)
 
 S P=1
LEGV S V=$P(LIS,"^",P)
 
 I V=VALA Q 0
 S P=P+1 I P=15 G LEGF
 G LEGV
 
LEGAL(REPER,ATR,VALA) 
 N GLO,INS,LIS,NF,P,REP,V
 S REP=$$NOMLOG^%QSF(REPER) Q:REP="" 0
 
 S GLO="^[QUI]RQSGLO(""QSPR"",REP,ATR)"
 
 S INS=$O(@GLO@(""))
 G LEG
 
 
INSER(REPER,ATR,VALA,FORC) 
 N GLO,INS,LIS,NF,P,REP
 Q:VALA=""
 S REP=$$NOMLOG^%QSF(REPER) Q:REP=""
 S GLO="^[QUI]RQSGLO(""QSPR"",REP,ATR)"
 
 S INS=$O(@GLO@(""))
 
 I INS="" Q:FORC=0  S INS="O"
 
 I INS="N" Q:FORC=0
 
 S NF=""
FIC 
 S NF=$O(@GLO@(INS,NF)) I NF="" G CHER
 S LIS=@GLO@(INS,NF),P=1
PRC I $P(LIS,"^",P)=VALA Q
 S P=P+1 I P=15 G FIC
 G PRC
CHER 
 S NF=""
CH S NF=$O(@GLO@(INS,NF))
 I NF="" S NF=$ZP(@GLO@(INS,""))+1,@GLO@(INS,NF)=VALA_"^" Q
 
 S LIS=@GLO@(INS,NF)
 
 S P=1
VAL 
 I $P(LIS,"^",P)="" G INS
 S P=P+1 I P=15 G CH
 G VAL
INS 
 I P=1 S @GLO@(INS,NF)=VALA_"^"_$P(LIS,"^",P+1,14) Q
 S @GLO@(INS,NF)=$P(LIS,"^",1,P-1)_"^"_VALA_"^"_$P(LIS,"^",P+1,19)
 Q
 
TEST 
 D CLEPAG^%VVIDEO
 W "Valeur : " R VAL W !
 I VAL="?" W $$^%QSPRVAL("ARTICLE","COMMENTAIRE",.VAL,0,6,79,15),!,VAL Q
 D INSER("ARTICLE","COMMENTAIRE",VAL)
 Q
 
 
UCONT 
 N INS,GL
 S GL="^[QUI]RQSGLO(""QSPR"","""_RESUL(2)_""","""_RESUL(3)_""")"
 S INS=$O(@GL@(""))
 I INS="" Q
 I INS=RESUL(ICC) Q
 D POCLEPA^%VVIDEO,^%VSQUEAK
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous changer la valeur de l'indicateur d'insertion")_" ? ","O")'=1 S TAB(ICC)=INS D ^%VAFFICH,POCLEPA^%VVIDEO Q
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COP")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(GL,INS),TEMP)
 K @GL@(INS)
 D GLOCOP^%QCAGLC(TEMP,$$CONCAS^%QZCHAD(GL,$S(INS="N":"O",1:"N")))
 I RESUL(ICC+1)'="",$D(@GL@(RESUL(ICC),RESUL(ICC+1))) K @GL@(RESUL(ICC),RESUL(ICC+1))
 D POCLEPA^%VVIDEO
 K @(TEMP) Q
 
 
SETREM(REPER,ATR) 
 N INS,REP
 S REP=$$NOMLOG^%QSF(REPER) I REP="" S ^[QUI]RQSDON("REMPRVAL",REPER,ATR)=0 Q
 I '($D(^[QUI]RQSGLO("QSPR",REP,ATR))) S ^[QUI]RQSDON("REMPRVAL",REPER,ATR)=0 Q
 S INS=$O(^[QUI]RQSGLO("QSPR",REP,ATR,""))
 S ^[QUI]RQSDON("REMPRVAL",REPER,ATR)=INS'="" Q
 
KILLREM K ^[QUI]RQSDON("REMPRVAL")

