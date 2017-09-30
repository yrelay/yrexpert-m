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

;%QSATTR3^INT^1^59547,73880^0
%QSATTR3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT(AFF) 
 N PCL,OO
 D INITV
 G @("T"_MODE)
T0 S A=""
 F %A=0:0 S A=$$NXTRIA^%QSTRUC8(BA,O,A) Q:A=""  S PCL=$P(A,".",1) I (PCL'="LIEN")&(PCL'="INVERSE"),$$^%QSDROIT(BA,A,"V",JE) S D="" F %D=0:0 S D=$$NXTRIAO^%QSTRUC8(BA,O,A,D) Q:D=""  S V=$$VALEUR^%QSTRUC8(BA,O,A,D) D @("INST"_AFF_"(A,V,D,.L)")
 G FT1
 
T1 S A=""
 F %A=0:0 S A=$O(^[QUI]QUERY2(BA,A)) Q:A=""  S PCL=$P(A,".",1) I (PCL'="LIEN")&(PCL'="INVERSE") D:$$^%QSDROIT(BA,A,"V",JE) TIN1
 G FT1
 
TIN1 G:'($$AIR^%QSGEST5(BA,O,A)) VIDE
 S D="" F %D=0:0 S D=$$NXTRIAO^%QSTRUC8(BA,O,A,D) Q:D=""  S V=$$VALEUR^%QSTRUC8(BA,O,A,D) D @("INST"_AFF_"(A,V,D,.L)")
 Q
 
FT1 
 D RECATPR
 D @("TAB"_AFF)
 Q
 
INITS(TABLE,PAQ,JEU,AFF) 
 N GLO S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLOVAL")
 D INITV
 G @("T"_MODE)
T2 
 N VAL S NUM=""
 F %NUM=1:1 S NUM=$O(@TABLE@(NUM)) Q:NUM=""  S A="" F %A=0:0 S A=$O(@TABLE@(NUM,A)) Q:A=""  D:'(PAQ) TIN2S D:PAQ TIN2S2
 D @("TAB"_AFF)
 Q
 
TIN2S 
SUIT2 K @(GLO) D MVG^%QSCALVA(BA,O,A,GLO,.TYPE)
 I @GLO=0 D ZERO Q
 S D="" F %D=1:1 S D=$O(@GLO@(D)) Q:D=""  S VAL=$$^%QSCALIN(BA,O,A,D) D SUIT22
 K @(GLO) Q
SUIT22 I (VAL="")&(JEU=1),$D(@VALJEU@(A)) S VAL=@VALJEU@(A)
 D @("INST"_AFF_"(A,VAL,D,.L)")
 Q
ZERO S VAL=""
 I JEU=1,$D(@VALJEU@(A)) S VAL=@VALJEU@(A) D @("INST"_AFF_"(A,VAL,1,.L)")
 Q:VAL'=""
 D VIDE Q
TIN2S2 
SUIT3 S VAL=$$^%QSCALIN(BA,O,A,INDICE)
 I (VAL="")&(JEU=1),$D(@VALJEU@(A)) S VAL=@VALJEU@(A)
 D @("INST"_AFF_"(A,VAL,INDICE,.L)")
 Q
 
 
 
