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

;%QMEAUT^INT^1^59547,73878^0
QMEAUT ;
 
 
 
 
 
MENU3(MEN) 
 K @(MEN)
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Aide")_"^AIDE"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte d'aide")
 S @MEN@(2)=$$^%QZCHW("Valeurs legales")_"^VALL"
 S @MEN@(2,"COM")=$$^%QZCHW("Acces aux valeurs legales")
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SUPP"
 S @MEN@(3,"COM")=$$^%QZCHW("Suppression de l'attribut")
 S @MEN@(4)=$$^%QZCHW("Duplication")_"^DUPLI"
 S @MEN@(4,"COM")=$$^%QZCHW("Duplication de l'attribut")
 Q
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q
 
CHERCHAT(ATT,IPLAC,ORDAT) 
 G:((ATT'="")!(IPLAC'=""))!(ORDAT'="") CAT2
 
 S IPLAC=$O(@GLOATT@(""))
 
 I IPLAC="" D M("Aucun attribut n'est defini") Q 0
 
 S ATT=@GLOATT@(IPLAC),ORDAT=@GLOATT@(IPLAC,"NUMERO.ORDRE") Q 1
CAT2 
 G:ATT="" CAT10
 
 G:$D(CATT(ATT)) CAT3
 
 G:IPLAC'="" CAT5
 
 S IPLAC=$ZP(@GLOATT@(""))+1 Q 1
CAT5 
 
 Q:'($D(@GLOATT@(IPLAC))) 1
 
 I @GLOATT@(IPLAC)=ATT S ORDAT=@GLOATT@(IPLAC,"NUMERO.ORDRE") Q 1
 
 D M("Couple attribut\numero de place incorrect") Q 0
CAT3 
 G:ORDAT="" CAT4
 
 G:'($D(CATT(ATT,ORDAT))) CAT9
 
 G:IPLAC'="" CAT6
 
 Q:CATT(ATT,ORDAT)=IPLAC 1
 D M("Triplet attribut\numero d'ordre\place d'affichage incorrect") Q 0
CAT6 
 S IPLAC=CATT(ATT,ORDAT) Q 1
CAT9 
 G:IPLAC'="" CAT7
 S IPLAC=$ZP(@GLOATT@(""))+1 Q 1
CAT7 Q:'($D(@GLOATT@(IPLAC))) 1
 D M("Couple attribut\numero de place incorrect") Q 0
CAT4 
 G:IPLAC'="" CAT8
 
 S ORDAT=$O(CATT(ATT,"")),IPLAC=CATT(ATT,ORDAT) Q 1
CAT8 
 I '($D(@GLOATT@(IPLAC))) D M("Couple attribut\numero de place incorrect") Q 0
 I @GLOATT@(IPLAC)'=ATT D M("Couple attribut\numero de place incorrect") Q 0
 S ORDAT=@GLOATT@(IPLAC,"NUMERO.ORDRE") Q 1
CAT10 
 I IPLAC="" D M("Informations insuffisantes") Q 0
 I '($D(@GLOATT@(IPLAC))) D M("Pas de parametre avec cet ordre d'affichage") Q 0
 S ATT=@GLOATT@(IPLAC),ORDAT=@GLOATT@(IPLAC,"NUMERO.ORDRE")
 Q 1
 
COUNT(NECR,VALLEG) 
 Q:NECR=1
 N NB,I
 S NB=(NECR-1)*10
 F I=1:1:NB S VALLEG=$O(@GLOATT@(IND,"VALEUR.LEGALE",VALLEG)) I VALLEG="" S VALLEG=$ZP(@GLOATT@(IND,"VALEUR.LEGALE","")) Q
 Q
 
KILLGR(VALLEG) 
 N I
 F I=1:1:10 S VALLEG=$O(@GLOATT@(IND,"VALEUR.LEGALE",VALLEG)) Q:VALLEG=""  K @GLOATT@(IND,"VALEUR.LEGALE",VALLEG)
 Q
 
AFFSAI 
 K RESUL S RESUL(1)=S
 D AFF^%VACTGRQ("QMEASGM",.RESUL)
 Q
 
AFFATT(VID) 
 K RESUL S RESUL(1)=S,RESUL(7)=LIBACT
 I '(VID) S RESUL(2)=AT,RESUL(4)=IND,RESUL(3)=ORDAT,RESUL(6)=VD,RESUL(5)=LON
 D AFF^%VACTGRQ("QMEASAT",.RESUL)
 Q
 
CHOATT(ATT) 
 D INIT^%QUCHOIP("CATT",1,"",2,10,76,10),AFF^%QUCHOIP
 S ATT=$$UN^%QUCHOIP D END^%QUCHOIP
 Q
 
NOUVEAU 
 I '($D(@GLOATT@(IND))) S @GLOATT@(IND)=AT,@GLOATT@(IND,"NUMERO.ORDRE")=ORDAT,@GLOATT@(IND,"VALEUR.DEFAUT")=RESUL(6),@GLOATT@(IND,"AIDE")="",@GLOATT@(IND,"INDICE.NOTE")="",TOUCH=1,CATT(AT,ORDAT)=IND,@GLOATT@(IND,"LONGUEUR")=RESUL(5) Q
 I RESUL(6)'=VD S @GLOATT@(IND,"VALEUR.DEFAUT")=RESUL(6),TOUCH=1
 I RESUL(5)'=LON S @GLOATT@(IND,"LONGUEUR")=RESUL(5),TOUCH=1
 Q
 
VL(IND,IN2) 
 N %VL,VL,VL2
 S VL=""
 F %VL=0:0 S VL=$O(@GLOATT@(IND,"VALEUR.LEGALE",VL)) Q:VL=""  S VL2=VL-(100000*IND),VL2=(100000*IN2)+VL2,@GLOATT@(IN2,"VALEUR.LEGALE",VL2)=@GLOATT@(IND,"VALEUR.LEGALE",VL)
 Q
 
CHOIX(XG,YH,DH,DV,ATR,GLO) 
 
 
 
 
 
 
 
 N X,%T,LAR,ZZ
 D ^%VZEATT
 
 S ZZ=$ZP(^QX($J,""))+1
 S LAR=DH-$S(SUB="C-IBM PC":2,1:0)
 S %T=4,%T(1)=16,%T(2)=20,%T(3)=15,%T(4)=23
 D CONSTAB(ZZ,"%T",ATR)
 S X=$$INI^%QUCHOI4(1,"",XG,YH,LAR,DV,$J("",4)_"REPERTOIRE"_$J("",10)_"INDIVIDU"_$J("",12)_"TITRE"_$J("",12)_"NUMERO D'ORDRE",ZZ,0)
 I X=0 K ^[QUI]QX($J) Q
 D CLFEN^%VVIDEO(XG,YH,DV,DH),AFF^%QUCHOI4(ZZ)
 S X=$$UN^%QUCHOI4(ZZ) G:X="" FIN
 S X=^[QUI]QX($J,ZZ,"R",X)
 S @GLO@("REP")=$$NOMINT^%QSF(^[QUI]QX($J,ZZ,"T",X,1))
 S @GLO@("IND")=^[QUI]QX($J,ZZ,"T",X,2)
 S @GLO@("ORD")=^[QUI]QX($J,ZZ,"T",X,4)
 
FIN D END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J)
 Q
 
CONSTAB(P,DIM,ATR) 
 N ADR,I,J,IND,VAL,OR,REP
 K ^[QUI]QX($J)
 F J=1:1:@DIM S ^[QUI]QX($J,P,"LC",J)=@DIM@(J)
 S REP=$$BASE^%QMEA,J=1
 S ADR=$$LAV^%QSGEST6(REP,ATR),VAL=""
VAL S VAL=$O(@ADR@(VAL)) Q:VAL=""
 S OR=""
OR S OR=$O(@ADR@(VAL,OR)) G:OR="" VAL
 S IND=""
IND S IND=$O(@ADR@(VAL,OR,IND)) G:IND="" OR
 S ^[QUI]QX($J,P,"T",J,1)=$$NOMLOG^%QSF(REP)
 S ^[QUI]QX($J,P,"T",J,2)=IND
 S ^[QUI]QX($J,P,"T",J,3)=VAL
 S ^[QUI]QX($J,P,"T",J,4)=$$^%QSCALIN(REP,IND,"INDICE.NOTE",OR)
 S J=J+1 G IND

