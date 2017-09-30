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

;%QSNOTE3^INT^1^59547,73882^0
QSNOTE3 ;
 
 
 
 
SUPP(BASE,IND,ORD) 
 
 Q:((BASE="")!(IND=""))!(ORD="")
 K ^[QUI]QUERYT(BASE,IND,ORD)
 Q
 
 
CREN(BASE,IND,ATR,VAL,LIGN) 
 
 
 
 
 
 
 N OR
 S OR=$$ORDRE^%QSNOTE(WHOIS,BASE,IND)
 
 I '($$IR^%QSGEST5(BASE,IND)) D PA^%QSGESTI(BASE,IND,"NOM",$$NOMEX^%QSGES10(BASE,IND),1)
 
 D PA^%QSGESTI(BASE,IND,ATR,VAL,OR)
 
 D INSER(BASE,IND,OR,LIGN)
 Q
 
 
INSER(BASE,IND,OR,LIGN) 
 N %T,%L,L,NBP,PARA
 K ^[QUI]QUERYT(BASE,IND,OR)
 S ^[QUI]QUERYT(BASE,IND,OR,"EXIST")=""
 S L=""
 F %L=0:0 S L=$O(@LIGN@(L)) Q:L=""  S ^[QUI]QUERYT(BASE,IND,OR,"LIGNE",L)=@LIGN@(L) D:@LIGN@(L)["@" INSER2
 Q
 
INSER2 
 S NBP=$L(@LIGN@(L),"@")
 F %T=2:1:NBP S PARA=$P(@LIGN@(L),"@",%T) S:PARA[" " PARA=$P(PARA," ",1) I PARA'="" S ^[QUI]QUERYT(BASE,IND,OR,"PARAMETRE",PARA,L)=""
 Q
 
ALLPARAM 
 N BASE,IND,OR,%B,%I,%O
 S BASE="" F %B=0:0 S BASE=$O(^[QUI]QUERYT(BASE)) Q:BASE=""  S IND="" F %I=0:0 S IND=$O(^[QUI]QUERYT(BASE,IND)) Q:IND=""  S OR="" F %O=0:0 S OR=$O(^[QUI]QUERYT(BASE,IND,OR)) Q:OR=""  D PARAM(BASE,IND,OR)
 Q
 
PARAM(BA,IND,OR) 
 N L,%L,NBP,%T,PARA,TX
 K ^[QUI]QUERYT(BA,IND,OR,"PARAMETRE")
 S L="" F %L=0:0 S L=$O(^[QUI]QUERYT(BA,IND,OR,"LIGNE",L)) Q:L=""  S TX=^[QUI]QUERYT(BA,IND,OR,"LIGNE",L),NBP=$L(TX,"@") F %T=2:1:NBP S PARA=$P(TX,"@",%T) S:PARA[" " PARA=$P(PARA," ",1) I PARA'="" S ^[QUI]QUERYT(BA,IND,OR,"PARAMETRE",PARA,L)=""
 Q
 
 
TETE 
 N %T,T
 S DX=XG,DY=YH,T=""
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 F %T=0:0 S T=$O(^[QUI]QUERYT(BASE,IND,ON,"LIGNE",T)) Q:T=""  S @LIGN@(T)=^[QUI]QUERYT(BASE,IND,ON,"LIGNE",T)
 D REAFF^%QULIMO3(1,1,LIGN,XG,YH,DH,DV)
 S DX=(XG+(((DH-2)-$L(NT))\2))-1,DY=YH
 X XY W " " S DX=DX+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W NT D NORM^%VVIDEO
 S DX=DX+$L(NT) X XY W " " Q
 
 
CHOIX(XG,YH,DH,DV,ATR,GLO) 
 
 
 
 
 
 
 
 N X,%T,LAR,ZZ,REPD
CHR D POCLEPA^%VVIDEO S REPD=$$^%VZAME1($$^%QZCHW("notes de quel repertoire")_" (* pour tous) ? ")
 I REPD="" Q
 I REPD="*" G CHX
 I $$REPM^%QSGEST9(REPD)=0 G CHR
CHX 
 D ^%VZEATT
 
 S ZZ=$ZP(^QX($J,""))+1
 S LAR=DH-$S(SUB="C-IBM PC":2,1:0)
 S %T=4,%T(1)=16,%T(2)=20,%T(3)=15,%T(4)=23
 D CONSTAB(ZZ,"%T",ATR,REPD)
 S X=$$INI^%QUCHOI4(1,"",XG,YH,LAR,DV,$J("",4)_"REPERTOIRE"_$J("",10)_"INDIVIDU"_$J("",12)_"TITRE"_$J("",12)_"NUMERO D'ORDRE",ZZ,0)
 I X=0 K ^[QUI]QX($J) Q
 D POCLEPA^%VVIDEO,CLFEN^%VVIDEO(XG,YH,DV,DH),AFF^%QUCHOI4(ZZ)
 S X=$$UN^%QUCHOI4(ZZ) G:X="" FIN
 
 
 S X=^[QUI]QX($J,ZZ,"R",X)
 S @GLO@("REP")=$$NOMINT^%QSF(^[QUI]QX($J,ZZ,"T",X,1))
 S @GLO@("IND")=^[QUI]QX($J,ZZ,"T",X,2)
 S @GLO@("ORD")=^[QUI]QX($J,ZZ,"T",X,4)
 
FIN D END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J)
 Q
 
CONSTAB(P,DIM,ATR,REPD) 
 
 
 
 N ADR,REP,I,J,TEMP,IND,VAL,OR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISREP") K @(TEMP)
 K ^[QUI]QX($J)
 F I=1:1:@DIM S ^[QUI]QX($J,P,"LC",I)=@DIM@(I)
 I REPD'="*" S @TEMP@($$NOMINT^%QSF(REPD))=""
 I REPD="*" D REPI^%QSGEST9(TEMP)
 S J=1,REP=""
 F I=1:1 S REP=$O(@TEMP@(REP)) Q:REP=""  D INS
 K @(TEMP)
 Q
INS 
 S VAL=""
VAL S VAL=$$NXTRAV^%QSTRUC8(REP,ATR,VAL) Q:VAL=""
 S OR=""
OR S OR=$$NXTRAVO^%QSTRUC8(REP,ATR,VAL,OR) G:OR="" VAL
 S IND=""
IND S IND=$$NXTRAVOI^%QSTRUC8(REP,ATR,VAL,OR,IND) G:IND="" OR
 S ^[QUI]QX($J,P,"T",J,1)=$$NOMLOG^%QSF(REP)
 S ^[QUI]QX($J,P,"T",J,2)=IND
 S ^[QUI]QX($J,P,"T",J,3)=VAL
 S ^[QUI]QX($J,P,"T",J,4)=OR
 S J=J+1 G IND