VIDE 
 D @("INST"_AFF_"(A,"""",""?"",.L)")
 Q
 
INITV 
 D ^%VZEATT
 S L1=((LA-6)\2)-4,YC=YH+2,XC=(XG+L1)+4,(LDEP,LC,COL,PAGE)=1,LFIN=(LDEP+HA)-5,L=0
 K ^ATT($J,Z),^VAL($J,Z),^LATT($J,Z)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 Q
 
RECATPR 
 N ATB,V1,TAB,I,ATR,OO,NOMEXT
 S NOMEXT=$$NOMLOG^%QSF(BA)
 S ATB=$O(^[QUI]RQSATPR(NOMEXT,""))
 I ATB'="*" S ATB="" G BAT
 D ATPRALL
BAT S ATB=$O(^[QUI]RQSATPR(NOMEXT,ATB))
 G:ATB="" ATTNOM
 G:ATB="NOM" BAT
 S OO=""
BV1 S OO=$$NXTRIAO^%QSTRUC8(BA,O,ATB,OO)
 G:OO="" BAT
 S V1=$$VALEUR^%QSTRUC8(BA,O,ATB,OO)
 D ^%QSATPR(NOMEXT,ATB,V1,.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  I '($$AIR^%QSGE5(BA,O,$P(ATR,"("))) D INSP($P(ATR," ("),TAB(I,ATR),$$ORD(ATR))
 K TAB
 G BV1
ATPRALL 
 D ALL^%QSATPR(NOMEXT,.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  D INSP($P(ATR," ("),TAB(I,ATR),$$ORD(ATR))
 K TAB
 Q
 
ATTNOM D ^%QSATPR(NOMEXT,"NOM",$$^%QSCALVA(BA,O,"NOM"),.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  D INSP($P(ATR," ("),TAB(I,ATR),$$ORD(ATR))
 K TAB
 Q
 
INSP(AT,V,D) 
 
 Q:'($$^%QSDROIT(BA,AT,"C",JE))
 S:D="" D=1 Q:$$OAIR^%QSGE5(BA,O,AT,D)
 D @("INST"_AFF_"(AT,V,D,.L)")
 D PA^%QSGESTI(BA,O,AT,V,D)
 Q
 
 
INST0(AT,V,D,L) 
 S L=L+1,@TEMP@(AT,D,L)=V
 Q
 
INST1(AT,V,D,L) 
 S L=L+1,@TEMP@(D,AT,L)=V
 Q
 
INST2(AT,V,D,L) 
 
 S L=L+1,^ATT($J,Z,L)=AT_$S(D=1:"",1:" ("_D_")"),^VAL($J,Z,L)=V,^LATT($J,Z,AT,D)=L
 Q
 
TAB0 
 S A="",L=0
 F %A=0:0 S A=$O(@TEMP@(A)) Q:A=""  S D="" F %D=0:0 S D=$O(@TEMP@(A,D)) Q:D=""  S V="" F %V=0:0 S V=$O(@TEMP@(A,D,V)) Q:V=""  I '($D(^LATT($J,Z,A,D))) D INST2(A,@TEMP@(A,D,V),D,.L)
 K @(TEMP) D POCLEPA^%VVIDEO Q
 
TAB1 
 S D="",L=0
 F %D=0:0 S D=$O(@TEMP@(D)) Q:D=""  S A="" F %A=0:0 S A=$O(@TEMP@(D,A)) Q:A=""  S V="" F %V=0:0 S V=$O(@TEMP@(D,A,V)) Q:V=""  I '($D(^LATT($J,Z,A,D))) D INST2(A,@TEMP@(D,A,V),D,.L)
 K @(TEMP) D POCLEPA^%VVIDEO Q
 
TAB2 Q
 
ORD(A) N D
 S D=$P($P(A," (",2),")") S:$E(D)="""" D=$E(D,2,$L(D)-1)
 Q D
 
DAT(LC) 
 N SATT,II,ATT,VAL,ORD
 S VAL=^VAL($J,Z,LC)
 Q:VAL'="" 0
 S ATT=$P(^ATT($J,Z,LC)," (",1)
 Q:$$TYPE^%QSGESPE(ATT_"/"_$$NOMLOG^%QSF(BA))'="DATE" 0
 
 Q:'($$FINT2^%QMDAUC(BA,ATT,.VAL)) 0
 
 S II=$$^%QSPRVAL(BA,ATT,.VAL,XG,YH,LA,HA)
 I II=1 D REAF^%QSATTR6
 I II=2 D ^%VZEAVT($$^%QZCHW("valeur refusee")) Q 0
 Q:VAL="" 0
 S ORD=$$ORD(^ATT($J,Z,LC)) S:ORD="" ORD=1
 D MOD^%QSATTR2(ATT,VAL,ORD,LC)
 D AFFV^%QSATTR2(LC)
 I $$CHANG^%QSATTR6(BA,ATT,VAL) D REAFF^%QSATTR6
 Q 1
 ;

